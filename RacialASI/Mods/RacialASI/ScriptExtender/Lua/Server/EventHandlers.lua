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