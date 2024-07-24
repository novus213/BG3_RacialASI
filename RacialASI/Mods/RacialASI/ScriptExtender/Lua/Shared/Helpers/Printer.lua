if VCHelpers.ModVars:isModLoaded("755a8a72-407f-4f0d-9a33-274ac0f0b53d") then

    RAPrinter = VolitionCabinetPrinter:New { Prefix = "RacialASI", ApplyColor = true,
    DebugLevel = MCMGet("debug_level") }

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

    mcmVars = {
        AddGnome_Tinkertools_Spells                                     = "notuse",
        AddGnome_ForestMinorIllusion_Spells                             = "notuse",
        AddHalfElf_Skills                                               = "notuse",
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives                 = "notuse",
        RemoveHuman_HumanMilitia_HumanVersatility_Passives              = "notuse",
        RemoveHalfElf_HumanMilitia_Passives                             = "notuse",
        AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives = MCMASIAPI:MCMGet("AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives"),
        AddUnderdarkRaces_LightSensitivity_Passives                     = "notuse"
        --[[
            mcmVars["AddGnomeTinkertoolsSpells"]
        ]]--
    }

    mcmVarsBooksSettings = {
        PatchAsi5eLimited = MCMASIAPI:MCMGet("PatchASI_5eLimited"),
        PatchAsi5e = MCMASIAPI:MCMGet("PatchASI_5e"),
        PatchAsi5eExtended = MCMASIAPI:MCMGet("PatchASI_5eExtended"),
        PatchAsiLegacy = MCMASIAPI:MCMGet("PatchASI_Legacy"),
        PatchAsiFlavour = MCMASIAPI:MCMGet("PatchASI_Flavour"),
        PatchAsiHomebrew = MCMASIAPI:MCMGet("PatchASI_Homebrew"),
        PatchAsiDefault = MCMASIAPI:MCMGet("PatchASI_Default")

        --[[
            mcmVarsBooksSettings["IgnoreAll"]
        ]]--
    }
    mcmVarsGeneralSettings = {
        RASI = MCMASIAPI:MCMGet("RASI"),
        DebugLevel = MCMASIAPI:MCMGet("Debug_level"),
        Log = MCMASIAPI:MCMGet("Log")

    }


    mcmVarsOptions 		= mcmVars

    PatchAsi5eLimited  = mcmVarsBooksSettings["PatchAsi5eLimited"]
    PatchAsi5e         = mcmVarsBooksSettings["PatchAsi5e"]
    PatchAsi5eExtended = mcmVarsBooksSettings["PatchAsi5eExtended"]
    PatchAsiLegacy     = mcmVarsBooksSettings["PatchAsiLegacy"]
    PatchAsiFlavour    = mcmVarsBooksSettings["PatchAsiFlavour"]
    PatchAsiHomebrew   = mcmVarsBooksSettings["PatchAsiHomebrew"]
    PatchAsiDefault    = mcmVarsBooksSettings["PatchAsiDefault"]


    DebugLevel = mcmVarsGeneralSettings["Debug_level"]
    Log = mcmVarsGeneralSettings["Log"]

    -- Register a net listener to handle settings changes dynamically
    Ext.RegisterNetListener("MCM_Saved_Setting", function(call, payload)

        local data = Ext.Json.Parse(payload)

        if not data or data.modGUID ~= ModuleUUID or not data.settingId then
            return
        end

        if mcmVars[data.settingId] ~= nil then
            mcmVars[data.settingId] = data.value

            RAWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            mcmVarsOptions 		= mcmVars

            --MCMASIAPI:OnStatsLoadedMCM()

        end

            if mcmVarsBooksSettings[data.settingId] ~= nil then
            mcmVarsBooksSettings[data.settingId] = data.value

            RAWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            PatchAsi5eLimited  = mcmVarsBooksSettings["PatchAsi5eLimited"]
            PatchAsi5e         = mcmVarsBooksSettings["PatchAsi5e"]
            PatchAsi5eExtended = mcmVarsBooksSettings["PatchAsi5eExtended"]
            PatchAsiLegacy     = mcmVarsBooksSettings["PatchAsiLegacy"]
            PatchAsiFlavour    = mcmVarsBooksSettings["PatchAsiFlavour"]
            PatchAsiHomebrew   = mcmVarsBooksSettings["PatchAsiHomebrew"]
            PatchAsiDefault    = mcmVarsBooksSettings["PatchAsiDefault"]



            --CleanOnRacesStatsLoaded()
            --builder5eRaces()

        end

        if mcmVarsGeneralSettings[data.settingId] ~= nil then

            mcmVarsGeneralSettings[data.settingId] = data.value
            RAWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            mcmVarsGeneralSettingsUse = mcmVarsGeneralSettings

        end

        if data.settingId == "debug_level" then

            RADebug(0, "Setting debug level to " .. data.value)
            RAPrinter.DebugLevel = data.value

            DebugLevel = mcmVarsGeneralSettings["Debug_level"]
        end

        if data.settingId == "Log" then

            RAWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            Log = mcmVarsGeneralSettings["Log"]
        end


    end)

end