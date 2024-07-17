SubscribedEvents = {}

function SubscribedEvents.SubscribeToEvents()
    Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "before", EHandlers.OnLevelGameplayStarted)
end

return SubscribedEvents