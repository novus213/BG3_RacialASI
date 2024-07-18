function isModLoaded(modId)
    return Ext.Mod.IsModLoaded(modId)
end

--- START CONFIG NO MCM
local function start()
    if not CONFIG then CONFIG = InitConfig() end
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

local function processOption(optionName, optionValue, actionConfigs)
    if optionValue.Enabled then
        BasicWarning(string.format("============> %s is enabled.", optionName))

        for _, actionConfig in ipairs(actionConfigs) do
            local action = actionConfig.action
            local payloads = actionConfig.payloads

            for _, payload in ipairs(payloads) do
                if payload.Target then
                    --BasicPrint(string.format("action : ", action))
                    --BasicPrint(string.format("payload : ", payload))
                    MCMASIAPI:handlePayload(action, payload)
                else
                    BasicError(string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
    end
end

local function OnStatsLoaded()
    if not isModLoaded(deps.Framework_GUID) then
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
--- End CONFIG NO MCM


if not isModLoaded(deps.MCM_GUID) then
    Ext.Events.StatsLoaded:Subscribe(start)
    Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
else
     -- ask how put button not in tab
    --- Function to create save button
    --[[Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, "SAVE TAB", function(tabHeader)
        local myCustomWidget = tabHeader:AddButton("Save")
        myCustomWidget.OnClick = function()
            MCMASIAPI:OnSessionLoadedMCM()
            MCMASIAPI:OnStatsLoadedMCM()
        end
    end)]]--

    Ext.Events.StatsLoaded:Subscribe(function()
    MCMASIAPI:OnSessionLoadedMCM()

    --[[ 
    mcmVarsOptions 		= mcmVars

    IgnoreAll 			= mcmVarsBooksSettings["IgnoreAll"]
    Ignore5eLimited 	= mcmVarsBooksSettings["Ignore5eLimited"]
    Ignore5e 			= mcmVarsBooksSettings["Ignore5e"]
    Ignore5eExtended 	= mcmVarsBooksSettings["Ignore5eExtended"]
    IgnoreFlavours 		= mcmVarsBooksSettings["IgnoreFlavours"]
    IgnoreLegacy 		= mcmVarsBooksSettings["IgnoreLegacy"]
    IgnoreHomebrew 		= mcmVarsBooksSettings["IgnoreHomebrew"]

    mcmVarsGeneralSettingsUse = mcmVarsGeneralSettings

    BasicPrint("Ignore5eExtended OnSessionLoadedMCM base")

    BasicPrint(Ignore5eExtended)
    ]]--

    end)

    -- Register a net listener to handle settings changes dynamically
    --[[
    Ext.RegisterNetListener("MCM_Saved_Setting", function(call, payload)
        
        BasicPrint("MCM_Saved_Setting")

        local data = Ext.Json.Parse(payload)

         BasicPrint("data")

        BasicPrint(data)
        

        if not data or data.modGUID ~= ModuleUUID or not data.settingId then
            return
        end

        if mcmVars[data.settingId] ~= nil then
            mcmVars[data.settingId] = data.value
        end

         if mcmVarsBooksSettings[data.settingId] ~= nil then
            mcmVarsBooksSettings[data.settingId] = data.value

            --BasicPrint(mcmVarsBooksSettings[data.settingId])
        end

        if mcmVarsGeneralSettings[data.settingId] ~= nil then
            mcmVarsGeneralSettings[data.settingId] = data.value
        end

         if data.settingId == "debug_level" then
            _D("Setting debug level to " .. data.value)
        end

    end)
    ]]--

    
    Ext.Events.StatsLoaded:Subscribe(function()

    --[[ 
    mcmVarsOptions 		= mcmVars

    IgnoreAll 			= mcmVarsBooksSettings["IgnoreAll"]
    Ignore5eLimited 	= mcmVarsBooksSettings["Ignore5eLimited"]
    Ignore5e 			= mcmVarsBooksSettings["Ignore5e"]
    Ignore5eExtended 	= mcmVarsBooksSettings["Ignore5eExtended"]
    IgnoreFlavours 		= mcmVarsBooksSettings["IgnoreFlavours"]
    IgnoreLegacy 		= mcmVarsBooksSettings["IgnoreLegacy"]
    IgnoreHomebrew 		= mcmVarsBooksSettings["IgnoreHomebrew"]

    mcmVarsGeneralSettingsUse = mcmVarsGeneralSettings

    BasicPrint("Ignore5eExtended OnStatsLoadedMCM base")

    BasicPrint(Ignore5eExtended)
    ]]--

    MCMASIAPI:OnStatsLoadedMCM()
    end)

    

    Ext.Events.GameStateChanged:Subscribe(function(e)
        if e.FromState == "Running" then
            MCMASIAPI:OnSessionLoadedMCM()
            MCMASIAPI:OnStatsLoadedMCM()

           --[[
           mcmVarsOptions 		= mcmVars

            IgnoreAll 			= mcmVarsBooksSettings["IgnoreAll"]
            Ignore5eLimited 	= mcmVarsBooksSettings["Ignore5eLimited"]
            Ignore5e 			= mcmVarsBooksSettings["Ignore5e"]
            Ignore5eExtended 	= mcmVarsBooksSettings["Ignore5eExtended"]
            IgnoreFlavours 		= mcmVarsBooksSettings["IgnoreFlavours"]
            IgnoreLegacy 		= mcmVarsBooksSettings["IgnoreLegacy"]
            IgnoreHomebrew 		= mcmVarsBooksSettings["IgnoreHomebrew"]

            mcmVarsGeneralSettingsUse = mcmVarsGeneralSettings

            BasicPrint("Ignore5eExtended OnSessionLoadedMCM Running")

            BasicPrint(Ignore5eExtended)
            ]]--
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