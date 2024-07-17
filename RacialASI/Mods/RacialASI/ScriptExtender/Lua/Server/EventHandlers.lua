EHandlers = {}

function EHandlers.OnLevelGameplayStarted(levelName, isEditorMode)
    LoadAndSendSettings()
end


function LoadAndSendSettings()
   if Ext.IsServer() then
        MCMASIAPI:OnSessionLoadedMCM()
        MCMASIAPI:OnStatsLoadedMCM()
    end
end