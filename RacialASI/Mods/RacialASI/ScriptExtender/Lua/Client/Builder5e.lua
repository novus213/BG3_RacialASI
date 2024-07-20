-- temporary require libs here , in futur require to Client/CleanRacesModASI.lua
--Ext.Require("Libs/RacesLibrary.lua")
Ext.Require("Libs/BooksLibrary.lua")


-- temp show var

BasicWarning("IgnoreAll")
BasicWarning(IgnoreAll)

BasicWarning("Ignore5eLimited")
BasicWarning(Ignore5eLimited)

BasicWarning("Ignore5e")
BasicWarning(Ignore5e)

BasicWarning("Ignore5eExtended")
BasicWarning(Ignore5eExtended)

BasicWarning("IgnoreFlavours")
BasicWarning(IgnoreFlavours)

BasicWarning("IgnoreLegacy")
BasicWarning(IgnoreLegacy)

BasicWarning("IgnoreHomebrew")
BasicWarning(IgnoreHomebrew)


--- Constructor for tableInsertRaceStats
---@param raceMod table raceMod
---@return table RaceStat
local function tableInsertRaceStats(raceMod)
    local RaceStat = {}
    local StatsList = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}
	if raceMod.Stats ~= nil then
		for i = 1, 6 do
			table.insert(RaceStat, "Ability(" .. StatsList[i] .. "," .. raceMod.Stats[i] .. ")")
		end
        if raceMod.Bonus ~= nil then
            for _, bonusRaceMod in pairs(raceMod.Bonus) do
                table.insert(RaceStat, bonusRaceMod.Bonus[_])

                BasicPrint(string.format("raceMod.Bonus[bonusRaceMod] XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX: %s\r\r", bonusRaceMod[_]))
            end
        end
        BasicWarning(string.format("raceMod.Stats: %s\r\r", table.dump(raceMod.Stats)))
		return RaceStat
	end
end



--- Constructor for createSABPayload
---@param uuid string race Progression.lsx Level 1 UUID
---@param modGuid string race mod modGuid
---@param sabUUID string SelectAbilityBonus UUID
---@return table payload
local function createSABPayload(modGuid, uuid, sabUUID, sab, sabAmount)
    return {
        Target = uuid,
        FileType = "Progression",
        Function = "SelectAbilityBonus",
        modGuid = modGuid,
        Params = {
            Guid = sabUUID,
            Amount = sabAmount,
            Amounts = sab,
            BonusType = "AbilityBonus"
        }
    }
end


--- Constructor for createBoostPayload
---@param uuid string race Progression.lsx Level 1 UUID
---@param modGuid string race mod modGuid
---@param ability string ability DnD (Strength ect.)
---@param score integer ability score
---@return table payload
local function createBoostPayload(modGuid, uuid, strings)
    return {
        modGuid = modGuid,
        Target = uuid,
        FileType = "Progression",
        Type = "Boosts",
        Strings = strings
      }
end


--- Constructor for RemoveRacePayload
---@param raceMod table raceMod
local function removeRacePayload(raceMod)
    local removedModRace = {}  -- Table to store classes with removed shit asi
    if Ext.Mod.IsModLoaded(deps.Framework_GUID) and Ext.Mod.IsModLoaded(raceMod.modGuid) then
            table.insert(removedModRace, raceMod.Name) -- Add to the list if ASI Fixed
            Ext.Net.PostMessageToServer("MU_Request_Server_Uninstall_Mod", Ext.Json.Stringify({
            modUUID = raceMod.modGuid
        }))
    end
    if #removedModRace > 0 then
        BasicWarning("============> Ability added to " ..
                 #removedModRace .. " mods: " ..
                 table.concat(removedModRace, ", "))
    end
end



--- Constructor for insertPayload
---@param raceMod table raceMod
local function insertPayload(raceMod)
local fixAsi = {}  -- Table to store classes with removed shit asi
	if raceMod.Sab ~= nil then
        local payload = {}
        if Ext.Mod.IsModLoaded(deps.Framework_GUID) and Ext.Mod.IsModLoaded(raceMod.modGuid) then
            payload = createSABPayload(raceMod.modGuid, raceMod.UUID, deps.AbilityList_UUID, raceMod.Sab, table.getLength(raceMod.Sab))
            table.insert(fixAsi, raceMod.Name) -- Add to the list if ASI Fixed
            Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
            BasicWarning(string.format("payload InsertSelectors: %s\r\r", table.dump(payload)))
        end
	end

	if raceMod.Stats ~= nil then
        local payload = {}
        if Ext.Mod.IsModLoaded(deps.Framework_GUID) and Ext.Mod.IsModLoaded(raceMod.modGuid) then
            local raceModStats = tableInsertRaceStats(raceMod)
            payload = createBoostPayload(raceMod.modGuid, raceMod.UUID, raceModStats)
            if raceMod.Stats ~= nil and raceMod.Sab == nil then
                table.insert(fixAsi, raceMod.Name) -- Add to the list if ASI Fixed
            end
            Mods.SubclassCompatibilityFramework.Api.InsertBoosts({payload})
            BasicWarning(string.format("payload InsertBoosts: %s\r\r", table.dump(payload)))
        end
	end
    if #fixAsi > 0 then
        BasicWarning("============> Ability added to " ..
                 #fixAsi .. " mods: " ..
                 table.concat(fixAsi, ", "))
    end
end

--- Constructor for builder5eRaces
function builder5eRaces()
    if IgnoreAll == false then
        --RaceStat = {}
        for _, raceMod in pairs(RaceLibrary) do
            if raceMod.SourceBook == nil or raceMod.SourceBook == "" then
                if IgnoreHomebrew == false then
                    insertPayload(raceMod)
                end
            else
                if Ignore5eLimited == false then
                    for _, book in pairs(Dnd5eLimited) do
                        if book.bookRef == raceMod.SourceBook then
                            insertPayload(raceMod)
                        end
                    end
                    if Ignore5e == false then
                        for _, book in pairs(Dnd5e) do
                            if book.bookRef == raceMod.SourceBook then
                                insertPayload(raceMod)
                            end
                        end
                        if Ignore5eExtended == false then
                            for _, book in pairs(Dnd5eExtended) do
                                if book.bookRef == raceMod.SourceBook then
                                    insertPayload(raceMod)
                                end
                            end
                            if IgnoreLegacy == false then
                                for _, book in pairs(Legacy) do
                                    if book.bookRef == raceMod.SourceBook then
                                        insertPayload(raceMod)
                                    end
                                end
                                if IgnoreFlavours == false then
                                    for _, book in pairs(Flavours) do
                                        if book.bookRef == raceMod.SourceBook then
                                            insertPayload(raceMod)
                                        end
                                    end
                                else
                                    BasicWarning(string.format("Ignore Adding: %s due to IgnoreFlavours = True", raceMod.Name))
                                    --print("Ignore Adding: " .. raceMod.Name .. " due to IgnoreFlavours = True")
                                    --removeRacePayload(raceMod)
                                end
                            else
                                BasicWarning(string.format("Ignore Adding: %s due to IgnoreLegacy = True", raceMod.Name))
                                --print("Ignore Adding: " .. raceMod.Name .. " due to IgnoreLegacy = True")
                                --removeRacePayload(raceMod)
                            end
                        else
                            BasicWarning(string.format("Ignore Adding: %s due to Ignore5eExtended = True", raceMod.Name))
                            --print("Ignore Adding: " .. raceMod.Name .. " due to Ignore5eExtended = True")
                            --removeRacePayload(raceMod)
                        end
                    else
                        BasicWarning(string.format("Ignore Adding: %s due to Ignore5e = True", raceMod.Name))
                        --print("Ignore Adding: " .. raceMod.Name .. " due to Ignore5e = True")
                        --removeRacePayload(raceMod)
                    end
                else
                    BasicWarning(string.format("Ignore Adding: %s due to IgnoreLimited = True", raceMod.Name))
                    --print("Ignore Adding: " .. raceMod.Name .. " due to IgnoreLimited = True")
                    --removeRacePayload(raceMod)
                end
            end
            --RaceStat =  {}
        end
    else
        BasicWarning("Ignore Adding the races ASI")
        --print("Ignore Adding the races ASI")
    end
end


--test execute ?
--builder5eRaces()
--or idk to TEST
if Ext.Mod.IsModLoaded(deps.Framework_GUID) then
    Ext.Events.StatsLoaded:Subscribe(builder5eRaces)
end