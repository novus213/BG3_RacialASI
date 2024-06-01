-- Launch
local function start()
    if not CONFIG then CONFIG = InitConfig() end
end

-- Debug toggle
local debugMode = true

-- Utility function to print debug messages
local function log(message)
    if debugMode then
        Ext.Utils.Print(message)
    end
end

-- Default settings configuration
local defaultSettings = {
    Options = {
        LightSensitivity_UnderdarkRaces = { Enabled = true },
        RemoveHumanPassives = { Enabled = false },
        RemoveHalfElfPassives = { Enabled = false },
        AddSelectors_Gnome = { Enabled = true }
    }
}

-- Define Actions and Payloads

local optionActions = {
    AddSelectors_Gnome = {
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
    LightSensitivity_UnderdarkRaces = {
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "4a634f24-bdcb-4559-b8be-7847133ad1c3",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"SunlightSensitivity"}
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "bd012f5b-0a0b-424e-ab7c-186dbd82ab30",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"SunlightSensitivity"}
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "58dae581-c25a-4dfb-8a57-589bf4b34f62",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"LightSensitivity"}
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- Deep Gnome Osi.AddExplorationExperience(GetHostCharacter(), 9000000)
                        Target = "938b6f72-18a6-4af0-924b-5292251d32bf",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"MagicResistance", "SunlightSensitivity"}
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- sunstone Gnome
                        Target = "3d7c0866-0357-43e1-ace0-b9c7f8bd90be",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"MagicResistance", "SunlightSensitivity"}
                    }   
                }
            }
        }
    },
    RemoveHumanPassives = {
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "dbde4d66-d3e4-4c3f-ae87-fd6e2d1cd276",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "HumanMilitia", "HumanVersatility" }
                    }
                }
            }
        }
    },
    RemoveHalfElfPassives = {
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
    }
}


-- Formatting function to format JSON content
local function formatting(file_contents)
    local result = ""
    local indentLevel = 0
    local inString = false
    local escapeNext = false

    for i = 1, #file_contents do
        local char = file_contents:sub(i, i)

        if inString then  
            if char == '"' and not escapeNext then
                inString = false  
            end
            escapeNext = (char == "\\") 
            result = result .. char
        else
            if char == '"' then
                inString = true
                escapeNext = false
                result = result .. char
            elseif char == "{" or char == "[" then
                result = result .. char .. "\n" .. string.rep("  ", indentLevel + 1)
                indentLevel = indentLevel + 1
            elseif char == "}" or char == "]" then
                indentLevel = indentLevel - 1
                result = result .. "\n" .. string.rep("  ", indentLevel) .. char
            elseif char == "," then
                result = result .. char .. "\n" .. string.rep("  ", indentLevel)
            elseif char ~= " " and char ~= "\n" and char ~= "\t" then
                result = result .. char
            end
        end
    end

    return result
end

local function writing()
    local json = Ext.Json.Stringify(defaultSettings, true) -- Convert table to JSON string
    local formatted_json = formatting(json) -- Format the JSON string

    local success, errorMessage = pcall(Ext.IO.SaveFile, "RacialASI_Progression.json", formatted_json)
    if success then
        BasicPrint("[RacialASI_Progression] RacialASI_Progression.json saved successfully.","INFO", nil, nil, true)
    else
        BasicError(string.format("[RacialASI_Progression] Failed to save RacialASI_Progression.json: %s", errorMessage))
    end
end

local function reading()
    local status, file_contents = pcall(Ext.IO.LoadFile, "RacialASI_Progression.json")

    if not status then
        BasicError(string.format("[RacialASI_Progression] Failed to load RacialASI_Progression.json: %s", file_contents)) -- file_contents will contain the error message
        return nil
    end

    if not file_contents then
        BasicError("[RacialASI_Progression] RacialASI_Progression.json not found. Creating configuration at Mods Folder")
        writing() -- Create default configuration

        -- Attempt to load again after writing default
        status, file_contents = pcall(Ext.IO.LoadFile, "RacialASI_Progression.json")
        if not status or not file_contents then
            BasicWarning("[RacialASI_Progression] ERROR: Failed to load config file even after creating default.")
            return nil
        end
    end

    local success, parsed_data = pcall(Ext.Json.Parse, file_contents)
    if not success then
        BasicError(string.format("[RacialASI_Progression] ERROR: Failed to parse config file. Invalid JSON format: %s", parsed_data)) -- parsed_data will contain the error message
        return nil
    end

    return parsed_data
end

--Maybe this is unncessary? Look at CF Github
local function callApiAction(action, payload)
    if not (Mods.SubclassCompatibilityFramework and Mods.SubclassCompatibilityFramework.Api) then
        BasicError("[RacialASI_Progression] ERROR: Subclass Compatibility Framework mod or its API is not available.")
    end

    local apiActions = {
        InsertPassives = Mods.SubclassCompatibilityFramework.Api.InsertPassives,
        RemovePassives = Mods.SubclassCompatibilityFramework.Api.RemovePassives,
        InsertSelectors = Mods.SubclassCompatibilityFramework.Api.InsertSelectors,
        SetBoolean = Mods.SubclassCompatibilityFramework.Api.SetBoolean
    }

    local apiFunction = apiActions[action]

    if apiFunction then
        return apiFunction(payload)
    else
        BasicError("[RacialASI_Progression] ERROR: Invalid API action: " .. action)
    end
end

local function isModLoaded(modId)
    return Ext.Mod.IsModLoaded(modId)
end

local function loadConfiguration()
    local config = reading()
    if not config then
        BasicError("[RacialASI_Progression] ERROR: Failed to load configuration file")
    end
    return config
end

local function handlePayload(action, payload)
    local success, result = pcall(callApiAction, action, { payload = payload })
    if not success then
        BasicError(string.format("[RacialASI_Progression] ERROR in %s action: %s", action, result))
    end
end

local function processOption(optionName, optionValue, actionConfigs)
    if optionValue.Enabled then
        BasicWarning(string.format("[RacialASI_Progression] %s is enabled.", optionName))

        for _, actionConfig in ipairs(actionConfigs) do
            local action = actionConfig.action
            local payloads = actionConfig.payloads

            for _, payload in ipairs(payloads) do
                if payload.Target then
                    handlePayload(action, payload)
                else
                    BasicError(string.format("[RacialASI_Progression] ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
    end
end

local function OnStatsLoaded()
    if not isModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
        return
    end

    BasicPrint("[RacialASI_Progression] OnStatsLoaded function triggered, loading config","INFO", nil, nil, true)

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
            BasicError(string.format("[RacialASI_Progression] ERROR: No action configuration found for %s.", optionName))
        end
    end
end

-- Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", start)

Ext.Events.StatsLoaded:Subscribe(start)
Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)

---Should've done this from the start
Ext.Events.GameStateChanged:Subscribe(function(e)
    if e.FromState == "Running" and e.ToState == "Save" then
        SyncModVariables()
        SyncUserVariables()
    end
end)