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
    }
]]--


---@class RaceMod: MetaClass
---@field Name string
---@field modURL table
---@field modGuid UUID
---@field ProgressionUUID table
---@field Author string
---@field SourceBook string
---@field MainRace boolean
---@field Stats table
---@field Sab table
RaceMod = _Class:Create("RaceMod", nil, {
    Name            = "Kender Best Race ever",
    modURL          = {},
    modGuid         = "",
    ProgressionUUID = {},
    Author          = "Larian",
    SourceBook      = "PHB",
    MainRace        = true,
    Stats           = {}, --{"0", "2", "0", "1", "0", "0"}, -- "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" 
    Sab             = {}, --{"2","1"} -- valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"}
})

---@class RaceMod
---@field Name string
---@field modURL table
---@field modGuid UUID
---@field ProgressionUUID table
---@field Author string
---@field SourceBook string
---@field MainRace boolean
---@field Stats table
---@field Sab table
function RaceMod:New(Name, modURL, modGuid, ProgressionUUID, Author, SourceBook, MainRace, Stats, Sab)
    local self = setmetatable({}, RaceMod)
    self.Name            = Name or "Kender The Alpha Race"
    self.modURL          = modURL or {}
    self.modGuid         = modGuid
    self.ProgressionUUID = ProgressionUUID or {}
    self.Author          = Author or "Larian"
    self.SourceBook      = SourceBook
    self.MainRace        = MainRace
    self.Stats           = Stats or {"0", "0", "0", "0", "0", "0"}
    self.Sab             = Sab or {"2","1"}
end