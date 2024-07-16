Ext.RegisterNetListener("MU_Reload_Conf", function()
    Ext.Events.NetMessageReceived:Subscribe(OnSessionLoadedMCM)
    Ext.Events.NetMessageReceived:Subscribe(OnStatsLoadedMCM)
end)