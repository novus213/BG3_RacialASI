--[[
 __      __       __ ________       _____                .__                   ____________________
/  \    /  \_____/  |\______ \     /  _  \ _____    _____|__| _____ _____     /   _____/\_   _____/
\   \/\/   /  _ \   __\    |  \   /  /_\  \\__  \  /  ___/  |/     \\__  \    \_____  \  |    __)_ 
 \        (  <_> )  | |    `   \ /    |    \/ __ \_\___ \|  |  Y Y  \/ __ \_  /        \ |        \
  \__/\  / \____/|__|/_______  / \____|__  (____  /____  >__|__|_|  (____  / /_______  //_______  /
       \/                    \/          \/     \/     \/         \/     \/          \/         \/ 
        \_ WotD Aasimar - Script Extender Edition 2.0.4.0 Used

]]--

local Framework_UUID = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9"
local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

local uuids = {
    "df422d42-8b37-4e1a-89e2-5082ab338bc7",
    "861d5758-b5f1-4ed0-8f69-a2f2fd1de210",
    "f5f61427-4d35-4666-b107-929dc26c7eea",
    "d6dac133-960f-4a6d-8586-292ca94c1b94",
    "d3eb8206-c769-449e-afca-8aed805ca903"
    -- "459fe764-6f12-4533-9b84-a69d16a8832e", base Aasimar source Volo's Guide to Monsters
    -- "63e0259e-4721-4f7e-bb75-c5d26a55dc74", -- Protector Ability(Charisma,2) Ability(Wisdom,1)
    -- "2d88948b-45ec-42ce-8dc9-755b6987a8f6", -- Scourge Ability(Charisma,2) Ability(Constitution,1)
    -- "adab8d9e-904b-436e-ba9b-9657dd5216c6", -- Fallen Ability(Charisma,2) Ability(Strength,1)
    -- "70ed9582-33c5-44c1-8710-2fbf8281543d" -- Heraut Ability(Charisma,2) Ability(????,1) Variant ?? WIS
}

local subAasimarFixed = {
    {
        Race = "Protector",
        modGuid = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
        UUID = "63e0259e-4721-4f7e-bb75-c5d26a55dc74",
        Strings = {"Ability(Charisma,2)", "Ability(Wisdom,1)"}
    },
    {
        Race = "Scourge",
        modGuid = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
        UUID = "2d88948b-45ec-42ce-8dc9-755b6987a8f6",
        Strings = {"Ability(Charisma,2)", "Ability(Constitution,1)"}
    },
    {
        Race = "Fallen",
        modGuid = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
        UUID = "adab8d9e-904b-436e-ba9b-9657dd5216c6",
        Strings = {"Ability(Charisma,2)", "Ability(Strength,1)"}
    },
    {
        Race = "Herault / Variant",
        modGuid = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
        UUID = "70ed9582-33c5-44c1-8710-2fbf8281543d",
        Strings = {"Ability(Charisma,2)", "Ability(Wisdom,1)"}
    }
}


local function createPayloadSpecial(mod, bonusType)
    local payload = {
        modGuid = mod.modGuid,
        Target = mod.UUID,
        FileType = "Progression"
    }
            payload.Type = "Boosts"
            payload.Strings = mod.Strings
    return payload
end

local function insertBonuses(mod, bonusType)
    if mod.modGuid and Ext.Mod.IsModLoaded(mod.modGuid) then
        local payload = createPayloadSpecial(mod, bonusType)
            Mods.SubclassCompatibilityFramework.Api.InsertBoosts({ payload })
        return true
    end
    return false
end


local function CustomRacesOnStatsLoaded()
    local insertedModNames = {}

    for _, mod in ipairs(subAasimarFixed) do
        if insertBonuses(mod, "fixed") then
            table.insert(insertedModNames, mod.Race)
        end
    end

    -- Log the results
    if #insertedModNames > 0 then
        BasicPrint("__      __       __ ________       _____                .__                   ____________________","INFO", nil, nil, true)
        BasicPrint("/  \\    /  \\_____/  |\\______ \\     /  _  \\ _____    _____|__| _____ _____     /   _____/\\_   _____/","INFO", nil, nil, true)
        BasicPrint("\\   \\/\\/   /  _ \\   __\\    |  \\   /  /_\\  \\\\__  \\  /  ___/  |/     \\\\__  \\    \\_____  \\  |    __)_ ","INFO", nil, nil, true)
        BasicPrint(" \\        (  <_> )  | |    `   \\ /    |    \\/ __ \\_\\___ \\|  |  Y Y  \\/ __ \\_  /        \\ |        \\","INFO", nil, nil, true)
        BasicPrint("  \\__/\\  / \\____/|__|/_______  / \\____|__  (____  /____  >__|__|_|  (____  / /_______  //_______  /","INFO", nil, nil, true)
        BasicPrint("       \\/                    \\/          \\/     \\/     \\/         \\/     \\/          \\/         \\/ ","INFO", nil, nil, true)
        BasicPrint("        \\_ WotD Aasimar - Script Extender Edition 2.0.4.0 Used","INFO", nil, nil, true)
        BasicWarning("============> Ability bonuses inserted to " .. 
                 #insertedModNames .. " mods: " .. 
                 table.concat(insertedModNames, ", "))
    end
end

if Ext.Mod.IsModLoaded(Framework_UUID) then 
    Ext.Events.StatsLoaded:Subscribe(CustomRacesOnStatsLoaded)
end


local function createPayload(uuid)
    local payload = {
        modGuid = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
        Target = uuid,
        FileType = "Progression",
        Function = "SelectAbilityBonus",
        Params = {
            Guid = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe",
            Amount = "2",
            BonusType = "AbilityBonus",
            Amounts = {"2", "1"}
        }
    }
    return payload
end

local function processSource(uuids)
    for _, uuid in ipairs(uuids) do
        local payload = createPayload(uuid)
        Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
    end
end

local function TripsAasimar_OnStatsLoaded()
    processSource(uuids)
end

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") or Ext.Mod.IsModLoaded("4806bd2a-929b-406e-b1d4-2e0e9cc23bb2") then
    Ext.Events.StatsLoaded:Subscribe(TripsAasimar_OnStatsLoaded)
    BasicPrint("============> Trips_Aasimar detected, reverting floating bonuses.","INFO", nil, nil, true)
end
