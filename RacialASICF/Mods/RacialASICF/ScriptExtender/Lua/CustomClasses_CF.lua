local listUUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

local classMods = {
    {
        Class = "Mystic",
        modGuid = "b2ac3aa8-ce29-4d53-be47-7121845f3c1c",
        UUID = "0482322d-723e-4705-a41a-99e27902311c"
    },
    {
        Class = "Magus",
        modGuid = "a827da36-4086-4d47-9945-f45555555555",
        UUID = "452d6137-7720-4d04-b950-f45555555555"
    },
    {
        Class = "BloodHunter",
        modGuid = "411d5c6e-2bd5-4e4e-ab72-67dcc37b8c0e",
        UUID = "b85c5b64-347c-4ece-b45c-fe55a6fa2762"
    },
    {
        Class = "Artificer",
        modGuid = "88fadf2c-152d-404e-b863-c12273559e1c",
        UUID = "c1965de9-87f1-47ee-93c7-43c54f685f2d"
    },
    {
        Class = "Troubadour",
        modGuid = "130082f8-4789-44ab-a4d0-a459459a5bf1",
        UUID = "985ddb6d-4ad1-4cdd-99ff-661f5176115c"
    },
    {
        Class = "DeathKnight",
        modGuid = "3eb9981c-15b7-4973-9c15-bb680808ebeb",
        UUID = "9406edff-5e57-4eb6-ab0d-a2cc7d5d8b8a"
    }
}

local function createPayload(uuid, modGuid)
    return {
        TargetUUID = uuid,
        FileType = "Progression",
        Function = "SelectAbilityBonus",
        ListUUID = listUUID,
        modGuid = modGuid
    }
end

local function removeSelectors(mod)
    if mod.modGuid and Ext.Mod.IsModLoaded(mod.modGuid) then
        local payload = createPayload(mod.UUID, mod.modGuid)
        Mods.SubclassCompatibilityFramework.Api.RemoveSelectors({payload})
        return mod.Class  -- Return the class name if selectors were removed
    end
end

local function CustomClassesOnStatsLoaded()
    local removedClasses = {}  -- Table to store classes with removed selectors
    for _, mod in ipairs(classMods) do
        local removedClass = removeSelectors(mod)
        if removedClass then
            table.insert(removedClasses, removedClass) -- Add to the list if removed
        end
    end

    if #removedClasses > 0 then  -- Check if any selectors were removed
        local classList = table.concat(removedClasses, ", ") -- Create comma-separated list
        Ext.Utils.Print(string.format("[PHB_Progression] Selectors removed from %d mods: %s", #removedClasses, classList))
    end
end

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then 
    Ext.Events.StatsLoaded:Subscribe(CustomClassesOnStatsLoaded)
end
