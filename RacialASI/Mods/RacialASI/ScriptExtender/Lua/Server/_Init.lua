Ext.Require("Server/EventHandlers.lua")
Ext.Require("Server/SubscribedEvents.lua")

SubscribedEvents.SubscribeToEvents()

--PersistentVars = {}
-- Variable will be restored after the savegame finished loading
--[[
function doStuff()
  Ext.Vars.RegisterUserVariable("ClassModObject", {
    Server = true,
    Client = true,
    SyncToClient = true
  })
  Ext.Vars.RegisterUserVariable("ClassMod", {
    Server = true,
    Client = true,
    SyncToClient = true
  })
end

doStuff()

function OnSessionLoaded()
  -- Persistent variables are only available after SessionLoaded is triggered!
  Ext.Require("Core/Builder5e.lua")
  Core.Builder5e()
end

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)
]]--

