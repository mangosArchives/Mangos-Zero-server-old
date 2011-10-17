ALTER TABLE db_version CHANGE COLUMN required_z1814_11827_01_mangos_creature_linking_template required_z1819_11831_01_mangos_mangos_string bit;

delete from mangos_string where entry = 1170;
insert into mangos_string values (1170,'Gear Score of Player %s is %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);