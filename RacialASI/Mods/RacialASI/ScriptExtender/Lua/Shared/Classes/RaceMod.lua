---@class RaceMod: MetaClass
---@field Name string
---@field modURL table
---@field modGuid UUID
---@field progressionUUID table
---@field author string
---@field sourceBook string
---@field mainRace boolean
---@field stats table
---@field sab table
---@field bonus table
---@field statsList table
---@field specialAbList UUID
RaceMod = _Class:Create("RaceMod", nil, { -- Example of Instance
    name            = "Kender Best Race ever",
    modURL          = {"https://bg3.wiki/wiki/Elf", "https://baldursgate3.wiki.fextralife.com/Elf"},
    modGuid         = "28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid example
    progressionUUID = {
                        [1] = "28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", -- example with lvl 1
                        [3] = "28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", -- example with lvl 3
                      },
    author          = "Larian",
    sourceBook      = "PHB",
    mainRace        = true,
    specialAbList   = "0a42b87b-a001-4091-8072-a611a85fa465",
    stats           = {"0", "2", "0", "1", "0", "0"}, --{"0", "2", "0", "1", "0", "0"}, -- "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" 
    sab             = {"2","1"}, --{"2","1"} -- valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"}
    bonus           = {"ProficiencyBonus(Skill,Stealth)"},
    statsList       = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}
})

---@class RaceMod
---@field name string
---@field modURL table
---@field modGuid UUID
---@field progressionUUID table
---@field author string
---@field sourceBook string
---@field mainRace boolean
---@field stats table
---@field sab table
---@field bonus table
---@field statsList table
function RaceMod:New(name, modURL, modGuid, progressionUUID, author, sourceBook, mainRace, specialAbList, stats, sab, bonus)
    local self           = setmetatable({}, RaceMod)
    self.name            = name or "Kender The Alpha Race"
    self.modURL          = modURL or {}
    self.modGuid         = modGuid
    self.progressionUUID = progressionUUID or {}
    self.author          = author or "Larian"
    self.sourceBook      = sourceBook
    self.mainRace        = mainRace
    self.specialAbList        = specialAbList
    self.stats           = stats or {"0", "0", "0", "0", "0", "0"}
    self.sab             = sab or {"2","1"}
    self.bonus           = bonus or {}
    self.statsList       = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}

end

--- Get Name of RaceMod
---@return string self.name
function RaceMod:GetName()
    return self.name
end

--- Get ModURL of RaceMod
---@return string self.modURL
function RaceMod:GetModURL()
    return self.modURL
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
---@return string self.mainRace
function RaceMod:GetMainRace()
    return self.mainRace
end

--- Get stats of RaceMod
---@return string self.stats
function RaceMod:GetStats()
    return self.stats
end

--- Get Name of RaceMod
---@return string self.name
function RaceMod:GetSab()
    return self.sab
end

--- Get Name of RaceMod
---@return string self.name
function RaceMod:GetBonus()
    return self.bonus
end

--- Get StatsList of RaceMod
---@return table self.statsList
function RaceMod:GetStatsList()
    return self.statsList
end

--- Get Object instancy of RaceMod
---@return Object self
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

--- Constructor for tableInsertRaceStats
---@param raceMod table raceMod
---@return table RaceStat
function RaceMod:TableInsertRaceStats()
    local RaceStat = {}
	if self.stats ~= nil then
		for i = 1, 6 do
			table.insert(RaceStat, "Ability(" .. self.statsList[i] .. "," .. self.stats[i] .. ")")
		end
        if self.Bonus ~= nil then
            local raceModBonusSize = table.getLength(self.bonus)
            for i = 1, raceModBonusSize do
                table.insert(RaceStat, self.bonus[i])
            end
        end
        VCWarn(0, "raceMod.Stats: " .. VCDumpArray(RaceStat))

		return RaceStat
	end
end


--- Constructor for insertPayload
---@param raceMod table raceMod
function RaceMod:InsertPayload()
local fixAsi = {}  -- Table to store classes with removed shit asi
	if self.sab ~= nil then
        local payload = {}
        if isModExist(self.modGuid) then
        -- special Ability List +x in some ASI or default
            local AbilityListUUID = ""
            if self.specialAbList ~= nil then
                AbilityListUUID = self.specialAbList
            else
                AbilityListUUID = deps.AbilityList_UUID
            end

            payload = VCHelpers.CF:InsertSelectorsPayload(self.modGuid, self.UUID, AbilityListUUID, self.sab,
            table.getLength(self.sab))

            table.insert(fixAsi, self.Name) -- Add to the list if ASI Fixed
            
            Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})

             VCWarn(0, "payload InsertSelectors: " .. VCDumpArray(RaceStat) .. "\n\n")
        end
	end

	if raceMod.Stats ~= nil then
        local payload = {}
        if isModExist(raceMod.modGuid) then
            local raceModStats = tableInsertRaceStats(raceMod)
            payload = createBoostPayload(raceMod.modGuid, raceMod.UUID, raceModStats)
            if raceMod.Stats ~= nil and raceMod.Sab == nil then
                table.insert(fixAsi, raceMod.Name) -- Add to the list if ASI Fixed
            end
            Mods.SubclassCompatibilityFramework.Api.InsertBoosts({payload})
            --BasicWarning(string.format("payload InsertBoosts: %s\n\n", table.dump(payload)))
        end
	end
    if #fixAsi > 0 then
        BasicWarning("============> Ability added to " ..
                 #fixAsi .. " mods: " ..
                 table.concat(fixAsi, ", "))
    end
end