--[[
{
        Name            =    "High Elf default",
        modURL            =     {"https://bg3.wiki/wiki/Elf", "https://baldursgate3.wiki.fextralife.com/Elf"%7D,
        modGuid            =    "28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
        TableUUID          =    "",
        ProgressionUUID       =    {
                                [1] = "",
                                [2] = "",
                                [3] = "",
                            },
        Author            =    "Larian",
        SourceBook        =    "PHB",
        MainRace        =    false,
        Stats            =    {"0", "2", "0", "1", "0", "0"}, -- "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" 
        Sab                =    {"2","1"} -- valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"}
        Bonus			=	{"ProficiencyBonus(Skill,Stealth)"}
    }
]]--


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
RaceMod = _Class:Create("RaceMod", nil, {
    name            = "Kender Best Race ever",
    modURL          = {},
    modGuid         = "",
    progressionUUID = {},
    author          = "Larian",
    sourceBook      = "PHB",
    mainRace        = true,
    stats           = {}, --{"0", "2", "0", "1", "0", "0"}, -- "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" 
    sab             = {}, --{"2","1"} -- valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"}
    bonus           = {},
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
function RaceMod:New(name, modURL, modGuid, progressionUUID, author, sourceBook, mainRace, stats, sab)
    local self           = setmetatable({}, RaceMod)
    self.name            = name or "Kender The Alpha Race"
    self.modURL          = modURL or {}
    self.modGuid         = modGuid
    self.progressionUUID = progressionUUID or {}
    self.author          = author or "Larian"
    self.sourceBook      = sourceBook
    self.mainRace        = mainRace
    self.stats           = stats or {"0", "0", "0", "0", "0", "0"}
    self.sab             = sab or {"2","1"}
    self.bonus           = bonus or {}
end


function RaceMod:GetName()
    return self.name
end

function RaceMod:GetModURL()
    return self.modURL
end

function RaceMod:GetModGuid()
    return self.modGuid
end

function RaceMod:GetProgressionUUID()
    return self.progressionUUID
end
function RaceMod:GetAuthor()
    return self.author
end
function RaceMod:GetSourceBook()
    return self.sourceBook
end
function RaceMod:GetMainRace()
    return self.mainRace
end

function RaceMod:GetStats()
    return self.stats
end

function RaceMod:GetSab()
    return self.sab
end

function RaceMod:GetBonus()
    return self.bonus
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
    local StatsList = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}
	if self.stats ~= nil then
		for i = 1, 6 do
			table.insert(RaceStat, "Ability(" .. StatsList[i] .. "," .. self.stats[i] .. ")")
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
