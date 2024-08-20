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
      if Ext.Mod.IsModLoaded(Data.Deps.Framework_FM_GUID.ModuleUUID) and Ext.Mod.IsModLoaded(Data.Deps.VariantHuman_FM_GUID.ModuleUUID) then
        local Wyll = "efc9d114-0296-4a30-b701-365fc07d44fb"
        local Gale = "35c3caad-5543-4593-be75-e7deba30f062" 
        local resW = Ext.StaticData.Get(Wyll, "Origin")
        local resG = Ext.StaticData.Get(Gale, "Origin")
        resW.RaceUUID = "db0262f7-8c73-43b5-ad69-7451089ff1a1" --Human default Fantastic M RACEUUID
        resG.RaceUUID = "db0262f7-8c73-43b5-ad69-7451089ff1a1" --Human default Fantastic M RACEUUID
      end    
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
