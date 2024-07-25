SubscribedEvents = {}
--[[
Ext.RegisterNetListener("MU_Request_Server_Uninstall_Mod", function(channel, payload)
    local data = Ext.Json.Parse(payload)
    local uuid = data.modUUID
    local mod = Ext.Mod.GetMod(uuid)
    if not Ext.Mod.isModLoaded(uuid) then
        Ext.Net.BroadcastMessage("MU_Uninstall_Mod_Failed",
            Ext.Json.Stringify({ modUUID = data.modUUID, error = "Mod is not loaded" }))
        return
    end
    Mods.ModUninstaller.UninstallMod(uuid)
end)
]]--
--[[function SubscribedEvents.SubscribeToEvents()
    Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "before", EHandlers.OnLevelGameplayStarted)
end]]

return SubscribedEvents