---@class ClasseMod:MetaClass
---@field name string
---@field modURL table
---@field modGuid string UUID
---@field progressionUUID table
---@field author string
---@field sourceBook string
---@field mainClasse boolean
---@field isLvl20 boolean
---@field isOutdated boolean
ClasseMod = _Class:Create("ClasseMod")

---@class ClasseMod
---@param name string
---@param modURL table
---@param modGuid string UUID
---@param progressionUUID table
---@param author string
---@param sourceBook string
---@param mainClasse boolean
---@param isLvl20 boolean
---@param isOutdated boolean
function ClasseMod:New(name, modURL, modGuid, progressionUUID, author, sourceBook, mainClasse, isLvl20, isOutdated)
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
function ClasseMod:GetProgressionUUID(lvl)
    return self.progressionUUID[lvl]
end

--- Get progressionUUID of ClasseMod
---@return table self.progressionUUID
function ClasseMod:GetProgressionUUID()
    return self.progressionUUID
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

function ClasseMod:SetProgressionUUID(pUUID,lvl)
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


---@param AbilityListUUID string
---@param lvl integer
---@param Object MetaClass:ClasseMod
--[[
function ClasseMod:RemoveClassesASI(lvl, AbilityListUUID, Object)
    AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
    if self.GetProgressionUUID(lvl) ~= "aaaa" then --rmv after lib finished
            local removedClass = VCHelpers.CF:removeSelectorsPayload(Object:GetModGuid(), Object:GetProgressionUUID(lvl),
        "SelectAbilityBonus", deps.AbilityList_UUID)
            if removedClass then
                table.insert(RemovedClasses, removedClass) -- Add to the list if removed
            end
        end
    if #removedClasses > 0 then  -- Check if any selectors were removed
        local classList = table.concat(removedClasses, ", ") -- Create comma-separated list
    RAWarn(2, string.format("============> Selectors removed from %d mods: %s", #removedClasses, classList))
    end
end



function ClasseMod:CleanOnRacesStatsLoaded(lvl, AbilityListUUID)
        AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
        -- remove +2+1, +1, +1+1 ect..
        local payload = VCHelpers.CF:removeSelectorsPayload(RaceMod:GetModGuid(), RaceMod:GetProgressionUUID(lvl), "SelectAbilityBonus",
        AbilityListUUID)

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(payload)
            RAPrint(1, "payload InsertSelectors: " .. RADumpArray(payload) .. "\n\n")
        end
        -- remove Boost Ability
        for _, ability in ipairs(RaceMod:GetStatsList()) do
            for score=-5,5 do -- change to -5 5 to low balancing charge server
                RemovedRaces = VCHelpers.CF:removeStringPayload(RaceMod:GetModGuid(), RaceMod:GetProgressionUUID(lvl), "Boosts",{"Ability("..ability..","..score..")"})
            end
        end
        if RemovedRaces then
            table.insert(RemovedRaces, RemovedRaces) -- Add to the list if removed
        end
end

]]--