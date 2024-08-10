---@class ClasseMod:MetaClass
---@field name string
---@field modURL table|string table
---@field modGuid string UUID
---@field progressionUUID table|string table
---@field author string
---@field sourceBook string
---@field mainClasse boolean
---@field isLvl20 boolean
---@field isOutdated boolean
---@field cdUUID table|string table
ClasseMod = _Class:Create("ClasseMod")


--- Constructor for the ClasseMod class.
---@class ClasseMod
---@param name string
---@param modURL table|string table
---@param modGuid string UUID
---@param progressionUUID table|string table
---@param author string
---@param sourceBook string
---@param mainClasse boolean
---@param isLvl20 boolean
---@param isOutdated boolean
---@param cDUUID table|string table
function ClasseMod:New(name, modURL, modGuid, progressionUUID, author, sourceBook, mainClasse, isLvl20, isOutdated,
                       cdUUID)
  local self           = setmetatable({}, ClasseMod)
  self.name            = name
  self.modURL          = modURL or nil
  self.modGuid         = modGuid
  self.progressionUUID = progressionUUID
  self.author          = author
  self.sourceBook      = sourceBook
  self.mainClasse      = mainClasse
  self.isLvl20         = isLvl20
  self.isOutdated      = isOutdated
  self.cDUUID          = cdUUID

  return self
end

--- Get Name of ClasseMod
---@return string self.name
function ClasseMod:GetName()
  return self.name
end

--- Get ModURL of ClasseMod
---@param i integer
---@return table self.modURL
function ClasseMod:GetModURL(i)
  return self.modURL[i]
end

--- Get ModGuid of ClasseMod
---@return string self.modGuid
function ClasseMod:GetModGuid()
  return self.modGuid
end

--- Get progressionUUID from lvl of ClasseMod
---@param lvl integer
---@return table self.progressionUUID
function ClasseMod:GetProgressionUUIDLvl(lvl)
  return self.progressionUUID[lvl]
end

--- Get author of ClasseMod
---@return string self.author
function ClasseMod:GetAuthor()
  return self.author
end

--- Get sourceBook of ClasseMod
---@return string self.sourceBook
function ClasseMod:GetSourceBook()
  return self.sourceBook
end

--- Get mainClasse of ClasseMod
---@return boolean self.mainRace
function ClasseMod:GetmainClasse()
  return self.mainClasse
end

--- Get isLvl20 of ClasseMod
---@return boolean self.isLvl20
function ClasseMod:GetIsLvl20()
  return self.isLvl20
end

--- Get isOutdated of ClasseMod
---@return boolean self.isOutdated
function ClasseMod:GetIsOutdated()
  return self.isOutdated
end

--- Get isOutdated of ClasseMod
---@return table self.cDUUID
function ClasseMod:GetCDUUID()
  return self.cDUUID
end

--- Get Object instancy of ClasseMod
function ClasseMod:GetObject()
  return self
end

function ClasseMod:SetName(name)
  self.name = name
end

function ClasseMod:SetModURL(modURL)
  self.name = modURL
end

function ClasseMod:SetModGuid(modGuid)
  self.modGuid = modGuid
end

function ClasseMod:SetProgressionUUID(pUUID, lvl)
  self.progressionUUID[lvl] = pUUID
end

function ClasseMod:SetAuthor(author)
  self.author = author
end

function ClasseMod:SetSourceBook(sourceBook)
  self.sourceBook = sourceBook
end

function ClasseMod:SetMainClasse(mainClasse)
  self.mainClasse = mainClasse
end

function ClasseMod:SetStats(isLvl20)
  self.isLvl20 = isLvl20
end

function ClasseMod:SetSab(isOutdated)
  self.isOutdated = isOutdated
end

--[[
_________ .__                         _________ .__                                       __________    _____         .__       .__      _____    _________.___
\_   ___ \|  |   ____ _____    ____   \_   ___ \|  | _____    ______ ______ ____   ______ \______   \  /  _  \   ____ |__|____  |  |    /  _  \  /   _____/|   |
/    \  \/|  | _/ __ \\__  \  /    \  /    \  \/|  | \__  \  /  ___//  ___// __ \ /  ___/  |       _/ /  /_\  \_/ ___\|  \__  \ |  |   /  /_\  \ \_____  \ |   |
\     \___|  |_\  ___/ / __ \|   |  \ \     \___|  |__/ __ \_\___ \ \___ \\  ___/ \___ \   |    |   \/    |    \  \___|  |/ __ \|  |__/    |    \/        \|   |
 \______  /____/\___  >____  /___|  /  \______  /____(____  /____  >____  >\___  >____  >  |____|_  /\____|__  /\___  >__(____  /____/\____|__  /_______  /|___|
        \/          \/     \/     \/          \/          \/     \/     \/     \/     \/          \/         \/     \/        \/              \/        \/
        \_Clean Classes ModASI
]]
--

---@param abilityListUUID string
---@param lvl integer
---@param newClass ClasseMod ClasseMod Instance
--@param removedClasses table
function ClasseMod:RemoveClassesASI(newClass, lvl, abilityListUUID)
  --exception lvl nil
  if newClass:GetProgressionUUIDLvl(lvl) == nil then return end
  abilityListUUID = abilityListUUID or Data.Deps.AbilityList_UUID.ModuleUUID

  if (newClass:GetModGuid() and VCHelpers.ModVars:IsModLoaded(newClass:GetModGuid())) then
    local payload          = {}
    local RemoveClassesASI = {}
    RADebug(4, table.dump(newClass:GetProgressionUUIDLvl(lvl)))
    RADebug(4, string.format("ClassModObject:GetModGuid(): %s", newClass:GetModGuid()))

    if newClass:GetProgressionUUIDLvl(lvl) ~= "aaaa" then --rmv after lib finished
      if newClass:GetProgressionUUIDLvl(lvl) == nil then
        RAWarn(1, string.format("============> ERROR: classeMod.progressionUUID %s.",
          table.dump(newClass:GetProgressionUUIDLvl(lvl))))
      end
      --local removedClasses =
      local action = "RemoveSelectors"
      payload = VCHelpers.CF:removeSelectorsPayload(newClass:GetModGuid(),
        newClass:GetProgressionUUIDLvl(lvl), "SelectAbilityBonus", abilityListUUID)

      if VCHelpers.CF:checkSCF() and payload then
        table.insert(RemoveClassesASI, newClass:GetName()) -- Add to the list if ASI Fixed
        RADebug(4, "RemoveClassesASI payload RemoveSelectors: ")
        RADebug(4, table.dump(payload))
        MCMASI:handlePayload(action, payload)
        --Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(payload)
        if #RemoveClassesASI > 0 then
          BasicWarning("============> BAD Classe Ability removed to " ..
            #RemoveClassesASI .. " mods: " ..
            table.concat(RemoveClassesASI, ", "))
        end
      end
    end
  end
end

--- Constructor for HideClassesAndSubClassesByRulesSet
---@param newClass ClasseMod ClasseMod ClasseMod Instance
function RaceMod:HideClassesAndSubClassesByRulesSet(newClass)
  if newClass:GetCDUUID() ~= nil then
    local classDescriptionUUIDSize = table.getLength(newClass:GetCDUUID())
    local tCDUUID = newClass:GetCDUUID()
    for i = 1, classDescriptionUUIDSize do
      local res = Ext.StaticData.Get(tCDUUID[i], "ClassDescription")

      if newClass:GetmainClasse() == true then
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.ProgressionTableUUID = "00000000-0000-0000-0000-000000000000"
      end
      if newClass:GetmainClasse() == false then
        res.ParentGuid = "00000000-0000-0000-0000-000000000000"
        res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        res.ProgressionTableUUID = "00000000-0000-0000-0000-000000000000"
      end
    end
  end
end
