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

    mcmVarsGeneralSettings = {
        RASI = MCMASIAPI:MCMGet("RASI"),
        debugToggle = MCMASIAPI:MCMGet("debugToggle"),
        ActiveBookBoost = MCMASIAPI:MCMGet("active_5e_boost")
    }
end

--- Constructor for MCMASI:OnStatsLoadedMCM
--- extract mcmVar table from MCM Json
function MCMASI:OnStatsLoadedMCM()
    for key, value in pairs(mcmVars) do
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
    MCMASIAPI:callApiAction(action, { payload = payload })
end

--- Constructor for MCMASI:MCMGet
--- Function to get MCM setting values
function  MCMASI:MCMGet(settingID)
    return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
end