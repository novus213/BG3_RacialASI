-- Refactorting Argelia
-- MCM plugin in working update

-- Launch CONFIG
local function start()
    if not CONFIG then CONFIG = InitConfig() end
end

-- Define Actions and Payloads

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
    },
    AddUnderdarkRaces_LightSensitivity_Passives = {
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "4a634f24-bdcb-4559-b8be-7847133ad1c3",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "bd012f5b-0a0b-424e-ab7c-186dbd82ab30",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "58dae581-c25a-4dfb-8a57-589bf4b34f62",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "dc9e985a-6b20-4066-ab3d-eed16191122b", --ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "3140a061-8e1f-4c9e-bca2-1c0ed5a3ae65", -- ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- Deep Gnome Osi.AddExplorationExperience(GetHostCharacter(), 9000000)
                        Target = "938b6f72-18a6-4af0-924b-5292251d32bf",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "MagicResistance", "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- sunstone Gnome
                        Target = "3d7c0866-0357-43e1-ace0-b9c7f8bd90be",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "MagicResistance", "SunlightSensitivity" }
                    }
                }
            }
        }
    },
    AddUndeadGhastlyGhouls_LightSensitivity_Passives = {
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- UndeadGhastly Ghouls
                        Target = "a21579fc-b7d7-4295-bf5c-d2111be3f13a",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity", "Fenrules_Undeath", "Fenrules_UndyingFervor", "NECROTIC_REGENERATION_TECHNICAL" }
                    }
                }
            }
        }
    },
    RemoveHuman_HumanMilitia_HumanVersatility_Passives = {
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "139e1b8c-dfa1-4b2d-895c-efb170736093", -- Larian Human Passives
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "HumanMilitia", "HumanVersatility" }
                    }
                }
            }
        }
    },
    RemoveHalfElf_HumanMilitia_Passives = {
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "a1729574-2f7b-4561-91d8-3766cf940420",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "HumanMilitia" }
                    }
                }
            }
        }
    },
    AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = { -- ProficiencyBonus(Skill,Stealth) woodElf
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- half Drow
                        Target = "58dae581-c25a-4dfb-8a57-589bf4b34f62",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "dc9e985a-6b20-4066-ab3d-eed16191122b", --ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "3140a061-8e1f-4c9e-bca2-1c0ed5a3ae65", -- ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    }
                }
            }
        }
    }
    -- Removed first and ten level passives (Illithid Disguise excluded) from Ghoul and added Undeath trait that replace and improve these passives
}

--Maybe this is unncessary? Look at CF Github
local function callApiAction(action, payload)
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

local function isModLoaded(modId)
    return Ext.Mod.IsModLoaded(modId)
end

local function loadConfiguration()
    local configData = LoadconfigASI()
    if not configData then
        BasicError("============> ERROR: Failed to load configuration file" .. configData)
    else
        BasicPrint("Config.load() - Config.json - Apply Configuration...")
    end
    return configData
end

function handlePayload(action, payload)
    local success, result = pcall(callApiAction, action, { payload = payload })
    if not success then
        BasicError(string.format("============> ERROR in %s action: %s", action, result))
    end
end

function processOption(optionName, optionValue, actionConfigs)
    if optionValue.Enabled then
        BasicWarning(string.format("============> %s is enabled.", optionName))

        for _, actionConfig in ipairs(actionConfigs) do
            local action = actionConfig.action
            local payloads = actionConfig.payloads

            for _, payload in ipairs(payloads) do
                if payload.Target then
                    --BasicPrint(string.format("action : ", action))
                    --BasicPrint(string.format("payload : ", payload))
                    handlePayload(action, payload)
                else
                    BasicError(string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
    end
end

local function OnStatsLoaded()
    if not isModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
        return
    end

    BasicPrint("============> OnStatsLoaded function triggered, loading config","INFO", nil, nil, true)

    local config = loadConfiguration()
    if not config then
        return
    end

    local options = config.Options

    for optionName, optionValue in pairs(options) do
        local actionConfigs = optionActions[optionName]
        if actionConfigs then
            processOption(optionName, optionValue, actionConfigs.actions)
        else
            BasicError(string.format("============> ERROR: No action configuration found for %s.", optionName))
        end
    end
end

function OnStatsLoadedMcm()
    for key, value in pairs(mcmVars) do
        local actionConfigs = optionActions["RemoveHuman_HumanMilitia_HumanVersatility_Passives"] --optionActions[key]
        if actionConfigs.actions then
            processOptionMcm("RemoveHuman_HumanMilitia_HumanVersatility_Passives", true, actionConfigs.actions)
            --processOptionMcm(key, value, actionConfigs.actions)
        else
            -- GENERAL SETTINGS
        --else
            --BasicError(string.format("============> ERROR: No configuration found for %s.", key))
        end
    end
end

function processOptionMcm(optionName, optionValue, actionConfigs)
    BasicPrint("COUCOU processOptionMcm loading")
    if optionValue == true then
        for _, actionConfig in ipairs(actionConfigs) do

            local action   = actionConfig.action
            local payloads = actionConfig.payloads
            BasicPrint(payloads)

            for _, payload in ipairs(payloads) do
                BasicPrint(payload)
                if payload.Target then
                        --[[if action == "InsertSelectors" then
                            local payload = createPayloadMcm(payload.modGuid, payload.Target, payload.Type, payload.Strings, payload.Function, param.Guid, param.PrepareType, param.CooldownType)
                            Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
                        end]]--

                        --[[
                        AddUndeadGhastlyGhouls_LightSensitivity_Passives = {
                                actions = {
                                    {
                                        action = "InsertPassives",
                                        payloads = {
                                            {
                                                modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- UndeadGhastly Ghouls
                                                Target = "a21579fc-b7d7-4295-bf5c-d2111be3f13a",
                                                FileType = "Progression",
                                                Type = "PassivesAdded",
                                                Strings = { "SunlightSensitivity", "Fenrules_Undeath", "Fenrules_UndyingFervor", "NECROTIC_REGENERATION_TECHNICAL" }
                                            }
                                        }
                                    }
                                }
                            }
                        ]]--


                        if action == "InsertPassives" then
                            BasicPrint("InsertPassives")
                            local payload = createPayloadMcm(payload.modGuid, payload.Target, payload.Type, payload.Strings)
                            
                            BasicPrint({payload})
                            Mods.SubclassCompatibilityFramework.Api.InsertPassives({payload})
                        end

                        if action == "RemovePassives" then
                            local payload = createPayloadMcm(payload.modGuid, payload.Target, payload.Type, payload.Strings)
                            BasicPrint("RemovePassives")
                            BasicPrint({payload})
                            Mods.SubclassCompatibilityFramework.Api.RemovePassives({payload})
                        end                   
                else
                    BasicError(string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
        BasicWarning(string.format("============> %s is enabled.", optionName))
    end
end

local function createPayloadMcm(modGuid, targetuuid, typePayload, stringPayload, func, paramsGuid, prepareType, CooldownType)
    BasicPrint("createPayloadMcm begin")
        if func == nil then
            BasicPrint("Strings Payload")
            return {
                modGuid = modGuid,
                Target = targetuuid,
                FileType = "Progression",
                Type = typePayload,
                Strings = {""..stringPayload..""}
            }
        elseif func == "AddSpells" then
            BasicPrint("func & Params Payload")
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


if not Ext.Mod.IsModLoaded(deps.MCM_GUID) then
    Ext.Events.StatsLoaded:Subscribe(start)
    Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)

    ---Should've done this from the start
    Ext.Events.GameStateChanged:Subscribe(function(e)
        if e.FromState == "Running" and e.ToState == "Save" then
            SyncModVariables()
            SyncUserVariables()
        end
    end)
else
        -- Function to get MCM setting values
    function MCMGet(settingID)
        return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
    end

    function OnSessionLoadedMCM()
        mcmVars = {
            addGnome_tinkertools_spells = MCMGet("addGnome_tinkertools_spells"),
            addHalfElfDrow_Drow_DrowWeaponTraining_Passives = MCMGet("addHalfElfDrow_Drow_DrowWeaponTraining_Passives"),
            RemoveHuman_HumanMilitia_HumanVersatility_Passives = MCMGet("RemoveHuman_HumanMilitia_HumanVersatility_Passives"),
            RemoveHalfElf_HumanMilitia_Passives = MCMGet("RemoveHalfElf_HumanMilitia_Passives"),
            AddUndeadGhastlyGhouls_LightSensitivity_Passives = MCMGet("AddUndeadGhastlyGhouls_LightSensitivity_Passives"),
            AddUnderdarkRaces_LightSensitivity_Passives = MCMGet("AddUnderdarkRaces_LightSensitivity_Passives")
            --[[
                mcmVars["AddGnomeTinkertoolsSpells"]
                            addGnome_tinkertools_spells = MCMGet("addGnome_tinkertools_spells"),
            ]]--
        }
        mcmVarsGeneralSettings = {
            RASI = MCMGet("RASI"),
            debugToggle = MCMGet("debugToggle"),
            ActiveBookBoost = MCMGet("active_5e_boost")
        }
    end

    if Ext.Mod.IsModLoaded(deps.MCM_GUID) then
        BasicPrint("COUCOU OnSessionLoadedMCM")
        Ext.Events.StatsLoaded:Subscribe(OnSessionLoadedMCM)
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
    end
    BasicPrint("COUCOU StatsLoaded")
    Ext.Events.StatsLoaded:Subscribe(OnStatsLoadedMcm)
    ---Should've done this from the start
    Ext.Events.GameStateChanged:Subscribe(function(e)
        if e.ToState == "Save" then
            BasicPrint("Save OnStatsLoadedMcm")
            OnStatsLoadedMcm()
        end
    end)
    BasicPrint("COUCOU fin StatsLoaded")
end