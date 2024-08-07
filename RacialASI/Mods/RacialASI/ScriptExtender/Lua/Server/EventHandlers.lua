EHandlers = {}
function EHandlers.SyncVars()
  if VCHelpers.ModVars:IsModLoaded(Data.Deps.MCM_GUID.ModuleUUID) and McmVarsGeneralSettings["RASI"] == true then
    Ext.Events.GameStateChanged:Subscribe(function (e)
      RAPrint(2, "e.FromState")
      RAPrint(2, e.FromState)
      if e.FromState == "initConnection" or e.FromState == "init" or e.FromState == "LoadSession" or e.FromState == "LoadMenu" then
        --if e.FromState == "PrepareRunning" or e.FromState == "Sync" or e.ToState == "LoadSession" or e.FromState == "LoadMenu" then
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

        MCMASIAPI:OnStatsLoadedMCM()

        Core.Builder5e()
      end
      Core.Builder5e()
    end)
  end
end
