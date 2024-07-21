-- temporary require libs here , in futur require to Client/CleanRacesModASI.lua
--Ext.Require("Libs/RacesLibrary.lua")
Ext.Require("Libs/BooksLibrary.lua")


-- temp show var

BasicWarning("PatchAsi5eLimited")
BasicWarning(PatchAsi5eLimited)

BasicWarning("PatchAsi5e")
BasicWarning(PatchAsi5e)

BasicWarning("PatchAsi5eExtended")
BasicWarning(PatchAsi5eExtended)

BasicWarning("PatchAsiLegacy")
BasicWarning(PatchAsiLegacy)

BasicWarning("PatchAsiFlavour")
BasicWarning(PatchAsiFlavour)

BasicWarning("PatchAsiHomebrew")
BasicWarning(PatchAsiHomebrew)

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
            local raceModBonusSize = table.getLength(raceMod.Bonus)
            for i = 1, raceModBonusSize do
                table.insert(RaceStat, raceMod.Bonus[i])
            end
        end
        BasicWarning(string.format("raceMod.Stats: %s\n\n", table.dump(RaceStat)))
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
    if isModExist(raceMod.modGuid) then
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
        if isModExist(raceMod.modGuid) then
        -- special Ability List +x in some ASI or default
            local AbilityListUUID = ""
            if raceMod.specialAbList ~= nil then
                AbilityListUUID = raceMod.specialAbList
            else
                AbilityListUUID = deps.AbilityList_UUID
            end
            payload = createSABPayload(raceMod.modGuid, raceMod.UUID, AbilityListUUID, raceMod.Sab, table.getLength(raceMod.Sab))
            table.insert(fixAsi, raceMod.Name) -- Add to the list if ASI Fixed
            Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
            BasicWarning(string.format("payload InsertSelectors: %s\n\n", table.dump(payload)))
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
            BasicWarning(string.format("payload InsertBoosts: %s\n\n", table.dump(payload)))
        end
	end
    if #fixAsi > 0 then
        BasicWarning("============> Ability added to " ..
                 #fixAsi .. " mods: " ..
                 table.concat(fixAsi, ", "))
    end
end

--- Constructor for insertPayload
---@param raceMod table raceMod
local function insertDefaultPayload(raceMod)
    local baseAsi = {}  -- Table to store classes with removed shit asi
    if isModExist(raceMod.modGuid) then
        payload = createSABPayload(raceMod.modGuid, raceMod.UUID, deps.AbilityList_UUID, {"2","1"}, 2)
        table.insert(baseAsi, raceMod.Name) -- Add to the list if ASI Fixed
        Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
    end
    if #baseAsi > 0 then
        BasicWarning("============> Base +2/+1 Ability added to " ..
                 #baseAsi .. " mods: " ..
                 table.concat(baseAsi, ", "))
    end
end

--- Constructor for builder5eRaces
function builder5eRaces()
	removedRaces = {}  -- Table to store race with removed shit asi
	for _, raceMod in pairs(RaceLibrary) do
		if isModExist(raceMod.modGuid) then -- présent dans isLoaded
			if raceMod.SourceBook == nil or raceMod.SourceBook == "" then
				if PatchAsiHomebrew==true then
					CleanOnRacesStatsLoaded(raceMod)
					insertPayload(raceMod)
				else
					BasicWarning(string.format("%s Wasn't fixed. You uncheck Homebrew", raceMod.Name))
				end
			end
			for _, book in pairs(Dnd5eLimited) do
				if book.bookRef == raceMod.SourceBook then
					if PatchAsi5eLimited == true then
						CleanOnRacesStatsLoaded(raceMod)
						insertPayload(raceMod)
					else
						BasicWarning(string.format("%s Wasn't fixed. You uncheck Fix 5e Limited", raceMod.Name))
					end
				end
			end
			for _, book in pairs(Dnd5e) do
				if book.bookRef == raceMod.SourceBook then
					if PatchAsi5e == true then
						CleanOnRacesStatsLoaded(raceMod)
						insertPayload(raceMod)
					else
						BasicWarning(string.format("%s Wasn't fixed. You uncheck Fix 5e", raceMod.Name))
					end
				end
			end
			for _, book in pairs(Dnd5eExtended) do
				if book.bookRef == raceMod.SourceBook then
					if PatchAsi5eExtended == true then
						CleanOnRacesStatsLoaded(raceMod)
						insertPayload(raceMod)
					else
						BasicWarning(string.format("%s Wasn't fixed. You uncheck Fix 5e Extended", raceMod.Name))
					end
				end
			end
			for _, book in pairs(Legacy) do
				if book.bookRef == raceMod.SourceBook then
					if PatchAsiLegacy == true then
						CleanOnRacesStatsLoaded(raceMod)
						insertPayload(raceMod)
					else
						BasicWarning(string.format("%s Wasn't fixed. You uncheck Fix 5e Legacy", raceMod.Name))
					end
				end
			end
			for _, book in pairs(Flavours) do
				if book.bookRef == raceMod.SourceBook then
					if PatchAsiFlavour == true then
						CleanOnRacesStatsLoaded(raceMod)
						insertPayload(raceMod)
					else
						BasicWarning(string.format("%s Wasn't fixed. You uncheck Fix Flavours", raceMod.Name))
					end
				end
			end
		end
	end
end

if Ext.Mod.IsModLoaded(deps.Framework_GUID) then
    Ext.Events.StatsLoaded:Subscribe(builder5eRaces)
end