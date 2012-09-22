ALTER TABLE db_version CHANGE COLUMN required_z1839_xxxxx_01_mangos_creature_linking_template required_z1840_xxxxx_01_mangos_creature_template bit;

ALTER TABLE  `creature_template` CHANGE  `family`  `family` TINYINT( 4 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `trainer_type`  `trainer_type` TINYINT( 4 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `dmgschool`  `dmgschool` TINYINT( 4 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `resistance1`  `resistance1` SMALLINT( 5 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `resistance2`  `resistance2` SMALLINT( 5 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `resistance3`  `resistance3` SMALLINT( 5 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `resistance4`  `resistance4` SMALLINT( 5 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `resistance5`  `resistance5` SMALLINT( 5 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `creature_template` CHANGE  `resistance6`  `resistance6` SMALLINT( 5 ) UNSIGNED NOT NULL DEFAULT  '0';
