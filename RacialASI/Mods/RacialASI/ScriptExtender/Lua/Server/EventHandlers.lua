EHandlers = {}

function EHandlers.SyncVarsCharCS()
  Ext.Osiris.RegisterListener("DB_TUT_CharacterCreation_Started", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      -- hide race / subrace / classe ruleSets
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

function EHandlers.SyncVarsLLGame()
  Ext.Osiris.RegisterListener("DB_LevelGameplayLoadedOnce_WaitForGameplay", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

function EHandlers.SyncVars2()
  Ext.Osiris.RegisterListener("DB_ZZZ_LevelLoaded", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

function EHandlers.SyncVars3()
  Ext.Osiris.RegisterListener("DB_LevelLoadedOnce", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

function EHandlers.SyncVars4()
  Ext.Osiris.RegisterListener("DB_CharacterCreationStarted", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

function EHandlers.SyncVars5()
  Ext.Osiris.RegisterListener("DB_StoryReloaded", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

function EHandlers.SyncVars6()
  Ext.Osiris.RegisterListener("DB_AnubisConfigOverride_UpdatedConfig", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end
