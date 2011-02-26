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

#include "ByteBuffer.h"
#include "TargetedMovementGenerator.h"
#include "Errors.h"
#include "Creature.h"
#include "DestinationHolderImp.h"
#include "World.h"

//#include "ace/High_Res_Timer.h"
//class ACE_High_Res_Timer;

//-----------------------------------------------//
template<class T, typename D>
void TargetedMovementGeneratorMedium<T,D>::_setTargetLocation(T &owner)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return;

    if (owner.hasUnitState(UNIT_STAT_NOT_MOVE))
        return;

    float x, y, z;

    // prevent redundant micro-movement for pets, other followers.
    if (i_offset && i_target->IsWithinDistInMap(&owner,2*i_offset))
    {
        if (i_destinationHolder.HasDestination())
            return;

        owner.GetPosition(x, y, z);
    }
    else if (!i_offset)
    {
        // to nearest contact position
        i_target->GetContactPoint( &owner, x, y, z );
    }
    else
    {
        // to at i_offset distance from target and i_angle from target facing
        i_target->GetClosePoint(x, y, z, owner.GetObjectBoundingRadius(), i_offset, i_angle, &owner);
    }

    /*
        We MUST not check the distance difference and avoid setting the new location for smaller distances.
        By that we risk having far too many GetContactPoint() calls freezing the whole system.
        In TargetedMovementGenerator<T>::Update() we check the distance to the target and at
        some range we calculate a new position. The calculation takes some processor cycles due to vmaps.
        If the distance to the target it too large to ignore,
        but the distance to the new contact point is short enough to be ignored,
        we will calculate a new contact point each update loop, but will never move to it.
        The system will freeze.
        ralf

        //We don't update Mob Movement, if the difference between New destination and last destination is < BothObjectSize
        float  bothObjectSize = i_target->GetObjectBoundingRadius() + owner.GetObjectBoundingRadius() + CONTACT_DISTANCE;
        if( i_destinationHolder.HasDestination() && i_destinationHolder.GetDestinationDiff(x,y,z) < bothObjectSize )
            return;
    */

    //ACE_High_Res_Timer timer = ACE_High_Res_Timer();
    //ACE_hrtime_t elapsed;
    //timer.start();

    bool forceDest = false;
    // allow pets following their master to cheat while generating paths
    if(owner.GetTypeId() == TYPEID_UNIT && ((Creature*)&owner)->IsPet()
        && owner.hasUnitState(UNIT_STAT_FOLLOW))
        forceDest = true;

    bool newPathCalculated = true;
    if(!i_path)
        i_path = new PathInfo(&owner, x, y, z, false, forceDest);
    else
        newPathCalculated = i_path->Update(x, y, z, false, forceDest);

    //timer.stop();
    //timer.elapsed_microseconds(elapsed);
    //sLog.outDebug("Path found in %llu microseconds", elapsed);

    // nothing we can do here ...
    if(i_path->getPathType() & PATHFIND_NOPATH)
        return;

    PointPath pointPath = i_path->getFullPath();

    if (i_destinationHolder.HasArrived() && m_pathPointsSent)
        --m_pathPointsSent;

    Traveller<T> traveller(owner);
    i_path->getNextPosition(x, y, z);
    i_destinationHolder.SetDestination(traveller, x, y, z, false);

    // send the path if:
    //    we have brand new path
    //    we have visited almost all of the previously sent points
    //    movespeed has changed
    //    the owner is stopped (caused by some movement effects)
    if (newPathCalculated || m_pathPointsSent < 2 || i_recalculateTravel || owner.IsStopped())
    {
        // send 10 nodes, or send all nodes if there are less than 10 left
        m_pathPointsSent = std::min<uint32>(10, pointPath.size() - 1);
        uint32 endIndex = m_pathPointsSent + 1;

        // dist to next node + world-unit length of the path
        x -= owner.GetPositionX();
        y -= owner.GetPositionY();
        z -= owner.GetPositionZ();
        float dist = sqrt(x*x + y*y + z*z) + pointPath.GetTotalLength(1, endIndex);

        // calculate travel time, set spline, then send path
        uint32 traveltime = uint32(dist / (traveller.Speed()*0.001f));
        SplineFlags flags = (owner.GetTypeId() == TYPEID_UNIT) ? ((Creature*)&owner)->GetSplineFlags() : SPLINEFLAG_WALKMODE;
        owner.SendMonsterMoveByPath(pointPath, 1, endIndex, flags, traveltime);
    }

    D::_addUnitStateMove(owner);
    if (owner.GetTypeId() == TYPEID_UNIT && ((Creature*)&owner)->CanFly())
        ((Creature&)owner).AddSplineFlag(SPLINEFLAG_FLYING);
}

template<>
void TargetedMovementGeneratorMedium<Player,ChaseMovementGenerator<Player> >::UpdateFinalDistance(float /*fDistance*/)
{
    // nothing to do for Player
}

template<>
void TargetedMovementGeneratorMedium<Player,FollowMovementGenerator<Player> >::UpdateFinalDistance(float /*fDistance*/)
{
    // nothing to do for Player
}

template<>
void TargetedMovementGeneratorMedium<Creature,ChaseMovementGenerator<Creature> >::UpdateFinalDistance(float fDistance)
{
    i_offset = fDistance;
    i_recalculateTravel = true;
}

template<>
void TargetedMovementGeneratorMedium<Creature,FollowMovementGenerator<Creature> >::UpdateFinalDistance(float fDistance)
{
    i_offset = fDistance;
    i_recalculateTravel = true;
}

template<class T, typename D>
bool TargetedMovementGeneratorMedium<T,D>::Update(T &owner, const uint32 & time_diff)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return false;

    if (!owner.isAlive())
        return true;

    if (owner.hasUnitState(UNIT_STAT_NOT_MOVE))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    if (owner.IsNonMeleeSpellCasted(false, false,  true))
    {
        if (!owner.IsStopped())
            owner.StopMoving();
        return true;
    }

    // prevent crash after creature killed pet
    if (static_cast<D*>(this)->_lostTarget(owner))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    if (i_path && (i_path->getPathType() & PATHFIND_NOPATH))
        return true;

    Traveller<T> traveller(owner);

    if (!i_destinationHolder.HasDestination())
        _setTargetLocation(owner);

    if (owner.IsStopped() && !i_destinationHolder.HasArrived())
    {
        D::_addUnitStateMove(owner);
        if (owner.GetTypeId() == TYPEID_UNIT && ((Creature*)&owner)->CanFly())
            ((Creature&)owner).AddSplineFlag(SPLINEFLAG_FLYING);

        i_destinationHolder.StartTravel(traveller);
        return true;
    }

    if (i_destinationHolder.UpdateTraveller(traveller, time_diff, i_recalculateTravel || owner.IsStopped()))
    {
        if (!this->IsActive(owner))                         // force stop processing (movement can move out active zone with cleanup movegens list)
            return true;                                    // not expire now, but already lost

        // put targeted movement generators on a higher priority
        if (owner.GetObjectBoundingRadius())
            i_destinationHolder.ResetUpdate(100);

        //More distance let have better performance, less distance let have more sensitive reaction at target move.
        float dist = i_target->GetObjectBoundingRadius() + owner.GetObjectBoundingRadius() + sWorld.getConfig(CONFIG_FLOAT_RATE_TARGET_POS_RECALCULATION_RANGE);

        float x,y,z;
        i_target->GetPosition(x, y, z);
        PathNode next_point(x, y, z);

        bool targetMoved = false, needNewDest = false;
        if (i_path)
        {
            PathNode end_point = i_path->getEndPosition();
            next_point = i_path->getNextPosition();

            needNewDest = i_destinationHolder.HasArrived() && !inRange(next_point, i_path->getActualEndPosition(), dist, dist);

            // GetClosePoint() will always return a point on the ground, so we need to
            // handle the difference in elevation when the creature is flying
            if (owner.GetTypeId() == TYPEID_UNIT && ((Creature*)&owner)->CanFly())
                targetMoved = i_target->GetDistanceSqr(end_point.x, end_point.y, end_point.z) >= dist*dist;
            else
                targetMoved = i_target->GetDistance2d(end_point.x, end_point.y) >= dist;
        }

        if (!i_path || targetMoved || needNewDest || i_recalculateTravel || owner.IsStopped())
        {
            // (re)calculate path
            _setTargetLocation(owner);

            next_point = i_path->getNextPosition();

            // Set new Angle For Map::
            owner.SetOrientation(owner.GetAngle(next_point.x, next_point.y));
        }
        // Update the Angle of the target only for Map::, no need to send packet for player
        else if (!i_angle && !owner.HasInArc(0.01f, next_point.x, next_point.y))
            owner.SetOrientation(owner.GetAngle(next_point.x, next_point.y));

        if ((owner.IsStopped() && !i_destinationHolder.HasArrived()) || i_recalculateTravel)
        {
            i_recalculateTravel = false;

            //Angle update will take place into owner.StopMoving()
            owner.SetOrientation(owner.GetAngle(next_point.x, next_point.y));

            owner.StopMoving();
            static_cast<D*>(this)->_reachTarget(owner);
        }
    }
    return true;
}

//-----------------------------------------------//
template<class T>
void ChaseMovementGenerator<T>::_reachTarget(T &owner)
{
    if (owner.CanReachWithMeleeAttack(this->i_target.getTarget()))
        owner.Attack(this->i_target.getTarget(),true);
}

template<>
void ChaseMovementGenerator<Player>::Initialize(Player &owner)
{
    owner.addUnitState(UNIT_STAT_CHASE|UNIT_STAT_CHASE_MOVE);
    _setTargetLocation(owner);
}

template<>
void ChaseMovementGenerator<Creature>::Initialize(Creature &owner)
{
    owner.addUnitState(UNIT_STAT_CHASE|UNIT_STAT_CHASE_MOVE);
    owner.RemoveSplineFlag(SPLINEFLAG_WALKMODE);

    if (((Creature*)&owner)->CanFly())
        owner.AddSplineFlag(SPLINEFLAG_FLYING);

    _setTargetLocation(owner);
}

template<class T>
void ChaseMovementGenerator<T>::Finalize(T &owner)
{
    owner.clearUnitState(UNIT_STAT_CHASE|UNIT_STAT_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::Interrupt(T &owner)
{
    owner.clearUnitState(UNIT_STAT_CHASE|UNIT_STAT_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::Reset(T &owner)
{
    Initialize(owner);
}

//-----------------------------------------------//
template<>
void FollowMovementGenerator<Creature>::_updateWalkMode(Creature &u)
{
    if (i_target.isValid() && u.IsPet())
        u.UpdateWalkMode(i_target.getTarget());
}

template<>
void FollowMovementGenerator<Player>::_updateWalkMode(Player &)
{
}

template<>
void FollowMovementGenerator<Player>::_updateSpeed(Player &/*u*/)
{
    // nothing to do for Player
}

template<>
void FollowMovementGenerator<Creature>::_updateSpeed(Creature &u)
{
    // pet only sync speed with owner
    if (!((Creature&)u).IsPet() || !i_target.isValid() || i_target->GetObjectGuid() != u.GetOwnerGuid())
        return;

    u.UpdateSpeed(MOVE_RUN,true);
    u.UpdateSpeed(MOVE_WALK,true);
    u.UpdateSpeed(MOVE_SWIM,true);
}

template<>
void FollowMovementGenerator<Player>::Initialize(Player &owner)
{
    owner.addUnitState(UNIT_STAT_FOLLOW|UNIT_STAT_FOLLOW_MOVE);
    _updateWalkMode(owner);
    _updateSpeed(owner);
    _setTargetLocation(owner);
}

template<>
void FollowMovementGenerator<Creature>::Initialize(Creature &owner)
{
    owner.addUnitState(UNIT_STAT_FOLLOW|UNIT_STAT_FOLLOW_MOVE);
    _updateWalkMode(owner);
    _updateSpeed(owner);

    if (((Creature*)&owner)->CanFly())
        owner.AddSplineFlag(SPLINEFLAG_FLYING);

    _setTargetLocation(owner);
}

template<class T>
void FollowMovementGenerator<T>::Finalize(T &owner)
{
    owner.clearUnitState(UNIT_STAT_FOLLOW|UNIT_STAT_FOLLOW_MOVE);
    _updateWalkMode(owner);
    _updateSpeed(owner);
}

template<class T>
void FollowMovementGenerator<T>::Interrupt(T &owner)
{
    owner.clearUnitState(UNIT_STAT_FOLLOW|UNIT_STAT_FOLLOW_MOVE);
    _updateWalkMode(owner);
    _updateSpeed(owner);
}

template<class T>
void FollowMovementGenerator<T>::Reset(T &owner)
{
    Initialize(owner);
}

//-----------------------------------------------//
template void TargetedMovementGeneratorMedium<Player,ChaseMovementGenerator<Player> >::_setTargetLocation(Player &);
template void TargetedMovementGeneratorMedium<Player,FollowMovementGenerator<Player> >::_setTargetLocation(Player &);
template void TargetedMovementGeneratorMedium<Creature,ChaseMovementGenerator<Creature> >::_setTargetLocation(Creature &);
template void TargetedMovementGeneratorMedium<Creature,FollowMovementGenerator<Creature> >::_setTargetLocation(Creature &);
template bool TargetedMovementGeneratorMedium<Player,ChaseMovementGenerator<Player> >::Update(Player &, const uint32 &);
template bool TargetedMovementGeneratorMedium<Player,FollowMovementGenerator<Player> >::Update(Player &, const uint32 &);
template bool TargetedMovementGeneratorMedium<Creature,ChaseMovementGenerator<Creature> >::Update(Creature &, const uint32 &);
template bool TargetedMovementGeneratorMedium<Creature,FollowMovementGenerator<Creature> >::Update(Creature &, const uint32 &);

template void ChaseMovementGenerator<Player>::_reachTarget(Player &);
template void ChaseMovementGenerator<Creature>::_reachTarget(Creature &);
template void ChaseMovementGenerator<Player>::Finalize(Player &);
template void ChaseMovementGenerator<Creature>::Finalize(Creature &);
template void ChaseMovementGenerator<Player>::Interrupt(Player &);
template void ChaseMovementGenerator<Creature>::Interrupt(Creature &);
template void ChaseMovementGenerator<Player>::Reset(Player &);
template void ChaseMovementGenerator<Creature>::Reset(Creature &);

template void FollowMovementGenerator<Player>::Finalize(Player &);
template void FollowMovementGenerator<Creature>::Finalize(Creature &);
template void FollowMovementGenerator<Player>::Interrupt(Player &);
template void FollowMovementGenerator<Creature>::Interrupt(Creature &);
template void FollowMovementGenerator<Player>::Reset(Player &);
template void FollowMovementGenerator<Creature>::Reset(Creature &);
