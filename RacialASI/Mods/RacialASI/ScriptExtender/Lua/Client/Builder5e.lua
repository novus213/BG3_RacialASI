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
local function TableInsertRaceStats(raceMod)
    local RaceStat = {}
	if raceMod.stats ~= nil then
		for i = 1, 6 do
			table.insert(RaceStat, "Ability(" .. raceMod.statsList[i] .. "," .. raceMod.stats[i] .. ")")
		end
        if raceMod.bonus ~= nil then
            local raceModBonusSize = table.getLength(raceMod.bonus)
            for i = 1, raceModBonusSize do
                table.insert(RaceStat, raceMod.bonus[i])
            end
        end
        RAPrint(1, "raceMod.Stats: " .. RADumpArray(RaceStat))

		return RaceStat
	end
end

--- Function for InsertPayloadRaceASI
local function InsertPayloadRaceASI(raceMod, lvl)
local fixAsi = {}  -- Table to store classes with removed shit asi
	if raceMod.sab ~= nil then
        local payload = {}
        if raceMod.modGuid and VCHelpers.ModVars:isModLoaded(raceMod.modGuid) then
        -- special Ability List +x in some ASI or default
            local AbilityListUUID = ""
            if raceMod.specialAbList ~= nil then
                AbilityListUUID = raceMod.specialAbList
            else
                AbilityListUUID = deps.AbilityList_UUID
            end

            payload = VCHelpers.CF:InsertSelectorsPayload(raceMod.modGuid, raceMod.progressionUUID[lvl], AbilityListUUID, raceMod.sab, table.getLength(raceMod.sab))

            table.insert(fixAsi, raceMod.name) -- Add to the list if ASI Fixed

            if VCHelpers.CF:checkSCF() then
                Mods.SubclassCompatibilityFramework.Api.InsertSelectors(payload)
                RAPrint(1, "payload InsertSelectors: " .. RADumpArray(fixAsi) .. "\n\n")
            end
        end
	end
	if raceMod.stats ~= nil then
        local payload = {}
        if raceMod.modGuid and VCHelpers.ModVars:isModLoaded(raceMod.modGuid) then

            local raceModStats = TableInsertRaceStats(raceMod)
            payload = VCHelpers.CF:addStringPayload(raceMod.modGuid, raceMod.progressionUUID[lvl], "Boosts", raceModStats)

            if raceMod.stats ~= nil and raceMod.sab == nil then
                table.insert(fixAsi, raceMod.name) -- Add to the list if ASI Fixed
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

local function InsertDefaultPayloadASI(raceMod, lvl, AbilityListUUID)
    local baseAsi = {}  -- Table to store classes with removed shit asi
    local payload = {}
    AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
    if raceMod.modGuid and VCHelpers.ModVars:isModLoaded(raceMod.modGuid) then
        payload =  VCHelpers.CF:InsertSelectorsPayload(raceMod.modGuid, raceMod.progressionUUID[lvl], "SelectAbilityBonus",
        AbilityListUUID, {"2","1"}, 2, "AbilityBonus")
        table.insert(baseAsi, raceMod.name) -- Add to the list if ASI Fixed

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


local function CleanOnRacesStatsLoaded(raceMod, lvl, AbilityListUUID)
        AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
        local stats = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}
        -- remove +2+1, +1, +1+1 ect..
        local payload = VCHelpers.CF:removeSelectorsPayload(raceMod.modGuid, raceMod.progressionUUID[lvl], "SelectAbilityBonus",
        AbilityListUUID)

        if VCHelpers.CF:checkSCF() then
            Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(payload)
            --RAPrint(1, "payload InsertSelectors: " .. RADumpArray(payload) .. "\n\n")
        end
        -- remove Boost Ability
        for _, ability in ipairs(stats) do
            for score=-5,5 do -- change to -5 5 to low balancing charge server
                RemovedRaces = VCHelpers.CF:removeStringPayload(raceMod.modGuid, raceMod.progressionUUID, "Boosts",{"Ability("..ability..","..score..")"})
            end
        end
        if RemovedRaces then
            table.insert(RemovedRaces, RemovedRaces) -- Add to the list if removed
        end
end

local function RemoveClassesASI(classeMod, lvl, AbilityListUUID)
    AbilityListUUID = AbilityListUUID or deps.AbilityList_UUID
    if classeMod.progressionUUID[lvl] ~= "aaaa" then --rmv after lib finished
            local removedClass = VCHelpers.CF:removeSelectorsPayload(classeMod.modGuid, classeMod.progressionUUID[lvl],
        "SelectAbilityBonus", deps.AbilityList_UUID)
            if removedClass then
                table.insert(RemovedClasses, removedClass) -- Add to the list if removed
            end
        end
end


local function classe5eModule()
    RemovedClasses = {}  -- Table to store classes with removed selectors
    for _, classeMod in ipairs(ClassesLibrary) do
        ClasseMod:New(classeMod.Name, classeMod.modURL, classeMod.modGuid, classeMod.progressionUUID, classeMod.Author,
        classeMod.SourceBook, classeMod.MainClasse, classeMod.isLvl20, classeMod.isOutdated)
        RAWarn(1, string.format("============> ERROR: classeMod.progressionUUID %s.",table.dump(classeMod.progressionUUID)))
        RemoveClassesASI(classeMod,1)
    end
end

local function race5eModule()
    RemovedRaces = {}
    for _, raceMod in pairs(RaceLibrary) do
        RaceMod:New(raceMod.Name,raceMod.modURL,raceMod.modGuid,raceMod.progressionUUID,raceMod.Author,raceMod.SourceBook,
        raceMod.MainRace,raceMod.specialAbList,raceMod.Stats,raceMod.Sab,raceMod.bonus)

        if PatchAsiDefault == true then
            CleanOnRacesStatsLoaded(raceMod,1)
            insertDefaultPayloadASI(raceMod,1)
        else
            if VCHelpers.ModVars:isModExist(deps.Framework_GUID, raceMod.modGuid) then -- présent dans isLoaded
                if raceMod.SourceBook == nil or raceMod.SourceBook == "" then
                    if PatchAsiHomebrew == true then
                        CleanOnRacesStatsLoaded(raceMod,1)
                        InsertPayloadRaceASI(raceMod,1)
                    else
                        --desactive moi ce putain de mod Connard function
                        if raceMod.NoDefStats == true then
                            InsertDefaultPayloadASI(raceMod,1)
                        end
                        RADebug(2, string.format("%s Wasn't fixed. You uncheck Homebrew", raceMod.Name))
                    end
                end
                for _, book in pairs(Dnd5eLimited) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsi5eLimited == true then
                            CleanOnRacesStatsLoaded(raceMod,1)
                            InsertPayloadRaceASI(raceMod,1)
                        else
                            if raceMod.NoDefStats == true then
                                InsertDefaultPayloadASI(raceMod,1)
                            end
                                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Limited", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5e) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsi5e == true then
                            CleanOnRacesStatsLoaded(raceMod,1)
                            InsertPayloadRaceASI(raceMod,1)
                        else
                            if raceMod.NoDefStats == true then
                                InsertDefaultPayloadASI(raceMod,1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5eExtended) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsi5eExtended == true then
                            CleanOnRacesStatsLoaded(raceMod,1)
                            InsertPayloadRaceASI(raceMod,1)
                        else
                            if raceMod.NoDefStats == true then
                                InsertDefaultPayloadASI(raceMod,1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Extended", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Legacy) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsiLegacy == true then
                            CleanOnRacesStatsLoaded(raceMod,1)
                            InsertPayloadRaceASI(raceMod,1)
                        else
                            if raceMod.NoDefStats == true then
                                InsertDefaultPayloadASI(raceMod,1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Legacy", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Flavours) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsiFlavour == true then
                            CleanOnRacesStatsLoaded(raceMod,1)
                            InsertPayloadRaceASI(raceMod,1)
                        else
                            if raceMod.NoDefStats == true then
                                InsertDefaultPayloadASI(raceMod,1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix Flavours", raceMod.Name))
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
    if isModLoaded(deps.MCM_GUID) then
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