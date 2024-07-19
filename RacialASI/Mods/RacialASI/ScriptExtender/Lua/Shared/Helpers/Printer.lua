if Ext.Mod.IsModLoaded("755a8a72-407f-4f0d-9a33-274ac0f0b53d") then

    mcmVars = {
        AddGnome_Tinkertools_Spells = MCMASIAPI:MCMGet("AddGnome_Tinkertools_Spells"),
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = MCMASIAPI:MCMGet("AddHalfElfDrow_Drow_DrowWeaponTraining_Passives"),
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = MCMASIAPI:MCMGet("RemoveHuman_HumanMilitia_HumanVersatility_Passives"),
        RemoveHalfElf_HumanMilitia_Passives = MCMASIAPI:MCMGet("RemoveHalfElf_HumanMilitia_Passives"),
        AddUndeadGhastlyGhouls_LightSensitivity_Passives = MCMASIAPI:MCMGet("AddUndeadGhastlyGhouls_LightSensitivity_Passives"),
        AddUnderdarkRaces_LightSensitivity_Passives = MCMASIAPI:MCMGet("AddUnderdarkRaces_LightSensitivity_Passives")
        --[[
            mcmVars["AddGnomeTinkertoolsSpells"]
        ]]--
    }

    mcmVarsBooksSettings = {
        IgnoreAll = MCMASIAPI:MCMGet("IgnoreAll"),
        Ignore5eLimited = MCMASIAPI:MCMGet("Ignore5eLimited"),
        Ignore5e = MCMASIAPI:MCMGet("Ignore5e"),
        Ignore5eExtended = MCMASIAPI:MCMGet("Ignore5eExtended"),
        IgnoreFlavours = MCMASIAPI:MCMGet("IgnoreFlavours"),
        IgnoreLegacy = MCMASIAPI:MCMGet("IgnoreLegacy"),
        IgnoreHomebrew = MCMASIAPI:MCMGet("IgnoreHomebrew")

        --[[
            mcmVarsBooksSettings["IgnoreAll"]
        ]]--
    }
    mcmVarsGeneralSettings = {
        RASI = MCMASIAPI:MCMGet("RASI"),
        debugLevel = MCMASIAPI:MCMGet("debug_level"),
        Log = MCMASIAPI:MCMGet("Log")

    }


    mcmVarsOptions 		= mcmVars

    IgnoreAll 			= mcmVarsBooksSettings["IgnoreAll"]
    Ignore5eLimited 	= mcmVarsBooksSettings["Ignore5eLimited"]
    Ignore5e 			= mcmVarsBooksSettings["Ignore5e"]
    Ignore5eExtended 	= mcmVarsBooksSettings["Ignore5eExtended"]
    IgnoreFlavours 		= mcmVarsBooksSettings["IgnoreFlavours"]
    IgnoreLegacy 		= mcmVarsBooksSettings["IgnoreLegacy"]
    IgnoreHomebrew 		= mcmVarsBooksSettings["IgnoreHomebrew"]


    debugLevel = mcmVarsBooksSettings["debug_level"]
    Log = mcmVarsBooksSettings["Log"]


    -- Register a net listener to handle settings changes dynamically
    Ext.RegisterNetListener("MCM_Saved_Setting", function(call, payload)

        local data = Ext.Json.Parse(payload)

        if not data or data.modGUID ~= ModuleUUID or not data.settingId then
            return
        end

        if mcmVars[data.settingId] ~= nil then
            mcmVars[data.settingId] = data.value

            BasicWarning(string.format("Setting %s to %s", data.settingId, data.value))

            mcmVarsOptions 		= mcmVars

        end

            if mcmVarsBooksSettings[data.settingId] ~= nil then
            mcmVarsBooksSettings[data.settingId] = data.value

            BasicWarning(string.format("Setting %s to %s", data.settingId, data.value))

            IgnoreAll 			= mcmVarsBooksSettings["IgnoreAll"]
            Ignore5eLimited 	= mcmVarsBooksSettings["Ignore5eLimited"]
            Ignore5e 			= mcmVarsBooksSettings["Ignore5e"]
            Ignore5eExtended 	= mcmVarsBooksSettings["Ignore5eExtended"]
            IgnoreFlavours 		= mcmVarsBooksSettings["IgnoreFlavours"]
            IgnoreLegacy 		= mcmVarsBooksSettings["IgnoreLegacy"]
            IgnoreHomebrew 		= mcmVarsBooksSettings["IgnoreHomebrew"]

        end

        if mcmVarsGeneralSettings[data.settingId] ~= nil then

            mcmVarsGeneralSettings[data.settingId] = data.value
            BasicWarning(string.format("Setting %s to %s", data.settingId, data.value))

            mcmVarsGeneralSettingsUse = mcmVarsBooksSettings

        end

        if data.settingId == "debug_level" then

            BasicWarning(string.format("Setting %s to %s", data.settingId, data.value))

            debugLevel = mcmVarsBooksSettings["debug_level"]
        end

        if data.settingId == "Log" then

            BasicWarning(string.format("Setting %s to %s", data.settingId, data.value))

            Log = mcmVarsBooksSettings["Log"]
        end


    end)

end