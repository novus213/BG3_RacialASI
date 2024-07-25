--- START CONFIG NO MCM
local function start()
    if not CONFIG then CONFIG = InitConfig() end
end

local function loadConfiguration()
    local configData = LoadconfigASI()
    if not configData then
        RAWarn(1, "============> ERROR: Failed to load configuration file" .. configData)
    else
        RAPrint(1, "Config.load() - Config.json - Apply Configuration...")
    end
    return configData
end

local function processOption(optionName, optionValue, actionConfigs)
    if optionValue.Enabled then
        RAWarn(2, string.format("============> %s is enabled.", optionName))

        for _, actionConfig in ipairs(actionConfigs) do
            local action = actionConfig.action
            local payloads = actionConfig.payloads

            for _, payload in ipairs(payloads) do
                if payload.Target then
                    --RAPrint(1, string.format("action : ", action))
                    --RAPrint(1, string.format("payload : ", payload))
                    MCMASIAPI:handlePayload(action, payload)
                else
                    RAWarn(1, string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
                end
            end
        end
    end
end

local function OnStatsLoaded()
    if not VCHelpers.ModVars:IsModLoaded(Deps.Framework_GUID) then
        return
    end

    RAPrint(1, "============> OnStatsLoaded function triggered, loading config","INFO", nil, nil, true)

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
            RAWarn(1, string.format("============> ERROR: No action configuration found for %s.", optionName))
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


if not VCHelpers.ModVars:IsModLoaded(Deps.MCM_GUID) then
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
        RAPrint(1, "e.FromState")
        RAPrint(1, e.FromState)

        if e.FromState == "PrepareRunning" then

            McmVarsOptions 		= McmVars

            PatchAsi5eLimited  = McmVarsBooksSettings["PatchAsi5eLimited"]
            PatchAsi5e         = McmVarsBooksSettings["PatchAsi5e"]
            PatchAsi5eExtended = McmVarsBooksSettings["PatchAsi5eExtended"]
            PatchAsiLegacy     = McmVarsBooksSettings["PatchAsiLegacy"]
            PatchAsiFlavour    = McmVarsBooksSettings["PatchAsiFlavour"]
            PatchAsiHomebrew   = McmVarsBooksSettings["PatchAsiHomebrew"]
            PatchAsiDefault    = McmVarsBooksSettings["PatchAsiDefault"]

            DebugLevel = McmVarsGeneralSettings["Debug_level"]
            Log = McmVarsGeneralSettings["Log"]

            MCMASIAPI:OnSessionLoadedMCM()
            MCMASIAPI:OnStatsLoadedMCM()
        end
    end)
end


---Should've done this from the start
Ext.Events.GameStateChanged:Subscribe(function(e)
    if e.FromState == "Running" and e.ToState == "Save" then
        VCHelpers.ModVars:Sync()
        VCHelpers.UserVars:Sync()
    end
end)