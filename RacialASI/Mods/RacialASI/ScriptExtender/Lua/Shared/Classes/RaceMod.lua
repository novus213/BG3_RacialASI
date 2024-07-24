---@class RaceMod: MetaClass
---@field name string
---@field modURL table
---@field modGuid string uuid
---@field progressionUUID table
---@field author string
---@field sourceBook string
---@field mainRace boolean
---@field stats table
---@field sab table
---@field bonus table
---@field statsList table
---@field specialAbList string uuid
RaceMod = _Class:Create("RaceMod")


---@class RaceMod
---@param name string
---@param modURL table
---@param modGuid string uuid
---@param progressionUUID table
---@param author string
---@param sourceBook string
---@param mainRace boolean
---@param specialAbList string
---@param stats table
---@param sab table
---@param bonus table
function RaceMod:New(name, modURL, modGuid, progressionUUID, author, sourceBook, mainRace, specialAbList, stats,
 sab, bonus)
    local self           = setmetatable({}, RaceMod)
    self.name            = name
    self.modURL          = modURL or nil
    self.modGuid         = modGuid
    self.progressionUUID = progressionUUID --Target
    self.author          = author
    self.sourceBook      = sourceBook
    self.mainRace        = mainRace
    self.specialAbList   = specialAbList or nil
    self.stats           = stats or nil
    self.sab             = sab or nil
    self.bonus           = bonus or nil
    self.statsList       = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}

end

--- Get Name of RaceMod
---@return string self.name
function RaceMod:GetName()
    return self.name
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

--- Get Name of RaceMod
---@return table self.name
function RaceMod:GetSab()
    return self.sab
end

--- Get Name of RaceMod
---@return table self.name
function RaceMod:GetBonus()
    return self.bonus
end

--- Get StatsList of RaceMod
---@return table self.statsList
function RaceMod:GetStatsList()
    return self.statsList
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
---@return table RaceStat
--[[
function RaceMod:TableInsertRaceStats()
    local RaceStat = {}
	if self.stats ~= nil then
		for i = 1, 6 do
			table.insert(RaceStat, "Ability(" .. self.statsList[i] .. "," .. self.stats[i] .. ")")
		end
        if self.bonus ~= nil then
            local raceModBonusSize = table.getLength(self.bonus)
            for i = 1, raceModBonusSize do
                table.insert(RaceStat, self.bonus[i])
            end
        end
        RAPrint(1, "raceMod.Stats: " .. RADumpArray(RaceStat))

		return RaceStat
	end
end
]]--


--- Function for InsertPayloadRaceASI
--[[
function RaceMod:InsertPayloadRaceASI(lvl)
local fixAsi = {}  -- Table to store classes with removed shit asi
	if self.sab ~= nil then
        local payload = {}
        if self.modGuid and VCHelpers.ModVars:isModLoaded(self.modGuid) then
        -- special Ability List +x in some ASI or default
            local AbilityListUUID = ""
            if self.specialAbList ~= nil then
                AbilityListUUID = self.specialAbList
            else
                AbilityListUUID = deps.AbilityList_UUID
            end
            local pUUID = self.progressionUUID[lvl]
            payload = VCHelpers.CF:InsertSelectorsPayload(self.modGuid, pUUID, AbilityListUUID, self.sab,
            table.getLength(self.sab))

            table.insert(fixAsi, self.name) -- Add to the list if ASI Fixed

            if VCHelpers.CF:checkSCF() then
                Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
                RAPrint(1, "payload InsertSelectors: " .. RADumpArray(fixAsi) .. "\n\n")
            end
        end
	end

	if self.stats ~= nil then
        local payload = {}
        if self.modGuid and VCHelpers.ModVars:isModLoaded(self.modGuid) then

            local raceModStats = self.InsertPayloadRaceASI()
            local pUUID = self.progressionUUID[lvl]
            payload = VCHelpers.CF:addStringPayload(self.modGuid, pUUID, "Boosts", raceModStats)

            if self.stats ~= nil and self.sab == nil then
                table.insert(fixAsi, self.name) -- Add to the list if ASI Fixed
            end

            if VCHelpers.CF:checkSCF() then
                Mods.SubclassCompatibilityFramework.Api.InsertBoosts(payload)
                RAPrint(1, "payload InsertBoosts: " .. RADumpArray(fixAsi) .. "\n\n")
            end
        end
	end
    if #fixAsi > 0 then
        RAWarn(2, "============> Ability added to " ..
                 #fixAsi .. " mods: " ..
                 table.concat(fixAsi, ", "))
    end
end
]]--

--- Constructor for insertDefaultPayloadASI
--[[
function RaceMod:insertDefaultPayloadASI(lvl, AbilityListUUID)
    local baseAsi = {}  -- Table to store classes with removed shit asi
    AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
    if self.modGuid and VCHelpers.ModVars:isModLoaded(self.modGuid) then
        local pUUID = self.progressionUUID[lvl]
        payload =  VCHelpers.CF:InsertSelectorsPayload(self.modGuid, pUUID, "SelectAbilityBonus",
        AbilityListUUID, {"2","1"}, 2, "AbilityBonus")
        table.insert(baseAsi, self.name) -- Add to the list if ASI Fixed

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
            RAPrint(1, "payload InsertSelectors: " .. RADumpArray(baseAsi) .. "\n\n")
        end
    end
    if #baseAsi > 0 then
        RAWarn(2, "============> Base +2/+1 Ability added to " ..
                 #baseAsi .. " mods: " ..
                 table.concat(baseAsi, ", "))
    end
end
]]--


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
---@param AbilityList string
---@param lvl int
--[[
function RaceMod:cleanOnRacesStatsLoaded(lvl, AbilityListUUID)
        AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
        -- remove +2+1, +1, +1+1 ect..
        local pUUID = self.progressionUUID[lvl]
        local payload = VCHelpers.CF:removeSelectorsPayload(self.modGuid, pUUID, "SelectAbilityBonus",
        AbilityListUUID)

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(payload)
            RAPrint(1, "payload InsertSelectors: " .. RADumpArray(payload) .. "\n\n")
        end

        -- remove Boost Ability
        for _, ability in ipairs(self.statsList) do
            for score=-5,5 do -- change to -5 5 to low balancing charge server
                RemovedRaces = VCHelpers.CF:removeStringPayload(self.modGuid, self.progressionUUID, "Boosts",
                {"Ability("..ability..","..score..")"})
            end
        end
        if RemovedRaces then
            table.insert(RemovedRaces, RemovedRaces) -- Add to the list if removed
        end
end
]]--