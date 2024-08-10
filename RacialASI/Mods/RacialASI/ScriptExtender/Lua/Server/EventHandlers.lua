EHandlers = {}
--[[
function EHandlers.SyncVars()
  if VCHelpers.ModVars:IsModLoaded(Data.Deps.MCM_GUID.ModuleUUID) and McmVarsGeneralSettings["RASI"] == true then
    McmVarsOptions     = McmVars

    PatchAsi5eLimited  = McmVarsBooksSettings["PatchAsi5eLimited"]
    PatchAsi5e         = McmVarsBooksSettings["PatchAsi5e"]
    PatchAsi5eExtended = McmVarsBooksSettings["PatchAsi5eExtended"]
    PatchAsiLegacy     = McmVarsBooksSettings["PatchAsiLegacy"]
    PatchAsiFlavour    = McmVarsBooksSettings["PatchAsiFlavour"]
    PatchAsiHomebrew   = McmVarsBooksSettings["PatchAsiHomebrew"]
    PatchAsiDefault    = McmVarsBooksSettings["PatchAsiDefault"]

    DebugLevel         = McmVarsGeneralSettings["Debug_level"]
    Log                = McmVarsGeneralSettings["Log"]
    RasiOnOff          = McmVarsGeneralSettings["RASI"]
    CheatAsi30         = McmVarsGeneralSettings["CheatAsi30"]
    MCMASIAPI:OnSessionLoadedMCM()
    MCMASIAPI:OnStatsLoadedMCM()
  end
  Ext.Require("Core/Builder5e.lua")
  Core.Builder5e()
end
]]--


function EHandlers.SyncVarsCharCS()
  Ext.Osiris.RegisterListener("DB_TUT_CharacterCreation_Started", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end


function EHandlers.SyncVarsLSGame()
  Ext.Osiris.RegisterListener("DB_LevelGameplayLoadedOnce_WaitForGameplay", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

