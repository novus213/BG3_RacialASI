-- Refactorting Argelia
-- MCM plugin in working update

-- Launch CONFIG
local function start()
    if not CONFIG then CONFIG = InitConfig() end
end

-- Define Actions and Payloads

local optionActions = {
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
    },
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

local function handlePayload(action, payload)
    local success, result = pcall(callApiAction, action, { payload = payload })
    if not success then
        BasicError(string.format("============> ERROR in %s action: %s", action, result))
    end
end

local function processOption(optionName, optionValue, actionConfigs)
    if optionValue.Enabled then
        BasicWarning(string.format("============> %s is enabled.", optionName))

        for _, actionConfig in ipairs(actionConfigs) do
            local action = actionConfig.action
            local payloads = actionConfig.payloads

            for _, payload in ipairs(payloads) do
                if payload.Target then
                    BasicPrint(string.format("action : ", action))
                    BasicPrint(string.format("payload : ", payload))
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

Ext.Events.StatsLoaded:Subscribe(start)
Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)

---Should've done this from the start
Ext.Events.GameStateChanged:Subscribe(function(e)
    if e.FromState == "Running" and e.ToState == "Save" then
        SyncModVariables()
        SyncUserVariables()
    end
end)