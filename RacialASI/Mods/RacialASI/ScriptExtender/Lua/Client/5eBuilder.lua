Ext.Require("Libs/RacesLibrary.lua")
Ext.Require("Libs/BooksLibrary.lua")


-- move the Vars to helpers
print("IgnoreAll")
print(IgnoreAll)

print("Ignore5eLimited")
print(Ignore5eLimited)

print("Ignore5e")
print(Ignore5e)

print("Ignore5eExtended")
print(Ignore5eExtended)

print("IgnoreFlavours")
print(IgnoreFlavours)

print("IgnoreLegacy")
print(IgnoreLegacy)

print("IgnoreHomebrew")
print(IgnoreHomebrew)





function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

--SearchedMod = "f4361c10-b197-4490-ae30-06ce796f950e"
StatsList = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}

function tableInsertRaceStats(raceMod)
	if raceMod.Stats ~= nil then
		for i = 1, 6 do
			table.insert(RaceStat, "Ability(" .. StatsList[i] .. "," .. raceMod.Stats[i] .. ")")
		end
		raceMod.Stats = RaceStat
		print("raceMod:", dump(raceMod))
	end
end


function createPayloadRaceStats(raceMod)

local payload = {
		modGuid = raceMod.modGuid,
		Target = raceMod.UUID,
		FileType = "Progression"
		}

	if raceMod.Sab ~= nil then
		payload.Function = "SelectAbilityBonus"
		payload.Params = {
			Guid = AbilityList_UUID,
			Amount = tablelength(raceMod.Sab),
			BonusType = "AbilityBonus",
			Amounts = raceMod.Sab
		}
		Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
	end

	if raceMod.Stats ~= nil then
		payload.Type = "Boosts"
		payload.Strings = raceMod.Strings
		Mods.SubclassCompatibilityFramework.Api.InsertBoosts({payload})
	end
	print("payload:", dump(payload))
--return payload
end



if IgnoreAll == false then
	for _, raceMod in pairs(RaceLibrary) do
		RaceStat =  {}
		if raceMod.SourceBook == nil or raceMod.SourceBook == "" then
			if IgnoreHomebrew == false then
				print("Le mod : " .. raceMod.Name .. " est bien dans la liste")
				-- Add Stats
				-- Add Sab
				tableInsertRaceStats(raceMod)
				createPayloadRaceStats(raceMod)
				print("Clean the Homebrew race: " .. raceMod.Name)
			else
				print("Ignore cleaning: " .. raceMod.Name .. " due to IgnoreHomebrew = True")
			end
		else
			if Ignore5eLimited == false then
				for _, book in pairs(Dnd5eLimited) do
					if book.bookRef == raceMod.SourceBook then
						tableInsertRaceStats(raceMod)
						createPayloadRaceStats(raceMod)
						-- Add Stats
						-- Add Sab
						print("Clean the 5eLimited race: " .. raceMod.Name)
					end
				end
				if Ignore5e == false then
					for _, book in pairs(Dnd5e) do
						if book.bookRef == raceMod.SourceBook then
							tableInsertRaceStats(raceMod)
							createPayloadRaceStats(raceMod)
							-- Add Stats
							-- Add Sab
							print("Clean the 5e race: " .. raceMod.Name)
						end
					end
					if Ignore5eExtended == false then
						for _, book in pairs(Dnd5eExtended) do
							if book.bookRef == raceMod.SourceBook then
								tableInsertRaceStats(raceMod)
								createPayloadRaceStats(raceMod)
								-- Add Stats
								-- Add Sab
								print("Clean the 5eExtended race: " .. raceMod.Name)
							end
						end
						if IgnoreLegacy == false then
							for _, book in pairs(Legacy) do
								if book.bookRef == raceMod.SourceBook then
									tableInsertRaceStats(raceMod)
									createPayloadRaceStats(raceMod)
									-- Add Stats
									-- Add Sab
									print("Clean the Legacy race: " .. raceMod.Name)
								end
							end
							if IgnoreFlavours == false then
								for _, book in pairs(Flavours) do
									if book.bookRef == raceMod.SourceBook then
										tableInsertRaceStats(raceMod)
										createPayloadRaceStats(raceMod)
										-- Add Stats
										-- Add Sab
										print("Clean the Flavours race: " .. raceMod.Name)
									end
								end
							else
								print("Ignore cleaning: " .. raceMod.Name .. " due to IgnoreFlavours = True")
							end
						else
							print("Ignore cleaning: " .. raceMod.Name .. " due to IgnoreLegacy = True")
						end
					else
						print("Ignore cleaning: " .. raceMod.Name .. " due to Ignore5eExtended = True")
					end
				else
					print("Ignore cleaning: " .. raceMod.Name .. " due to Ignore5e = True")
				end
			else
				print("Ignore cleaning: " .. raceMod.Name .. " due to IgnoreLimited = True")
			end
		end
		RaceStat =  {}
	end
else
	print("Ignore cleaning the races ASI")
end