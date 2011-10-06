ALTER TABLE db_version CHANGE COLUMN required_z1765_xxxxx_01_mangos_spell_affect required_z1807_xxxxx_01_mangos_spell_proc_event bit;

DELETE FROM `spell_proc_event` WHERE `entry` = 6346;
INSERT INTO `spell_proc_event` VALUES
( 6346, 0x7F,  0, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x00000000, 0x00000100, 0.000000, 0.000000,  0);