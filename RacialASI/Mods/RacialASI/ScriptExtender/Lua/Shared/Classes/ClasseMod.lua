---@diagnostic disable: return-type-mismatch

---@class ClasseMod: MetaClass
ClasseMod = _Class:Create("ClasseMod", nil, { -- Example of Instance
    name 			=	"Artificer",
    modURL			=	"https://www.nexusmods.com/baldursgate3/mods/1779",
    modGuid 		=	"88fadf2c-152d-404e-b863-c12273559e1c",
    UUID			=	{
                        [1] = "28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", -- example with lvl 1
                        [3] = "28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", -- example with lvl 3
                        },
    Author			=	"KiderionLykon",
    SourceBook		=	"TCoE",
    MainClasse		=	true,
    isLvl20			=	true,
    isOutdated		=	false
})

---@class name string
---@class modURL table
---@class modGuid UUID
---@class progressionUUID table
---@class author string
---@class sourceBook string
---@class mainClasse boolean
---@class isLvl20 boolean
---@class isOutdated boolean
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
end

--- Get Name of ClasseMod
---@return string self.name
function ClasseMod:GetName()
    return self.name
end

--- Get ModURL of ClasseMod
---@param integer i
---@return string self.modURL
function ClasseMod:GetModURL(i)
    return self.modURL[i]
end

--- Get ModGuid of ClasseMod
---@return string self.modGuid
function ClasseMod:GetModGuid()
    return self.modGuid
end

--- Get progressionUUID from lvl of ClasseMod
---@param integer lvl
---@return table self.progressionUUID
function ClasseMod:GetProgressionUUID(lvl)
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
---@return string self.mainRace
function ClasseMod:GetmainClasse()
    return self.mainClasse
end

--- Get isLvl20 of ClasseMod
---@return string self.isLvl20
function ClasseMod:GetIsLvl20()
    return self.isLvl20
end

--- Get isOutdated of ClasseMod
---@return string self.isOutdated
function ClasseMod:GetIsOutdated()
    return self.isOutdated
end

--- Get Object instancy of ClasseMod
---@return Object? self
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

function ClasseMod:SetProgressionUUID(progressionUUID)
    self.progressionUUID = progressionUUID
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

---@param string AbilityListUUID
---@param integer lvl
function ClasseMod:removeClassesASI(AbilityListUUID, lvl)
    if self.progressionUUID[1] ~= "aaaa" then --rmv after lib finished
        local removedClass = VCHelpers.CF:removeSelectorsPayload(self.modGuid, self.progressionUUID[lvl],
        "SelectAbilityBonus", AbilityListUUID)
        if removedClass then
            table.insert(RemovedClasses, removedClass) -- Add to the list if removed
        end
    end
end