SubscribedEvents = {}


function SubscribedEvents.SubscribeToEvents()
  -- When resetting Lua states
  -- Ext.Events.ResetCompleted:Subscribe(EHandlers.OnReset)

  if McmVarsGeneralSettings["RASI"] == true then
    Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "before", EHandlers.OnLevelGameplayStarted)

    Ext.Events.SessionLoaded:Subscribe(EHandlers.OnSessionLoaded)
  else
    RAWarn(1, "MCM RASI Mod Disable <Patchs Raw>")
  end
end

return SubscribedEvents
