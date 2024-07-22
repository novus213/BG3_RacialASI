Ext.Require("Libs/ClassesLibrary.lua")

--[[
_________ .__                         _________ .__                                       __________    _____         .__       .__      _____    _________.___ 
\_   ___ \|  |   ____ _____    ____   \_   ___ \|  | _____    ______ ______ ____   ______ \______   \  /  _  \   ____ |__|____  |  |    /  _  \  /   _____/|   |
/    \  \/|  | _/ __ \\__  \  /    \  /    \  \/|  | \__  \  /  ___//  ___// __ \ /  ___/  |       _/ /  /_\  \_/ ___\|  \__  \ |  |   /  /_\  \ \_____  \ |   |
\     \___|  |_\  ___/ / __ \|   |  \ \     \___|  |__/ __ \_\___ \ \___ \\  ___/ \___ \   |    |   \/    |    \  \___|  |/ __ \|  |__/    |    \/        \|   |
 \______  /____/\___  >____  /___|  /  \______  /____(____  /____  >____  >\___  >____  >  |____|_  /\____|__  /\___  >__(____  /____/\____|__  /_______  /|___|
        \/          \/     \/     \/          \/          \/     \/     \/     \/     \/          \/         \/     \/        \/              \/        \/      
        \_Clean Classes ModASI
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
        BasicPrint("_________ .__                         _________ .__                                       __________    _____         .__       .__      _____    _________.___  ","INFO", nil, nil, true)
        BasicPrint("\\_   ___ \\|  |   ____ _____    ____   \\_   ___ \\|  | _____    ______ ______ ____   ______ \\______   \\  /  _  \\   ____ |__|____  |  |    /  _  \\  /   _____/|   | ","INFO", nil, nil, true)
        BasicPrint("/    \\  \\/|  | _/ __ \\\\__  \\  /    \\  /    \\  \\/|  | \\__  \\  /  ___//  ___// __ \\ /  ___/  |       _/ /  /_\\  \\_/ ___\\|  \\__  \\ |  |   /  /_\\  \\ \\_____  \\ |   | ","INFO", nil, nil, true)
        BasicPrint("\\     \\___|  |_\\  ___/ / __ \\|   |  \\ \\     \\___|  |__/ __ \\_\\___ \\ \\___ \\\\  ___/ \\___ \\   |    |   \\/    |    \\  \\___|  |/ __ \\|  |__/    |    \\/        \\|   | ","INFO", nil, nil, true)
        BasicPrint(" \\______  /____/\\___  >____  /___|  /  \\______  /____(____  /____  >____  >\\___  >____  >  |____|_  /\\____|__  /\\___  >__(____  /____/\\____|__  /_______  /|___| ","INFO", nil, nil, true)
        BasicPrint("        \\/          \\/     \\/     \\/          \\/          \\/     \\/     \\/     \\/     \\/          \\/         \\/     \\/        \\/              \\/        \\/       ","INFO", nil, nil, true)
        BasicPrint("        \\_Clean Classes ModASI ","INFO", nil, nil, true)
        BasicWarning(string.format("============> Selectors removed from %d mods: %s", #removedClasses, classList))
    end
end

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
    Ext.Events.StatsLoaded:Subscribe(CleanClassesModASIOnStatsLoaded)
end
