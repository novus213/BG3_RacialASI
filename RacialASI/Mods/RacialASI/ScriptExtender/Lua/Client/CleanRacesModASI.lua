raceMods = {
    {
        Race = "Aasimar DEMERDE DarthRen",
        modGuid = "ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
        UUID = "06e918ad-be2c-48b6-a098-0288539de744"
    },
    {
        Race = "Aasimar(Radiant Soul) DarthRen",
        modGuid = "ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
        UUID = "4c2c61ae-5904-4576-a8c5-efecce67ab82"
    },
    {
        Name = "Raven Queen's Chosen - Shadar-Kai",
        modGuid = "c36d595f-70d1-44f1-8ca6-4ad14186f489",
        UUID = "2f7edf7e-0a6b-4018-9715-1cb8aa238e4a"
    },
    {
        Race = "Aasimar(Radiant Consumption)",
        UUID = "56d62681-9769-4ad7-9bbf-4f72db44f070",
        modGuid = "ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa"
    },
    {
        Race = "Aasimar(Necrotic Shroud)",
        UUID = "1b07140b-98c1-42e8-b4ec-072622862dc2",
        modGuid = "ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa"
    }
}

--[[
{
    modGuid="GUID3",
    Status="Detected",
    Race="Mod de race 3",
    Author="",
    UUID="",
    SourceBook = "Mordenkainen Presents: Monsters of the Multiverse",
    Strings = {"Ability(Dexterity,1)", "Ability(Charisma,2)"}
    StringStats = {"2", "0", "1", "0", "0", "0"}
    SAB = true/false
    SABNb = "2"
    SABStats = {"2", "1"}
}
    ]]--

local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

--- Constructor for createSABPayload
---@param uuid string race Progression.lsx Level 1 UUID
---@param modGuid string race mod modGuid
---@param sabUUID string SelectAbilityBonus UUID
---@return table payload
function createSABPayload(uuid, modGuid, sabUUID)
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
function createBoostPayload(modGuid, uuid, ability, score)
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
function removeBoosts(mod, ability, score)
    if mod.modGuid and Ext.Mod.IsModLoaded(mod.modGuid) then
        local payload = createBoostPayload(mod.modGuid, mod.UUID, ability, score)
        Mods.SubclassCompatibilityFramework.Api.RemoveBoosts({payload})
        return mod.Race  -- Return the race name if selectors were removed
    end
end

--- Constructor for CleanOnStatsLoaded
--- Clean race mods stats ASI
function CleanOnStatsLoaded()
    local removedRaces = {}  -- Table to store classes with removed shit asi
    local stats = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}

    for _, mod in ipairs(raceMods) do

        -- remove +2+1, +1, +1+1 ect..
        local payload = createSABPayload(mod.UUID, mod.modGuid, AbilityList_UUID)
        Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})

        -- remove Boost Ability
        for _, ability in ipairs(stats) do
            for score=-10,10 do
                removedRace = removeBoosts(mod, ability, score)
            end
        end
        if removedRace then
            table.insert(removedRaces, removedRace) -- Add to the list if removed
        end
    end

    if #removedRaces > 0 then
        BasicWarning("============> Ability boost remove to " ..
                 #removedRaces .. " mods: " ..
                 table.concat(removedRaces, ", "))
    end
end

Ext.Events.StatsLoaded:Subscribe(CleanOnStatsLoaded)