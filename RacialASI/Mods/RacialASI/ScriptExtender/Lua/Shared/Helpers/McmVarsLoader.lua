if Ext.Mod.IsModLoaded("755a8a72-407f-4f0d-9a33-274ac0f0b53d") then

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

            VCWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            mcmVarsOptions 		= mcmVars

            --MCMASIAPI:OnStatsLoadedMCM()

        end

            if mcmVarsBooksSettings[data.settingId] ~= nil then
            mcmVarsBooksSettings[data.settingId] = data.value

            VCWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

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
            VCWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            mcmVarsGeneralSettingsUse = mcmVarsGeneralSettings

        end

        if data.settingId == "debug_level" then

            VCWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            DebugLevel = mcmVarsGeneralSettings["Debug_level"]
        end

        if data.settingId == "Log" then

            VCWarn(2, string.format("Setting %s to %s", data.settingId, data.value))

            Log = mcmVarsGeneralSettings["Log"]
        end


    end)

end