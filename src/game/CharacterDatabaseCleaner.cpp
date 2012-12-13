/*
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
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

#include "Common.h"
#include "CharacterDatabaseCleaner.h"
#include "World.h"
#include "Database/DatabaseEnv.h"
#include "DBCStores.h"
#include "ProgressBar.h"

template <class T>
inline void delete_null_entries(DBCStorage <T> storage, const char *table, const char *column) {
    uint32 count = storage.GetNumRows();
    std::ostringstream ss;
    bool first = true;
    
    ss << "DELETE FROM " << table << " WHERE " << column << " IN (";
    
    /*get ranges*/
    for (uint32 i = 0; i != count; i++) {
        if (!storage.LookupEntry(i)) {
            if (first) {
                first = false;
            } else {
                ss << ',';
            }
            
            ss << i;
        }
    }
    
    if (!first) {
        ss << ')';
        
        CharacterDatabase.Execute(ss.str().c_str());
    }
}

void CharacterDatabaseCleaner::CleanDatabase()
{
    // config to disable
    if (!sWorld.getConfig(CONFIG_BOOL_CLEAN_CHARACTER_DB))
        return;

    sLog.outString("Cleaning character database...");

    // check flags which clean ups are necessary
    QueryResult* result = CharacterDatabase.PQuery("SELECT cleaning_flags FROM saved_variables");
    if (!result)
        return;
    uint32 flags = (*result)[0].GetUInt32();
    
    delete result;

    // clean up
    if (flags & CLEANING_FLAG_SKILLS)
        CleanCharacterSkills();
    if (flags & CLEANING_FLAG_SPELLS)
        CleanCharacterSpell();
    CharacterDatabase.Execute("UPDATE saved_variables SET cleaning_flags = 0");
}

void CharacterDatabaseCleaner::CleanCharacterSkills()
{
    uint32 count = sSkillLineStore.GetNumRows();
    delete_null_entries<SkillLineEntry>(sSkillLineStore, "character_skills", "skill");
    
    CharacterDatabase.PExecute("DELETE FROM character_skills WHERE skill >= %u", count);
}

void CharacterDatabaseCleaner::CleanCharacterSpell()
{
    uint32 count = sSpellStore.GetNumRows();
    delete_null_entries<SpellEntry>(sSpellStore, "character_spell", "spell");
    
    CharacterDatabase.PExecute("DELETE FROM character_spell WHERE spell >= %u", count);
}
