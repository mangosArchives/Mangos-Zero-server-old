ALTER TABLE db_version CHANGE COLUMN required_z1819_11831_02_mangos_command required_z1824_xxxxx_01_mangos_spell_affect_event bit;

DELETE FROM `spell_affect` WHERE `entry` = 28854;
INSERT INTO `spell_affect` VALUES (28854, 0, 2);