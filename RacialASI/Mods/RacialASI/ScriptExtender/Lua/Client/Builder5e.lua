 --[[
 .________        __________      .__.__       .___            
 |   ____/ ____   \______   \__ __|__|  |    __| _/___________ 
 |____  \_/ __ \   |    |  _/  |  \  |  |   / __ |/ __ \_  __ \
 /       \  ___/   |    |   \  |  /  |  |__/ /_/ \  ___/|  | \/
/______  /\___  >  |______  /____/|__|____/\____ |\___  >__|   
       \/     \/          \/                    \/    \/       
        \_Clean Races ModASI
]]--
Ext.Require("Libs/ClassesLibrary.lua")
Ext.Require("Libs/BooksLibrary.lua")
Ext.Require("Libs/RacesLibrary.lua")

RAPrint(1, "PatchAsi5eLimited: ")
RAPrint(1, PatchAsi5eLimited)
RAPrint(1, "PatchAsi5e: ")
RAPrint(1, PatchAsi5e)
RAPrint(1, "PatchAsi5eExtended: ")
RAPrint(1, PatchAsi5eExtended)
RAPrint(1, "PatchAsiLegacy: ")
RAPrint(1, PatchAsiLegacy)
RAPrint(1, "PatchAsiFlavour: ")
RAPrint(1, PatchAsiFlavour)
RAPrint(1, "PatchAsiHomebrew: ")
RAPrint(1, PatchAsiHomebrew)



--[[
_________ .__                         _________ .__                                       __________    _____         .__       .__      _____    _________.___ 
\_   ___ \|  |   ____ _____    ____   \_   ___ \|  | _____    ______ ______ ____   ______ \______   \  /  _  \   ____ |__|____  |  |    /  _  \  /   _____/|   |
/    \  \/|  | _/ __ \\__  \  /    \  /    \  \/|  | \__  \  /  ___//  ___// __ \ /  ___/  |       _/ /  /_\  \_/ ___\|  \__  \ |  |   /  /_\  \ \_____  \ |   |
\     \___|  |_\  ___/ / __ \|   |  \ \     \___|  |__/ __ \_\___ \ \___ \\  ___/ \___ \   |    |   \/    |    \  \___|  |/ __ \|  |__/    |    \/        \|   |
 \______  /____/\___  >____  /___|  /  \______  /____(____  /____  >____  >\___  >____  >  |____|_  /\____|__  /\___  >__(____  /____/\____|__  /_______  /|___|
        \/          \/     \/     \/          \/          \/     \/     \/     \/     \/          \/         \/     \/        \/              \/        \/      
        \_Clean Classes ModASI
]]--

--- Function for TableInsertRaceStats
local function TableInsertRaceStats()
    local raceStat = {}
	if RaceModObject:GetStats() ~= nil then
		for i = 1, 6 do
			table.insert(raceStat, "Ability(" .. RaceModObject:GetStatsListI(i) .. "," .. RaceModObject:GetStats(i) .. ")")
		end
        if RaceModObject:GetBonus() ~= nil then
            local raceModBonusSize = table.getLength(RaceModObject:GetBonus())
            for i = 1, raceModBonusSize do
                table.insert(raceStat, RaceModObject:GetBonusI(i))
            end
        end
        RAPrint(1, string.format("raceMod.Stats: %s",RADumpArray(raceStat)))

		return raceStat
	end
end

--- Function for InsertPayloadRaceASI
local function InsertPayloadRaceASI(lvl)
local fixAsi = {}  -- Table to store classes with removed shit asi
	if RaceModObject:GetSab() ~= nil then
        local payload = {}
        if RaceModObject:GetModGuid() and VCHelpers.ModVars:isModLoaded(RaceModObject:GetModGuid()) then
        -- special Ability List +x in some ASI or default
            local abilityListUUID = ""
            if RaceModObject:GetSpecialAbList() ~= nil then
                abilityListUUID = RaceModObject:GetSpecialAbList()
            else
                abilityListUUID = deps.AbilityList_UUID
            end

            local sabAs = table.getLength(RaceModObject:GetSab()) --sabAmounts

            payload = VCHelpers.CF:InsertSelectorsPayload(RaceModObject:GetModGuid(),
            RaceModObject:GetProgressionUUID(lvl), abilityListUUID, RaceModObject:GetSab(),sabAs)

            table.insert(fixAsi, RaceModObject:GetName()) -- Add to the list if ASI Fixed

            if VCHelpers.CF:checkSCF() then
                Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
                RAPrint(1, "payload InsertSelectors: %s\n\n", RADumpArray(fixAsi))
            end
        end
	end
	if RaceModObject:GetStats() ~= nil then
        local payload = {}
        if RaceModObject:GetModGuid() and VCHelpers.ModVars:isModLoaded(RaceModObject:GetModGuid()) then

            local raceModStats = TableInsertRaceStats(RaceModObject)
            payload = VCHelpers.CF:addStringPayload(RaceModObject:GetModGuid(), RaceModObject:GetProgressionUUID(lvl),
            "Boosts", raceModStats)

            if RaceModObject:GetStats() ~= nil and RaceModObject:GetSab() == nil then
                table.insert(fixAsi, RaceModObject:GetName()) -- Add to the list if ASI Fixed
            end

            if VCHelpers.CF:checkSCF() then
                Mods.SubclassCompatibilityFramework.Api.InsertBoosts(payload)
                RAPrint(1, "payload InsertBoosts: %s\n\n", RADumpArray(payload))
            end
        end
	end
    if #fixAsi > 0 then
        BasicWarning("============> Ability added to " ..
                 #fixAsi .. " mods: " ..
                 table.concat(fixAsi, ", "))
    end
end

local function InsertDefaultPayloadASI(lvl, AbilityListUUID)
    local baseAsi = {}  -- Table to store classes with removed shit asi
    local payload = {}
    AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
    if RaceModObject:GetModGuid() and VCHelpers.ModVars:isModLoaded(RaceModObject:GetModGuid()) then
        payload =  VCHelpers.CF:InsertSelectorsPayload(RaceModObject:GetModGuid(),
        RaceModObject:GetProgressionUUID(lvl), "SelectAbilityBonus", AbilityListUUID, {"2","1"}, 2, "AbilityBonus")
        table.insert(baseAsi, RaceModObject:GetName()) -- Add to the list if ASI Fixed

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
            RAPrint(1, string.format("payload InsertSelectors: %s \n\n ", RADumpArray(payload)))
        end
    end
    if #baseAsi > 0 then
        BasicWarning("============> Base +2/+1 Ability added to " ..
                 #baseAsi .. " mods: " ..
                 table.concat(baseAsi, ", "))
    end
end


local function CleanOnRacesStatsLoaded(lvl, AbilityListUUID)
        AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
        -- remove +2+1, +1, +1+1 ect..
        local payload = VCHelpers.CF:removeSelectorsPayload(RaceModObject:GetModGuid(),
        RaceModObject:GetProgressionUUID(lvl), "SelectAbilityBonus",
        AbilityListUUID)

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(payload)
            RAPrint(1, string.format("payload InsertSelectors: %s", RADumpArray(payload)))
        end
        -- remove Boost Ability
        for _, ability in ipairs(RaceModObject:GetStatsList()) do
            for score=-5,5 do -- change to -5 5 to low balancing charge server
                RemovedRaces = VCHelpers.CF:removeStringPayload(RaceModObject:GetModGuid(),
                RaceModObject:GetProgressionUUID(lvl),"Boosts",{"Ability("..ability..","..score..")"})
            end
        end
        if RemovedRaces then
            table.insert(RemovedRaces, RemovedRaces) -- Add to the list if removed
        end
end

local function RemoveClassesASI(lvl, AbilityListUUID)
    AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID

    RAPrint(1, ClassModObject:GetProgressionUUID(1))
    RAPrint(1, string.format("ClassModObject:GetModGuid(): %s", ClassModObject:GetModGuid()))

    if ClassModObject:GetProgressionUUID(lvl) ~= "aaaa" then --rmv after lib finished
        local removedClass = VCHelpers.CF:removeSelectorsPayload(ClassModObject:GetModGuid(),
        ClassModObject:GetProgressionUUID(lvl), "SelectAbilityBonus", AbilityListUUID)
        if removedClass then
            table.insert(RemovedClasses, removedClass) -- Add to the list if removed
        end
    end
end



local function classe5eModule()
    RemovedClasses = {}  -- Table to store classes with removed selectors
    for _, classeMod in ipairs(ClassesLibrary) do
        ClassModObject = ClasseMod:New(classeMod.Name, classeMod.modURL, classeMod.modGuid, classeMod.progressionUUID, classeMod.Author,
        classeMod.SourceBook, classeMod.MainClasse, classeMod.isLvl20, classeMod.isOutdated)
        if ClassModObject:GetProgressionUUID(1) == nil then
            RAWarn(1, string.format("============> ERROR: classeMod.progressionUUID %s.",
            table.dump(ClassModObject:GetProgressionUUID(1))))
        end
        RemoveClassesASI(1)
    end
    RAWarn(2, string.format("RemovedClasses : %s ", RemovedClasses))
    if #RemovedClasses > 0 then  -- Check if any selectors were removed
        local classList = table.concat(RemovedClasses, ", ") -- Create comma-separated list
    BasicWarning(string.format("============> Selectors removed from %d mods: %s", #RemovedClasses, classList))
    end
end

local function race5eModule()
    RemovedRaces = {}
    for _, raceMod in pairs(RaceLibrary) do
        RaceModObject = RaceMod:New(raceMod.Name,raceMod.modURL,raceMod.modGuid,raceMod.progressionUUID,raceMod.Author,
        raceMod.SourceBook,raceMod.MainRace,raceMod.specialAbList,raceMod.Stats,raceMod.Sab,raceMod.bonus,
        raceMod.NoDefStats)

        if PatchAsiDefault == true then
            CleanOnRacesStatsLoaded(1)
            InsertDefaultPayloadASI(1)
        else
            if VCHelpers.ModVars:isModExist(deps.Framework_GUID, RaceModObject:GetModGuid()) then -- présent dans isLoaded
                if RaceModObject:GetSourceBook() == nil or RaceModObject:GetSourceBook() == "" then
                    if PatchAsiHomebrew == true then
                        CleanOnRacesStatsLoaded(1)
                        InsertPayloadRaceASI(1)
                    else
                        --desactive moi ce putain de mod Connard function
                        if RaceModObject:GetNoDefStats() == true then
                            InsertDefaultPayloadASI(1)
                        end
                        RADebug(2, string.format("%s Wasn't fixed. You uncheck Homebrew", RaceModObject:GetName()))
                    end
                end
                for _, book in pairs(Dnd5eLimited) do
                    if book.bookRef == RaceModObject:GetSourceBook() then
                        if PatchAsi5eLimited == true then
                            CleanOnRacesStatsLoaded(1)
                            InsertPayloadRaceASI(1)
                        else
                            if RaceModObject:GetNoDefStats() == true then
                                InsertDefaultPayloadASI(1)
                            end
                                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Limited", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5e) do
                    if book.bookRef == RaceModObject:GetSourceBook() then
                        if PatchAsi5e == true then
                            CleanOnRacesStatsLoaded(1)
                            InsertPayloadRaceASI(1)
                        else
                            if RaceModObject:GetNoDefStats() == true then
                                InsertDefaultPayloadASI(1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5eExtended) do
                    if book.bookRef == RaceModObject:GetSourceBook() then
                        if PatchAsi5eExtended == true then
                            CleanOnRacesStatsLoaded(1)
                            InsertPayloadRaceASI(1)
                        else
                            if RaceModObject:GetNoDefStats() == true then
                                InsertDefaultPayloadASI(1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Extended", RaceModObject:GetName()))
                        end
                    end
                end
                for _, book in pairs(Legacy) do
                    if book.bookRef == RaceModObject:GetSourceBook() then
                        if PatchAsiLegacy == true then
                            CleanOnRacesStatsLoaded(1)
                            InsertPayloadRaceASI(1)
                        else
                            if RaceModObject:GetNoDefStats() == true then
                                InsertDefaultPayloadASI(1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Legacy", RaceModObject:GetName()))
                        end
                    end
                end
                for _, book in pairs(Flavours) do
                    if book.bookRef == RaceModObject:GetSourceBook() then
                        if PatchAsiFlavour == true then
                            CleanOnRacesStatsLoaded(1)
                            InsertPayloadRaceASI(1)
                        else
                            if RaceModObject:GetNoDefStats() == true then
                                InsertDefaultPayloadASI(1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix Flavours", RaceModObject:GetName()))
                        end
                    end
                end
            end
        end
	end
  
end


--- Constructor for builder5eRaces
local function builder5e()
    classe5eModule()
	race5eModule()
    if VCHelpers.ModVars:isModLoaded(deps.MCM_GUID) then
        RAPrint(1, "                               ")
        RAPrint(1, "                               ")
        RAPrint(1, " ----------------------------- ")
        RAPrint(1, " ----------------------------- ")
        RAPrint(1, "Config.MCM.loaded() Happy Fun Gaming!...")
    end
end

if VCHelpers.ModVars:isModLoaded(deps.Framework_GUID) then
    Ext.Events.StatsLoaded:Subscribe(builder5e)
end