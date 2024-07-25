---@class RaceMod:MetaClass
---@field name string
---@field modURL any table
---@field modGuid string uuid
---@field progressionUUID any table
---@field author string
---@field sourceBook string
---@field mainRace boolean
---@field stats any table
---@field sab any table
---@field bonus any table
---@field statsList any table
---@field specialAbList string uuid
---@field NoDefStats boolean
RaceMod = _Class:Create("RaceMod")


---@class RaceMod
---@param name string
---@param modURL any table
---@param modGuid string uuid
---@param progressionUUID any table
---@param author string
---@param sourceBook string
---@param mainRace boolean
---@param specialAbList string
---@param stats any table
---@param sab any table
---@param bonus any table
---@param NoDefStats boolean
function RaceMod:New(name, modURL, modGuid, progressionUUID, author, sourceBook, mainRace, specialAbList, stats,
 sab, bonus, NoDefStats)
    local self           = setmetatable({}, RaceMod)
    self.name            = name
    self.modURL          = modURL or nil
    self.modGuid         = modGuid
    self.progressionUUID = progressionUUID --Target
    self.author          = author
    self.sourceBook      = sourceBook
    self.mainRace        = mainRace
    self.specialAbList   = specialAbList or nil
    self.stats           = stats or nil --{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    self.sab             = sab or nil -- {"2","1"}
    self.bonus           = bonus or nil
    self.statsList       = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}
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
    local pUUID = self.progressionUUID[lvl]
    return pUUID
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
---@return table self.stats
function RaceMod:GetStats()
    return self.stats
end

--- Get self.stats[i] of RaceMod
---@return table self.stats[i]
function RaceMod:GetStatsI(i)
    return self.stats[i]
end

--- Get Name of RaceMod
---@return table self.sab
function RaceMod:GetSab()
    return self.sab
end

--- Get bonus of RaceMod
---@return table self.bonus
function RaceMod:GetBonus()
    return self.bonus
end

--- Get bonus[i] of RaceMod
---@return table self.bonus[i]
function RaceMod:GetBonusI(i)
    return self.bonus[i]
end

--- Get StatsList of RaceMod
---@return table self.statsList
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

--- Function for tableInsertRaceStats
---@param newRace RaceMod RaceMod Instance
---@return table RaceStat
function RaceMod:TableInsertRaceStats(newRace)
    local raceStat = {}
	if newRace:GetStats() ~= nil then
		for i = 1, 6 do
            BasicPrint(newRace:GetStatsListI(i))
            BasicPrint(newRace:GetStatsI(i))
            BasicPrint(string.format("Ability(%s,%s)", newRace:GetStatsListI(i), newRace:GetStatsI(i)))
			table.insert(raceStat, "Ability(" .. newRace:GetStatsListI(i) .. "," .. newRace:GetStatsI(i) .. ")")
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
end


--- Function for InsertPayloadRaceASI
---@param lvl integer
---@param newRace RaceMod RaceMod Instance
function RaceMod:InsertPayloadRaceASI(newRace, lvl)
local fixAsi = {}  -- Table to store classes with removed shit asi
	if newRace:GetSab() ~= nil then
        local payload = {}
        if newRace:GetModGuid() and VCHelpers.ModVars:isModLoaded(newRace:GetModGuid()) then
        -- special Ability List +x in some ASI or default
            local abilityListUUID = deps.AbilityList_UUID
            if newRace:GetSpecialAbList() ~= nil then
                abilityListUUID = newRace:GetSpecialAbList()
            end

            local sabAs = table.getLength(newRace:GetSab()) --sabAmounts

            payload = VCHelpers.CF:InsertSelectorsPayload(newRace:GetModGuid(),
            newRace:GetProgressionUUID(lvl), abilityListUUID, newRace:GetSab(),sabAs)

            table.insert(fixAsi, newRace:GetName()) -- Add to the list if ASI Fixed

            if VCHelpers.CF:checkSCF() then
                Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
                RAPrint(1, "payload InsertSelectors: %s\n\n", RADumpArray(fixAsi))
            end
        end
	end
	if newRace:GetStats() ~= nil then
        local payload = {}
        if newRace:GetModGuid() and VCHelpers.ModVars:isModLoaded(newRace:GetModGuid()) then

            local raceModStats = RaceMod:TableInsertRaceStats(newRace)
            payload = VCHelpers.CF:addStringPayload(newRace:GetModGuid(), newRace:GetProgressionUUID(lvl),
            "Boosts", raceModStats)

            if newRace:GetStats() ~= nil and newRace:GetSab() == nil then
                table.insert(fixAsi, newRace:GetName()) -- Add to the list if ASI Fixed
            end

            if VCHelpers.CF:checkSCF() then
                Mods.SubclassCompatibilityFramework.Api.InsertBoosts(payload)
            end
        end
	end
    if #fixAsi > 0 then
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
    local baseAsi = {}  -- Table to store classes with removed shit asi
    local payload = {}
    abilityListUUID = abilityListUUID or deps.AbilityList_UUID
    if newRace:GetModGuid() and VCHelpers.ModVars:isModLoaded(newRace:GetModGuid()) then
        payload =  VCHelpers.CF:InsertSelectorsPayload(newRace:GetModGuid(),
        newRace:GetProgressionUUID(lvl), "SelectAbilityBonus", abilityListUUID, {"2","1"}, 2, "AbilityBonus")
        table.insert(baseAsi, newRace:GetName()) -- Add to the list if ASI Fixed

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
            --RAPrint(1, string.format("payload InsertSelectors: %s \n\n ", RADumpArray(payload)))
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
]]--

--- Constructor for cleanOnRacesStatsLoaded
--- Clean race mods stats ASI
---@param abilityListUUID string
---@param lvl integer
---@param newRace RaceMod RaceMod Instance
function RaceMod:CleanOnRacesStatsLoaded(newRace, lvl, abilityListUUID)
        abilityListUUID = abilityListUUID or deps.AbilityList_UUID
        -- remove +2+1, +1, +1+1 ect..
        local payload = VCHelpers.CF:removeSelectorsPayload(newRace:GetModGuid(),
        newRace:GetProgressionUUID(lvl), "SelectAbilityBonus",
        abilityListUUID)

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(payload)
            --RAPrint(1, string.format("payload InsertSelectors: %s", table.dump(payload)))
        end
        -- remove Boost Ability
        BasicPrint(string.format("payload InsertSelectors: %s", newRace:GetStatsList()))
        --RADumpArray(2,newRace:GetStatsList())
        for _, ability in ipairs(newRace:GetStatsList()) do
            for score=-5,5 do -- change to -5 5 to low balancing charge server
                RemovedRaces = VCHelpers.CF:removeStringPayload(newRace:GetModGuid(),
                newRace:GetProgressionUUID(lvl),"Boosts",{"Ability("..ability..","..score..")"})
            end
        end
        if RemovedRaces then
            table.insert(RemovedRaces, RemovedRaces) -- Add to the list if removed
        end
end