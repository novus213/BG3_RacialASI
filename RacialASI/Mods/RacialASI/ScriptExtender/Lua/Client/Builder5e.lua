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

local function classe5eModule()
    --local removedClasses = {}  -- Table to store classes with removed selectors
    for _, classeMod in ipairs(ClassesLibrary) do
        local classModObject = ClasseMod:New(classeMod.Name, classeMod.modURL, classeMod.modGuid, classeMod.progressionUUID, classeMod.Author,
        classeMod.SourceBook, classeMod.MainClasse, classeMod.isLvl20, classeMod.isOutdated)
        --local removedClass =
        ClasseMod:RemoveClassesASI(classModObject, 1)
        --[[
        if removedClass then
                table.insert(removedClasses, removedClass) -- Add to the list if removed
        end
        ]]--
    end
    --[[
    BasicPrint(table.dump(removedClasses))
    if #removedClasses > 0 then
        local classList = table.concat(removedClasses, ", ")
    BasicWarning(string.format("============> Selectors removed from %d mods: %s", #removedClasses, classList))
    end
    ]]--
end

local function race5eModule()
    RemovedRaces = {}
    for _, raceMod in pairs(RaceLibrary) do
        local raceModObject = RaceMod:New(raceMod.Name,raceMod.modURL,raceMod.modGuid,raceMod.progressionUUID,raceMod.Author,
        raceMod.SourceBook,raceMod.MainRace,raceMod.specialAbList,raceMod.Stats,raceMod.Sab,raceMod.bonus,
        raceMod.NoDefStats)

        if PatchAsiDefault == true then
            RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
            RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
        else
            if VCHelpers.ModVars:IsModExist(Data.Deps.Framework_GUID, raceModObject:GetModGuid()) then -- présent dans isLoaded
                if raceModObject:GetSourceBook() == nil or raceModObject:GetSourceBook() == "" then
                    if PatchAsiHomebrew == true then
                        RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                        RaceMod:InsertPayloadRaceASI(raceModObject, 1)
                    else
                        --desactive moi ce putain de mod Connard function
                        if raceModObject:GetNoDefStats() == true then
                            RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                        end
                        RADebug(2, string.format("%s Wasn't fixed. You uncheck Homebrew", raceModObject:GetName()))
                    end
                end
                for _, book in pairs(Dnd5eLimited) do
                    if book.bookRef == raceModObject:GetSourceBook() then
                        if PatchAsi5eLimited == true then
                            RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                            RaceMod:InsertPayloadRaceASI(raceModObject, 1)
                        else
                            if raceModObject:GetNoDefStats() == true then
                                RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                            end
                                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Limited", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5e) do
                    if book.bookRef == raceModObject:GetSourceBook() then
                        if PatchAsi5e == true then
                            RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                            RaceMod:InsertPayloadRaceASI(raceModObject, 1)
                        else
                            if raceModObject:GetNoDefStats() == true then
                                RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5eExtended) do
                    if book.bookRef == raceModObject:GetSourceBook() then
                        if PatchAsi5eExtended == true then
                            RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                            RaceMod:InsertPayloadRaceASI(raceModObject, 1)
                        else
                            if raceModObject:GetNoDefStats() == true then
                                RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Extended", raceModObject:GetName()))
                        end
                    end
                end
                for _, book in pairs(Legacy) do
                    if book.bookRef == raceModObject:GetSourceBook() then
                        if PatchAsiLegacy == true then
                            RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                            RaceMod:InsertPayloadRaceASI(raceModObject, 1)
                        else
                            if raceModObject:GetNoDefStats() == true then
                                RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Legacy", raceModObject:GetName()))
                        end
                    end
                end
                for _, book in pairs(Flavours) do
                    if book.bookRef == raceModObject:GetSourceBook() then
                        if PatchAsiFlavour == true then
                            RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                            RaceMod:InsertPayloadRaceASI(raceModObject, 1)
                        else
                            if raceModObject:GetNoDefStats() == true then
                                RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix Flavours", raceModObject:GetName()))
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
    if VCHelpers.ModVars:IsModLoaded(Data.Deps.MCM_GUID) then
        RAPrint(1, "                               ")
        RAPrint(1, "                               ")
        RAPrint(1, " ----------------------------- ")
        RAPrint(1, " ----------------------------- ")
        RAPrint(1, "Config.MCM.loaded() Happy Fun Gaming!...")
    end
end

if VCHelpers.ModVars:IsModLoaded(Data.Deps.Framework_GUID) then
    Ext.Events.StatsLoaded:Subscribe(builder5e)
end