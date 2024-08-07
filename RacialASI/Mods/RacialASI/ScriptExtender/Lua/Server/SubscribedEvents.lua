SubscribedEvents = {}

function SubscribedEvents.SubscribeToEvents()
  if McmVarsGeneralSettings["RASI"] == true then
    EHandlers.SyncVars()
  else
    RAWarn(1, "MCM RASI Mod Disable <Patchs Raw>")
  end
end

return SubscribedEvents
