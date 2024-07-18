Ext.Require("Client/RacesLibrary.lua")


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


StatsList = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}

--[[Books = { Officials Sources list ]]
Dnd5eLimited = { --[[ Core Rule Books (5e Limited) ]]
	{bookRef = "PHB",			bookName = "Player’s Handbook",								},
	{bookRef = "DMG",			bookName = "Dungeon Master’s Guide",						},
	{bookRef = "MM",			bookName = "Monster Manual",								},
}
Dnd5e = { --[[  Complements Books (5e) ]]
	{bookRef = "VGtM",			bookName = "Volo’s Guide to Monsters"						},
	{bookRef = "XGtE",			bookName = "Xanathar’s Guide to Everything"					},
	{bookRef = "MToF",			bookName = "Mordenkainen’s Tome of Foes"					},
	{bookRef = "TCoE",			bookName = "Tasha’s Cauldron of Everything"					},
	{bookRef = "FToD",			bookName = "Fizban’s Treasury of Dragons"					},
	{bookRef = "MPMotM",		bookName = "Monsters of the Multiverse"						},
	{bookRef = "BPGotG",		bookName = "Bigby Presents: Glory of the Giants"			},
	{bookRef = "TBoMT",			bookName = "The Book of Many Things"						},
}
Dnd5eExtended = { --[[ Campains settings (5e Extended) ]]
	{bookRef = "SCA",		bookName = "Sword Coast Adventurer’s Guide"						},
	{bookRef = "GGtR",		bookName = "Guildmasters’ Guide to Ravnica"						},
	{bookRef = "AI",		bookName = "Acquisitions Incorporated"							},
	{bookRef = "ERftLW",	bookName = "Eberron: Rising from the Last War"					},
	{bookRef = "EGtW",		bookName = "Explorer’s Guide to Wildemount"						},
	{bookRef = "MOoT",		bookName = "Mythic Odysseys of Theros"							},
	{bookRef = "VRGtR",		bookName = "Van Richten’s Guide to Ravenloft"					},
	{bookRef = "SACoC",		bookName = "Strixhaven: A Curriculum of Chaos"					},
	{bookRef = "SAiS",		bookName = "Spelljammer: Adventures in Space"					},
	{bookRef = "PAitM",		bookName = "Planescape: Adventures in the Multiverse"			},
}
Flavours = {	--[[ Flavours ]]
	{bookRef = "HotDQ",		bookName = "Hoard of the Dragon Queen"							},
	{bookRef = "TRoT",		bookName = "The Rise of Tiamat"									},
	{bookRef = "PotA",		bookName = "Princes of the Apocalypse"							},
	{bookRef = "OutA",		bookName = "Out of the Abyss"									},
	{bookRef = "CoS",		bookName = "Curse of Strahd"									},
	{bookRef = "SKT",		bookName = "Storm King’s Thunder"								},
	{bookRef = "TftYP",		bookName = "Tales from the Yawning Portal"						},
	{bookRef = "ToA",		bookName = "Tomb of Annihilation"								},
	{bookRef = "WDH",		bookName = "Waterdeep: Dragon Heist"							},
	{bookRef = "WDotMM",	bookName = "Waterdeep: Dungeon of the Mad Mage"					},
	{bookRef = "STTHfT",	bookName = "Stranger Things: The Hunt for Thessalhydra"			},
	{bookRef = "GoS",		bookName = "Ghosts of Saltmarsh"								},
	{bookRef = "EK",		bookName = "Essentials Kit"										},
	{bookRef = "BGDiA",		bookName = "Baldurs Gate: Descent into Avernus"					},
	{bookRef = "DDvRM",		bookName = "Dungeons & Dragons vs Rick and Morty"				},
	{bookRef = "IDRotF",	bookName = "Icewind Dale: Rime of the Frostmaiden"				},
	{bookRef = "CM",		bookName = "Candlekeep Mysteries"								},
	{bookRef = "TWBTW",		bookName = "Wild Beyond the Witchlight"							},
	{bookRef = "CRCotN",	bookName = "Critical Role: Call of the Netherdeep"				},
	{bookRef = "JTtRC",		bookName = "Journeys Through the Radiant Citadel"				},
	{bookRef = "DoSI",		bookName = "Starter Set: Dragons of Stormwreck Isle"			},
	{bookRef = "DSotDQ",	bookName = "Dragonlance: Shadow of the Dragon Queen"			},
	{bookRef = "ToD",		bookName = "Tyranny of Dragons Re-release"						},
	{bookRef = "KftGV",		bookName = "Keys from the Golden Vault"							},
	{bookRef = "PaBTSO",	bookName = "Phandelver and Below: The Shattered Obelisk"		},
	{bookRef = "VEoR",		bookName = "Vecna: Eve of Ruin"									},
}
Legacy = {	--[[ Legacy --]]
	{bookRef = "VGtML",		bookName = "Volo's Guide to Monsters"							},
}



if IgnoreAll == false then
	for _, raceMod in pairs(RaceLibrary) do
		if raceMod.SourceBook == nil or raceMod.SourceBook == "" then
			if IgnoreHomebrew == false then
				-- Delete stats
				-- Delete sab
				-- Add Stats
				-- Add Sab
				print("Clean the Homebrew race: " .. raceMod.Name)
			else
				print("Ignore cleaning: " .. raceMod.Name .. " due to IgnoreHomebrew = True")
			end
		else
			if Ignore5eLimited == false then
				for _, book in pairs(Dnd5eLimited) do
					if book.bookRef == raceMod.SourceBook then
						-- Delete stats
						-- Delete sab
						-- Add Stats
						-- Add Sab
						print("Clean the 5eLimited race: " .. raceMod.Name)
					end
				end
				if Ignore5e == false then
					for _, book in pairs(Dnd5e) do
						if book.bookRef == raceMod.SourceBook then
							-- Delete stats
							-- Delete sab
							-- Add Stats
							-- Add Sab
							print("Clean the 5e race: " .. raceMod.Name)
						end
					end
					if Ignore5eExtended == false then
						for _, book in pairs(Dnd5eExtended) do
							if book.bookRef == raceMod.SourceBook then
								-- Delete stats
								-- Delete sab
								-- Add Stats
								-- Add Sab
								print("Clean the 5eExtended race: " .. raceMod.Name)
							end
						end
						if IgnoreLegacy == false then
							for _, book in pairs(Legacy) do
								if book.bookRef == raceMod.SourceBook then
									-- Delete stats
									-- Delete sab
									-- Add Stats
									-- Add Sab
									print("Clean the Legacy race: " .. raceMod.Name)
								end
							end
							if IgnoreFlavours == false then
								for _, book in pairs(Flavours) do
									if book.bookRef == raceMod.SourceBook then
										-- Delete stats
										-- Delete sab
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
	end
else
	print("Ignore cleaning the races ASI")
end	

