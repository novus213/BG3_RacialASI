--- MCM CONFIG
---@class MCMASI

MCMASI = _Class:Create("MCMASI", nil, {
  mods = {},
  profiles = {},
})

MCMASIAPI = MCMASI:New({}, "RacialASI")
--RASIAPI = _MetaClass._Debug(RASIAPI)
--setmetatable(Mods[Ext.Mod.GetMod(ModuleUUID).Info.Directory], { __index = Mods.RacialASI })

--- Constructor for MCMASI:OnSessionLoadedMCM
--- Function to load MCM values from json
function MCMASI:OnSessionLoadedMCM()
  McmVars = {
    AddGnome_Tinkertools_Spells                                     = "notoptional",
    AddGnome_ForestMinorIllusion_Spells                             = "notoptional",
    AddHalfElf_Skills                                               = "notoptional",
    AddHalfElfDrow_Drow_DrowWeaponTraining_Passives                 = MCMASIAPI:MCMGet(
      "AddHalfElfDrow_Drow_DrowWeaponTraining_Passives"),
    RemoveHuman_HumanMilitia_HumanVersatility_Passives              = MCMASIAPI:MCMGet(
      "RemoveHuman_HumanMilitia_HumanVersatility_Passives"),
    RemoveHalfElf_HumanMilitia_Passives                             = MCMASIAPI:MCMGet(
      "RemoveHalfElf_HumanMilitia_Passives"),
    AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives = MCMASIAPI:MCMGet(
      "AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives"),
    AddUnderdarkRaces_LightSensitivity_Passives                     = MCMASIAPI:MCMGet(
      "AddUnderdarkRaces_LightSensitivity_Passives")
    --[[
            McmVars["AddGnomeTinkertoolsSpells"]
        ]] --
  }

  McmVarsBooksSettings = {
    PatchAsi5eLimited  = MCMASIAPI:MCMGet("PatchASI_5eLimited"),
    PatchAsi5e         = MCMASIAPI:MCMGet("PatchASI_5e"),
    PatchAsi5eExtended = MCMASIAPI:MCMGet("PatchASI_5eExtended"),
    PatchAsiLegacy     = MCMASIAPI:MCMGet("PatchASI_Legacy"),
    PatchAsiFlavour    = MCMASIAPI:MCMGet("PatchASI_Flavour"),
    PatchAsiHomebrew   = MCMASIAPI:MCMGet("PatchASI_Homebrew"),
    PatchAsiDefault    = MCMASIAPI:MCMGet("PatchASI_Default")
    --[[
            McmVarsBooksSettings["IgnoreAll"]
        ]] --
  }

  McmVarsGeneralSettings = {
    RASI         = MCMASIAPI:MCMGet("RASI"),
    DebugLevel   = MCMASIAPI:MCMGet("Debug_level"),
    Log          = MCMASIAPI:MCMGet("Log"),
    CheatAsi30   = MCMASIAPI:MCMGet("CheatAsi30"),
    RaceHiddener = MCMASIAPI:MCMGet("RaceHiddener")
    --ClasseHiddener = MCMASIAPI:MCMGet("ClasseHiddener"),

  }

  RAWarn(2, string.format("============> McmVars is loaded. %s", table.dump(McmVars)))
  RAWarn(2, string.format("============> McmVarsGeneralSettings is loaded. %s", table.dump(McmVarsGeneralSettings)))
  RAWarn(2, string.format("============> McmVarsBooksSettings is loaded. %s", table.dump(McmVarsBooksSettings)))
end

--- Constructor for MCMASI:OnStatsLoadedMCM
--- extract mcmVar table from MCM Json
function MCMASI:OnStatsLoadedMCM()
  local modSettingsTable = Mods.BG3MCM.MCMAPI:GetAllModSettings(ModuleUUID)
  --[[
  force 5e limited function

  for key, value in pairs(McmVarsOptions) do
    local actionConfigs = Data.Libs.OptionActions[key]
    if type(value) == "boolean" then
      local isValid = Mods.BG3MCM.MCMAPI:IsSettingValueValid(key, value, ModuleUUID)
      RADebug(2, "Setting value for " .. key .. " is valid? " .. tostring(isValid))
      if not isValid then
        RAWarn(1, "Invalid value for setting '" .. key .. " (" .. tostring(value) .. "). Value will not be saved.")
        return
      end
      if value == false and type(value) == "boolean" and actionConfigs.ruleset == "5eLimited" and PatchAsi5eLimited == true then
        RAWarn(2, string.format("============> %s will enable (5eLimited enableb).", key))
        modSettingsTable[key] = true
        McmVars[key] = modSettingsTable[key]
      end

      if (actionConfigs.ruleset == "5eLimited" and PatchAsi5eLimited == false and value == true and type(value) == "boolean") or
        PatchAsiDefault == true then
        RAWarn(2, string.format("============> %s will disable (5eLimited disabled or Patch ASI Default enabled).", key))
        modSettingsTable[key] = false
        McmVars[key] = modSettingsTable[key]
      end
    end
  end
]]
   --
  Mods.BG3MCM.ModConfig:UpdateAllSettingsForMod(ModuleUUID, modSettingsTable)

  for key, value in pairs(McmVarsOptions) do
    local actionConfigs = Data.Libs.OptionActions[key]
    if value == true or value == "notoptional" then
      if actionConfigs.ruleset == "5eLimited" and PatchAsi5eLimited == true then
        if actionConfigs then
          MCMASIAPI:processOptionMcm(key, actionConfigs.actions)
        else
          RAWarn(1, string.format("============> ERROR: No configuration found for %s.", key))
        end
        RAWarn(2, string.format("============> %s is enabled.", key))
      end
    end
  end
end

--- Constructor for MCMASI:processOptionMcm
---@param optionName string Mcm option name
---@param optionValue boolean active or not option
---@param actionConfigs table actions table from mcm option
function MCMASI:processOptionMcm(optionName, actionConfigs)
  for _, actionConfig in ipairs(actionConfigs) do
    local action   = actionConfig.action
    local payloads = actionConfig.payloads

    for _, payload in ipairs(payloads) do
      if payload.Target then
        MCMASIAPI:handlePayload(action, payload)
      else
        RAWarn(1, string.format("============> ERROR: Invalid target UUID for payload in '%s'.", optionName))
      end
    end
  end
end

--- Constructor for MCMASI:callApiAction
---@param action string payload action
---@param payload table payload
function MCMASI:callApiAction(action, payload)
  if not (Mods.SubclassCompatibilityFramework and Mods.SubclassCompatibilityFramework.Api) then
    RAWarn(1, "============> ERROR: Subclass Compatibility Framework mod or its API is not available.")
  end

  local apiActions = {
    InsertPassives  = Mods.SubclassCompatibilityFramework.Api.InsertPassives,
    RemovePassives  = Mods.SubclassCompatibilityFramework.Api.RemovePassives,
    InsertSelectors = Mods.SubclassCompatibilityFramework.Api.InsertSelectors,
    RemoveSelectors = Mods.SubclassCompatibilityFramework.Api.RemoveSelectors,
    InsertBoosts    = Mods.SubclassCompatibilityFramework.Api.InsertBoosts,
    RemoveBoosts    = Mods.SubclassCompatibilityFramework.Api.RemoveBoosts,
    SetBoolean      = Mods.SubclassCompatibilityFramework.Api.SetBoolean
  }

  local apiFunction = apiActions[action]

  if apiFunction then
    return apiFunction(payload)
  else
    RAWarn(1, "============> ERROR: Invalid API action: " .. action)
  end
end

--- Constructor for MCMASI:handlePayload
---@param action string payload action
---@param payload table payload
function MCMASI:handlePayload(action, payload)
  MCMASIAPI:callApiAction(action, { payload = payload })
end

--- Constructor for MCMASI:MCMGet
--- Function to get MCM setting values
function MCMASI:MCMGet(settingID)
  return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
end
