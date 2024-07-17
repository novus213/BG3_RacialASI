--- Launch CONFIG NO MCM
local function start()
    if not CONFIG then CONFIG = InitConfig() end
end

function callApiAction(action, payload)
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

function isModLoaded(modId)
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


if not Ext.Mod.IsModLoaded(deps.MCM_GUID) then
    Ext.Events.StatsLoaded:Subscribe(start)
    Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
else
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

    --- Constructor for MCMGet class.
    --- Function to get MCM setting values
    function MCMGet(settingID)
        return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
    end

     -- ask how put button not in tab
    --- Function to create save button
    Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, "SAVE TAB", function(tabHeader)
        local myCustomWidget = tabHeader:AddButton("Save")
        myCustomWidget.OnClick = function()
            MCMASIAPI:OnSessionLoadedMCM()
            MCMASIAPI:OnStatsLoadedMCM()
        end
    end)


    Ext.Events.StatsLoaded:Subscribe(function()
    MCMASIAPI:OnSessionLoadedMCM()
    end)

    -- Register a net listener to handle settings changes dynamically
    Ext.RegisterNetListener("MCM_Saved_Setting", function(call, payload)
        local data = Ext.Json.Parse(payload)
        if not data or data.modGUID ~= ModuleUUID or not data.settingId then
            return
        end

        if mcmVars[data.settingId] ~= nil then
            mcmVars[data.settingId] = data.value
        end

        if mcmVarsGeneralSettings[data.settingId] ~= nil then
            mcmVarsGeneralSettings[data.settingId] = data.value
        end

    end)
    
    Ext.Events.StatsLoaded:Subscribe(function()
    MCMASIAPI:OnStatsLoadedMCM()
    end)    

    Ext.Events.GameStateChanged:Subscribe(function(e)
        if e.FromState == "Running" then
            MCMASIAPI:OnSessionLoadedMCM()
            MCMASIAPI:OnStatsLoadedMCM()
        end
    end)
end

---Should've done this from the start
Ext.Events.GameStateChanged:Subscribe(function(e)
    if e.FromState == "Running" and e.ToState == "Save" then
        SyncModVariables()
        SyncUserVariables()
    end
end)