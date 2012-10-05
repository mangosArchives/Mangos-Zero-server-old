ALTER TABLE db_version CHANGE COLUMN required_z1841_xxxxx_01_mangos_spell_template required_z1842_xxxxx_01_mangos_spell_template bit;

DELETE FROM spell_template WHERE id IN (23363, 25192, 26133);
INSERT INTO spell_template VALUES
(23363, 0x00000000, 101,  21,  76,  18,   0,   0, 179804, 0,     'Summon Drakonid Corpse Trigger'),
(25192, 0x00000000, 101,  21,  76,  18,   0,   0, 180619, 0,     'Summon Ossirian Crystal'),
(26133, 0x00000000, 101,  21,  76,  18,   0,   0, 180795, 0,     'Summon Sandworm Base');