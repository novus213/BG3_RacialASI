EHandlers = {}

function EHandlers.OnLevelGameplayStarted(levelName, isEditorMode)
    LoadAndSendSettings()
end


function LoadAndSendSettings()
    if Ext.IsServer() then
        MCMRAAPI:OnSessionLoadedMCM()
        MCMRAAPI:OnStatsLoadedMCM()
    end
end