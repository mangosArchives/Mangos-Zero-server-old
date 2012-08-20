-- MySQL dump 10.13  Distrib 5.5.27, for Linux (x86_64)
--
-- Host: localhost    Database: mangos
-- ------------------------------------------------------
-- Server version	5.5.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areatrigger_involvedrelation`
--

DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_tavern`
--

DROP TABLE IF EXISTS `areatrigger_tavern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_teleport`
--

DROP TABLE IF EXISTS `areatrigger_teleport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `required_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required_item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required_item2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required_quest_done` int(11) unsigned NOT NULL DEFAULT '0',
  `required_failed_text` text,
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battleground_events`
--

DROP TABLE IF EXISTS `battleground_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battleground_events` (
  `map` smallint(5) NOT NULL,
  `event1` tinyint(3) unsigned NOT NULL,
  `event2` tinyint(3) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`map`,`event1`,`event2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battleground_template`
--

DROP TABLE IF EXISTS `battleground_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battlemaster_entry`
--

DROP TABLE IF EXISTS `battlemaster_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `security` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command`
--

LOCK TABLES `command` WRITE;
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
INSERT INTO `command` VALUES
('account',0,'Syntax: .accountDisplay the access level of your account.'),
('account characters',3,'Syntax: .account characters [#accountId|$accountName]\r\n\r\nShow list all characters for account selected by provided #accountId or $accountName, or for selected player in game.'),
('account create',4,'Syntax: .account create $account $passwordCreate account and set password to it.'),
('account delete',4,'Syntax: .account delete $accountDelete account with all characters.'),
('account lock',0,'Syntax: .account lock [on|off]Allow login from account only from current used IP or remove this requirement.'),
('account onlinelist',4,'Syntax: .account onlinelistShow list of online accounts.'),
('account password',0,'Syntax: .account password $old_password $new_password $new_passwordChange your account password.'),
('account set addon',3,'Syntax: .account set addon [#accountId|$accountName] #addon\r\n\r\nSet user (possible targeted) expansion addon level allowed. Addon values: 0 - normal, 1 - tbc, 2 - wotlk.'),
('account set gmlevel',4,'Syntax: .account set gmlevel [#accountId|$accountName] #level\r\n\r\nSet the security level for targeted player (can\'t be used at self) or for #accountId or $accountName to a level of #level.\r\n\r\n#level may range from 0 to 3.'),
('account set password',4,'Syntax: .account set password (#accountId|$accountName) $password $password\r\n\r\nSet password for account.'),
('additem',3,'Syntax: .additem #itemid/[#itemname]/#shift-click-item-link #itemcountAdds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added..'),
('additemset',3,'Syntax: .additemset #itemsetidAdd items from itemset of id #itemsetid to your or selected character inventory. Will add by one example each item from itemset.'),
('announce',1,'Syntax: .announce $MessageToBroadcastSend a global message to all players online in chat log.'),
('auction',3,'Syntax: .auction\r\n\r\nShow your team auction store.'),
('auction alliance',3,'Syntax: .auction alliance\r\n\r\nShow alliance auction store independent from your team.'),
('auction goblin',3,'Syntax: .auction goblin\r\n\r\nShow goblin auction store common for all teams.'),
('auction horde',3,'Syntax: .auction horde\r\n\r\nShow horde auction store independent from your team.'),
('aura',3,'Syntax: .aura #spellidAdd the aura from spell #spellid to the selected Unit.'),
('ban account',3,'Syntax: .ban account $Name $bantime $reasonBan account kick player.$bantime: negative value leads to permban, otherwise use a timestring like 4d20h3s\"\".\"'),
('ban character',3,'Syntax: .ban character $Name $bantime $reasonBan account and kick player.$bantime: negative value leads to permban, otherwise use a timestring like 4d20h3s\"\".\"'),
('ban ip',3,'Syntax: .ban ip $Ip $bantime $reasonBan IP.$bantime: negative value leads to permban, otherwise use a timestring like 4d20h3s\"\".\"'),
('baninfo account',3,'Syntax: .baninfo account $accountidWatch full information about a specific ban.'),
('baninfo character',3,'Syntax: .baninfo character $charactername Watch full information about a specific ban.'),
('baninfo ip',3,'Syntax: .baninfo ip $ipWatch full information about a specific ban.'),
('bank',3,'Syntax: .bankShow your bank inventory.'),
('banlist account',3,'Syntax: .banlist account [$Name]Searches the banlist for a account name pattern or show full list account bans.'),
('banlist character',3,'Syntax: .banlist character $NameSearches the banlist for a character name pattern. Pattern required.'),
('banlist ip',3,'Syntax: .banlist ip [$Ip]Searches the banlist for a IP pattern or show full list of IP bans.'),
('cast',3,'Syntax: .cast #spellid [triggered]  Cast #spellid to selected target. If no target selected cast to self. If \'trigered\' or part provided then spell casted with triggered flag.'),
('cast back',3,'Syntax: .cast back #spellid [triggered]  Selected target will cast #spellid to your character. If \'trigered\' or part provided then spell casted with triggered flag.'),
('cast dist',3,'Syntax: .cast dist #spellid [#dist [triggered]]  You will cast spell to pint at distance #dist. If \'trigered\' or part provided then spell casted with triggered flag. Not all spells can be casted as area spells.'),
('cast self',3,'Syntax: .cast self #spellid [triggered]Cast #spellid by target at target itself. If \'trigered\' or part provided then spell casted with triggered flag.'),
('cast target',3,'Syntax: .cast target #spellid [triggered]  Selected target will cast #spellid to his victim. If \'trigered\' or part provided then spell casted with triggered flag.'),
('character deleted delete',4,'Syntax: .character deleted delete #guid|$name\r\n\r\nCompletely deletes the selected characters.\r\nIf $name is supplied, only characters with that string in their name will be deleted, if #guid is supplied, only the character with that GUID will be deleted.'),
('character deleted list',3,'Syntax: .character deleted list [#guid|$name]\r\n\r\nShows a list with all deleted characters.\r\nIf $name is supplied, only characters with that string in their name will be selected, if #guid is supplied, only the character with that GUID will be selected.'),
('character deleted old',4,'Syntax: .character deleted old [#keepDays]\r\n\r\nCompletely deletes all characters with deleted time longer #keepDays. If #keepDays not provided the  used value from mangosd.conf option \'CharDelete.KeepDays\'. If referenced config option disabled (use 0 value) then command can\'t be used without #keepDays.'),
('character deleted restore',3,'Syntax: .character deleted restore #guid|$name [$newname] [#new account]\r\n\r\nRestores deleted characters.\r\nIf $name is supplied, only characters with that string in their name will be restored, if $guid is supplied, only the character with that GUID will be restored.\r\nIf $newname is set, the character will be restored with that name instead of the original one. If #newaccount is set, the character will be restored to specific account character list. This works only with one character!'),
('character erase',4,'Syntax: .character erase $name\r\n\r\nDelete character $name. Character finally deleted in case any deleting options.'),
('character level',3,'Syntax: .character level [$playername] [#level]Set the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent values recalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.'),
('character rename',2,'Syntax: .character rename [$name]Mark selected in game or by $name in command character for rename at next login.'),
('character reputation',2,'Syntax: .character reputation [$player_name]Show reputation information for selected player or player find by $player_name.'),
('combatstop',2,'Syntax: .combatstop [$playername]Stop combat for selected character. If selected non-player then command applied to self. If $playername provided then attempt applied to online player $playername.'),
('commands',0,'Syntax: .commandsDisplay a list of available commands for your account level.'),
('cooldown',3,'Syntax: .cooldown [#spell_id]Remove all (if spell_id not provided) or #spel_id spell cooldown from selected character or you (if no selection).'),
('damage',3,'Syntax: .damage $damage_amount [$school [$spellid]]Apply $damage to target. If not $school and $spellid provided then this flat clean melee damage without any modifiers. If $school provided then damage modified by armor reduction (if school physical), and target absorbing modifiers and result applied as melee damage to target. If spell provided then damage modified and applied as spell damage. $spellid can be shift-link.'),
('debug anim',2,'Syntax: .debug anim #emoteidPlay emote #emoteid for your character.'),
('debug bg',3,'Syntax: .debug bgToggle debug mode for battlegrounds. In debug mode GM can start battleground with single player.'),
('debug getitemvalue',3,'Syntax: .debug getitemvalue #itemguid #field [int|hex|bit|float]\r\n\r\nGet the field #field of the item #itemguid in your inventroy.\r\n\r\nUse type arg for set output format: int (decimal number), hex (hex value), bit (bitstring), float. By default use integer output.'),
('debug getvalue',3,'Syntax: .debug getvalue #field [int|hex|bit|float]\r\n\r\nGet the field #field of the selected target. If no target is selected, get the content of your field.\r\n\r\nUse type arg for set output format: int (decimal number), hex (hex value), bit (bitstring), float. By default use integer output.'),
('debug moditemvalue',3,'Syntax: .debug moditemvalue #guid #field [int|float| &= | |= | &=~ ] #value\r\n\r\nModify the field #field of the item #itemguid in your inventroy by value #value. \r\n\r\nUse type arg for set mode of modification: int (normal add/subtract #value as decimal number), float (add/subtract #value as float number), &= (bit and, set to 0 all bits in value if it not set to 1 in #value as hex number), |= (bit or, set to 1 all bits in value if it set to 1 in #value as hex number), &=~ (bit and not, set to 0 all bits in value if it set to 1 in #value as hex number). By default expect integer add/subtract.'),
('debug modvalue',3,'Syntax: .debug modvalue #field [int|float| &= | |= | &=~ ] #value\r\n\r\nModify the field #field of the selected target by value #value. If no target is selected, set the content of your field.\r\n\r\nUse type arg for set mode of modification: int (normal add/subtract #value as decimal number), float (add/subtract #value as float number), &= (bit and, set to 0 all bits in value if it not set to 1 in #value as hex number), |= (bit or, set to 1 all bits in value if it set to 1 in #value as hex number), &=~ (bit and not, set to 0 all bits in value if it set to 1 in #value as hex number). By default expect integer add/subtract.'),
('debug play cinematic',1,'Syntax: .debug play cinematic #cinematicidPlay cinematic #cinematicid for you. You stay at place while your mind fly.'),
('debug play sound',1,'Syntax: .debug play sound #soundidPlay sound with #soundid.Sound will be play only for you. Other players do not hear this.Warning: client may have more 5000 sounds...'),
('debug setitemvalue',3,'Syntax: .debug setitemvalue #guid #field [int|hex|bit|float] #value\r\n\r\nSet the field #field of the item #itemguid in your inventroy to value #value.\r\n\r\nUse type arg for set input format: int (decimal number), hex (hex value), bit (bitstring), float. By default expect integer input format.'),
('debug setvalue',3,'Syntax: .debug setvalue #field [int|hex|bit|float] #value\r\n\r\nSet the field #field of the selected target to value #value. If no target is selected, set the content of your field.\r\n\r\nUse type arg for set input format: int (decimal number), hex (hex value), bit (bitstring), float. By default expect integer input format.'),
('debug spellcoefs',3,'Syntax: .debug spellcoefs #spellid\r\n\r\nShow default calculated and DB stored coefficients for direct/dot heal/damage.'),
('debug spellmods',3,'Syntax: .debug spellmods (flat|pct) #spellMaskBitIndex #spellModOp #value\r\n\r\nSet at client side spellmod affect for spell that have bit set with index #spellMaskBitIndex in spell family mask for values dependent from spellmod #spellModOp to #value.'),
('delticket',2,'Syntax: .delticket all        .delticket #num        .delticket $character_nameall to dalete all tickets at server, $character_name to delete ticket of this character, #num to delete ticket #num.'),
('demorph',2,'Syntax: .demorphDemorph the selected player.'),
('die',3,'Syntax: .dieKill the selected player. If no player is selected, it will kill you.'),
('dismount',0,'Syntax: .dismountDismount you, if you are mounted.'),
('distance',3,'Syntax: .distance [$name/$link]Display the distance from your character to the selected creature/player, or player with name $name, or player/creature/gameobject pointed to shift-link with guid.'),
('event',2,'Syntax: .event #event_idShow details about event with #event_id.'),
('event list',2,'Syntax: .event listShow list of currently active events.Show list of all events'),
('event start',2,'Syntax: .event start #event_idStart event #event_id. Set start time for event to current moment (change not saved in DB).'),
('event stop',2,'Syntax: .event stop #event_idStop event #event_id. Set start time for event to time in past that make current moment is event stop time (change not saved in DB).'),
('explorecheat',3,'Syntax: .explorecheat #flagReveal  or hide all maps for the selected player. If no player is selected, hide or reveal maps to you.Use a #flag of value 1 to reveal, use a #flag value of 0 to hide all maps.'),
('gearscore',3,'Syntax: .gearscore [#withBags] [#withBank]\r\n\r\nShow selected player\'s gear score. Check items in bags if #withBags != 0 and check items in Bank if #withBank != 0. Default: 1 for bags and 0 for bank'),
('gm',1,'Syntax: .gm [on/off]Enable or Disable in game GM MODE or show current state of on/off not provided.'),
('gm chat',1,'Syntax: .gm chat [on/off]Enable or disable chat GM MODE (show gm badge in messages) or show current state of on/off not provided.'),
('gm fly',3,'Syntax: .gm fly [on/off]Enable/disable gm fly mode.'),
('gm ingame',0,'Syntax: .gm ingameDisplay a list of available in game Game Masters.'),
('gm list',3,'Syntax: .gm listDisplay a list of all Game Masters accounts and security levels.'),
('gm setview',1,'Syntax: .gm setview\r\n\r\nSet farsight view on selected unit. Select yourself to set view back.'),
('gm visible',1,'Syntax: .gm visible on/offOutput current visibility state or make GM visible(on) and invisible(off) for other players.'),
('go',1,'Syntax: .go  [$playername|pointlink|#x #y #z [#mapid]]\r\nTeleport your character to point with coordinates of player $playername, or coordinates of one from shift-link types: player, tele, taxinode, creature/creature_entry, gameobject/gameobject_entry, or explicit #x #y #z #mapid coordinates.'),
('go creature',1,'Syntax: .go creature (#creature_guid|$creature_name|id #creature_id)\r\nTeleport your character to creature with guid #creature_guid, or teleport your character to creature with name including as part $creature_name substring, or teleport your character to a creature that was spawned from the template with this entry #creature_id.'),
('go graveyard',1,'Syntax: .go graveyard #graveyardId Teleport to graveyard with the graveyardId specified.'),
('go grid',1,'Syntax: .go grid #gridX #gridY [#mapId]Teleport the gm to center of grid with provided indexes at map #mapId (or current map if it not provided).'),
('go object',1,'Syntax: .go object (#gameobject_guid|$gameobject_name|id #gameobject_id)\r\nTeleport your character to gameobject with guid #gameobject_guid, or teleport your character to gameobject with name including as part $gameobject_name substring, or teleport your character to a gameobject that was spawned from the template with this entry #gameobject_id.'),
('go taxinode',1,'Syntax: .go taxinode #taxinodeTeleport player to taxinode coordinates. You can look up zone using .lookup taxinode $namepart'),
('go trigger',1,'Syntax: .go trigger (#trigger_id|$trigger_shift-link|$trigger_target_shift-link) [target]\r\n\r\nTeleport your character to areatrigger with id #trigger_id or trigger id associated with shift-link. If additional arg \"target\" provided then character will telported to areatrigger target point.'),
('go xy',1,'Syntax: .go xy #x #y [#mapid]Teleport player to point with (#x,#y) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.'),
('go xyz',1,'Syntax: .go xyz #x #y #z [#mapid]Teleport player to point with (#x,#y,#z) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.'),
('go zonexy',1,'Syntax: .go zonexy #x #y [#zone]Teleport player to point with (#x,#y) client coordinates at ground(water) level in zone #zoneid or current zone if #zoneid not provided. You can look up zone using .lookup area $namepart'),
('gobject add',2,'Syntax: .gobject add #id <spawntimeSecs>Add a game object from game object templates to the world at your current location using the #id.spawntimesecs sets the spawntime, it is optional.Note: this is a copy of .gameobject.'),
('gobject delete',2,'Syntax: .gobject delete #go_guidDelete gameobject with guid #go_guid.'),
('gobject move',2,'Syntax: .gobject move #goguid [#x #y #z]Move gameobject #goguid to character coordinates (or to (#x,#y,#z) coordinates if its provide).'),
('gobject near',2,'Syntax: .gobject near  [#distance]Output gameobjects at distance #distance from player. Output gameobject guids and coordinates sorted by distance from character. If #distance not provided use 10 as default value.'),
('gobject target',2,'Syntax: .gobject target [#go_id|#go_name_part]Locate and show position nearest gameobject. If #go_id or #go_name_part provide then locate and show position of nearest gameobject with gameobject template id #go_id or name included #go_name_part as part.'),
('gobject turn',2,'Syntax: .gobject turn #goguid Set for gameobject #goguid orientation same as current character orientation.'),
('goname',1,'Syntax: .goname [$charactername]Teleport to the given character. Either specify the character name or click on the character\'s portrait, e.g. when you are in a group. Character can be offline.'),
('gps',1,'Syntax: .gps [$name|$shift-link]Display the position information for a selected character or creature (also if player name $name provided then for named player, or if creature/gameobject shift-link provided then pointed creature/gameobject if it loaded). Position information includes X, Y, Z, and orientation, map Id and zone Id'),
('groupgo',1,'Syntax: .groupgo [$charactername]Teleport the given character and his group to you. Teleported only online characters but original selected group member can be offline.'),
('guid',2,'Syntax: .guidDisplay the GUID for the selected character.'),
('guild create',2,'Syntax: .guild create [$GuildLeaderName] $GuildName\"\"Create a guild named $GuildName with the player $GuildLeaderName (or selected) as leader.  Guild name must in quotes.\"'),
('guild delete',2,'Syntax: .guild delete $GuildName\"\"Delete guild $GuildName. Guild name must in quotes.\"'),
('guild invite',2,'Syntax: .guild invite [$CharacterName] $GuildName\"\"Add player $CharacterName (or selected) into a guild $GuildName. Guild name must in quotes.\"'),
('guild rank',2,'Syntax: .guild rank $CharacterName #RankSet for $CharacterName rank #Rank in a guild.'),
('guild uninvite',2,'Syntax: .guild uninvite [$CharacterName]Remove player $CharacterName (or selected) from a guild.'),
('help',0,'Syntax: .help [$command]Display usage instructions for the given $command. If no $command provided show list available commands.'),
('hidearea',3,'Syntax: .hidearea #areaidHide the area of #areaid to the selected character. If no character is selected, hide this area to you.'),
('honor add',2,'Syntax: .honor add $amountAdd a certain amount of honor (gained in lifetime) to the selected player.'),
('honor addkill',2,'Syntax: .honor addkikllAdd the targeted unit as one of your pvp kills today (you only get honor if it\'s a racial leader or a player)'),
('honor show',1,'Syntax: .honor showDisplay the honor stats of the selected player'),
('honor update',2,'Syntax: .honor updateForce honor to be update'),
('hover',3,'Syntax: .hover #flagEnable or disable hover mode for your character.Use a #flag of value 1 to enable, use a #flag value of 0 to disable hover.'),
('instance listbinds',3,'Syntax: .instance listbinds  Lists the binds of the selected player.'),
('instance savedata',3,'Syntax: .instance savedata  Save the InstanceData for the current player\'s map to the DB.'),
('instance stats',3,'Syntax: .instance stats  Shows statistics about instances.'),
('instance unbind',3,'Syntax: .instance unbind all  All of the selected player\'s binds will be cleared..instance unbind #mapid Only the specified #mapid instance will be cleared.'),
('itemmove',2,'Syntax: .itemmove #sourceslotid #destinationslotidMove an item from slots #sourceslotid to #destinationslotid in your inventoryNot yet implemented'),
('kick',2,'Syntax: .kick [$charactername]Kick the given character name from the world. If no character name is provided then the selected player (except for yourself) will be kicked.'),
('learn',3,'Syntax: .learn #spell [all]Selected character learn a spell of id #spell. If \'all\' provided then all ranks learned.'),
('learn all',3,'Syntax: .learn allLearn all big set different spell maybe useful for Administaror.'),
('learn all_crafts',2,'Syntax: .learn craftsLearn all professions and recipes.'),
('learn all_default',1,'Syntax: .learn all_default [$playername]Learn for selected/$playername player all default spells for his race/class and spells rewarded by completed quests.'),
('learn all_gm',2,'Syntax: .learn all_gmLearn all default spells for Game Masters.'),
('learn all_lang',1,'Syntax: .learn all_langLearn all languages'),
('learn all_myclass',3,'Syntax: .learn all_myclassLearn all spells and talents available for his class.'),
('learn all_myspells',3,'Syntax: .learn all_myspellsLearn all spells (except talents and spells with first rank learned as talent) available for his class.'),
('learn all_mytalents',3,'Syntax: .learn all_mytalentsLearn all talents (and spells with first rank learned as talent) available for his class.'),
('learn all_recipes',2,'Syntax: .learn all_recipes [$profession]Learns all recipes of specified profession and sets skill level to max.Example: .learn all_recipes enchanting'),
('levelup',3,'Syntax: .levelup [$playername] [#numberoflevels]Increase/decrease the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent VALUESrecalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.'),
('linkgrave',3,'Syntax: .linkgrave #graveyard_id [alliance|horde]Link current zone to graveyard for any (or alliance/horde faction ghosts). This let character ghost from zone teleport to graveyard after die if graveyard is nearest from linked to zone and accept ghost of this faction. Add only single graveyard at another map and only if no graveyards linked (or planned linked at same map).'),
('list creature',3,'Syntax: .list creature #creature_id [#max_count]Output creatures with creature id #creature_id found in world. Output creature guids and coordinates sorted by distance from character. Will be output maximum #max_count creatures. If #max_count not provided use 10 as default value.'),
('list item',3,'Syntax: .list item #item_id [#max_count]Output items with item id #item_id found in all character inventories, mails, auctions, and guild banks. Output item guids, item owner guid, owner account and owner name (guild name and guid in case guild bank). Will be output maximum #max_count items. If #max_count not provided use 10 as default value.'),
('list object',3,'Syntax: .list object #gameobject_id [#max_count]Output gameobjects with gameobject id #gameobject_id found in world. Output gameobject guids and coordinates sorted by distance from character. Will be output maximum #max_count gameobject. If #max_count not provided use 10 as default value.'),
('list talents',3,'Syntax: .list talents\r\n\r\nShow list all really known (as learned spells) talent rank spells for selected player or self.'),
('loadscripts',3,'Syntax: .loadscripts $scriptlibrarynameUnload current and load the script library $scriptlibraryname or reload current if $scriptlibraryname omitted, in case you changed it while the server was running.'),
('lookup account email',2,'Syntax: .lookup account email $emailpart [#limit] \r\n\r\n Searchs accounts, which email including $emailpart with optional parametr #limit of results. If #limit not provided expected 100.'),
('lookup account ip',2,'Syntax: lookup account ip $ippart [#limit] \r\n\r\n Searchs accounts, which last used ip inluding $ippart (textual) with optional parametr #$limit of results. If #limit not provided expected 100.'),
('lookup account name',2,'Syntax: .lookup account name $accountpart [#limit] \r\n\r\n Searchs accounts, which username including $accountpart with optional parametr #limit of results. If #limit not provided expected 100.'),
('lookup area',1,'Syntax: .lookup area $namepartLooks up an area by $namepart, and returns all matches with their area ID\'s.'),
('lookup creature',3,'Syntax: .lookup creature $namepartLooks up a creature by $namepart, and returns all matches with their creature ID\'s.'),
('lookup event',2,'Syntax: .lookup event $nameAttempts to find the ID of the event with the provided $name.'),
('lookup faction',3,'Syntax: .lookup faction $nameAttempts to find the ID of the faction with the provided $name.'),
('lookup item',3,'Syntax: .lookup item $itemnameLooks up an item by $itemname, and returns all matches with their Item ID\'s.'),
('lookup itemset',3,'Syntax: .lookup itemset $itemnameLooks up an item set by $itemname, and returns all matches with their Item set ID\'s.'),
('lookup object',3,'Syntax: .lookup object $objnameLooks up an gameobject by $objname, and returns all matches with their Gameobject ID\'s.'),
('lookup player account',2,'Syntax: .lookup player account $accountpart [#limit] \r\n\r\n Searchs players, which account username including $accountpart with optional parametr #limit of results. If #limit not provided expected 100.'),
('lookup player email',2,'Syntax: .lookup player email $emailpart [#limit] \r\n\r\n Searchs players, which account email including $emailpart with optional parametr #limit of results. If #limit not provided expected 100.'),
('lookup player ip',2,'Syntax: .lookup player ip $ippart [#limit] \r\n\r\n Searchs players, which account last used ip inluding $ippart (textual) with optional parametr #limit of results. If #limit not provided expected 100.'),
('lookup pool',2,'Syntax: .lookup pool $pooldescpart\r\n\r\nList of pools (anywhere) with substring in description.'),
('lookup quest',3,'Syntax: .lookup quest $namepartLooks up a quest by $namepart, and returns all matches with their quest ID\'s.'),
('lookup skill',3,'Syntax: .lookup skill $$namepartLooks up a skill by $namepart, and returns all matches with their skill ID\'s.'),
('lookup spell',3,'Syntax: .lookup spell $namepartLooks up a spell by $namepart, and returns all matches with their spell ID\'s.'),
('lookup taxinode',3,'Syntax: .lookup taxinode $substringSearch and output all taxinodes with provide $substring in name.'),
('lookup tele',1,'Syntax: .lookup tele $substringSearch and output all .tele command locations with provide $substring in name.'),
('maxskill',3,'Syntax: .maxskillSets all skills of the targeted player to their maximum VALUESfor its current level.'),
('modify aspeed',1,'Syntax: .modify aspeed #rateModify all speeds -run,swim,run back,swim back- of the selected player to \normalbase speed for this move type\"\"*rate. If no player is selected, modify your speed. #rate may range from 0.1 to 10.\"'),
('modify bwalk',1,'Syntax: .modify bwalk #rateModify the speed of the selected player while running backwards to \normal walk back speed\"\"*rate. If no player is selected, modify your speed. #rate may range from 0.1 to 10.\"'),
('modify drunk',1,'Syntax: .modify drunk #value Set drunk level to #value (0..100). Value 0 remove drunk state, 100 is max drunked state.'),
('modify energy',1,'Syntax: .modify energy #energyModify the energy of the selected player. If no player is selected, modify your energy.'),
('modify faction',1,'Syntax: .modify faction #factionid #flagid #npcflagid #dynamicflagidModify the faction and flags of the selected creature. Without arguments, display the faction and flags of the selected creature.'),
('modify gender',2,'Syntax: .modify gender male/femaleChange gender of selected player.'),
('modify honor',2,'Syntax: .modify honor $field $valueAdd $value to an honor $field (it\'s just for debug , values won\'t be saved at player logout)Field list: points / rank / todaykills / yesterdaykills / yesterdayhonor /thisweekkills / thisweekhonor / lastweekkills / lastweekhonor /lastweekstanding / lifetimedishonorablekills / lifetimehonorablekills '),
('modify hp',1,'Syntax: .modify hp #newhpModify the hp of the selected player. If no player is selected, modify your hp.'),
('modify mana',1,'Syntax: .modify mana #newmanaModify the mana of the selected player. If no player is selected, modify your mana.'),
('modify money',1,'Syntax: .modify money #money.money #moneyAdd or remove money to the selected player. If no player is selected, modify your money. #gold can be negative to remove money.'),
('modify morph',2,'Syntax: .modify morph #displayidChange your current model id to #displayid.'),
('modify mount',1,'Syntax: .modify mount #id #speedDisplay selected player as mounted at #id creature and set speed to #speed value.'),
('modify rage',1,'Syntax: .modify rage #newrageModify the rage of the selected player. If no player is selected, modify your rage.'),
('modify rep',2,'Syntax: .modify rep #repId (#repvalue | $rankname [#delta])Sets the selected players reputation with faction #repId to #repvalue or to $reprank.If the reputation rank name is provided, the resulting reputation will be the lowest reputation for that rank plus the delta amount, if specified.You can use \'.pinfo rep\' to list all known reputation ids, or use \'.lookup faction $name\' to locate a specific faction id.'),
('modify scale',1,'Syntax: .modify scale #scale\r\n\r\nChange model scale for targeted player (util relogin) or creature (until respawn).'),
('modify speed',1,'Syntax: .modify speed #rate.speed #rateModify the running speed of the selected player to \normal base run speed\"\"*rate. If no player is selected, modify your speed. #rate may range from 0.1 to 10.\"'),
('modify standstate',2,'Syntax: .modify standstate #emoteidChange the emote of your character while standing to #emoteid.'),
('modify swim',1,'Syntax: .modify swim #rateModify the swim speed of the selected player to \normal swim speed\"\"*rate. If no player is selected, modify your speed. #rate may range from 0.1 to 10.\"'),
('movegens',3,'Syntax: .movegens  Show movement generators stack for selected creature or player.'),
('mute',1,'Syntax: .mute [$playerName] $timeInMinutesDisible chat messaging for any character from account of character $playerName (or currently selected) at $timeInMinutes minutes. Player can be offline.'),
('namego',1,'Syntax: .namego [$charactername]Teleport the given character to you. Character can be offline.'),
('neargrave',3,'Syntax: .neargrave [alliance|horde]Find nearest graveyard linked to zone (or only nearest from accepts alliance or horde faction ghosts).'),
('notify',1,'Syntax: .notify $MessageToBroadcastSend a global message to all players online in screen.'),
('npc add',2,'Syntax: .npc add #creatureidSpawn a creature by the given template id of #creatureid.'),
('npc additem',2,'Syntax: .npc additem #itemId <#maxcount><#incrtime>r\r\n\r\nAdd item #itemid to item list of selected vendor. Also optionally set max count item in vendor item list and time to item count restoring.'),
('npc addmove',2,'Syntax: .npc addmove #creature_guid [#waittime]Add your current location as a waypoint for creature with guid #creature_guid. And optional add wait time.'),
('npc addweapon',3,'Not yet implemented.'),
('npc aiinfo',2,'Syntax: .npc npc aiinfo\r\n\r\nShow npc AI and script information.'),
('npc allowmove',3,'Syntax: .npc allowmoveEnable or disable movement creatures in world. Not implemented.'),
('npc changelevel',2,'Syntax: .npc changelevel #levelChange the level of the selected creature to #level.#level may range from 1 to 63.'),
('npc delete',2,'Syntax: .npc delete [#guid]Delete creature with guid #guid (or the selected if no guid is provided)'),
('npc delitem',2,'Syntax: .npc delitem #itemIdRemove item #itemid from item list of selected vendor.'),
('npc factionid',2,'Syntax: .npc factionid #factionidSet the faction of the selected creature to #factionid.'),
('npc flag',2,'Syntax: .npc flag #npcflagSet the NPC flags of creature template of the selected creature and selected creature to #npcflag. NPC flags will applied to all creatures of selected creature template after server restart or grid unload/load.'),
('npc follow',2,'Syntax: .npc followSelected creature start follow you until death/fight/etc.'),
('npc info',3,'Syntax: .npc infoDisplay a list of details for the selected creature.The list includes:- GUID, Faction, NPC flags, Entry ID, Model ID,- Level,- Health (current/maximum),- Field flags, dynamic flags, faction template, - Position information,- and the creature type, e.g. if the creature is a vendor.'),
('npc move',2,'Syntax: .npc move [#creature_guid]Move the targeted creature spawn point to your coordinates.'),
('npc name',2,'Syntax: .npc name $nameChange the name of the selected creature or character to $name.Command disabled.'),
('npc playemote',3,'Syntax: .npc playemote #emoteidMake the selected creature emote with an emote of id #emoteid.'),
('npc say',1,'Syntax: .npc say #text\r\nMake the selected npc says #text.'),
('npc setdeathstate',2,'Syntax: .npc setdeathstate on/offSet default death state (dead/alive) for npc at spawn.'),
('npc setmodel',2,'Syntax: .npc setmodel #displayidChange the model id of the selected creature to #displayid.'),
('npc setmovetype',2,'Syntax: .npc setmovetype [#creature_guid] stay/random/way [NODEL]Set for creature pointed by #creature_guid (or selected if #creature_guid not provided) movement type and move it to respawn position (if creature alive). Any existing waypoints for creature will be removed from the database if you do not use NODEL. If the creature is dead then movement type will applied at creature respawn.Make sure you use NODEL, if you want to keep the waypoints.'),
('npc spawndist',2,'Syntax: .npc spawndist #distAdjust spawndistance of selected creature to dist.'),
('npc spawntime',2,'Syntax: .npc spawntime #time Adjust spawntime of selected creature to time.'),
('npc subname',2,'Syntax: .npc subname $NameChange the subname of the selected creature or player to $Name.Command disabled.'),
('npc tame',2,'Syntax: .npc tameTame selected creature (tameable non pet creature). You don\'t must have pet.'),
('npc textemote',1,'Syntax: .npc textemote #emoteidMake the selected creature to do textemote with an emote of id #emoteid.'),
('npc unfollow',2,'Syntax: .npc unfollowSelected creature (non pet) stop follow you.'),
('npc whisper',1,'Syntax: .npc whisper #playerguid #textMake the selected npc whisper #text to  #playerguid.'),
('npc yell',1,'Syntax: .npc yell #text\r\nMake the selected npc yells #text.'),
('pdump load',3,'Syntax: .pdump load $filename $account [$newname] [$newguid]Load character dump from dump file into character list of $account with saved or $newname, with saved (or first free) or $newguid guid.'),
('pdump write',3,'Syntax: .pdump write $filename $playerNameOrGUIDWrite character dump with name/guid $playerNameOrGUID to file $filename.'),
('pinfo',2,'Syntax: .pinfo [$player_name]Output account information for selected player or player find by $player_name.'),
('pool',2,'Syntax: .pool #pool_id\r\n\r\nPool information and full list creatures/gameobjects included in pool.'),
('pool list',2,'Syntax: .pool list\r\n\r\nList of pools with spawn in current map (only work in instances. Non-instanceable maps share pool system state os useless attempt get all pols at all continents.'),
('pool spawns',2,'Syntax: .pool spawns #pool_id\r\n\r\nList current creatures/objects listed in pools (or in specific #pool_id) and spawned (added to grid data, not meaning show in world.'),
('quest add',3,'Syntax: .quest add #quest_idAdd to character quest log quest #quest_id. Quest started from item can\'t be added by this command but correct .additem call provided in command output.'),
('quest complete',3,'Syntax: .quest complete #questidMark all quest objectives as completed for target character active quest. After this target character can go and get quest reward.'),
('quest remove',3,'Syntax: .quest remove #quest_idSet quest #quest_id state to not completed and not active (and remove from active quest list) for selected player.'),
('quit',4,'Syntax: quit\r\n\r\nClose RA connection. Command must be typed fully (quit).'),
('recall',1,'Syntax: .recall [$playername]Teleport $playername or selected player to the place where he has been before last use of a teleportation command. If no $playername is entered and no player is selected, it will teleport you.'),
('reload all',3,'Syntax: .reload allReload all tables with reload support added and that can be _safe_ reloaded.'),
('reload all_area',3,'Syntax: .reload all_areaReload all `areatrigger_*` tables if reload support added for this table and this table can be _safe_ reloaded.'),
('reload all_eventai',3,'Syntax: .reload all_eventai\r\n\r\nReload `creature_ai_*` tables if reload support added for these tables and these tables can be _safe_ reloaded.'),
('reload all_item',3,'Syntax: .reload all_item\r\n\r\nReload `item_required_target`, `page_texts` and `item_enchantment_template` tables.'),
('reload all_locales',3,'Syntax: .reload all_localesReload all `locales_*` tables with reload support added and that can be _safe_ reloaded.'),
('reload all_loot',3,'Syntax: .reload all_lootReload all `*_loot_template` tables. This can be slow operation with lags for server run.'),
('reload all_npc',3,'Syntax: .reload all_npc\r\n\r\nReload `points_of_interest` and `npc_*` tables if reload support added for these tables and these tables can be _safe_ reloaded.'),
('reload all_quest',3,'Syntax: .reload all_questReload all quest related tables if reload support added for this table and this table can be _safe_ reloaded.'),
('reload all_scripts',3,'Syntax: .reload all_scripts\r\n\r\nReload `*_scripts` tables.'),
('reload all_spell',3,'Syntax: .reload all_spellReload all `spell_*` tables with reload support added and that can be _safe_ reloaded.'),
('reload config',3,'Syntax: .reload configReload config settings (by default stored in mangosd.conf). Not all settings can be change at reload: some new setting values will be ignored until restart, some values will applied with delay or only to new objects/maps, some values will explicitly rejected to change at reload.'),
('repairitems',2,'Syntax: .repairitemsRepair all selected player\'s items.'),
('reset all',3,'Syntax: .reset all spellsSyntax: .reset all talentsRequest reset spells or talents at next login each existed character.'),
('reset honor',3,'Syntax: .reset honor [Playername]  Reset all honor data for targeted character.'),
('reset level',3,'Syntax: .reset level [Playername]  Reset level to 1 including reset stats and talents.  Equipped items with greater level requirement can be lost.'),
('reset spells',3,'Syntax: .reset spells [Playername]  Removes all non-original spells from spellbook.. Playername can be name of offline character.'),
('reset stats',3,'Syntax: .reset stats [Playername]  Resets(recalculate) all stats of the targeted player to their original VALUESat current level.'),
('reset talents',3,'Syntax: .reset talents [Playername]  Removes all talents of the targeted player. Playername can be name of offline character.'),
('respawn',3,'Syntax: .respawnRespawn selected creature or respawn all nearest creatures (if none selected) and GO without waiting respawn time expiration.'),
('revive',3,'Syntax: .reviveRevive the selected player. If no player is selected, it will revive you.'),
('save',0,'Syntax: .saveSaves your character.'),
('saveall',1,'Syntax: .saveallSave all characters in game.'),
('send items',3,'Syntax: .send items #playername #subject\"\" \"\"#text\"\" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]Send a mail to a player. Subject and mail text must be in \"\"\"\". If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.\"'),
('send mail',1,'Syntax: .send mail #playername #subject\"\" \"\"#text\"\"Send a mail to a player. Subject and mail text must be in \"\"\"\".\"'),
('send mass items',3,'Syntax: .send mass items #racemask|$racename|alliance|horde|all \"#subject\" \"#text\" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]\r\n\r\nSend a mail to players. Subject and mail text must be in \"\". If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.'),
('send mass mail',3,'Syntax: .send mass mail #racemask|$racename|alliance|horde|all \"#subject\" \"#text\"\r\n\r\nSend a mail to players. Subject and mail text must be in \"\".'),
('send mass money',3,'Syntax: .send mass money #racemask|$racename|alliance|horde|all \"#subject\" \"#text\" #money\r\n\r\nSend mail with money to players. Subject and mail text must be in \"\".'),
('send message',3,'Syntax: .send message $playername $messageSend screen message to player from ADMINISTRATOR.'),
('send money',3,'Syntax: .send money #playername #subject\"\" \"\"#text\"\" #moneySend mail with money to a player. Subject and mail text must be in \"\"\"\".\"'),
('server corpses',2,'Syntax: .server corpsesTriggering corpses expire check in world.'),
('server exit',4,'Syntax: .server exitTerminate mangosd NOW. Exit code 0.'),
('server idlerestart',3,'Syntax: .server idlerestart #delayRestart the server after #delay seconds if no active connections are present (no players). Use #exist_code or 2 as program exist code.'),
('server idlerestart cancel',3,'Syntax: .server idlerestart cancelCancel the restart/shutdown timer if any.'),
('server idleshutdown',3,'Syntax: .server idleshutdown #delay [#exist_code]Shut the server down after #delay seconds if no active connections are present (no players). Use #exist_code or 0 as program exist code.'),
('server idleshutdown cancel',3,'Syntax: .server idleshutdown cancelCancel the restart/shutdown timer if any.'),
('server info',0,'Syntax: .server infoDisplay server version and the number of connected players.'),
('server log filter',4,'Syntax: .server log filter [($filtername|all) (on|off)]\r\n\r\nShow or set server log filters. If used \"all\" then all filters will be set to on/off state.'),
('server log level',4,'Syntax: .server log level [#level]\r\n\r\nShow or set server log level (0 - errors only, 1 - basic, 2 - detail, 3 - debug).'),
('server motd',0,'Syntax: .server motdShow server Message of the day.'),
('server plimit',3,'Syntax: .server plimit [#num|-1|-2|-3|reset|player|moderator|gamemaster|administrator]Without arg show current player amount and security level limitations for login to server, with arg set player linit ($num > 0) or securiti limitation ($num < 0 or security leme name. With `reset` sets player limit to the one in the config file'),
('server restart',3,'Syntax: .server restart #delayRestart the server after #delay seconds. Use #exist_code or 2 as program exist code.'),
('server restart cancel',3,'Syntax: .server restart cancelCancel the restart/shutdown timer if any.'),
('server set motd',3,'Syntax: .server set motd $MOTDSet server Message of the day.'),
('server shutdown',3,'Syntax: .server shutdown #delay [#exit_code]\r\n\r\nShut the server down after #delay seconds. Use #exit_code or 0 as program exit code.'),
('server shutdown cancel',3,'Syntax: .server shutdown cancelCancel the restart/shutdown timer if any.'),
('setskill',3,'Syntax: .setskill #skill #level [#max]Set a skill of id #skill with a current skill value of #level and a maximum value of #max (or equal current maximum if not provide) for the selected character. If no character is selected, you learn the skill.'),
('showarea',3,'Syntax: .showarea #areaidReveal the area of #areaid to the selected character. If no character is selected, reveal this area to you.'),
('stable',3,'Syntax: .stable\r\n\r\nShow your pet stable.'),
('start',0,'Syntax: .startTeleport you to the starting area of your character.'),
('taxicheat',1,'Syntax: .taxicheat on/offTemporary grant access or remove to all taxi routes for the selected character. If no character is selected, hide or reveal all routes to you.Visited taxi nodes sill accessible after removing access.'),
('tele',1,'Syntax: .tele #locationTeleport player to a given location.'),
('tele add',3,'Syntax: .tele add $nameAdd current your position to .tele command target locations list with name $name.'),
('tele del',3,'Syntax: .tele del $nameRemove location with name $name for .tele command locations list.'),
('tele group',1,'Syntax: .tele group#locationTeleport a selected player and his group members to a given location.'),
('tele name',1,'Syntax: .tele name [#playername] #locationTeleport the given character to a given location. Character can be offline.'),
('ticket',2,'Syntax: .ticket on\r\n        .ticket off\r\n        .ticket #num\r\n        .ticket $character_name\r\n        .ticket respond #num $response\r\n        .ticket respond $character_name $response\r\n\r\non/off for GMs to show or not a new ticket directly, $character_name to show ticket of this character, #num to show ticket #num.'),
('trigger',2,'Syntax: .trigger [#trigger_id|$trigger_shift-link|$trigger_target_shift-link]\r\n\r\nShow detail infor about areatrigger with id #trigger_id or trigger id associated with shift-link. If areatrigger id or shift-link not provided then selected nearest areatrigger at current map.'),
('trigger active',2,'Syntax: .trigger active\r\n\r\nShow list of areatriggers wiht activation zone including current character position.'),
('trigger near',2,'Syntax: .trigger near [#distance]\r\n\r\nOutput areatriggers at distance #distance from player. If #distance not provided use 10 as default value.'),
('unaura',3,'Syntax: .unaura #spellidRemove aura due to spell #spellid from the selected Unit.'),
('unban account',3,'Syntax: .unban account $NameUnban accounts for account name pattern.'),
('unban character',3,'Syntax: .unban character $NameUnban accounts for character name pattern.'),
('unban ip',3,'Syntax : .unban ip $IpUnban accounts for IP pattern.'),
('unlearn',3,'Syntax: .unlearn #spell [all]Unlearn for selected player a spell #spell.  If \'all\' provided then all ranks unlearned.'),
('unmute',1,'Syntax: .unmute $playerNameRestore chat messaging for any character from account of character $playerName.'),
('waterwalk',2,'Syntax: .waterwalk on/offSet on/off waterwalk state for selected player.'),
('wchange',3,'Syntax: .wchange #weathertype #statusSet current weather to #weathertype with an intensity of #status.#weathertype can be 1 for rain, 2 for snow, and 3 for sand. #status can be 0 for disabled, and 1 for enabled.'),
('whispers',1,'Syntax: .whispers on|offEnable/disable accepting whispers by GM from players. By default use mangosd.conf setting.'),
('wp add',2,'Syntax: .wp add [#creature_guid or Select a Creature]'),
('wp export',3,'Syntax: .wp export [#creature_guid or Select a Creature] $filename'),
('wp import',3,'Syntax: .wp import $filename'),
('wp modify',2,'Syntax: .wp modify [#creature_guid or Select a Creature]add - Add a waypoint after the selected visualwaittime $timeemote IDspell IDtext1| text2| text3| text4| text5 <text>model1 IDmodel2 IDmove(moves wp to player pos)del (deletes the wp)Only one parameter per time!'),
('wp show',2,'Syntax: .wp show [#creature_guid or Select a Creature]onfirstlastoffinfoFor using info you have to do first show on and than select a Visual-Waypoint and do the show info!');
/*!40000 ALTER TABLE `command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature`
--

DROP TABLE IF EXISTS `creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(9) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(10) unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '5',
  `currentwaypoint` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `DeathState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `index_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_addon`
--

DROP TABLE IF EXISTS `creature_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `b2_0_sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `b2_1_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `moveflags` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_ai_scripts`
--

DROP TABLE IF EXISTS `creature_ai_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_ai_scripts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `creature_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Template Identifier',
  `event_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type',
  `event_inverse_phase_mask` int(11) NOT NULL DEFAULT '0' COMMENT 'Mask which phases this event will not trigger in',
  `event_chance` int(3) unsigned NOT NULL DEFAULT '100',
  `event_flags` int(3) unsigned NOT NULL DEFAULT '0',
  `event_param1` int(11) NOT NULL DEFAULT '0',
  `event_param2` int(11) NOT NULL DEFAULT '0',
  `event_param3` int(11) NOT NULL DEFAULT '0',
  `event_param4` int(11) NOT NULL DEFAULT '0',
  `action1_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action1_param1` int(11) NOT NULL DEFAULT '0',
  `action1_param2` int(11) NOT NULL DEFAULT '0',
  `action1_param3` int(11) NOT NULL DEFAULT '0',
  `action2_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action2_param1` int(11) NOT NULL DEFAULT '0',
  `action2_param2` int(11) NOT NULL DEFAULT '0',
  `action2_param3` int(11) NOT NULL DEFAULT '0',
  `action3_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action3_param1` int(11) NOT NULL DEFAULT '0',
  `action3_param2` int(11) NOT NULL DEFAULT '0',
  `action3_param3` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Scripts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_ai_summons`
--

DROP TABLE IF EXISTS `creature_ai_summons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_ai_summons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Location Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) unsigned NOT NULL DEFAULT '120',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Summon Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Summoning Locations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_ai_texts`
--

DROP TABLE IF EXISTS `creature_ai_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_ai_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_battleground`
--

DROP TABLE IF EXISTS `creature_battleground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_battleground` (
  `guid` int(10) unsigned NOT NULL COMMENT 'Creature''s GUID',
  `event1` tinyint(3) unsigned NOT NULL COMMENT 'main event',
  `event2` tinyint(3) unsigned NOT NULL COMMENT 'sub event',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature battleground indexing system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_equip_template`
--

DROP TABLE IF EXISTS `creature_equip_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_equip_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `equipentry1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipentry2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipentry3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_equip_template_raw`
--

DROP TABLE IF EXISTS `creature_equip_template_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_equip_template_raw` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `equipmodel1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipinfo1` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo2` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo3` int(10) unsigned NOT NULL DEFAULT '0',
  `equipslot1` int(11) NOT NULL DEFAULT '0',
  `equipslot2` int(11) NOT NULL DEFAULT '0',
  `equipslot3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_involvedrelation`
--

DROP TABLE IF EXISTS `creature_involvedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_linking_template`
--

DROP TABLE IF EXISTS `creature_linking_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_linking_template` (
  `entry` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'creature_template.entry of the slave mob that is linked',
  `map` mediumint(8) unsigned NOT NULL COMMENT 'Id of map of the mobs',
  `master_entry` int(10) unsigned NOT NULL COMMENT 'master to trigger events',
  `flag` mediumint(8) unsigned NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY (`entry`,`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature Linking System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_loot_template`
--

DROP TABLE IF EXISTS `creature_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry 0 used for player insignia loot',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_model_info`
--

DROP TABLE IF EXISTS `creature_model_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_model_info` (
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_other_team` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_movement`
--

DROP TABLE IF EXISTS `creature_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_movement` (
  `id` int(10) unsigned NOT NULL COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0',
  `script_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `textid1` int(11) NOT NULL DEFAULT '0',
  `textid2` int(11) NOT NULL DEFAULT '0',
  `textid3` int(11) NOT NULL DEFAULT '0',
  `textid4` int(11) NOT NULL DEFAULT '0',
  `textid5` int(11) NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `wpguid` int(11) NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `model1` mediumint(9) NOT NULL DEFAULT '0',
  `model2` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_movement_scripts`
--

DROP TABLE IF EXISTS `creature_movement_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_movement_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_movement_template`
--

DROP TABLE IF EXISTS `creature_movement_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_movement_template` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Creature entry',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0',
  `script_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `textid1` int(11) NOT NULL DEFAULT '0',
  `textid2` int(11) NOT NULL DEFAULT '0',
  `textid3` int(11) NOT NULL DEFAULT '0',
  `textid4` int(11) NOT NULL DEFAULT '0',
  `textid5` int(11) NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `wpguid` int(11) NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `model1` mediumint(9) NOT NULL DEFAULT '0',
  `model2` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature waypoint system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_onkill_reputation`
--

DROP TABLE IF EXISTS `creature_onkill_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `TeamDependent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_questrelation`
--

DROP TABLE IF EXISTS `creature_questrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template`
--

DROP TABLE IF EXISTS `creature_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int(11) unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int(11) unsigned NOT NULL DEFAULT '0',
  `modelid_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(100) NOT NULL DEFAULT '0',
  `subname` char(100) DEFAULT NULL,
  `gossip_menu_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `minlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `minhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `minmana` int(10) unsigned NOT NULL DEFAULT '0',
  `maxmana` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction_A` smallint(5) unsigned NOT NULL DEFAULT '0',
  `faction_H` smallint(5) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mindmg` float NOT NULL DEFAULT '0',
  `maxdmg` float NOT NULL DEFAULT '0',
  `dmgschool` tinyint(4) NOT NULL DEFAULT '0',
  `attackpower` int(10) unsigned NOT NULL DEFAULT '0',
  `dmg_multiplier` float NOT NULL DEFAULT '1',
  `baseattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `rangeattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unit_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  `family` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_type` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `trainer_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `trainer_race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minrangedmg` float NOT NULL DEFAULT '0',
  `maxrangedmg` float NOT NULL DEFAULT '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `lootid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `skinloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint(5) NOT NULL DEFAULT '0',
  `resistance2` smallint(5) NOT NULL DEFAULT '0',
  `resistance3` smallint(5) NOT NULL DEFAULT '0',
  `resistance4` smallint(5) NOT NULL DEFAULT '0',
  `resistance5` smallint(5) NOT NULL DEFAULT '0',
  `resistance6` smallint(5) NOT NULL DEFAULT '0',
  `spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) DEFAULT NULL,
  `MovementType` tinyint(3) unsigned DEFAULT '0',
  `InhabitType` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `Civilian` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RacialLeader` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RegenHealth` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `trainer_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vendor_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mechanic_immune_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `flags_extra` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_addon`
--

DROP TABLE IF EXISTS `creature_template_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `b2_0_sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `b2_1_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `moveflags` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_script_string`
--

DROP TABLE IF EXISTS `db_script_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_script_string` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` varchar(120) DEFAULT NULL,
  `creature_ai_version` varchar(120) DEFAULT NULL,
  `required_z1824_xxxxx_01_mangos_spell_affect_event` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Used DB version notes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disenchant_loot_template`
--

DROP TABLE IF EXISTS `disenchant_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disenchant_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_scripts`
--

DROP TABLE IF EXISTS `event_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exploration_basexp`
--

DROP TABLE IF EXISTS `exploration_basexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exploration_basexp` (
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `basexp` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fishing_loot_template`
--

DROP TABLE IF EXISTS `fishing_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fishing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry 0 used for junk loot at fishing fail (if allowed by config option)',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event`
--

DROP TABLE IF EXISTS `game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '86400' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '43200' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_creature`
--

DROP TABLE IF EXISTS `game_event_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_creature` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Negatives value to remove during event and ignore pool grouping, positive value for spawn during event and if guid is part of pool then al pool memebers must be listed as part of event spawn.',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_creature_data`
--

DROP TABLE IF EXISTS `game_event_creature_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_creature_data` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_gameobject`
--

DROP TABLE IF EXISTS `game_event_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_gameobject` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Negatives value to remove during event and ignore pool grouping, positive value for spawn during event and if guid is part of pool then al pool memebers must be listed as part of event spawn.',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_mail`
--

DROP TABLE IF EXISTS `game_event_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_mail` (
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Negatives value to send at event stop, positive value for send at event start.',
  `raceMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`,`raceMask`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_quest`
--

DROP TABLE IF EXISTS `game_event_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_quest` (
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry from quest_template',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'entry from game_event',
  PRIMARY KEY (`quest`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_graveyard_zone`
--

DROP TABLE IF EXISTS `game_graveyard_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_graveyard_zone` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ghost_zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_tele`
--

DROP TABLE IF EXISTS `game_tele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_tele` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tele Command';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_weather`
--

DROP TABLE IF EXISTS `game_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject`
--

DROP TABLE IF EXISTS `gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_battleground`
--

DROP TABLE IF EXISTS `gameobject_battleground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_battleground` (
  `guid` int(10) unsigned NOT NULL COMMENT 'GameObject''s GUID',
  `event1` tinyint(3) unsigned NOT NULL COMMENT 'main event',
  `event2` tinyint(3) unsigned NOT NULL COMMENT 'sub event',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='GameObject battleground indexing system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_involvedrelation`
--

DROP TABLE IF EXISTS `gameobject_involvedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_loot_template`
--

DROP TABLE IF EXISTS `gameobject_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_questrelation`
--

DROP TABLE IF EXISTS `gameobject_questrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_scripts`
--

DROP TABLE IF EXISTS `gameobject_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_template`
--

DROP TABLE IF EXISTS `gameobject_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '1',
  `data0` int(10) unsigned NOT NULL DEFAULT '0',
  `data1` int(10) unsigned NOT NULL DEFAULT '0',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `data3` int(10) unsigned NOT NULL DEFAULT '0',
  `data4` int(10) unsigned NOT NULL DEFAULT '0',
  `data5` int(10) unsigned NOT NULL DEFAULT '0',
  `data6` int(10) unsigned NOT NULL DEFAULT '0',
  `data7` int(10) unsigned NOT NULL DEFAULT '0',
  `data8` int(10) unsigned NOT NULL DEFAULT '0',
  `data9` int(10) unsigned NOT NULL DEFAULT '0',
  `data10` int(10) unsigned NOT NULL DEFAULT '0',
  `data11` int(10) unsigned NOT NULL DEFAULT '0',
  `data12` int(10) unsigned NOT NULL DEFAULT '0',
  `data13` int(10) unsigned NOT NULL DEFAULT '0',
  `data14` int(10) unsigned NOT NULL DEFAULT '0',
  `data15` int(10) unsigned NOT NULL DEFAULT '0',
  `data16` int(10) unsigned NOT NULL DEFAULT '0',
  `data17` int(10) unsigned NOT NULL DEFAULT '0',
  `data18` int(10) unsigned NOT NULL DEFAULT '0',
  `data19` int(10) unsigned NOT NULL DEFAULT '0',
  `data20` int(10) unsigned NOT NULL DEFAULT '0',
  `data21` int(10) unsigned NOT NULL DEFAULT '0',
  `data22` int(10) unsigned NOT NULL DEFAULT '0',
  `data23` int(10) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu`
--

DROP TABLE IF EXISTS `gossip_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gossip_menu` (
  `entry` smallint(6) unsigned NOT NULL DEFAULT '0',
  `text_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cond_1_val_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_1_val_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cond_2_val_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_2_val_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu_option`
--

DROP TABLE IF EXISTS `gossip_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gossip_menu_option` (
  `menu_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `option_icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_text` text,
  `option_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `npc_option_npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `action_menu_id` mediumint(8) NOT NULL DEFAULT '0',
  `action_poi_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action_script_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `box_coded` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `box_money` int(11) unsigned NOT NULL DEFAULT '0',
  `box_text` text,
  `cond_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cond_1_val_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_1_val_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cond_2_val_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_2_val_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cond_3_val_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cond_3_val_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_scripts`
--

DROP TABLE IF EXISTS `gossip_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gossip_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` smallint(5) unsigned NOT NULL DEFAULT '0',
  `levelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `levelMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `maxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reset_delay` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Reset time in days',
  `ghostEntranceMap` smallint(5) unsigned NOT NULL,
  `ghostEntranceX` float NOT NULL,
  `ghostEntranceY` float NOT NULL,
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_enchantment_template`
--

DROP TABLE IF EXISTS `item_enchantment_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_enchantment_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ench` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_loot_template`
--

DROP TABLE IF EXISTS `item_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_required_target`
--

DROP TABLE IF EXISTS `item_required_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_required_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_template`
--

DROP TABLE IF EXISTS `item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `BuyPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `SellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClass` mediumint(9) NOT NULL DEFAULT '-1',
  `AllowableRace` mediumint(9) NOT NULL DEFAULT '-1',
  `ItemLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stackable` smallint(5) unsigned NOT NULL DEFAULT '1',
  `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min3` float NOT NULL DEFAULT '0',
  `dmg_max3` float NOT NULL DEFAULT '0',
  `dmg_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min4` float NOT NULL DEFAULT '0',
  `dmg_max4` float NOT NULL DEFAULT '0',
  `dmg_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min5` float NOT NULL DEFAULT '0',
  `dmg_max5` float NOT NULL DEFAULT '0',
  `dmg_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `armor` smallint(5) unsigned NOT NULL DEFAULT '0',
  `holy_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fire_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nature_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frost_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shadow_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `arcane_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` smallint(5) unsigned NOT NULL DEFAULT '1000',
  `ammo_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '0',
  `sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `block` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Map` smallint(6) NOT NULL DEFAULT '0',
  `BagFamily` mediumint(9) NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `DisenchantID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `maxMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `Duration` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Duration in seconds',
  `ExtraFlags` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_creature`
--

DROP TABLE IF EXISTS `locales_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_creature` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `subname_loc1` varchar(100) DEFAULT NULL,
  `subname_loc2` varchar(100) DEFAULT NULL,
  `subname_loc3` varchar(100) DEFAULT NULL,
  `subname_loc4` varchar(100) DEFAULT NULL,
  `subname_loc5` varchar(100) DEFAULT NULL,
  `subname_loc6` varchar(100) DEFAULT NULL,
  `subname_loc7` varchar(100) DEFAULT NULL,
  `subname_loc8` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_gameobject`
--

DROP TABLE IF EXISTS `locales_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_gameobject` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_gossip_menu_option`
--

DROP TABLE IF EXISTS `locales_gossip_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_gossip_menu_option` (
  `menu_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_item`
--

DROP TABLE IF EXISTS `locales_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_item` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `description_loc1` varchar(255) DEFAULT NULL,
  `description_loc2` varchar(255) DEFAULT NULL,
  `description_loc3` varchar(255) DEFAULT NULL,
  `description_loc4` varchar(255) DEFAULT NULL,
  `description_loc5` varchar(255) DEFAULT NULL,
  `description_loc6` varchar(255) DEFAULT NULL,
  `description_loc7` varchar(255) DEFAULT NULL,
  `description_loc8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_npc_text`
--

DROP TABLE IF EXISTS `locales_npc_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_npc_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text0_0_loc1` longtext,
  `Text0_0_loc2` longtext,
  `Text0_0_loc3` longtext,
  `Text0_0_loc4` longtext,
  `Text0_0_loc5` longtext,
  `Text0_0_loc6` longtext,
  `Text0_0_loc7` longtext,
  `Text0_0_loc8` longtext,
  `Text0_1_loc1` longtext,
  `Text0_1_loc2` longtext,
  `Text0_1_loc3` longtext,
  `Text0_1_loc4` longtext,
  `Text0_1_loc5` longtext,
  `Text0_1_loc6` longtext,
  `Text0_1_loc7` longtext,
  `Text0_1_loc8` longtext,
  `Text1_0_loc1` longtext,
  `Text1_0_loc2` longtext,
  `Text1_0_loc3` longtext,
  `Text1_0_loc4` longtext,
  `Text1_0_loc5` longtext,
  `Text1_0_loc6` longtext,
  `Text1_0_loc7` longtext,
  `Text1_0_loc8` longtext,
  `Text1_1_loc1` longtext,
  `Text1_1_loc2` longtext,
  `Text1_1_loc3` longtext,
  `Text1_1_loc4` longtext,
  `Text1_1_loc5` longtext,
  `Text1_1_loc6` longtext,
  `Text1_1_loc7` longtext,
  `Text1_1_loc8` longtext,
  `Text2_0_loc1` longtext,
  `Text2_0_loc2` longtext,
  `Text2_0_loc3` longtext,
  `Text2_0_loc4` longtext,
  `Text2_0_loc5` longtext,
  `Text2_0_loc6` longtext,
  `Text2_0_loc7` longtext,
  `Text2_0_loc8` longtext,
  `Text2_1_loc1` longtext,
  `Text2_1_loc2` longtext,
  `Text2_1_loc3` longtext,
  `Text2_1_loc4` longtext,
  `Text2_1_loc5` longtext,
  `Text2_1_loc6` longtext,
  `Text2_1_loc7` longtext,
  `Text2_1_loc8` longtext,
  `Text3_0_loc1` longtext,
  `Text3_0_loc2` longtext,
  `Text3_0_loc3` longtext,
  `Text3_0_loc4` longtext,
  `Text3_0_loc5` longtext,
  `Text3_0_loc6` longtext,
  `Text3_0_loc7` longtext,
  `Text3_0_loc8` longtext,
  `Text3_1_loc1` longtext,
  `Text3_1_loc2` longtext,
  `Text3_1_loc3` longtext,
  `Text3_1_loc4` longtext,
  `Text3_1_loc5` longtext,
  `Text3_1_loc6` longtext,
  `Text3_1_loc7` longtext,
  `Text3_1_loc8` longtext,
  `Text4_0_loc1` longtext,
  `Text4_0_loc2` longtext,
  `Text4_0_loc3` longtext,
  `Text4_0_loc4` longtext,
  `Text4_0_loc5` longtext,
  `Text4_0_loc6` longtext,
  `Text4_0_loc7` longtext,
  `Text4_0_loc8` longtext,
  `Text4_1_loc1` longtext,
  `Text4_1_loc2` longtext,
  `Text4_1_loc3` longtext,
  `Text4_1_loc4` longtext,
  `Text4_1_loc5` longtext,
  `Text4_1_loc6` longtext,
  `Text4_1_loc7` longtext,
  `Text4_1_loc8` longtext,
  `Text5_0_loc1` longtext,
  `Text5_0_loc2` longtext,
  `Text5_0_loc3` longtext,
  `Text5_0_loc4` longtext,
  `Text5_0_loc5` longtext,
  `Text5_0_loc6` longtext,
  `Text5_0_loc7` longtext,
  `Text5_0_loc8` longtext,
  `Text5_1_loc1` longtext,
  `Text5_1_loc2` longtext,
  `Text5_1_loc3` longtext,
  `Text5_1_loc4` longtext,
  `Text5_1_loc5` longtext,
  `Text5_1_loc6` longtext,
  `Text5_1_loc7` longtext,
  `Text5_1_loc8` longtext,
  `Text6_0_loc1` longtext,
  `Text6_0_loc2` longtext,
  `Text6_0_loc3` longtext,
  `Text6_0_loc4` longtext,
  `Text6_0_loc5` longtext,
  `Text6_0_loc6` longtext,
  `Text6_0_loc7` longtext,
  `Text6_0_loc8` longtext,
  `Text6_1_loc1` longtext,
  `Text6_1_loc2` longtext,
  `Text6_1_loc3` longtext,
  `Text6_1_loc4` longtext,
  `Text6_1_loc5` longtext,
  `Text6_1_loc6` longtext,
  `Text6_1_loc7` longtext,
  `Text6_1_loc8` longtext,
  `Text7_0_loc1` longtext,
  `Text7_0_loc2` longtext,
  `Text7_0_loc3` longtext,
  `Text7_0_loc4` longtext,
  `Text7_0_loc5` longtext,
  `Text7_0_loc6` longtext,
  `Text7_0_loc7` longtext,
  `Text7_0_loc8` longtext,
  `Text7_1_loc1` longtext,
  `Text7_1_loc2` longtext,
  `Text7_1_loc3` longtext,
  `Text7_1_loc4` longtext,
  `Text7_1_loc5` longtext,
  `Text7_1_loc6` longtext,
  `Text7_1_loc7` longtext,
  `Text7_1_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_page_text`
--

DROP TABLE IF EXISTS `locales_page_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_points_of_interest`
--

DROP TABLE IF EXISTS `locales_points_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name_loc1` text,
  `icon_name_loc2` text,
  `icon_name_loc3` text,
  `icon_name_loc4` text,
  `icon_name_loc5` text,
  `icon_name_loc6` text,
  `icon_name_loc7` text,
  `icon_name_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_quest`
--

DROP TABLE IF EXISTS `locales_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_quest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_loot_template`
--

DROP TABLE IF EXISTS `mail_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mangos_string`
--

DROP TABLE IF EXISTS `mangos_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangos_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangos_string`
--

LOCK TABLES `mangos_string` WRITE;
/*!40000 ALTER TABLE `mangos_string` DISABLE KEYS */;
INSERT INTO `mangos_string` VALUES
(1,'You should select a character or a creature.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'You should select a creature.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'|cffff0000[System Message]: %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'|cffff0000[Event Message]: %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'There is no help for that command',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'There is no such command',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'There is no such subcommand',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'Command %s have subcommands:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'Commands available to you:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'Incorrect syntax.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'Your account level is: %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(12,'Online players: %u (max: %u) Queued players: %u (max: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'Server uptime: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'Player saved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'All players saved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(16,'There are the following active GMs on this server:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(17,'There are no GMs currently logged in on this server.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'Cannot do that while flying.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'Cannot do that in Battlegrounds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,'Target is flying you can\'t do that.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'%s is flying command failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'You are not mounted so you can\'t dismount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'Cannot do that while fighting.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'You used it recently.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'Password not changed (unknown error)!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,'The password was changed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(27,'The old password is wrong',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(28,'Your account is now locked.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,'Your account is now unlocked.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(30,', rank ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(31,' [known]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(32,' [learn]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(33,' [passive]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(34,' [talent]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(35,' [active]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(36,' [complete]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(37,' (offline)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(38,'on',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(39,'off',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(40,'You are: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(41,'visible',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(42,'invisible',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(43,'done',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(44,'You',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(45,' <unknown> ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(46,'<error>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(47,'<non-existing character>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(48,'UNKNOWN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(49,'You must be at least level %u to enter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(50,'You must be at least level %u and have item %s to enter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(51,'Hello! Ready for some training?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(52,'Invaid item count (%u) for item %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(53,'Mail can\'t have more %u item stacks',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(54,'The new passwords do not match',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(55,'Your password can\'t be longer than 16 characters (client limit), password not changed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(56,'Current Message of the day: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(57,'Using World DB: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(58,'Using script library: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(59,'Using creature EventAI: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(61,'Username: ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(62,'Password: ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(63,'Accepts whispers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(64,'Doesn\'t accept whispers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(65,'Using script library: <Unknown Script Library>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(66,'Using script library: <No Script Library Loaded>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(100,'Global notify: ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(101,'Map: %u (%s) Zone: %u (%s) Area: %u (%s)X: %f Y: %f Z: %f Orientation: %fgrid[%u,%u]cell[%u,%u] InstanceID: %u ZoneX: %f ZoneY: %fGroundZ: %f FloorZ: %f Have height data (Map: %u VMap: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(102,'%s is already being teleported.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(103,'You can summon a player to your instance only if he is in your party with you as leader.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(104,'You cannot go to the player\'s instance because you are in a party now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(105,'You can go to the player\'s instance while not being in his party only if your GM mode is on.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(106,'You can not go to player %s from instance to instance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(107,'You can not summon player %s from instance to instance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(108,'You are summoning %s%s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(109,'You are being summoned by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(110,'You are teleporting %s%s to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(111,'You are being teleported by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(112,'Player (%s) does not exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(113,'Appearing at %s\'s location.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(114,'%s is appearing to your location.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(115,'Incorrect values.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(116,'No character selected.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(117,'%s is not in a group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(118,'You changed HP of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(119,'%s changed your HP to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(120,'You changed MANA of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(121,'%s changed your MANA to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(122,'You changed ENERGY of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(123,'%s changed your ENERGY to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(124,'Current energy: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(125,'You changed rage of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(126,'%s changed your rage to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(127,'You changed level of %s to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(128,'GUID %i, faction is %i, flags is %i, npcflag is %i, DY flag is %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(129,'Wrong faction: %u (not found in factiontemplate.dbc).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(130,'You changed GUID=%i \'s Faction to %i, flags to %i, npcflag to %i, dyflag to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(131,'You changed the %s spellmod %u to value %i for spell with family bit %u for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(132,'%s changed your spellmod %u to value %i for spell with family bit %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(133,'%s has access to all taxi nodes now (until logout).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(134,'%s has no more access to all taxi nodes now (only visited accessible).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(135,'%s has given you access to all taxi nodes (until logout).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(136,'%s has removed access to all taxi nodes (only visited still accessible).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(137,'You set all speeds to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(138,'%s set all your speeds to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(139,'You set the speed to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(140,'%s set your speed to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(141,'You set the swim speed to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(142,'%s set your swim speed to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(143,'You set the backwards run speed to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(144,'%s set your backwards run speed to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(147,'You set the size %2.2f of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(148,'%s set your size to %2.2f.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(149,'There is no such mount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(150,'You give a mount to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(151,'%s gave you a mount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(152,'USER1: %i, ADD: %i, DIF: %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(153,'You take all copper of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(154,'%s took you all of your copper.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(155,'You take %i copper from %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(156,'%s took %i copper from you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(157,'You give %i copper to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(158,'%s gave you %i copper.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(159,'You hear sound %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(160,'USER2: %i, ADD: %i, RESULT: %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(161,'Removed bit %i in field %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(162,'Set bit %i in field %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(163,'Teleport location table is empty!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(164,'Teleport location not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(165,'Requires search parameter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(166,'There are no teleport locations matching your request.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(168,'Locations found are: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(169,'Mail sent to %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(170,'You try to hear sound %u but it doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(171,'You can\'t teleport self to self!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(172,'server console command',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(175,'Liquid level: %f, ground: %f, type: %d, status: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(200,'No selection.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(201,'Object GUID is: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(202,'The name was too long by %i characters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(203,'Error, name can only contain characters A-Z and a-z.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(204,'The subname was too long by %i characters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(205,'Not yet implemented',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(206,'Item \'%i\' \'%s\' added to list with maxcount \'%i\' and incrtime \'%i\'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(207,'Item \'%i\' not found in database.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(208,'Item \'%i\' \'%s\' deleted from vendor list',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(209,'Item \'%i\' not found in vendor list.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(210,'Item \'%i\' already in vendor list.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(211,'Spells of %s reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(212,'Spells of %s will reset at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(213,'Talents of %s reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(214,'Talents of %s will reset at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(215,'Your spells have been reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(216,'Your talents have been reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(217,'Unknown case \'%s\' for .resetall command. Type full correct case name.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(218,'Spells will reset for all players at login. Strongly recommend re-login!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(219,'Talents will reset for all players at login. Strongly recommend re-login!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(220,'Creature (GUID: %u) No waypoint found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(221,'Creature (GUID: %u) Last waypoint not found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(222,'Creature (GUID: %u) No waypoint found - used \'wpguid\'. Now trying to find it by its position...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(223,'Creature (GUID: %u) No waypoints found - This is a MaNGOS db problem (single float).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(224,'Selected creature is ignored - provided GUID is used',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(225,'Creature (GUID: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(226,'You must select a visual waypoint.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(227,'No visual waypoints found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(228,'Could not create visual waypoint with creatureID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(229,'All visual waypoints removed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(230,'Could not create waypoint-creature with ID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(231,'No GUID provided.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(232,'No waypoint number provided.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(233,'Argument required for \'%s\'.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(234,'Waypoint %i added to GUID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(235,'Waypoint %d added.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(236,'Waypoint changed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(237,'Waypoint %s modified.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(238,'WP export successfull.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(239,'No waypoints found inside the database.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(240,'File imported.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(241,'Waypoint removed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(242,'Warning: Could not delete WP from the world with ID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(243,'This happens if the waypoint is too far away from your char.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(244,'The WP is deleted from the database, but not from the world here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(245,'They will disappear after a server restart.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(246,'Waypoint %d: Info for creature: %s, GUID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(247,'Waittime: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(248,'Model %d: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(249,'Emote: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(250,'Spell: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(251,'Text%d (ID: %i): %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(252,'AIScript: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(253,'Forced rename for player %s will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(254,'Forced rename for player %s (GUID #%u) will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(255,'Waypoint-Creature (GUID: %u) Not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(256,'Could not find NPC...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(257,'Creature movement type set to \'%s\', waypoints removed (if any).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(258,'Creature movement type set to \'%s\', waypoints were not removed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(259,'Incorrect value, use on or off',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(260,'Value saved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(261,'Value saved, you may need to rejoin or clean your client cache.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(262,'Areatrigger ID %u not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(263,'Target map or coordinates is invalid (X: %f Y: %f MapId: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(264,'Zone coordinates is invalid (X: %f Y: %f AreaId: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(265,'Zone %u (%s) is part of instanceable map %u (%s)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(266,'Nothing found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(267,'Object not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(268,'Creature not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(270,'Creature Removed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(271,'Creature moved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(272,'Creature (GUID:%u) must be on the same map as player!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(273,'Game Object (GUID: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(274,'Game Object (GUID: %u) has references in not found owner %s GO list, can\'t be deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(275,'Game Object (GUID: %u) removed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(276,'Game Object |cffffffff|Hgameobject:%d|h[%s]|h|r (GUID: %u) turned',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(277,'Game Object |cffffffff|Hgameobject:%d|h[%s]|h|r (GUID: %u) moved',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(278,'You must select a vendor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(279,'You must send id for item',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(280,'Vendor has too many items (max 128)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(281,'You can\'t kick self, logout instead',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(282,'Player %s kicked.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(284,'Accepting Whisper: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(285,'Accepting Whisper: ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(286,'Accepting Whisper: OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(287,'Creature (GUID: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(288,'Tickets count: %i show new tickets: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(289,'New ticket from %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(290,'Ticket of %s (Last updated: %s):%s ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(291,'New ticket show: ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(292,'New ticket show: OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(293,'Ticket %i doesn\'t exist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(294,'All tickets deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(295,'Character %s ticket deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(296,'Ticket deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(297,'Spawn distance changed to: %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(298,'Spawn time changed to: %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(299,'The %s field of %s was set to %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(300,'Your chat has been disabled for %u minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(301,'You have disabled %s\'s chat for %u minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(302,'Player\'s chat is already enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(303,'Your chat has been enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(304,'You have enabled %s\'s chat.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(305,'Faction %s (%u) reputation of %s was set to %5d!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(307,'No faction found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(308,'Faction %i unknown!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(309,'Invalid parameter %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(310,'delta must be between 0 and %d (inclusive)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(311,'%d - |cffffffff|Hfaction:%d|h[%s]|h|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(312,' [visible]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(313,' [at war]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(314,' [peace forced]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(315,' [hidden]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(316,' [invisible forced]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(317,' [inactive]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(318,'Hated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(319,'Hostile',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(320,'Unfriendly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(321,'Neutral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(322,'Friendly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(323,'Honored',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(324,'Revered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(325,'Exalted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(326,'Faction %s (%u) can\'not have reputation.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(327,' [no reputation]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(328,'Characters at account %s (Id: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(329,'  %s (GUID %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(330,'No players found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(331,'Extended item cost %u not exist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(332,'GM mode is ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(333,'GM mode is OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(334,'GM Chat Badge is ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(335,'GM Chat Badge is OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(336,'You repair all %s\'s items.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(337,'All your items repaired by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(338,'You set waterwalk mode %s for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(339,'Your waterwalk mode %s by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(340,'%s is now following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(341,'%s is not following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(342,'%s is now not following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(343,'Creature (Entry: %u) cannot be tamed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(344,'You already have pet.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(347,'TaxiNode ID %u not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(348,'Game Object (Entry: %u) have invalid data and can\'t be spawned',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(357,'Areatrigger %u not has target coordinates',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(358,'No areatriggers found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(359,'%s|cffffffff|Hareatrigger_target:%u|h[Trigger target %u]|h|r Map %u X:%f Y:%f Z:%f%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(360,'%s[Trigger target %u] Map %u X:%f Y:%f Z:%f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(361,'|cffffffff|Hareatrigger:%u|h[Trigger %u]|h|r Map %u X:%f Y:%f Z:%f%s%s%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(362,'[Trigger %u] Map %u X:%f Y:%f Z:%f%s%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(363,' (Dist %f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(364,' [Tavern]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(365,' [Quest]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(366,'Explore quest:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(367,'Required level %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(368,'Required Items:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(369,'Required quest:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(373,'Response:\n%s ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(374,'Tickets count: %i\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(375,'Player %s not have tickets.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(376,'%u - |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(377,'No pools found for map \'%s\' (Id:%u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(378,'You can\'t use this command at non-instanceable map \'%s\' (Id:%u). Use .lookup pool command instead.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(379,'You can\'t use this command without args at non-instanceable map \'%s\' (Id:%u).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(380,'%d%s - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r Chance:%f %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(381,'%d%s - [%s] X:%f Y:%f Z:%f MapId:%d Chance:%f %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(382,'%d%s - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(383,'%d%s - [%s] X:%f Y:%f Z:%f MapId:%d %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(384,'%d%s - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r Chance:%f %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(385,'%d%s - [%s] X:%f Y:%f Z:%f MapId:%d Chance:%f %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(386,'%d%s - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(387,'%d%s - [%s] X:%f Y:%f Z:%f MapId:%d %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(388,'Creatures with explicitly chance:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(389,'Creatures with equal chance:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(390,'Gameobjects with explicitly chance:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(391,'Gameobjects with equal chance:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(392,'Pool %u - Mother pool: %u |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(393,'Pool %u - Mother pool: %u [%s] AutoSpawn: %u MaxLimit: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(394,'Pool %u - Mother pool: none AutoSpawn: %u MaxLimit: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(395,'No pools found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(396,'%u - [%s] AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(397,'Pools with explicitly chance:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(398,'Pools with equal chance:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(399,'%u - |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u Chance: %f %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(400,'|cffff0000[System Message]:|rScripts reloaded',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(401,'You change security level of account %s to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(402,'%s changed your security level to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(403,'You have low security level for this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(404,'Creature movement disabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(405,'Creature movement enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(406,'Weather can\'t be changed for this zone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(407,'Weather system disabled at server.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(408,'%s is banned for %s. Reason: %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(409,'%s is banned permanently for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(410,'%s %s not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(411,'%s unbanned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(412,'There was an error removing the ban on %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(413,'Account not exist: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(414,'There is no such character.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(415,'There is no such IP in banlist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(416,'Account %s has never been banned',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(417,'Ban history for account %s:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(418,'Ban Date: %s Bantime: %s Still active: %s  Reason: %s Set by: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(419,'Inf.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(420,'Never',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(421,'Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(422,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(423,'IP: %sBan Date: %sUnban Date: %sRemaining: %sReason: %sSet by: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(424,'There is no matching IPban.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(425,'There is no matching account.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(426,'There is no banned account owning a character matching this part.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(427,'The following IPs match your pattern:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(428,'The following accounts match your query:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(429,'You learned many spells/skills.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(430,'You learned all spells for class.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(431,'You learned all talents for class.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(432,'You learned all languages.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(433,'You learned all craft skills and recipes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(434,'Could not find \'%s\'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(435,'Invalid item id: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(436,'No items found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(437,'Invalid gameobject id: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(438,'Found items %u: %u ( inventory %u mail %u auction %u guild %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(439,'Found gameobjects %u: %u ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(440,'Invalid creature id: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(441,'Found creatures %u: %u ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(442,'No area found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(443,'No item sets found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(444,'No skills found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(445,'No spells found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(446,'No quests found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(447,'No creatures found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(448,'No gameobjects found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(449,'Graveyard #%u doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(450,'Graveyard #%u already linked to zone #%u (current).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(451,'Graveyard #%u linked to zone #%u (current).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(452,'Graveyard #%u can\'t be linked to subzone or not existed zone #%u (internal error).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(454,'No faction in Graveyard with id= #%u , fix your DB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(455,'invalid team, please fix database',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(456,'any',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(457,'alliance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(458,'horde',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(459,'Graveyard #%u (faction: %s) is nearest from linked to zone #%u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(460,'Zone #%u doesn\'t have linked graveyards.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(461,'Zone #%u doesn\'t have linked graveyards for faction: %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(462,'Teleport location already exists!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(463,'Teleport location added.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(464,'Teleport location NOT added: database error.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(465,'Teleport location deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(466,'No taxinodes found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(467,'Target unit has %d auras:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(468,'id: %d eff: %d type: %d duration: %d maxduration: %d name: %s%s%s caster: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(469,'Target unit has %d auras of type %d:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(470,'id: %d eff: %d name: %s%s%s caster: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(471,'Quest %u not found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(472,'Quest %u started from item. For correct work, please, add item to inventory and start quest in normal way: .additem %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(473,'Quest removed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(474,' [rewarded]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(475,' [complete]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(476,' [active]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(477,'%s\'s Fly Mode %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(478,'Opcode %u sent to %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(479,'Character loaded successfully!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(480,'Failed to load the character!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(481,'Character dumped successfully!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(482,'Character dump failed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(483,'Spell %u broken and not allowed to cast or learn!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(484,'Skill %u (%s) for player %s set to %u and current maximum set to %u (without permanent (talent) bonuses).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(485,'Player %s must have skill %u (%s) before using this command.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(486,'Invalid skill id (%u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(487,'You learned default GM spells/skills.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(488,'You already know that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(489,'Target(%s) already know that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(490,'%s doesn\'t know that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(491,'You already forgot that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(492,'All spell cooldowns removed for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(493,'Spell %u cooldown removed for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(494,'Command : Additem, itemId = %i, amount = %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(495,'Command : Additemset, itemsetId = %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(496,'Removed itemID = %i, amount = %i from %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(497,'Cannot create item \'%i\' (amount: %i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(498,'You need to provide a guild name!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(499,'Player not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(500,'Player already has a guild!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(501,'Guild not created! (already exists?)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(502,'No items from itemset \'%u\' found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(503,'The distance is: (3D) %f (2D) %f - (3D, point-to-point) %f yards.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(504,'Item \'%i\' \'%s\' Item Slot %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(505,'Item \'%i\' doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(506,'Item \'%i\' \'%s\' Added to Slot %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(507,'Item save failed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(508,'%d - owner: %s (guid: %u account: %u ) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(509,'%d - sender: %s (guid: %u account: %u ) receiver: %s (guid: %u account: %u ) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(510,'%d - owner: %s (guid: %u account: %u ) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(511,'Wrong link type!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(512,'%d - |cffffffff|Hitem:%d:0:0:0:0:0:0:0|h[%s]|h|r %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(513,'%d - |cffffffff|Hquest:%d:%d|h[%s]|h|r %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(514,'%d - |cffffffff|Hcreature_entry:%d|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(515,'%d%s - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(516,'%d - |cffffffff|Hgameobject_entry:%d|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(517,'%d%s, Entry %d - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(518,'%d - |cffffffff|Hitemset:%d|h[%s %s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(519,'|cffffffff|Htele:%s|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(520,'%d - |cffffffff|Hspell:%d|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(521,'%d - |cffffffff|Hskill:%d|h[%s %s]|h|r %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(522,'Game Object (Entry: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(523,'>> Game Object %s (GUID: %u) at %f %f %f. Orientation %f.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(524,'Selected object:|cffffffff|Hgameobject:%d|h[%s]|h|r GUID: %u ID: %uX: %f Y: %f Z: %f MapId: %uOrientation: %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(525,'>> Add Game Object \'%i\' (%s) (GUID: %i) added at \'%f %f %f\'.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(526,'%s (lowguid: %u) movement generators stack:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(527,'   Idle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(528,'   Random',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(529,'   Waypoint',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(530,'   Animal random',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(531,'   Confused',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(532,'   Targeted to player %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(533,'   Targeted to creature %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(534,'   Targeted to <NULL>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(535,'   Home movement to (X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(536,'   Home movement used for player?!?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(537,'   Taxi flight',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(538,'   Unknown movement generator (%u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(539,'Player selected: %s.\nFaction: %u.\nnpcFlags: %u.\nEntry: %u.\nDisplayID: %u (Native: %u).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(540,'Level: %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(541,'Health (base): %u. (max): %u. (current): %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(542,'Unit Flags: %u.\nDynamic Flags: %u.\nFaction Template: %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(543,'Loot: %u Pickpocket: %u Skinning: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(544,'Position: %f %f %f.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(545,'*** Is a vendor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(546,'*** Is a trainer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(547,'InstanceID: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(548,'Player%s %s (guid: %u) Account: %s (id: %u) GMLevel: %u Last IP: %s Last login: %s Latency: %ums',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(549,'Played time: %s Level: %u Money: %ug%us%uc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(550,'Command .pinfo doesn\'t support \'rep\' option for offline players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(551,'%s has explored all zones now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(552,'%s has no more explored zones.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(553,'%s has explored all zones for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(554,'%s has hidden all zones from you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(555,'Hover enabled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(556,'Hover disabled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(557,'%s level up you to (%i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(558,'%s level down you to (%i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(559,'%s reset your level progress.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(560,'The area has been set as explored.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(561,'The area has been set as not explored.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(564,'The value index %u is too big to %s (count: %u).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(565,'Set for %s field:%u to uint32 value:%u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(566,'You set for %s field:%u to uint32 value: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(567,'Set for %s field:%u to to float value:%f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(568,'You set for %s field:%u to float value: %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(569,'Get %s uint32 value:[FIELD]:%u [VALUE]:%u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(570,'%s has uint32 value:[FIELD]:%u [VALUE]:%u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(571,'Get %s float value:[FIELD]:%u [VALUE]:%f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(572,'%s has float value:[FIELD]:%u [VALUE]:%f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(575,'Modify %s uint32 field:%u to sum with:%i = %u (%i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(576,'You modify for %s uint32 field:%u to sum with:%i = %u (%i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(577,'You are now invisible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(578,'You are now visible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(579,'Selected player or creature not have victim.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(580,'You learned all default spells for race/class and completed quests rewarded spells.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(581,'Found near gameobjects (distance %f): %u ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(582,'SpawnTime: Full:%s Remain:%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(583,'%d - |cffffffff|Hgameevent:%d|h[%s]|h|r%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(584,'No event found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(585,'Event not exist!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(586,'Event %u: %s%sStart: %s End: %s Occurence: %s Length: %sNext state change: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(587,'Event %u already active!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(588,'Event %u not active!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(589,'   Point movement to (X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(590,'   Fear movement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(591,'   Distract movement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(592,'You have learned all spells in craft: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(593,'Currently Banned Accounts:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(594,'|    Account    |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(595,'Currently Banned IPs:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(596,'|      IP       |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(597,'Current gamemasters:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(598,'|    Account    |  GM  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(599,'No gamemasters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(600,'The Alliance wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(601,'The Horde wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(602,'The battle for Warsong Gulch begins in 1 minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(603,'The battle for Warsong Gulch begins in 30 seconds. Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(604,'Let the battle for Warsong Gulch begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(605,'$n captured the Horde flag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(606,'$n captured the Alliance flag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(607,'The Horde flag was dropped by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(608,'The Alliance Flag was dropped by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(609,'The Alliance Flag was returned to its base by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(610,'The Horde flag was returned to its base by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(611,'The Horde flag was picked up by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(612,'The Alliance Flag was picked up by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(613,'The flags are now placed at their bases.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(614,'The Alliance flag is now placed at its base.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(615,'The Horde flag is now placed at its base.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(650,'Alliance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(651,'Horde',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(652,'stables',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(653,'blacksmith',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(654,'farm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(655,'lumber mill',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(656,'mine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(657,'The %s has taken the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(658,'$n has defended the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(659,'$n has assaulted the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(660,'$n claims the %s! If left unchallenged, the %s will control it in 1 minute!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(661,'The Battle for Arathi Basin begins in 1 minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(662,'The Battle for Arathi Basin begins in 30 seconds. Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(663,'The Battle for Arathi Basin has begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(664,'The Alliance has gathered $1776W resources, and is near victory!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(665,'The Horde has gathered $1777W resources, and is near victory!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(666,'After your recent battle in %s our best attempts to award you a Mark of Honor failed. Enclosed you will find the Mark of Honor we were not able to deliver to you at the time. Thanks for fighting in %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(705,'You must wait %s before speaking again.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(706,'This item(s) have problems with equipping/storing in inventory.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(707,'%s wishes to not be disturbed and cannot receive whisper messages: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(708,'%s is Away from Keyboard: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(709,'Do not Disturb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(710,'Away from Keyboard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(711,'Queue status for %s (Lvl: %u to %u)Queued alliances: %u (Need at least %u more)Queued hordes: %u (Need at least %u more)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(712,'|cffff0000[BG Queue Announcer]:|r %s -- [%u-%u] A: %u/%u, H: %u/%u|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(715,'You don\'t meet Battleground level requirements',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(717,'|cffff0000[BG Queue Announcer]:|r %s -- [%u-%u] Started!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(720,'Your group is too large for this battleground. Please regroup to join.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(727,'Your group has an offline member. Please remove him before joining.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(728,'Your group has players from the opposing faction. You can\'t join the battleground as a group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(729,'Your group has players from different battleground brakets. You can\'t join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(730,'Someone in your party is already in this battleground queue. (S)he must leave it before joining as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(731,'Someone in your party is Deserter. You can\'t join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(732,'Someone in your party is already in three battleground queues. You cannot join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(733,'You cannot teleport to a battleground map.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(734,'You cannot summon players to a battleground or arena map.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(735,'You must be in GM mode to teleport to a player in a battleground.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(736,'You cannot teleport to a battleground from another battleground. Please leave the current battleground first.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(739,'Battlegrounds are set to 1v0 for debugging.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(740,'Battlegrounds are set to normal playercount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(750,'Not enough players. This game will close in %u mins.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(751,'Not enough players. This game will close in %u seconds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(752,'Only the Alliance can use that portal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(753,'Only the Horde can use that portal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(759,'%s was destroyed by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(760,'The %s is under attack! If left unchecked, the %s will destroy it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(761,'The %s was taken by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(762,'The %s was taken by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(763,'The %s was taken by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(764,'The %s is under attack! If left unchecked, the %s will capture it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(765,'The %s has taken the %s! Its supplies will now be used for reinforcements!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(766,'Irondeep Mine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(767,'Coldtooth Mine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(768,'Stormpike Aid Station',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(769,'Dun Baldar South Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(770,'Dun Baldar North Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(771,'Stormpike Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(772,'Icewing Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(773,'Stonehearth Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(774,'Stonehearth Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(775,'Snowfall Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(776,'Iceblood Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(777,'Iceblood Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(778,'Tower Point',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(779,'Frostwolf Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(780,'East Frostwolf Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(781,'West Frostwolf Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(782,'Frostwolf Relief Hut',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(784,'1 minute until the battle for Alterac Valley begins.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(785,'30 seconds until the battle for Alterac Valley begins. Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(786,'The battle for Alterac Valley has begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(787,'The Alliance Team is running out of reinforcements!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(788,'The Horde Team is running out of reinforcements!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(789,'The Frostwolf General is Dead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(790,'The Stormpike General is Dead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(801,'You do not have enough gold',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(802,'You do not have enough free slots',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(803,'Your partner does not have enough free bag slots',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(804,'You do not have permission to perform that function',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(805,'Unknown language',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(806,'You don\'t know that language',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(807,'Please provide character name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(808,'Player %s not found or offline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(809,'Account for character %s not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(811,'Guild Master',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(812,'Officer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(813,'Veteran',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(814,'Member',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(815,'Initiate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1000,'Exiting daemon...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1001,'Account deleted: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1002,'Account %s NOT deleted (probably sql file format was updated)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1003,'Account %s NOT deleted (unknown error)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1004,'Account created: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1005,'Account name can\'t be longer than 16 characters (client limit), account not created!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1006,'Account with this name already exist!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1007,'Account %s NOT created (probably sql file format was updated)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1008,'Account %s NOT created (unknown error)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1009,'Player %s (Guid: %u) Account %s (Id: %u) deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1010,'| ID         |    Account    |       Character      |       IP        | GM | Expansion |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1012,'========================================================================================',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1013,'| %10u |%15s| %20s | %15s |%4d| %9d |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1014,'No online players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1015,'Used not fully typed quit command, need type it fully (quit), or command used not in RA command line.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1016,'| GUID       | Name                 | Account                      | Delete Date         |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1017,'| %10u | %20s | %15s (%10u) | %19s |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1018,'==========================================================================================',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1019,'No characters found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1020,'Restoring the following characters:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1021,'Deleting the following characters:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1022,'ERROR: You can only assign a new name if you have only selected a single character!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1023,'Character \'%s\' (GUID: %u Account %u) can\'t be restored: account not exist!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1024,'Character \'%s\' (GUID: %u Account %u) can\'t be restored: account character list full!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1025,'Character \'%s\' (GUID: %u Account %u) can\'t be restored: new name already used!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1026,'GUID: %u Name: %s Account: %s (%u) Date: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1027,'Log filters state:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1028,'All log filters set to: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1029,'Command can be called only from RA-console.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1100,'Account %s (Id: %u) have up to %u expansion allowed now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1101,'Message of the day changed to:%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1102,'Message sent to %s: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1103,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1104,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1105,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1106,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1107,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1108,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1109,'%d - %s %s %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1110,'%d%s - %s X:%f Y:%f Z:%f MapId:%d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1111,'%d%s - %s X:%f Y:%f Z:%f MapId:%d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1112,'Failed to open file: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1113,'Account %s (%u) have max amount allowed characters (client limit)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1114,'Dump file have broken data!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1115,'Invalid character name!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1116,'Invalid character guid!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1117,'Character guid %u in use!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1118,'%d - guild: %s (guid: %u) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1119,'You must use male or female as gender.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1120,'You change gender of %s to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1121,'Your gender changed to %s by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1122,'(%u/%u +perm %u +temp %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1128,'%d - |cffffffff|Htaxinode:%u|h[%s %s]|h|r (Map:%u X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1129,'%d - %s %s (Map:%u X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1130,'event started %u \"%s\"',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1131,'event stopped %u \"%s\"',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1132,'   Follow player %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1133,'   Follow creature %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1134,'   Follow <NULL>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1135,'List known talents:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1136,'   (Found talents: %u used talent points: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1137,'%d%s - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1138,'=================================================================================',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1139,'| GUID       | Name                 | Race            | Class           | Level |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1140,'| %10u | %20s | %15s | %15s | %5u |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1141,'%u - |cffffffff|Hplayer:%s|h[%s]|h|r %s %s %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1142,'%u - %s (Online:%s IP:%s GM:%u Expansion:%u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1143,'Spawned by event %u (%s)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1144,'Despawned by event %u (%s)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1145,'Part of pool %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1146,'Part of pool %u, top pool %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1147,'The (top)pool %u is spawned by event %u (%s)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1148,'The (top)pool %u is despawned by event %u (%s)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1149,' (Pool %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1150,' (Event %i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1151,' (Pool %u Event %i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1152,'[usable]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1153,'Get %s bitstr value:[FIELD]:%u [VALUE]:%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1154,'%s has bitstr value:[FIELD]:%u [VALUE]:%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1155,'Get %s hex value:[FIELD]:%u [VALUE]:%x',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1156,'%s has hex value:[FIELD]:%u [VALUE]:%x',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1157,'Modify %s hex field:%u %s %x = %x (hex)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1158,'You modify for %s hex field:%u %s %x = %x (hex)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1159,'Modify %s float field:%u to sum with:%f = %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1160,'You modify for %s float field:%u to sum with:%f = %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1165,'Spell %u not have auras.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1166,'Scripting library not found or not accessible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1167,'Scripting library has wrong list functions (outdated?).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1168,'Scripting library reloaded.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1169,'Scripting library build for different mangosd revision.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1170,'Gear Score of Player %s is %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1200,'You try to view cinematic %u but it doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1202,'Spell %u %s = %f (*1.88 = %f) DB = %f AP = %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1203,'direct heal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1204,'direct damage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1205,'dot heal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1206,'dot damage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1300,'|c0000ff00[Broadcast]:|r %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1400,'Private ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1401,'Corporal ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1402,'Sergeant ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1403,'Master Sergeant ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1404,'Sergeant Major ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1405,'Knight ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1406,'Knight-Lieutenant ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1407,'Knight-Captain ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1408,'Knight-Champion ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1409,'Lieutenant Commander ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1410,'Commander ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1411,'Marshal ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1412,'Field Marshal ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1413,'Grand Marshal ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1414,'Scout ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1415,'Grunt ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1416,'Sergeant ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1417,'Senior Sergeant ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1418,'First Sergeant ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1419,'Stone Guard ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1420,'Blood Guard ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1421,'Legionnare ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1422,'Centurion ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1423,'Champion ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1424,'Lieutenant General ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1425,'General ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1426,'Warlord ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1427,'High Warlord ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1428,'Game Master ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1429,'No Rank ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1430,'Dishonored ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1431,'Exiled ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1432,'Outlaw ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1433,'Pariah ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1434,'Player: %s - %s (Rank %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1435,'Today: [Honorable Kills: |c0000ff00%u|r] [Dishonorable Kills: |c00ff0000%u|r]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1436,'Yesterday: [Kills: |c0000ff00%u|r] [Honor: %u]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1437,'This Week: [Kills: |c0000ff00%u|r] [Honor: %u]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1438,'Last Week: [Kills: |c0000ff00%u|r] [Honor: %u] [Standing: %u]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1439,'Life Time: [Rank Points: |c0000ff00%f|r] [Honorable Kills: |c0000ff00%u|r] [Dishonorable Kills: |c00ff0000%u|r] [Highest Rank %u: %s]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1500,'%u - [%s] AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u Chance: %f %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1501,'%u - |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1502,'%u - [%s] AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1503,'Can not add spawn because no free guids for static spawn in reserved guids range. Server restart is required before command can be used. Also look GuidReserveSize.* config options.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1504,'AI-Information for Npc Entry %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1505,'AIName: %s (%s) ScriptName: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1506,'Current phase = %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1507,'Combat-Movement is %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1508,'Melee attacking is %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10001,'The Horde has collected 200 silithyst!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10002,'The Alliance has collected 200 silithyst!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10003,'The Horde has taken the Northpass Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10004,'The Alliance has taken the Northpass Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10005,'The Horde has taken the Eastwall Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10006,'The Alliance has taken the Eastwall Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10007,'The Horde has taken the Crown Guard Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10008,'The Alliance has taken the Crown Guard Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10009,'The Horde has taken the Plaguewood Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10010,'The Alliance has taken the Plaguewood Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10011,'The Horde lost the Northpass Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10012,'The Alliance lost the Northpass Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10013,'The Horde lost the Eastwall Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10014,'The Alliance lost the Eastwall Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10015,'The Horde lost the Crown Guard Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10016,'The Alliance lost the Crown Guard Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10017,'The Horde lost the Plaguewood Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10018,'The Alliance lost the Plaguewood Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mangos_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_gossip`
--

DROP TABLE IF EXISTS `npc_gossip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_gossip` (
  `npc_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_text`
--

DROP TABLE IF EXISTS `npc_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_text` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob0` float NOT NULL DEFAULT '0',
  `em0_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob1` float NOT NULL DEFAULT '0',
  `em1_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob2` float NOT NULL DEFAULT '0',
  `em2_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob3` float NOT NULL DEFAULT '0',
  `em3_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob4` float NOT NULL DEFAULT '0',
  `em4_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob5` float NOT NULL DEFAULT '0',
  `em5_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob6` float NOT NULL DEFAULT '0',
  `em6_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob7` float NOT NULL DEFAULT '0',
  `em7_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_trainer`
--

DROP TABLE IF EXISTS `npc_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_trainer` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_trainer_template`
--

DROP TABLE IF EXISTS `npc_trainer_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_trainer_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_vendor`
--

DROP TABLE IF EXISTS `npc_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_vendor` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_vendor_template`
--

DROP TABLE IF EXISTS `npc_vendor_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_vendor_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_text`
--

DROP TABLE IF EXISTS `page_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `next_page` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_levelstats`
--

DROP TABLE IF EXISTS `pet_levelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `inte` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_name_generation`
--

DROP TABLE IF EXISTS `pet_name_generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_name_generation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `half` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `petcreateinfo_spell`
--

DROP TABLE IF EXISTS `petcreateinfo_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petcreateinfo_spell` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet Create Spells';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pickpocketing_loot_template`
--

DROP TABLE IF EXISTS `pickpocketing_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pickpocketing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_classlevelstats`
--

DROP TABLE IF EXISTS `player_classlevelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_classlevelstats` (
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `basehp` smallint(5) unsigned NOT NULL,
  `basemana` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_levelstats`
--

DROP TABLE IF EXISTS `player_levelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `inte` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_xp_for_level`
--

DROP TABLE IF EXISTS `player_xp_for_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_xp_for_level` (
  `lvl` int(3) unsigned NOT NULL,
  `xp_for_next_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo`
--

DROP TABLE IF EXISTS `playercreateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_action`
--

DROP TABLE IF EXISTS `playercreateinfo_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_item`
--

DROP TABLE IF EXISTS `playercreateinfo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_spell`
--

DROP TABLE IF EXISTS `playercreateinfo_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playercreateinfo_spell` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `points_of_interest`
--

DROP TABLE IF EXISTS `points_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_creature`
--

DROP TABLE IF EXISTS `pool_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_creature` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_creature_template`
--

DROP TABLE IF EXISTS `pool_creature_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_creature_template` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_gameobject`
--

DROP TABLE IF EXISTS `pool_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_gameobject` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_gameobject_template`
--

DROP TABLE IF EXISTS `pool_gameobject_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_gameobject_template` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_pool`
--

DROP TABLE IF EXISTS `pool_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_pool` (
  `pool_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mother_pool` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`pool_id`),
  KEY `pool_idx` (`mother_pool`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_template`
--

DROP TABLE IF EXISTS `pool_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_end_scripts`
--

DROP TABLE IF EXISTS `quest_end_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_end_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_start_scripts`
--

DROP TABLE IF EXISTS `quest_start_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_start_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_template`
--

DROP TABLE IF EXISTS `quest_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Method` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `ZoneOrSort` smallint(6) NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredClasses` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `QuestFlags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestInChain` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SrcSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId1` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId2` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId3` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId4` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue3` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue4` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue5` mediumint(9) NOT NULL DEFAULT '0',
  `RewOrReqMoney` int(11) NOT NULL DEFAULT '0',
  `RewMoneyMaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `RewSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewSpellCast` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewMailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewMailDelaySecs` int(11) unsigned NOT NULL DEFAULT '0',
  `PointMapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOpt` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay1` int(11) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay2` int(11) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay3` int(11) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay4` int(11) unsigned NOT NULL DEFAULT '0',
  `IncompleteEmote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CompleteEmote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay1` int(11) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay2` int(11) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay3` int(11) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay4` int(11) unsigned NOT NULL DEFAULT '0',
  `StartScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `CompleteScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_loot_template`
--

DROP TABLE IF EXISTS `reference_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_reward_rate`
--

DROP TABLE IF EXISTS `reputation_reward_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputation_reward_rate` (
  `faction` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_spillover_template`
--

DROP TABLE IF EXISTS `reputation_spillover_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputation_spillover_template` (
  `faction` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max rank, above this will not give any spillover',
  `faction2` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction3` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction4` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reserved_name`
--

DROP TABLE IF EXISTS `reserved_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scripted_areatrigger`
--

DROP TABLE IF EXISTS `scripted_areatrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripted_areatrigger` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scripted_event_id`
--

DROP TABLE IF EXISTS `scripted_event_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripted_event_id` (
  `id` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Script library scripted events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_discovery_template`
--

DROP TABLE IF EXISTS `skill_discovery_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_extra_item_template`
--

DROP TABLE IF EXISTS `skill_extra_item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_fishing_base_level`
--

DROP TABLE IF EXISTS `skill_fishing_base_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Fishing system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skinning_loot_template`
--

DROP TABLE IF EXISTS `skinning_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skinning_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_affect`
--

DROP TABLE IF EXISTS `spell_affect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_affect` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `effectId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`effectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_area`
--

DROP TABLE IF EXISTS `spell_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint(8) NOT NULL DEFAULT '0',
  `racemask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_bonus_data`
--

DROP TABLE IF EXISTS `spell_bonus_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_bonus_data` (
  `entry` smallint(5) unsigned NOT NULL,
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_chain`
--

DROP TABLE IF EXISTS `spell_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_chain` (
  `spell_id` mediumint(9) NOT NULL DEFAULT '0',
  `prev_spell` mediumint(9) NOT NULL DEFAULT '0',
  `first_spell` mediumint(9) NOT NULL DEFAULT '0',
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `req_spell` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_elixir`
--

DROP TABLE IF EXISTS `spell_elixir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_elixir` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of potion',
  `mask` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Mask 0x1 battle 0x2 guardian 0x3 flask 0x7 unstable flasks 0xB shattrath flasks',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_facing`
--

DROP TABLE IF EXISTS `spell_facing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_facing` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell ID',
  `facingcasterflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'flag for facing state, usually 1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_learn_spell`
--

DROP TABLE IF EXISTS `spell_learn_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_pet_auras`
--

DROP TABLE IF EXISTS `spell_pet_auras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `pet` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_proc_event`
--

DROP TABLE IF EXISTS `spell_proc_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_proc_event` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` bigint(40) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` bigint(40) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` bigint(40) unsigned NOT NULL DEFAULT '0',
  `procFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0',
  `ppmRate` float NOT NULL DEFAULT '0',
  `CustomChance` float NOT NULL DEFAULT '0',
  `Cooldown` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_proc_item_enchant`
--

DROP TABLE IF EXISTS `spell_proc_item_enchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_proc_item_enchant` (
  `entry` mediumint(8) unsigned NOT NULL,
  `ppmRate` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_script_target`
--

DROP TABLE IF EXISTS `spell_script_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_script_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_scripts`
--

DROP TABLE IF EXISTS `spell_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_target_position`
--

DROP TABLE IF EXISTS `spell_target_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_target_position` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_threat`
--

DROP TABLE IF EXISTS `spell_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `Threat` smallint(6) NOT NULL,
  `multiplier` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `ap_bonus` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transports` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `world_template`
--

DROP TABLE IF EXISTS `world_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world_template` (
  `map` smallint(5) unsigned NOT NULL,
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
