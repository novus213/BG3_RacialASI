depsServ = {
    MCM_GUID       = "755a8a72-407f-4f0d-9a33-274ac0f0b53d"
}

if not Ext.Mod.IsModLoaded(depsServ.MCM_GUID) then return end

-- Function to get MCM setting values
function MCMGet(settingID)
    return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
end

local function OnSessionLoaded()
    mcmVars = {
        RASI = MCMGet("RASI"),
        debugToggle = MCMGet("debugToggle"),
        addGnome_tinkertools_spells = MCMGet("addGnome_tinkertools_spells"),
        addHalfElfDrow_drow_drowWeaponTraining_passives = MCMGet("addHalfElfDrow_drow_drowWeaponTraining_passives"),
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = MCMGet("RemoveHuman_HumanMilitia_HumanVersatility_Passives"),
        RemoveHalfElf_HumanMilitia_Passives = MCMGet("RemoveHalfElf_HumanMilitia_Passives"),
        AddUndeadGhastlyGhouls_LightSensitivity_Passives = MCMGet("AddUndeadGhastlyGhouls_LightSensitivity_Passives"),
        AddUnderdarkRaces_LightSensitivity_Passives = MCMGet("AddUnderdarkRaces_LightSensitivity_Passives"),
        ActiveBookBoost = MCMGet("active_5e_boost")
        --[[
            mcmVars["AddGnomeTinkertoolsSpells"]
        ]]--
    }
end

--[[
optionActions = {
    AddGnome_Tinkertools_Spells = {
        actions = {
            {
                action = "InsertSelectors",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "aa2257a9-1779-4d8b-be65-8a08eede07fa",
                        FileType = "Progression",
                        Function = "AddSpells",
                        Params = {
                            Guid = "5fdb4bd0-8122-4ce6-9191-fffc951cf3a3",                      -- Used in All
                            PrepareType = "AlwaysPrepared", -- Used in SelectSpells, AddSpells. Values: Default, AlwaysPrepared
                            CooldownType = "UntilRest"     -- Used in SelectSpells, AddSpells. Values: Default, UntilRest
                        }
                    }
                }
            }
        }
    }
}
]]--

function OnStatsLoadedMcm()
    for optionName, optionValue in ipairs(mcmVars) do
        local actionConfigs = optionActions[optionName]
        if actionConfigs then
            processOptionMcm(optionName, optionValue, actionConfigs.actions)
        else
            BasicError(string.format("============> ERROR: No action configuration found for %s.", optionName))
        end
    end
end

function processOptionMcm(optionName, optionValue, actionConfigs)
    if optionValue == true then
        BasicWarning(string.format("============> %s is enabled.", optionName))
        for _, actionConfig in ipairs(actionConfigs) do

            local action = actionConfig.action
            local payloads = actionConfig.payloads

            for _, payload in ipairs(payloads) do
                if payload.Target then
                        if action == "InsertSelectors" then
                            local payload = createPayload(payload.modGuid, payload.Target, payload.Function, payload.Params.Guid, payload.Params.PrepareType, payload.Params.CooldownType)
                            Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
                        end

                        if action == "InsertPassives" then
                            local payload = createPayload(payload.modGuid, payload.Target, payload.Function, payload.Params.Guid, payload.Params.PrepareType, payload.Params.CooldownType, payload.Type, payload.TypeStrings)
                            Mods.SubclassCompatibilityFramework.Api.InsertPassives({payload})
                        end

                        if action == "RemovePassives" then
                            local payload = createPayload(payload.modGuid, payload.Target, payload.Function, payload.Params.Guid, payload.Params.PrepareType, payload.Params.CooldownType, payload.Type, payload.TypeStrings)
                            Mods.SubclassCompatibilityFramework.Api.RemovePassives({payload})
                        end                    
                else
                    BasicError(string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
    end
end

local function createPayload(modGuid, targetuuid, func, paramsGuid, prepareType, CooldownType, typePayload, stringPayload)
        if func == nil then
            return {
                modGuid = modGuid,
                Target = targetuuid,
                FileType = "Progression",
                Type = typePayload,
                Strings = {""..stringPayload..""}
            }
        elseif func == "AddSpells" then
            return {
                modGuid = modGuid,
                Target = targetuuid,
                FileType = "Progression",
                Function = func,
                Params = {
                    Guid = paramsGuid,                      -- Used in All
                    PrepareType = prepareType, -- Used in SelectSpells, AddSpells. Values: Default, AlwaysPrepared
                    CooldownType = cooldownType     -- Used in SelectSpells, AddSpells. Values: Default, UntilRest
                }
            }
        end
end

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)

-- Register a net listener to handle settings changes dynamically
Ext.RegisterNetListener("MCM_Saved_Setting", function(call, payload)
    local data = Ext.Json.Parse(payload)
    if not data or data.modGUID ~= ModuleUUID or not data.settingId then
        return
    end

    if mcmVars[data.settingId] ~= nil then
        mcmVars[data.settingId] = data.value
    end
end)

--[[
Ext.Osiris.RegisterListener("TUT_CharacterCreation_Started",1,"before",function()
end) 
]]--