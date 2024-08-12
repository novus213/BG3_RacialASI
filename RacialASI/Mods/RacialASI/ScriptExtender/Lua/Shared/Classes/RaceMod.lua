---@class RaceMod:MetaClass
---@field name string
---@field modURL table|string table table
---@field modGuid string uuid
---@field progressionUUID table|string table
---@field author string
---@field sourceBook string
---@field mainRace boolean
---@field stats table|string table
---@field sab table|string table
---@field bonus table|string table
---@field statsList table|string table
---@field specialAbList string uuid
---@field presetUUID  table|string tableUUID CharacterCreationPresetUuid
---@field oPresetUUID  table|string originPresetUUID OriginPresetsPresetUuid
---@field compPresetUUID  table|string compPresetUUID CompanionPresetsPresetUuid
---@field NoDefStats boolean
RaceMod = _Class:Create("RaceMod")


---@class RaceMod
---@param name string
---@param modURL table|string table
---@param modGuid string uuid
---@param progressionUUID table|string table
---@param author string
---@param sourceBook string
---@param mainRace boolean
---@param specialAbList string
---@param stats table|string table
---@param sab table|string table
---@param bonus table|string table
---@param presetUUID  table|string presetUUID CharacterCreationPresetUuid
---@param originPresetUUID  table|string originPresetUUID OriginPresetsPresetUuid
---@param compPresetUUID  table|string compPresetUUID CompanionPresetsPresetUuid
---@param NoDefStats boolean
function RaceMod:New(name, modURL, modGuid, progressionUUID, author, sourceBook, mainRace, specialAbList, stats,
                     sab, bonus, presetUUID, originPresetUUID, compPresetUUID, NoDefStats)
  local self           = setmetatable({}, RaceMod)
  self.name            = name
  self.modURL          = modURL or nil
  self.modGuid         = modGuid
  self.progressionUUID = progressionUUID --Target
  self.author          = author
  self.sourceBook      = sourceBook
  self.mainRace        = mainRace
  self.specialAbList   = specialAbList or nil
  self.stats           = stats or
    nil                             --{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
  self.sab             = sab or nil -- {"2","1"}
  self.bonus           = bonus or nil
  self.statsList       = { "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" }
  self.presetUUID      = presetUUID or nil       --CharacterCreationPresetUuid nil if vanilla
  self.oPresetUUID     = originPresetUUID or nil -- OriginPresetsPresetUuid
  self.compPresetUUID  = compPresetUUID or nil   -- OriginPresetsPresetUuid
  self.NoDefStats      = NoDefStats or false

  return self
end

--- Get Name of RaceMod
---@return string self.name
function RaceMod:GetName()
  return self.name
end

--- Set NoDefStats of RaceMod
function RaceMod:SetNoDefStats(NoDefStats)
  self.modGuid = NoDefStats
end

--- Get NoDefStats of RaceMod
---@return boolean self.NoDefStats
function RaceMod:GetNoDefStats()
  return self.NoDefStats
end

--- Get ModURL of ClasseMod
---@param i integer
---@return table self.modURL
function RaceMod:GetModURL(i)
  return self.modURL[i]
end

--- Get ModGuid of RaceMod
---@return string self.modGuid
function RaceMod:GetModGuid()
  return self.modGuid
end

--- Get progressionUUID from lvl of RaceMod
---@return table self.progressionUUID
function RaceMod:GetProgressionUUID(lvl)
  return self.progressionUUID[lvl]
end

--- Get author of RaceMod
---@return string self.author
function RaceMod:GetAuthor()
  return self.author
end

--- Get sourceBook of RaceMod
---@return string self.sourceBook
function RaceMod:GetSourceBook()
  return self.sourceBook
end

--- Get mainRace of RaceMod
---@return boolean self.mainRace
function RaceMod:GetMainRace()
  return self.mainRace
end

--- Get stats of RaceMod
---@return table|string self.stats
function RaceMod:GetStats()
  return self.stats
end

--- Get self.stats[i] of RaceMod
---@return table self.stats[i]
function RaceMod:GetStatsI(i)
  return self.stats[i]
end

--- Get Name of RaceMod
---@return table|string self.sab
function RaceMod:GetSab()
  return self.sab
end

--- Get bonus of RaceMod
---@return table|string self.bonus
function RaceMod:GetBonus()
  return self.bonus
end

--- Get bonus[i] of RaceMod
---@return table self.bonus[i]
function RaceMod:GetBonusI(i)
  return self.bonus[i]
end

--- Get StatsList of RaceMod
---@return table|string self.statsList
function RaceMod:GetStatsList()
  return self.statsList
end

--- Get statsList[i] of RaceMod
---@return table self.statsList
function RaceMod:GetStatsListI(i)
  return self.statsList[i]
end

--- Get specialAbList of RaceMod
---@return string self.specialAbList
function RaceMod:GetSpecialAbList()
  return self.specialAbList
end

function RaceMod:GetObject()
  return self
end

function RaceMod:SetBonus(bonus)
  self.bonus = bonus
end

function RaceMod:SetName(name)
  self.name = name
end

function RaceMod:SetModURL(modURL)
  self.name = modURL
end

function RaceMod:SetModGuid(modGuid)
  self.modGuid = modGuid
end

function RaceMod:SetProgressionUUID(progressionUUID)
  self.progressionUUID = progressionUUID
end

function RaceMod:SetAuthor(author)
  self.author = author
end

function RaceMod:SetSourceBook(sourceBook)
  self.sourceBook = sourceBook
end

function RaceMod:SetMainRace(mainRace)
  self.mainRace = mainRace
end

function RaceMod:SetStats(stats)
  self.stats = stats
end

function RaceMod:SetSab(sab)
  self.sab = sab
end

function RaceMod:GetPresetUUID()
  return self.presetUUID
end

function RaceMod:GetOPresetUUID()
  return self.oPresetUUID
end

function RaceMod:GetComPresetUUID()
  return self.compPresetUUID
end

--- Function for tableInsertRaceStats
---@param newRace RaceMod RaceMod Instance
---@return table RaceStat
function RaceMod:TableInsertRaceStats(newRace)
  local raceStat = {}
  if newRace:GetStats() ~= nil then
    for i = 1, 6 do
      RAPrint(2, newRace:GetStatsListI(i))
      RAPrint(2, newRace:GetStatsI(i))
      RAPrint(2, string.format("Ability(%s,%s)", newRace:GetStatsListI(i), newRace:GetStatsI(i)))
      table.insert(raceStat, "Ability(" .. newRace:GetStatsListI(i) .. "," .. newRace:GetStatsI(i) .. ")")
    end
    if newRace:GetBonus() ~= nil then
      local raceModBonusSize = table.getLength(newRace:GetBonus())
      for i = 1, raceModBonusSize do
        table.insert(raceStat, newRace:GetBonusI(i))
      end
    end
  end
  return raceStat
end

--- Function for TableInsertRaceCheatsStats
---@param newRace RaceMod RaceMod Instance
---@return table RaceStat
function RaceMod:TableInsertRaceCheatsStats(newRace, cheatASI)
  local raceStat = {}
  for i = 1, 6 do
    table.insert(raceStat, "Ability(" .. newRace:GetStatsListI(i) .. "," .. cheatASI .. ")") --- 15+18 so 8+7+33 max
  end
  if newRace:GetBonus() ~= nil then
    local raceModBonusSize = table.getLength(newRace:GetBonus())
    for i = 1, raceModBonusSize do
      table.insert(raceStat, newRace:GetBonusI(i))
    end
  end
  --RAPrint(1, string.format("raceMod.Stats: %s",RADumpArray(raceStat)))
  return raceStat
end

--- Function for InsertPayloadRaceASI
---@param lvl integer
---@param newRace RaceMod RaceMod Instance
function RaceMod:InsertPayloadRaceASI(newRace, lvl, cheatAsi30)
  --exception lvl nil
  if newRace:GetProgressionUUID(lvl) == nil then return end
  local cAsi30 = cheatAsi30 or 0
  local fixAsi = {} -- Table to store classes with removed shit asi
  if newRace:GetSab() ~= nil then
    local payload = {}
    if (newRace:GetModGuid() and VCHelpers.ModVars:IsModLoaded(newRace:GetModGuid())) then
      -- special Ability List +x in some ASI or default
      local abilityListUUID = Data.Deps.AbilityList_UUID.ModuleUUID
      if newRace:GetSpecialAbList() ~= nil then
        abilityListUUID = newRace:GetSpecialAbList()
      end

      local action = "InsertSelectors"
      local sabAs = table.getLength(newRace:GetSab()) --sabAmounts
      payload = VCHelpers.CF:InsertSelectorsPayload(newRace:GetModGuid(), newRace:GetProgressionUUID(lvl),
        "SelectAbilityBonus", abilityListUUID, sabAs, newRace:GetSab(), "AbilityBonus")

      table.insert(fixAsi, newRace:GetName()) -- Add to the list if ASI Fixed
      if VCHelpers.CF:checkSCF() then
        MCMASI:handlePayload(action, payload)
        --Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
        if cAsi30 > 0 then
          RADebug(2, "InsertPayloadRaceASI payload InsertSelectors: +X CHEAT")
        else
          RADebug(2, "InsertPayloadRaceASI payload InsertSelectors:")
          RADebug(4, table.dump(payload))
        end
      end
    end
  end
  if newRace:GetStats() ~= nil or cAsi30 > 0 then
    local payload = {}
    if (newRace:GetModGuid() and VCHelpers.ModVars:IsModLoaded(newRace:GetModGuid())) then
      local raceModStats = nil
      if cAsi30 > 0 and newRace:GetMainRace() == true then
        raceModStats = RaceMod:TableInsertRaceCheatsStats(newRace, cAsi30)
      end
      if cAsi30 == 0 then
        raceModStats = RaceMod:TableInsertRaceStats(newRace)
      end
      if raceModStats ~= nil then
        local action = "InsertBoosts"
        payload = VCHelpers.CF:addStringPayload(newRace:GetModGuid(), newRace:GetProgressionUUID(lvl),
          "Boosts", raceModStats)
        if VCHelpers.CF:checkSCF() then
          MCMASI:handlePayload(action, payload)
          --Mods.SubclassCompatibilityFramework.Api.InsertBoosts(payload)
          RADebug(4, "InsertPayloadRaceASI payload InsertBoosts: ")
          RADebug(4, table.dump(payload))
        end
      end
      if (newRace:GetStats() ~= nil and newRace:GetSab() == nil) then
        table.insert(fixAsi, newRace:GetName()) -- Add to the list if ASI Fixed
      end
    end
  end
  if #fixAsi > 0 and cAsi30 > 0 then
    BasicWarning("============> Ability ****CHEAT**** added to " ..
      #fixAsi .. " mods: " ..
      table.concat(fixAsi, ", "))
  elseif #fixAsi > 0 then
    BasicWarning("============> Ability added to " ..
      #fixAsi .. " mods: " ..
      table.concat(fixAsi, ", "))
  end
end

--- Constructor for insertDefaultPayloadASI
---@param lvl integer
---@param abilityListUUID string
---@param newRace RaceMod RaceMod Instance
function RaceMod:InsertDefaultPayloadASI(newRace, lvl, abilityListUUID)
  --exception lvl nil
  if newRace:GetProgressionUUID(lvl) == nil then return end
  local baseAsi   = {} -- Table to store races with removed shit asi
  local payload   = {}
  abilityListUUID = abilityListUUID or Data.Deps.AbilityList_UUID.ModuleUUID
  if (newRace:GetModGuid() and VCHelpers.ModVars:IsModLoaded(newRace:GetModGuid())) or
    newRace:GetModGuid() == Data.Deps.GustavDev_GUID.ModuleUUID then
    local action = "InsertSelectors"
    payload = VCHelpers.CF:InsertSelectorsPayload(newRace:GetModGuid(),
      newRace:GetProgressionUUID(lvl), "SelectAbilityBonus", abilityListUUID, 2, { "2", "1" }, "AbilityBonus")
    table.insert(baseAsi, newRace:GetName()) -- Add to the list if ASI Fixed

    if VCHelpers.CF:checkSCF() then
      MCMASI:handlePayload(action, payload)
      --Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
      RADebug(4, "InsertDefaultPayloadASI payload InsertSelectors: ")
      RADebug(4, table.dump(payload))
    end
  end
  if #baseAsi > 0 then
    BasicWarning("============> Base +2/+1 Ability added to " ..
      #baseAsi .. " mods: " ..
      table.concat(baseAsi, ", "))
  end
end

--[[
_________ .__                         __________                              __________    _____         .__       .__      _____    _________.___
\_   ___ \|  |   ____ _____    ____   \______   \_____    ____  ____   ______ \______   \  /  _  \   ____ |__|____  |  |    /  _  \  /   _____/|   |
/    \  \/|  | _/ __ \\__  \  /    \   |       _/\__  \ _/ ___\/ __ \ /  ___/  |       _/ /  /_\  \_/ ___\|  \__  \ |  |   /  /_\  \ \_____  \ |   |
\     \___|  |_\  ___/ / __ \|   |  \  |    |   \ / __ \\  \__\  ___/ \___ \   |    |   \/    |    \  \___|  |/ __ \|  |__/    |    \/        \|   |
 \______  /____/\___  >____  /___|  /  |____|_  /(____  /\___  >___  >____  >  |____|_  /\____|__  /\___  >__(____  /____/\____|__  /_______  /|___|
        \/          \/     \/     \/          \/      \/     \/    \/     \/          \/         \/     \/        \/              \/        \/
        \_Clean Races ModASI
]]
--

--- Constructor for cleanOnRacesStatsLoaded
--- Clean race mods stats ASI
---@param abilityListUUID string
---@param lvl integer
---@param newRace RaceMod RaceMod Instance
function RaceMod:CleanOnRacesStatsLoaded(newRace, lvl, abilityListUUID)
  --exception lvl nil
  if newRace:GetProgressionUUID(lvl) == nil then return end

  abilityListUUID = abilityListUUID or Data.Deps.AbilityList_UUID.ModuleUUID
  if (newRace:GetModGuid() and VCHelpers.ModVars:IsModLoaded(newRace:GetModGuid())) or newRace:GetModGuid() == Data.Deps.GustavDev_GUID.ModuleUUID then
    local rbaseAsi = {}
    -- remove +2+1, +1, +1+1 ect..
    local payload  = VCHelpers.CF:removeSelectorsPayload(newRace:GetModGuid(),
      newRace:GetProgressionUUID(lvl), "SelectAbilityBonus",
      abilityListUUID)

    if VCHelpers.CF:checkSCF() and payload then
      table.insert(rbaseAsi, newRace:GetName()) -- Add to the list if ASI Fixed
      local action = "RemoveSelectors"
      RADebug(4, "CleanOnRacesStatsLoaded payload RemoveSelectors: ")
      RADebug(4, table.dump(payload))
      --Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(payload)
      MCMASI:handlePayload(action, payload)
      if #rbaseAsi > 0 then
        BasicWarning("============> Base +2/+1 Ability removed to " ..
          #rbaseAsi .. " mods: " ..
          table.concat(rbaseAsi, ", "))
      end
    end

    local removeRaces = {} -- Table to store races with removed shit asi

    local raceStat = {}
    for score = -5, 5 do
      raceStat = {}
      for i = 1, 6 do -- change to -5 5 to low balancing charge server
        table.insert(raceStat, "Ability(" .. newRace:GetStatsListI(i) .. "," .. score .. ")")
      end

      local removedRacesAbility = raceStat
      local action = "RemoveBoosts"
      payload = VCHelpers.CF:addStringPayload(newRace:GetModGuid(), newRace:GetProgressionUUID(lvl),
        "Boosts", removedRacesAbility)

      if VCHelpers.CF:checkSCF() and payload then
        RADebug(4, "CleanOnRacesStatsLoaded payload RemoveBoosts: ")
        RADebug(4, table.dump(payload))
        MCMASI:handlePayload(action, payload)
        --Mods.SubclassCompatibilityFramework.Api.RemoveBoosts({ payload })
        if score == 5 then
          table.insert(removeRaces, newRace:GetName()) -- Add to the list if ASI Fixed
          if #removeRaces > 0 then
            BasicWarning("============> Race removed Boosts " ..
              #removeRaces .. " mods: " ..
              table.concat(removeRaces, ", "))
          end
        end
      end
    end
  end
end

--- Constructor for HideRacesAndSubRaceByRulesSet
---@param newRace RaceMod RaceMod Instance
function RaceMod:HideRacesAndSubRaceByRulesSet(newRace)
  if newRace:GetPresetUUID() ~= nil then
    local presetUUIDSize = table.getLength(newRace:GetPresetUUID())
    local tCCPRUUID = newRace:GetPresetUUID()
    for i = 1, presetUUIDSize do
      local res = Ext.StaticData.Get(tCCPRUUID[i], "CharacterCreationPreset")
      if newRace:GetMainRace() == true then
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.RaceUUID = "00000000-0000-0000-0000-000000000000"
      end
      if newRace:GetMainRace() == false then
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.SubRaceUUID = "00000000-0000-0000-0000-000000000000"
      end
    end
  end
  if newRace:GetOPresetUUID() ~= nil then -- HideOriginByRulesSet
    local presetUUIDSize = table.getLength(newRace:GetOPresetUUID())
    local tOriginPRUUID = newRace:GetOPresetUUID()
    for i = 1, presetUUIDSize do
      local res = Ext.StaticData.Get(tOriginPRUUID[i], "Origin")
      if newRace:GetMainRace() == true then
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.RaceUUID = "00000000-0000-0000-0000-000000000000"
      end
      if newRace:GetMainRace() == false then
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.SubRaceUUID = "00000000-0000-0000-0000-000000000000"
      end
    end
  end
  if newRace:GetComPresetUUID() ~= nil then -- HideCompanionByRulesSet ??
    local presetUUIDSize = table.getLength(newRace:GetComPresetUUID())
    local tComPPRUUID = newRace:GetComPresetUUID()
    for i = 1, presetUUIDSize do
      local res = Ext.StaticData.Get(tComPPRUUID[i], "CompanionPreset")
      --[[
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
      print(tostring(res))
      print(table.getLength(res))
      for k, v in pairs(res) do
        print(k .. " : " .. v)
      end
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

      xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
resource::CompanionPreset (000002ADFEC534B0)
11
RaceUuid : ff2b6894-b03e-4bc6-a3b4-ce16ce405e7e
SubRaceUuid : dd21fb84-2d6a-4d7d-a418-ca96991d3920
BodyType : 1
BodyShape : 0
RootTemplate : 4fad9633-f171-47bd-99dc-81cc99d1add5
Overview : HEL_F_Camera_CompanionOverview_A
CloseUpA : HEL_F_Camera_CompanionCloseup_A
CloseUpB : HEL_F_Camera_CompanionCloseup_B
VoiceTableUuid : 60e91119-d07a-497a-8b3f-1cd88d3b464e
VOLinesTableUuid : eec1dacc-91ee-49db-968f-a367faa97f42
ResourceUUID : 4c1dd831-9a0a-4555-bd17-8aca3133b76b
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

      ]]
         --
      if newRace:GetMainRace() == true then
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.RaceUuid = "00000000-0000-0000-0000-000000000000"
      end
      if newRace:GetMainRace() == false then
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.SubRaceUuid = "00000000-0000-0000-0000-000000000000"
      end
    end
  end
end
