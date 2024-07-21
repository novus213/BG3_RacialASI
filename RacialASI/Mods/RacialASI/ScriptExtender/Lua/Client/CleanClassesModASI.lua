Ext.Require("Libs/ClassesLibrary.lua")

--[[
_________                 __                   _________ .__
\_   ___ \ __ __  _______/  |_  ____   _____   \_   ___ \|  | _____    ______ ______ ____   ______
/    \  \/|  |  \/  ___/\   __\/  _ \ /     \  /    \  \/|  | \__  \  /  ___//  ___// __ \ /  ___/
\     \___|  |  /\___ \  |  | (  <_> )  Y Y  \ \     \___|  |__/ __ \_\___ \ \___ \\  ___/ \___ \
 \______  /____//____  > |__|  \____/|__|_|  /  \______  /____(____  /____  >____  >\___  >____  >
        \/           \/                    \/          \/          \/     \/     \/     \/     \/
        \_Custom Races from Nexus
]]--

local listUUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

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
        return mod.Name  -- Return the class name if selectors were removed
    end
end

local function CleanClassesModASIOnStatsLoaded()
    local removedClasses = {}  -- Table to store classes with removed selectors
    for _, mod in ipairs(ClassesLibrary) do
        if mod.UUID ~= "aaaa" then --rmv after lib finished
            local removedClass = removeSelectors(mod)
            if removedClass then
                table.insert(removedClasses, removedClass) -- Add to the list if removed
            end
        end
    end

    if #removedClasses > 0 then  -- Check if any selectors were removed
        local classList = table.concat(removedClasses, ", ") -- Create comma-separated list
        BasicPrint("  _________                 __                   _________ .__                                      ","INFO", nil, nil, true)
        BasicPrint("\\_   ___ \\ __ __  _______/  |_  ____   _____   \\_   ___ \\|  | _____    ______ ______ ____   ______","INFO", nil, nil, true)
        BasicPrint("/    \\  \\/|  |  \\/  ___/\\   __\\/  _ \\ /     \\  /    \\  \\/|  | \\__  \\  /  ___//  ___// __ \\ /  ___/","INFO", nil, nil, true)
        BasicPrint("\\     \\___|  |  /\\___ \\  |  | (  <_> )  Y Y  \\ \\     \\___|  |__/ __ \\_\\___ \\ \\___ \\\\  ___/ \\___ \\ ","INFO", nil, nil, true)
        BasicPrint(" \\______  /____//____  > |__|  \\____/|__|_|  /  \\______  /____(____  /____  >____  >\\___  >____  >","INFO", nil, nil, true)
        BasicPrint("        \\/           \\/                    \\/          \\/          \\/     \\/     \\/     \\/     \\/ ","INFO", nil, nil, true)
        BasicPrint("        \\_Custom Races from Nexus","INFO", nil, nil, true)
        BasicWarning(string.format("============> Selectors removed from %d mods: %s", #removedClasses, classList))
    end
end

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
    Ext.Events.StatsLoaded:Subscribe(CleanClassesModASIOnStatsLoaded)
end
