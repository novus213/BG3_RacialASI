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
        PatchAsi5eLimited   = MCMASIAPI:MCMGet("PatchASI_5eLimited"),
        PatchAsi5e          = MCMASIAPI:MCMGet("PatchASI_5e"),
        PatchAsi5eExtended  = MCMASIAPI:MCMGet("PatchASI_5eExtended"),
        PatchAsiLegacy      = MCMASIAPI:MCMGet("PatchASI_Legacy"),
        PatchAsiFlavour     = MCMASIAPI:MCMGet("PatchASI_Flavour"),
        PatchAsiHomebrew    = MCMASIAPI:MCMGet("PatchASI_Homebrew"),
        PatchAsiDefault     = MCMASIAPI:MCMGet("PatchASI_Default")
        --[[
            mcmVarsBooksSettings["IgnoreAll"]
        ]]--
    }
    mcmVarsGeneralSettings = {
        RASI        = MCMASIAPI:MCMGet("RASI"),
        DebugLevel  = MCMASIAPI:MCMGet("Debug_level"),
        Log         = MCMASIAPI:MCMGet("Log")
    }

    

    BasicWarning(string.format("============> mcmVars is loaded. %s", table.dump(mcmVars)))
    BasicWarning(string.format("============> mcmVarsGeneralSettings is loaded. %s", table.dump(mcmVarsGeneralSettings)))
    BasicWarning(string.format("============> mcmVarsBooksSettings is loaded. %s", table.dump(mcmVarsBooksSettings)))
end

--- Constructor for MCMASI:OnStatsLoadedMCM
--- extract mcmVar table from MCM Json
function MCMASI:OnStatsLoadedMCM()
    for key, value in pairs(mcmVarsOptions) do
        local actionConfigs = optionActions[key]

        if value == true then
            if actionConfigs then
                MCMASIAPI:processOptionMcm(key, actionConfigs.actions)
            else
                    BasicError(string.format("============> ERROR: No configuration found for %s.", key))
            end
            BasicWarning(string.format("============> %s is enabled.", key))
        else
            if value == "notuse" and actionConfigs.ruleset == "5eLimited" and PatchAsi5eLimited == true then
                if actionConfigs then
                    MCMASIAPI:processOptionMcm(key, actionConfigs.actions)
                else
                        BasicError(string.format("============> ERROR: No configuration found for %s.", key))
                end
                BasicWarning(string.format("============> %s is enabled (5eLimited Actived).", key))
            end
        end
    end
end

--- Constructor for MCMASI:processOptionMcm
---@param optionName string Mcm option name
---@param optionValue boolean active or not option
---@param actionConfigs table actions table from mcm option
function MCMASI:processOptionMcm(optionName, actionConfigs)
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

--- Constructor for MCMASI:callApiAction
---@param action string payload action
---@param payload table payload
function MCMASI:callApiAction(action, payload)
    if not (Mods.SubclassCompatibilityFramework and Mods.SubclassCompatibilityFramework.Api) then
        BasicError("============> ERROR: Subclass Compatibility Framework mod or its API is not available.")
    end

    local apiActions = {
        InsertPassives  = Mods.SubclassCompatibilityFramework.Api.InsertPassives,
        RemovePassives  = Mods.SubclassCompatibilityFramework.Api.RemovePassives,
        InsertSelectors = Mods.SubclassCompatibilityFramework.Api.InsertSelectors,
        RemoveSelectors = Mods.SubclassCompatibilityFramework.Api.RemoveSelectors,
        InsertBoosts    = Mods.SubclassCompatibilityFramework.Api.InsertBoosts,
        RemoveBoosts    = Mods.SubclassCompatibilityFramework.Api.RemoveBoosts,
        SetBoolean      = Mods.SubclassCompatibilityFramework.Api.SetBoolean
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
    MCMASIAPI:callApiAction(action, { payload = payload })
    BasicWarning(string.format("============> %s payload.", { payload = payload }))
end

--- Constructor for MCMASI:MCMGet
--- Function to get MCM setting values
function  MCMASI:MCMGet(settingID)
    return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
end