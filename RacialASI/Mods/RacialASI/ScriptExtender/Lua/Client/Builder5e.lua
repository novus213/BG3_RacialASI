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



--local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

StatsList = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}


--- Constructor for tableInsertRaceStats
---@param raceMod table raceMod
function tableInsertRaceStats(raceMod)
	if raceMod.Stats ~= nil then
		for i = 1, 6 do
			table.insert(RaceStat, "Ability(" .. StatsList[i] .. "," .. raceMod.Stats[i] .. ")")
		end
		raceMod.Stats = RaceStat
        BasicWarning(string.format("raceMod ============> %s", raceMod))
		print("raceMod:", table.dump(raceMod))
	end
end


--- Constructor for createPayloadRaceStats
---@param raceMod table raceMod
function createPayloadRaceStats(raceMod)
local payload = {
		modGuid = raceMod.modGuid,
		Target = raceMod.UUID,
		FileType = "Progression"
		}

	if raceMod.Sab ~= nil then
		payload.Function = "SelectAbilityBonus"
		payload.Params = {
			Guid = deps.AbilityList_UUID,
			Amount = table.getLength(raceMod.Sab),
			BonusType = "AbilityBonus",
			Amounts = raceMod.Sab
		}
        Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
        BasicWarning("payload: %s", table.dump(payload))
	end

	if raceMod.Stats ~= nil then
		payload.Type = "Boosts"
		payload.Strings = raceMod.Strings
		Mods.SubclassCompatibilityFramework.Api.InsertBoosts({payload})
	end

    BasicWarning("payload: %s", table.dump(payload))
end

--- Constructor for builder5eRaces
function builder5eRaces()
    if IgnoreAll == false then
        RaceStat =  {}
        for _, raceMod in pairs(RaceLibrary) do
            if raceMod.SourceBook == nil or raceMod.SourceBook == "" then
                if IgnoreHomebrew == false then
                    BasicWarning(string.format("Le mod : %s est bien dans la liste", raceMod.Name))
                    -- Add Stats
                    -- Add Sab
                    tableInsertRaceStats(raceMod)
                    createPayloadRaceStats(raceMod)
                    BasicWarning(string.format("Add the Homebrew race: %s", raceMod.Name))
                    --print("Add the Homebrew race: " .. raceMod.Name)
                else
                    --print("Ignore cleaning: " .. raceMod.Name .. " due to IgnoreHomebrew = True")
                    BasicWarning(string.format("Ignore Adding: %s due to IgnoreHomebrew = True", raceMod.Name))
                end
            else
                if Ignore5eLimited == false then
                    for _, book in pairs(Dnd5eLimited) do
                        if book.bookRef == raceMod.SourceBook then
                            tableInsertRaceStats(raceMod)
                            createPayloadRaceStats(raceMod)
                            -- Add Stats
                            -- Add Sab
                            BasicWarning(string.format("Add the 5eLimited race: %s", raceMod.Name))
                            --print("Add the 5eLimited race: " .. raceMod.Name)
                        end
                    end
                    if Ignore5e == false then
                        for _, book in pairs(Dnd5e) do
                            if book.bookRef == raceMod.SourceBook then
                                tableInsertRaceStats(raceMod)
                                createPayloadRaceStats(raceMod)
                                -- Add Stats
                                -- Add Sab
                                BasicWarning(string.format("Add the 5e race: %s", raceMod.Name))
                                --print("Add the 5e race: " .. raceMod.Name)
                            end
                        end
                        if Ignore5eExtended == false then
                            for _, book in pairs(Dnd5eExtended) do
                                if book.bookRef == raceMod.SourceBook then
                                    tableInsertRaceStats(raceMod)
                                    createPayloadRaceStats(raceMod)
                                    -- Add Stats
                                    -- Add Sab
                                    BasicWarning(string.format("Add the 5eExtended race: %s", raceMod.Name))
                                    --print("Add the 5eExtended race: " .. raceMod.Name)
                                end
                            end
                            if IgnoreLegacy == false then
                                for _, book in pairs(Legacy) do
                                    if book.bookRef == raceMod.SourceBook then
                                        tableInsertRaceStats(raceMod)
                                        createPayloadRaceStats(raceMod)
                                        -- Add Stats
                                        -- Add Sab
                                        BasicWarning(string.format("Add the Legacy race: %s", raceMod.Name))
                                        --print("Add the Legacy race: " .. raceMod.Name)
                                    end
                                end
                                if IgnoreFlavours == false then
                                    for _, book in pairs(Flavours) do
                                        if book.bookRef == raceMod.SourceBook then
                                            tableInsertRaceStats(raceMod)
                                            createPayloadRaceStats(raceMod)
                                            -- Add Stats
                                            -- Add Sab
                                            BasicWarning(string.format("Add the Flavours race: %s", raceMod.Name))
                                            --print("Add the Flavours race: " .. raceMod.Name)
                                        end
                                    end
                                else
                                    BasicWarning(string.format("Ignore Adding: %s due to IgnoreFlavours = True", raceMod.Name))
                                    --print("Ignore Adding: " .. raceMod.Name .. " due to IgnoreFlavours = True")
                                end
                            else
                                BasicWarning(string.format("Ignore Adding: %s due to IgnoreLegacy = True", raceMod.Name))
                                --print("Ignore Adding: " .. raceMod.Name .. " due to IgnoreLegacy = True")
                            end
                        else
                            BasicWarning(string.format("Ignore Adding: %s due to Ignore5eExtended = True", raceMod.Name))
                            --print("Ignore Adding: " .. raceMod.Name .. " due to Ignore5eExtended = True")
                        end
                    else
                        BasicWarning(string.format("Ignore Adding: %s due to Ignore5e = True", raceMod.Name))
                        --print("Ignore Adding: " .. raceMod.Name .. " due to Ignore5e = True")
                    end
                else
                    BasicWarning(string.format("Ignore Adding: %s due to IgnoreLimited = True", raceMod.Name))
                    --print("Ignore Adding: " .. raceMod.Name .. " due to IgnoreLimited = True")
                end
            end
            RaceStat =  {}
        end
    else
        BasicWarning("Ignore Adding the races ASI")
        --print("Ignore Adding the races ASI")
    end
end


--test execute ?
--builder5eRaces()
--or idk to TEST
Ext.Events.StatsLoaded:Subscribe(builder5eRaces)