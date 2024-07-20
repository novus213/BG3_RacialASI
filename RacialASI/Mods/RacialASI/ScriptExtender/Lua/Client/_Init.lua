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

    local settings5e = config.Settings5e

    IgnoreAll = settings5e["IgnoreAll"]
    Ignore5eLimited = settings5e["Ignore5eLimited"]
    Ignore5e = settings5e["Ignore5e"]
    Ignore5eExtended = settings5e["Ignore5eExtended"]
    IgnoreFlavours = settings5e["IgnoreFlavours"]
    IgnoreLegacy = settings5e["IgnoreLegacy"]
    IgnoreHomebrew = settings5e["IgnoreHomebrew"]

end
--- End CONFIG NO MCM


if not isModLoaded(deps.MCM_GUID) then
    Ext.Events.StatsLoaded:Subscribe(start)
    Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
else

    Ext.Events.StatsLoaded:Subscribe(function()
    MCMASIAPI:OnSessionLoadedMCM()
    end)

    Ext.Events.StatsLoaded:Subscribe(function()
    MCMASIAPI:OnStatsLoadedMCM()
    end)

    Ext.Events.GameStateChanged:Subscribe(function(e)
        --if e.FromState == "Running" or e.ToState == "Unloading" then
        CleanOnStatsLoaded()
        builder5eRaces()
        mcmVarsOptions 		= mcmVars

        IgnoreAll 			= mcmVarsBooksSettings["IgnoreAll"]
        Ignore5eLimited 	= mcmVarsBooksSettings["Ignore5eLimited"]
        Ignore5e 			= mcmVarsBooksSettings["Ignore5e"]
        Ignore5eExtended 	= mcmVarsBooksSettings["Ignore5eExtended"]
        IgnoreFlavours 		= mcmVarsBooksSettings["IgnoreFlavours"]
        IgnoreLegacy 		= mcmVarsBooksSettings["IgnoreLegacy"]
        IgnoreHomebrew 		= mcmVarsBooksSettings["IgnoreHomebrew"]


        debugLevel = mcmVarsBooksSettings["debug_level"]
        Log = mcmVarsBooksSettings["Log"]

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
        --end
    end)
end

---Should've done this from the start
Ext.Events.GameStateChanged:Subscribe(function(e)
    if e.FromState == "Running" and e.ToState == "Save" then
        SyncModVariables()
        SyncUserVariables()
    end
end)