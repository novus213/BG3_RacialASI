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

    PatchAsi5eLimited  = settings5e["PatchASI_5eLimited"]
    PatchAsi5e         = settings5e["PatchASI_5e"]
    PatchAsi5eExtended = settings5e["PatchASI_5eExtended"]
    PatchAsiLegacy     = settings5e["PatchASI_Legacy"]
    PatchAsiFlavour    = settings5e["PatchASI_Flavour"]
    PatchAsiHomebrew   = settings5e["PatchASI_Homebrew"]
    PatchAsiDefault    = settings5e["PatchASI_Default"]


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
        BasicPrint("e.FromState")
        BasicPrint(e.FromState)

        if e.FromState == "PrepareRunning" then

            mcmVarsOptions 		= mcmVars

            PatchAsi5eLimited  = mcmVarsBooksSettings["PatchASI_5eLimited"]
            PatchAsi5e         = mcmVarsBooksSettings["PatchASI_5e"]
            PatchAsi5eExtended = mcmVarsBooksSettings["PatchASI_5eExtended"]
            PatchAsiLegacy     = mcmVarsBooksSettings["PatchASI_Legacy"]
            PatchAsiFlavour    = mcmVarsBooksSettings["PatchASI_Flavour"]
            PatchAsiHomebrew   = mcmVarsBooksSettings["PatchASI_Homebrew"]
            PatchAsiDefault    = mcmVarsBooksSettings["PatchASI_Default"]

            DebugLevel = mcmVarsGeneralSettings["debug_level"]
            Log = mcmVarsGeneralSettings["Log"]

            --CleanOnRacesStatsLoaded()
            --builder5eRaces()

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