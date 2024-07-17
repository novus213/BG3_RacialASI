--- MCM CONFIG
---@class MCMASI

MCMASI = _Class:Create("MCMASI", nil, {
    mods = {},
    profiles = {},
})

MCMASIAPI = MCMASI:New({}, "RacialASI")
--RASIAPI = _MetaClass._Debug(RASIAPI)
--setmetatable(Mods[Ext.Mod.GetMod(ModuleUUID).Info.Directory], { __index = Mods.RacialASI })
--- Constructor for OnSessionLoadedMCM class.
--- Function to load MCM values from json
function MCMASI:OnSessionLoadedMCM()
    mcmVars = {
        AddGnome_Tinkertools_Spells = MCMGet("AddGnome_Tinkertools_Spells"),
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = MCMGet("AddHalfElfDrow_Drow_DrowWeaponTraining_Passives"),
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = MCMGet("RemoveHuman_HumanMilitia_HumanVersatility_Passives"),
        RemoveHalfElf_HumanMilitia_Passives = MCMGet("RemoveHalfElf_HumanMilitia_Passives"),
        AddUndeadGhastlyGhouls_LightSensitivity_Passives = MCMGet("AddUndeadGhastlyGhouls_LightSensitivity_Passives"),
        AddUnderdarkRaces_LightSensitivity_Passives = MCMGet("AddUnderdarkRaces_LightSensitivity_Passives")
        --[[
            mcmVars["AddGnomeTinkertoolsSpells"]
        ]]--
    }

    mcmVarsGeneralSettings = {
        RASI = MCMGet("RASI"),
        debugToggle = MCMGet("debugToggle"),
        ActiveBookBoost = MCMGet("active_5e_boost")
    }
end

--- Constructor for OnStatsLoadedMCM class.
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

--- Constructor for processOptionMcm class.
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
                    handlePayload(action, payload)
                else
                    BasicError(string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
    end
end