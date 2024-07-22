--[[
_________ .__                         __________                              __________    _____         .__       .__      _____    _________.___ 
\_   ___ \|  |   ____ _____    ____   \______   \_____    ____  ____   ______ \______   \  /  _  \   ____ |__|____  |  |    /  _  \  /   _____/|   |
/    \  \/|  | _/ __ \\__  \  /    \   |       _/\__  \ _/ ___\/ __ \ /  ___/  |       _/ /  /_\  \_/ ___\|  \__  \ |  |   /  /_\  \ \_____  \ |   |
\     \___|  |_\  ___/ / __ \|   |  \  |    |   \ / __ \\  \__\  ___/ \___ \   |    |   \/    |    \  \___|  |/ __ \|  |__/    |    \/        \|   |
 \______  /____/\___  >____  /___|  /  |____|_  /(____  /\___  >___  >____  >  |____|_  /\____|__  /\___  >__(____  /____/\____|__  /_______  /|___|
        \/          \/     \/     \/          \/      \/     \/    \/     \/          \/         \/     \/        \/              \/        \/      
        \_Clean Races ModASI
]]--

Ext.Require("Libs/RacesLibrary.lua")

local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

--- Constructor for createSABPayload
---@param uuid string race Progression.lsx Level 1 UUID
---@param modGuid string race mod modGuid
---@param sabUUID string SelectAbilityBonus UUID
---@return table payload
local function createSABPayload(uuid, modGuid, sabUUID)
    return {
        TargetUUID = uuid,
        FileType = "Progression",
        Function = "SelectAbilityBonus",
        ListUUID = sabUUID,
        modGuid = modGuid
    }
end


--- Constructor for createBoostPayload
---@param uuid string race Progression.lsx Level 1 UUID
---@param modGuid string race mod modGuid
---@param ability string ability DnD (Strength ect.)
---@param score integer ability score
---@return table payload
local function createBoostPayload(modGuid, uuid, ability, score)
    return {
        modGuid = modGuid,
        Target = uuid,
        FileType = "Progression",
        Type = "Boosts",
        Strings = {"Ability("..ability..","..score..")"}
      }
end

--- Constructor for removeBoosts
---@param mod table race mod table
---@param ability string ability DnD (Strength ect.)
---@param score integer ability score
---@return string mod.Race Return the race name if selectors were removed
local function removeBoosts(mod, ability, score)
    if mod.modGuid and Ext.Mod.IsModLoaded(mod.modGuid) then
        local payload = createBoostPayload(mod.modGuid, mod.UUID, ability, score)

        Mods.SubclassCompatibilityFramework.Api.RemoveBoosts({payload})

        --BasicWarning(string.format("payload: %s", table.dump(payload)))

        return mod.Name  -- Return the race name if selectors were removed
    end
end

--- Constructor for CleanOnRacesStatsLoaded
--- Clean race mods stats ASI
---@param mod table race mod table
function CleanOnRacesStatsLoaded(mod)
    local stats = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}

    --for _, mod in ipairs(RaceLibrary) do

        --BasicWarning(string.format("mod.UUID ============> %s", mod.UUID))

	    --BasicWarning(string.format("mod.modGuid ============> %s", mod.modGuid))

        --BasicWarning(string.format("AbilityList_UUID ============> %s", AbilityList_UUID))


        -- remove +2+1, +1, +1+1 ect..
        local payload = createSABPayload(mod.UUID, mod.modGuid, AbilityList_UUID)

        Mods.SubclassCompatibilityFramework.Api.RemoveSelectors({payload})

        --BasicWarning(string.format("payload: %s", table.dump(payload)))

        -- remove Boost Ability
        for _, ability in ipairs(stats) do
            for score=-5,5 do -- change to -5 5 to low balancing charge server
                removedRace = removeBoosts(mod, ability, score)
            end
        end
        if removedRace then
            table.insert(removedRaces, removedRace) -- Add to the list if removed
        end
    --end
end

--Ext.Events.StatsLoaded:Subscribe(CleanOnRacesStatsLoaded)