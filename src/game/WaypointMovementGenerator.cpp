/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2012 MaNGOSZero <https://github.com/mangos-zero>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include <ctime>

#include "WaypointMovementGenerator.h"
#include "ObjectMgr.h"
#include "Creature.h"
#include "DestinationHolderImp.h"
#include "CreatureAI.h"
#include "WaypointManager.h"
#include "WorldPacket.h"
#include "ScriptMgr.h"

#include <cassert>

//-----------------------------------------------//
void WaypointMovementGenerator<Creature>::LoadPath(Creature &creature)
{
    DETAIL_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "LoadPath: loading waypoint path for %s", creature.GetGuidStr().c_str());

    i_path = sWaypointMgr.GetPath(creature.GetGUIDLow());

    // We may LoadPath() for several occasions:

    // 1: When creature.MovementType=2
    //    1a) Path is selected by creature.guid == creature_movement.id
    //    1b) Path for 1a) does not exist and then use path from creature.GetEntry() == creature_movement_template.entry

    // 2: When creature_template.MovementType=2
    //    2a) Creature is summoned and has creature_template.MovementType=2
    //        Creators need to be sure that creature_movement_template is always valid for summons.
    //        Mob that can be summoned anywhere should not have creature_movement_template for example.

    // No movement found for guid
    if (!i_path)
    {
        i_path = sWaypointMgr.GetPathTemplate(creature.GetEntry());

        // No movement found for entry
        if (!i_path)
        {
            sLog.outErrorDb("WaypointMovementGenerator::LoadPath: creature %s (Entry: %u GUID: %u) doesn't have waypoint path",
                creature.GetName(), creature.GetEntry(), creature.GetGUIDLow());
            return;
        }
    }

    if (creature.CanFly())
        creature.AddSplineFlag(SPLINEFLAG_FLYING);

    // We have to set the destination here (for the first point), right after Initialize. Without, we may not have valid xyz for GetResetPosition
    CreatureTraveller traveller(creature);
    MoveToNextNode(traveller);
}

void WaypointMovementGenerator<Creature>::Initialize(Creature &creature)
{
    LoadPath(creature);
    creature.addUnitState(UNIT_STAT_ROAMING|UNIT_STAT_ROAMING_MOVE);
}

void WaypointMovementGenerator<Creature>::Finalize(Creature &creature)
{
    creature.clearUnitState(UNIT_STAT_ROAMING|UNIT_STAT_ROAMING_MOVE);
}

void WaypointMovementGenerator<Creature>::Interrupt(Creature &creature)
{
    creature.clearUnitState(UNIT_STAT_ROAMING|UNIT_STAT_ROAMING_MOVE);
}

void WaypointMovementGenerator<Creature>::Reset(Creature &creature)
{
    SetStoppedByPlayer(false);
    i_nextMoveTime.Reset(0);
    creature.addUnitState(UNIT_STAT_ROAMING|UNIT_STAT_ROAMING_MOVE);
}

bool WaypointMovementGenerator<Creature>::Update(Creature &creature, const uint32 &diff)
{
    if (!&creature)
        return true;

    // Waypoint movement can be switched on/off
    // This is quite handy for escort quests and other stuff
    if (creature.hasUnitState(UNIT_STAT_NOT_MOVE))
    {
        creature.clearUnitState(UNIT_STAT_ROAMING_MOVE);
        return true;
    }

    // prevent a crash at empty waypoint path.
    if (!i_path || i_path->empty())
    {
        creature.clearUnitState(UNIT_STAT_ROAMING_MOVE);
        return true;
    }

    if (i_currentNode >= i_path->size())
    {
        sLog.outError("WaypointMovement currentNode (%u) is equal or bigger than path size (creature entry %u)", i_currentNode, creature.GetEntry());
        i_currentNode = 0;
    }

    CreatureTraveller traveller(creature);

    i_nextMoveTime.Update(diff);

    if (i_destinationHolder.UpdateTraveller(traveller, diff, false, true))
    {
        if (!IsActive(creature))                            // force stop processing (movement can move out active zone with cleanup movegens list)
            return true;                                    // not expire now, but already lost
    }

    // creature has been stopped in middle of the waypoint segment
    if (!i_destinationHolder.HasArrived() && creature.IsStopped())
    {
        // Timer has elapsed, meaning this part controlled it
        if (i_nextMoveTime.Passed())
        {
            SetStoppedByPlayer(false);

            creature.addUnitState(UNIT_STAT_ROAMING_MOVE);

            if (creature.CanFly())
                creature.AddSplineFlag(SPLINEFLAG_FLYING);

            // Now we re-set destination to same node and start travel
            MoveToNextNode(traveller);
        }
        else // if( !i_nextMoveTime.Passed())
        {
            // unexpected end of timer && creature stopped && not at end of segment
            if (!IsStoppedByPlayer())
            {
                // Put 30 seconds delay
                i_destinationHolder.IncreaseTravelTime(STOP_TIME_FOR_PLAYER);
                i_nextMoveTime.Reset(STOP_TIME_FOR_PLAYER);
                SetStoppedByPlayer(true);                   // Mark we did it
            }
        }
        return true;                                        // Abort here this update
    }

    if (creature.IsStopped())
    {
        if (!m_isArrivalDone)
        {
            if (i_path->at(i_currentNode).orientation != 100)
                creature.SetOrientation(i_path->at(i_currentNode).orientation);

            if (i_path->at(i_currentNode).script_id)
            {
                DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Creature movement start script %u at point %u for %s.", i_path->at(i_currentNode).script_id, i_currentNode, creature.GetGuidStr().c_str());
                creature.GetMap()->ScriptsStart(sCreatureMovementScripts, i_path->at(i_currentNode).script_id, &creature, &creature);
            }

            // We have reached the destination and can process behavior
            if (WaypointBehavior *behavior = i_path->at(i_currentNode).behavior)
            {
                if (behavior->emote != 0)
                    creature.HandleEmote(behavior->emote);

                if (behavior->spell != 0)
                {
                    creature.CastSpell(&creature, behavior->spell, false);

                    if (!IsActive(creature))                // force stop processing (cast can change movegens list)
                        return true;                        // not expire now, but already lost
                }

                if (behavior->model1 != 0)
                    creature.SetDisplayId(behavior->model1);

                if (behavior->textid[0])
                {
                    // Not only one text is set
                    if (behavior->textid[1])
                    {
                        // Select one from max 5 texts (0 and 1 already checked)
                        int i = 2;
                        for(; i < MAX_WAYPOINT_TEXT; ++i)
                        {
                            if (!behavior->textid[i])
                                break;
                        }

                        creature.MonsterSay(behavior->textid[rand() % i], LANG_UNIVERSAL);
                    }
                    else
                        creature.MonsterSay(behavior->textid[0], LANG_UNIVERSAL);
                }
            }                                               // wpBehaviour found

            // Can only do this once for the node
            m_isArrivalDone = true;

            // Inform script
            MovementInform(creature);

            if (!IsActive(creature))                        // force stop processing (movement can move out active zone with cleanup movegens list)
                return true;                                // not expire now, but already lost

            // prevent a crash at empty waypoint path.
            if (!i_path || i_path->empty() || i_currentNode >= i_path->size())
            {
                creature.clearUnitState(UNIT_STAT_ROAMING_MOVE);
                return true;
            }
        }
    }                                                       // i_creature.IsStopped()

    // This is at the end of waypoint segment (incl. was previously stopped by player, extending the time)
    if (i_nextMoveTime.Passed())
    {
        // If stopped then begin a new move segment
        if (creature.IsStopped())
        {
            creature.addUnitState(UNIT_STAT_ROAMING_MOVE);

            if (creature.CanFly())
                creature.AddSplineFlag(SPLINEFLAG_FLYING);

            if (WaypointBehavior *behavior = i_path->at(i_currentNode).behavior)
            {
                if (behavior->model2 != 0)
                    creature.SetDisplayId(behavior->model2);

                creature.SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
            }

            // behavior for "departure" of the current node is done
            m_isArrivalDone = false;

            // Proceed with increment current node and then send to the next destination
            ++i_currentNode;

            // Oops, end of the line so need to start from the beginning
            if (i_currentNode >= i_path->size())
                i_currentNode = 0;

            if (i_path->at(i_currentNode).orientation != 100)
                creature.SetOrientation(i_path->at(i_currentNode).orientation);

            MoveToNextNode(traveller);
        }
        else
        {
            // If not stopped then stop it
            creature.clearUnitState(UNIT_STAT_ROAMING_MOVE);

            SetStoppedByPlayer(false);

            // Set TimeTracker to waittime for the current node
            i_nextMoveTime.Reset(i_path->at(i_currentNode).delay);
        }
    }

    return true;
}

void WaypointMovementGenerator<Creature>::MovementInform(Creature &creature)
{
    if (creature.AI())
        creature.AI()->MovementInform(WAYPOINT_MOTION_TYPE, i_currentNode);
}

bool WaypointMovementGenerator<Creature>::GetResetPosition(Creature&, float& x, float& y, float& z)
{
    return PathMovementBase<Creature, WaypointPath const*>::GetPosition(x,y,z);
}

void WaypointMovementGenerator<Creature>::MoveToNextNode(CreatureTraveller &traveller)
{
    Creature* owner = &(traveller.i_traveller);
    const WaypointNode &node = i_path->at(i_currentNode);

    PathInfo sub_path(owner, node.x, node.y, node.z);
    PointPath pointPath = sub_path.getFullPath();

    float speed = traveller.Speed()*0.001f; // in ms
    uint32 traveltime = uint32(pointPath.GetTotalLength()/speed);
    owner->SendMonsterMoveByPath(pointPath, 1, pointPath.size(), owner->GetSplineFlags(), traveltime);

    PathNode p = pointPath[pointPath.size()-1];
    i_destinationHolder.SetDestination(traveller, p.x, p.y, p.z, false);

    i_nextMoveTime.Reset(traveltime);
}

//----------------------------------------------------//
uint32 FlightPathMovementGenerator::GetPathAtMapEnd() const
{
    if (i_currentNode >= i_path->size())
        return i_path->size();

    uint32 curMapId = (*i_path)[i_currentNode].mapid;

    for(uint32 i = i_currentNode; i < i_path->size(); ++i)
    {
        if ((*i_path)[i].mapid != curMapId)
            return i;
    }

    return i_path->size();
}

void FlightPathMovementGenerator::Initialize(Player &player)
{
    Reset(player);
}

void FlightPathMovementGenerator::Finalize(Player & player)
{
    // remove flag to prevent send object build movement packets for flight state and crash (movement generator already not at top of stack)
    player.clearUnitState(UNIT_STAT_TAXI_FLIGHT);

    float x, y, z;
    i_destinationHolder.GetLocationNow(player.GetMap(), x, y, z);
    player.SetPosition(x, y, z, player.GetOrientation());

    player.Unmount();
    player.RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);

    if(player.m_taxi.empty())
    {
        player.getHostileRefManager().setOnlineOfflineState(true);
        if(player.pvpInfo.inHostileArea)
            player.CastSpell(&player, 2479, true);

        // update z position to ground and orientation for landing point
        // this prevent cheating with landing  point at lags
        // when client side flight end early in comparison server side
        player.StopMoving();
    }
}

void FlightPathMovementGenerator::Interrupt(Player & player)
{
    player.clearUnitState(UNIT_STAT_TAXI_FLIGHT);
}

void FlightPathMovementGenerator::Reset(Player & player)
{
    player.getHostileRefManager().setOnlineOfflineState(false);
    player.addUnitState(UNIT_STAT_TAXI_FLIGHT);
    player.SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);
    Traveller<Player> traveller(player);
    // do not send movement, it was sent already
    i_destinationHolder.SetDestination(traveller, (*i_path)[i_currentNode].x, (*i_path)[i_currentNode].y, (*i_path)[i_currentNode].z, false);

    TaxiPathNodeList path = GetPath();
    uint32 pathEndPoint = GetPathAtMapEnd();
    uint32 traveltime = uint32(PLAYER_FLIGHT_SPEED * path.GetTotalLength(GetCurrentNode(),pathEndPoint));
    player.SendMonsterMoveByPath(path,GetCurrentNode(),pathEndPoint, SplineFlags(SPLINEFLAG_WALKMODE|SPLINEFLAG_FLYING), traveltime );
}

bool FlightPathMovementGenerator::Update(Player &player, const uint32 &diff)
{
    if (MovementInProgress())
    {
        Traveller<Player> traveller(player);
        if( i_destinationHolder.UpdateTraveller(traveller, diff, false) )
        {
            if (!IsActive(player))                          // force stop processing (movement can move out active zone with cleanup movegens list)
                return true;                                // not expire now, but already lost

            i_destinationHolder.ResetUpdate(FLIGHT_TRAVEL_UPDATE);
            if (i_destinationHolder.HasArrived())
            {
                uint32 curMap = (*i_path)[i_currentNode].mapid;
                ++i_currentNode;
                if (MovementInProgress())
                {
                    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "loading node %u for player %s", i_currentNode, player.GetName());
                    if ((*i_path)[i_currentNode].mapid == curMap)
                    {
                        // do not send movement, it was sent already
                        i_destinationHolder.SetDestination(traveller, (*i_path)[i_currentNode].x, (*i_path)[i_currentNode].y, (*i_path)[i_currentNode].z, false);
                    }
                    return true;
                }
                //else HasArrived()
            }
            else
                return true;
        }
        else
            return true;
    }

    // we have arrived at the end of the path
    return false;
}

void FlightPathMovementGenerator::SetCurrentNodeAfterTeleport()
{
    if (i_path->empty())
        return;

    uint32 map0 = (*i_path)[0].mapid;

    for (size_t i = 1; i < i_path->size(); ++i)
    {
        if ((*i_path)[i].mapid != map0)
        {
            i_currentNode = i;
            return;
        }
    }
}
