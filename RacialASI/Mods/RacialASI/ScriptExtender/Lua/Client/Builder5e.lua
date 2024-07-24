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

RAPrint(1, "PatchAsi5eLimited: " .. PatchAsi5eLimited)
RAPrint(1, "PatchAsi5e: " .. PatchAsi5e)
RAPrint(1, "PatchAsi5eExtended: " .. PatchAsi5eExtended)
RAPrint(1, "PatchAsiLegacy: " .. PatchAsiLegacy)
RAPrint(1, "PatchAsiFlavour: " .. PatchAsiFlavour)
RAPrint(1, "PatchAsiHomebrew: " .. PatchAsiHomebrew)



--[[
_________ .__                         _________ .__                                       __________    _____         .__       .__      _____    _________.___ 
\_   ___ \|  |   ____ _____    ____   \_   ___ \|  | _____    ______ ______ ____   ______ \______   \  /  _  \   ____ |__|____  |  |    /  _  \  /   _____/|   |
/    \  \/|  | _/ __ \\__  \  /    \  /    \  \/|  | \__  \  /  ___//  ___// __ \ /  ___/  |       _/ /  /_\  \_/ ___\|  \__  \ |  |   /  /_\  \ \_____  \ |   |
\     \___|  |_\  ___/ / __ \|   |  \ \     \___|  |__/ __ \_\___ \ \___ \\  ___/ \___ \   |    |   \/    |    \  \___|  |/ __ \|  |__/    |    \/        \|   |
 \______  /____/\___  >____  /___|  /  \______  /____(____  /____  >____  >\___  >____  >  |____|_  /\____|__  /\___  >__(____  /____/\____|__  /_______  /|___|
        \/          \/     \/     \/          \/          \/     \/     \/     \/     \/          \/         \/     \/        \/              \/        \/      
        \_Clean Classes ModASI
]]--

local function classe5eModule()
    local removedClasses = {}  -- Table to store classes with removed selectors
    for _, classeMod in ipairs(ClassesLibrary) do
        ClasseMod:New(classeMod.Name, classeMod.modURL, classeMod.modGuid, classeMod.progressionUUID, classeMod.Author,
        classeMod.SourceBook, classeMod.MainClasse, classeMod.isLvl20, classeMod.isOutdated)
        if classeMod.UUID ~= "aaaa" then --rmv after lib finished
            local removedClass = VCHelpers.CF:removeSelectorsPayload(classeMod.modGuid, classeMod.progressionUUID[1],
            "SelectAbilityBonus", Deps.AbilityList_UUID)
            if removedClass then
                table.insert(removedClasses, removedClass) -- Add to the list if removed
            end
        end
    end
end

local function race5eModule()
    removedRaces = {}  -- Table to store race with removed shit asi
    -- on test si le mec a coché dans mcm default payload si oui on fait un for each for _, raceMod in pairs(RaceLibrary) do  RaceMod:CleanOnRacesStatsLoaded(raceMod) et insertDefaultPayload(raceMod)
    for _, raceMod in pairs(RaceLibrary) do
        RaceMod:New(raceMod.Name,raceMod.modURL,raceMod.modGuid,raceMod.progressionUUID,raceMod.Author,raceMod.SourceBook,
        raceMod.MainRace,raceMod.specialAbList,raceMod.Stats,raceMod.Sab,raceMod.bonus)
        if PatchAsiDefault == true then
            RaceMod:CleanOnRacesStatsLoaded(1)
            RaceMod:insertDefaultPayloadASI()
        else
            if VCHelpers.ModVars:isModExist(deps.Framework_GUID, raceMod.modGuid) then -- présent dans isLoaded
                if raceMod.SourceBook == nil or raceMod.SourceBook == "" then
                    if PatchAsiHomebrew == true then
                         RaceMod:CleanOnRacesStatsLoaded(1)
                        RaceMod:InsertPayloadRaceASI()
                    else
                        --desactive moi ce putain de mod Connard function
                        if raceMod.NoDefStats == true then
                            RaceMod:insertDefaultPayloadASI()
                        end
                        RADebug(2, string.format("%s Wasn't fixed. You uncheck Homebrew", raceMod.Name))
                    end
                end
                for _, book in pairs(Dnd5eLimited) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsi5eLimited == true then
                             RaceMod:CleanOnRacesStatsLoaded(1)
                            RaceMod:InsertPayloadRaceASI()
                        else
                            if raceMod.NoDefStats == true then
                                RaceMod:insertDefaultPayloadASI()
                            end
                                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Limited", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5e) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsi5e == true then
                             RaceMod:CleanOnRacesStatsLoaded(1)
                            RaceMod:InsertPayloadRaceASI()
                        else
                            if raceMod.NoDefStats == true then
                                RaceMod:insertDefaultPayloadASI()
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Dnd5eExtended) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsi5eExtended == true then
                             RaceMod:CleanOnRacesStatsLoaded(1)
                            RaceMod:InsertPayloadRaceASI()
                        else
                            if raceMod.NoDefStats == true then
                                RaceMod:insertDefaultPayloadASI()
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Extended", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Legacy) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsiLegacy == true then
                             RaceMod:CleanOnRacesStatsLoaded(1)
                            RaceMod:InsertPayloadRaceASI()
                        else
                            if raceMod.NoDefStats == true then
                                RaceMod:insertDefaultPayloadASI()
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Legacy", raceMod.Name))
                        end
                    end
                end
                for _, book in pairs(Flavours) do
                    if book.bookRef == raceMod.SourceBook then
                        if PatchAsiFlavour == true then
                             RaceMod:CleanOnRacesStatsLoaded(1)
                            RaceMod:InsertPayloadRaceASI()
                        else
                            if raceMod.NoDefStats == true then
                                RaceMod:insertDefaultPayloadASI()
                            end
                            RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix Flavours", raceMod.Name))
                        end
                    end
                end
            end
        end
	end
    if #removedRaces > 0 then
        RADebug(2, "============> Ability boost remove to " ..
                 #removedRaces .. " mods: " ..
                 table.concat(removedRaces, ", "))
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