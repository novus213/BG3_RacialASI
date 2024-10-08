if VCHelpers.ModVars:IsModLoaded("755a8a72-407f-4f0d-9a33-274ac0f0b53d") then
  RAPrinter = VolitionCabinetPrinter:New { Prefix = "RacialASIPrinter", ApplyColor = true,
    DebugLevel = MCMGet("Debug_level") }

  function RAPrint(debugLevel, ...)
    RAPrinter:SetFontColor(0, 255, 255)
    RAPrinter:Print(debugLevel, ...)
  end

  function RATest(debugLevel, ...)
    RAPrinter:SetFontColor(100, 200, 150)
    RAPrinter:PrintTest(debugLevel, ...)
  end

  function RASuccess(debugLevel, ...)
    RAPrinter:SetFontColor(50, 255, 100)
    RAPrinter:Print(debugLevel, ...)
  end

  function RADebug(debugLevel, ...)
    RAPrinter:SetFontColor(200, 200, 0)
    RAPrinter:PrintDebug(debugLevel, ...)
  end

  function RAWarn(debugLevel, ...)
    RAPrinter:SetFontColor(255, 100, 50)
    RAPrinter:PrintWarning(debugLevel, ...)
  end

  function RADump(debugLevel, ...)
    RAPrinter:SetFontColor(190, 150, 225)
    RAPrinter:Dump(debugLevel, ...)
  end

  function RADumpArray(debugLevel, ...)
    RAPrinter:DumpArray(debugLevel, ...)
  end

  McmVars = {
    AddGnome_Tinkertools_Spells                                     = "notoptional",
    AddGnome_ForestMinorIllusion_Spells                             = "notoptional",
    AddHalfElf_Skills                                               = "notoptional",
    AddHalfElfDrow_Drow_DrowWeaponTraining_Passives                 = MCMASIAPI:MCMGet(
      "AddHalfElfDrow_Drow_DrowWeaponTraining_Passives"),
    RemoveHuman_HumanMilitia_HumanVersatility_Passives              = MCMASIAPI:MCMGet(
      "RemoveHuman_HumanMilitia_HumanVersatility_Passives"),
    RemoveHalfElf_HumanMilitia_Passives                             = MCMASIAPI:MCMGet(
      "RemoveHalfElf_HumanMilitia_Passives"),
    AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives = MCMASIAPI:MCMGet(
      "AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives"),
    AddUnderdarkRaces_LightSensitivity_Passives                     = MCMASIAPI:MCMGet(
      "AddUnderdarkRaces_LightSensitivity_Passives")
    --[[
            McmVars["AddGnomeTinkertoolsSpells"]
        ]] --
  }

  McmVarsBooksSettings = {
    PatchAsi5eLimited = MCMASIAPI:MCMGet("PatchASI_5eLimited"),
    PatchAsi5e = MCMASIAPI:MCMGet("PatchASI_5e"),
    PatchAsi5eExtended = MCMASIAPI:MCMGet("PatchASI_5eExtended"),
    PatchAsiLegacy = MCMASIAPI:MCMGet("PatchASI_Legacy"),
    PatchAsiFlavour = MCMASIAPI:MCMGet("PatchASI_Flavour"),
    PatchAsiHomebrew = MCMASIAPI:MCMGet("PatchASI_Homebrew"),
    PatchAsiDefault = MCMASIAPI:MCMGet("PatchASI_Default")

    --[[
            McmVarsBooksSettings["IgnoreAll"]
        ]] --
  }
  McmVarsGeneralSettings = {
    RASI = MCMASIAPI:MCMGet("RASI"),
    DebugLevel = MCMASIAPI:MCMGet("Debug_level"),
    Log = MCMASIAPI:MCMGet("Log"),
    CheatAsi30 = MCMASIAPI:MCMGet(
      "CheatAsi30"),
    RaceHiddener = MCMASIAPI:MCMGet("RaceHiddener"),
    ClasseHiddener = MCMASIAPI:MCMGet("ClasseHiddener")

  }


  McmVarsOptions     = McmVars

  PatchAsi5eLimited  = McmVarsBooksSettings["PatchAsi5eLimited"]
  PatchAsi5e         = McmVarsBooksSettings["PatchAsi5e"]
  PatchAsi5eExtended = McmVarsBooksSettings["PatchAsi5eExtended"]
  PatchAsiLegacy     = McmVarsBooksSettings["PatchAsiLegacy"]
  PatchAsiFlavour    = McmVarsBooksSettings["PatchAsiFlavour"]
  PatchAsiHomebrew   = McmVarsBooksSettings["PatchAsiHomebrew"]
  PatchAsiDefault    = McmVarsBooksSettings["PatchAsiDefault"]


  DebugLevel     = McmVarsGeneralSettings["Debug_level"]
  Log            = McmVarsGeneralSettings["Log"]
  RASI           = McmVarsGeneralSettings["RASI"]
  CheatAsi30     = McmVarsGeneralSettings["CheatAsi30"]
  RaceHiddener   = McmVarsGeneralSettings["RaceHiddener"]
  ClasseHiddener = McmVarsGeneralSettings["ClasseHiddener"]



  -- In your MCM-integrated mod's code
  Ext.ModEvents.BG3MCM["MCM_Setting_Saved"]:Subscribe(function (payload)
    --local data = Ext.Json.Parse(payload)

    if not payload or payload.modUUID ~= ModuleUUID or not payload.settingId then
      return
    end

    if McmVars[payload.settingId] ~= nil then
      McmVars[payload.settingId] = payload.value

      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))

      McmVarsOptions = McmVars

      --MCMASIAPI:OnStatsLoadedMCM()
    end

    if McmVarsBooksSettings[payload.settingId] ~= nil then
      McmVarsBooksSettings[payload.settingId] = payload.value

      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))

      PatchAsi5eLimited  = McmVarsBooksSettings["PatchAsi5eLimited"]
      PatchAsi5e         = McmVarsBooksSettings["PatchAsi5e"]
      PatchAsi5eExtended = McmVarsBooksSettings["PatchAsi5eExtended"]
      PatchAsiLegacy     = McmVarsBooksSettings["PatchAsiLegacy"]
      PatchAsiFlavour    = McmVarsBooksSettings["PatchAsiFlavour"]
      PatchAsiHomebrew   = McmVarsBooksSettings["PatchAsiHomebrew"]
      PatchAsiDefault    = McmVarsBooksSettings["PatchAsiDefault"]

      --CleanOnRacesStatsLoaded()
      --builder5eRaces()
    end

    if McmVarsGeneralSettings[payload.settingId] ~= nil then
      McmVarsGeneralSettings[payload.settingId] = payload.value
      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))

      --McmVarsGeneralSettings = McmVarsGeneralSettings
    end

    if payload.settingId == "debug_level" then
      RADebug(0, "Setting debug level to " .. payload.value)
      RAPrinter.DebugLevel = payload.value
      DebugLevel = McmVarsGeneralSettings["Debug_level"]
    end

    if payload.settingId == "Log" then
      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))
      Log = McmVarsGeneralSettings["Log"]
    end

    if payload.settingId == "RASI" then
      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))
      RasiOnOff = McmVarsGeneralSettings["RASI"]
    end

    if payload.settingId == "CheatAsi30" then
      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))
      CheatAsi30 = McmVarsGeneralSettings["CheatAsi30"]
    end

    if payload.settingId == "RaceHiddener" then
      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))
      RaceHiddener = McmVarsGeneralSettings["RaceHiddener"]
    end

    if payload.settingId == "ClasseHiddener" then
      RAWarn(2, string.format("Setting %s to %s", payload.settingId, payload.value))
      ClasseHiddener = McmVarsGeneralSettings["ClasseHiddener"]
    end
  end)
end
