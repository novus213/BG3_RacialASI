--- MCM CONFIG
---@class MCMASI

MCMASI = _Class:Create("MCMASI", nil, {
    mods = {},
    profiles = {},
})

MCMASIAPI = MCMASI:New({}, "RacialASI")
--RASIAPI = _MetaClass._Debug(RASIAPI)
--setmetatable(Mods[Ext.Mod.GetMod(ModuleUUID).Info.Directory], { __index = Mods.RacialASI })

--- Constructor for MCMASI:OnSessionLoadedMCM
--- Function to load MCM values from json
function MCMASI:OnSessionLoadedMCM()
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

    BasicWarning(string.format("============> %s is loaded.", mcmVars))
    BasicWarning(string.format("============> %s is loaded.", mcmVarsGeneralSettings))
    BasicWarning(string.format("============> %s is loaded.", mcmVarsBooksSettings))
end

--- Constructor for MCMASI:OnStatsLoadedMCM
--- extract mcmVar table from MCM Json
function MCMASI:OnStatsLoadedMCM()

    BasicPrint("    ____             _       __   ___   _____ ____   ____________","INFO", nil, nil, true)
    BasicPrint("   / __ \\____ ______(_)___ _/ /  /   | / ___//  _/  / ____/ ____/","INFO", nil, nil, true)
    BasicPrint("  / /_/ / __ `/ ___/ / __ `/ /  / /| | \\__ \\ / /   /___ \\/ __/   ","INFO", nil, nil, true)
    BasicPrint(" / _, _/ /_/ / /__/ / /_/ / /  / ___ |___/ // /   ____/ / /___   ","INFO", nil, nil, true)
    BasicPrint("/_/ |_|\\__,_/\\___/_/\\__,_/_/  /_/  |_/____/___/  /_____/_____/   ","INFO", nil, nil, true)
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint(
        string.format("Config.MCM.Init() - %s mod by Fenrules VERSION : %s starting up... ", MOD_INFO.MOD_NAME,
        MOD_INFO.VERSION),
        "INFO", nil, nil, true)
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")

    for key, value in pairs(mcmVarsOptions) do
        local actionConfigs = optionActions[key]

        if actionConfigs then
            MCMASIAPI:processOptionMcm(key, value, actionConfigs.actions)
        else
                BasicError(string.format("============> ERROR: No configuration found for %s.", key))
        end
    end
end

--- Constructor for MCMASI:processOptionMcm
---@param optionName string Mcm option name
---@param optionValue boolean active or not option
---@param actionConfigs table actions table from mcm option 
function MCMASI:processOptionMcm(optionName,optionValue, actionConfigs)
    if optionValue == true then
        BasicWarning(string.format("============> %s is enabled.", optionName))
        for _, actionConfig in ipairs(actionConfigs) do

            local action   = actionConfig.action
            local payloads = actionConfig.payloads

            for _, payload in ipairs(payloads) do
                if payload.Target then
                    MCMASIAPI:handlePayload(action, payload)
                else
                    BasicError(string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
    end
end

--- Constructor for MCMASI:callApiAction
---@param action string payload action
---@param payload table payload
function MCMASI:callApiAction(action, payload)
    if not (Mods.SubclassCompatibilityFramework and Mods.SubclassCompatibilityFramework.Api) then
        BasicError("============> ERROR: Subclass Compatibility Framework mod or its API is not available.")
    end

    local apiActions = {
        InsertPassives = Mods.SubclassCompatibilityFramework.Api.InsertPassives,
        RemovePassives = Mods.SubclassCompatibilityFramework.Api.RemovePassives,
        InsertSelectors = Mods.SubclassCompatibilityFramework.Api.InsertSelectors,
        InsertBoosts = Mods.SubclassCompatibilityFramework.Api.InsertBoosts,
        RemoveBoosts = Mods.SubclassCompatibilityFramework.Api.RemoveBoosts,
        SetBoolean = Mods.SubclassCompatibilityFramework.Api.SetBoolean
    }

    local apiFunction = apiActions[action]

    if apiFunction then
        return apiFunction(payload)
    else
        BasicError("============> ERROR: Invalid API action: " .. action)
    end
end

--- Constructor for MCMASI:handlePayload
---@param action string payload action
---@param payload table payload
function MCMASI:handlePayload(action, payload)
    BasicPrint("payload")
    BasicPrint(payload)
    MCMASIAPI:callApiAction(action, { payload = payload })
end

--- Constructor for MCMASI:MCMGet
--- Function to get MCM setting values
function  MCMASI:MCMGet(settingID)
    return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
end