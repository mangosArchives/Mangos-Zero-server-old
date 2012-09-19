ALTER TABLE db_version CHANGE COLUMN required_z1838_xxxxx_01_mangos_drop_tbc required_z1839_xxxxx_01_mangos_creature_linking_template bit;

ALTER TABLE `creature_linking_template` CHANGE `entry` `entry` INT( 10 ) UNSIGNED NOT NULL COMMENT 'creature_template.entry of the slave mob that is linked';

