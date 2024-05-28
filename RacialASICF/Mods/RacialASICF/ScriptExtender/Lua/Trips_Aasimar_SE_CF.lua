local uuids = {
    "df422d42-8b37-4e1a-89e2-5082ab338bc7",
    "861d5758-b5f1-4ed0-8f69-a2f2fd1de210",
    "f5f61427-4d35-4666-b107-929dc26c7eea",
    "d6dac133-960f-4a6d-8586-292ca94c1b94",
    "d3eb8206-c769-449e-afca-8aed805ca903",
    "459fe764-6f12-4533-9b84-a69d16a8832e",
    "63e0259e-4721-4f7e-bb75-c5d26a55dc74",
    "2d88948b-45ec-42ce-8dc9-755b6987a8f6",
    "adab8d9e-904b-436e-ba9b-9657dd5216c6",
    "70ed9582-33c5-44c1-8710-2fbf8281543d"
}


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
    Ext.Utils.Print("[PHB_Progression] Trips_Aasimar detected, reverting floating bonuses.")
end
