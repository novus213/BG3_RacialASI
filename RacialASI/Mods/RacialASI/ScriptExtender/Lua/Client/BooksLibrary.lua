IgnoreAll 			= false
Ignore5eLimited 	= false
Ignore5e 			= false
Ignore5eExtended 	= false
IgnoreFlavours 		= false
IgnoreLegacy 		= false
IgnoreHomebrew 		= false

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


RaceLibrary = {
	{
		Name			=	"Fairy (Flutter and Whimsy)",
		Guid			=	"673c5b7b-a274-4916-ad89-4e3c591e1187",
		UUID			=	"7b4d6e73-c54f-41ed-bd69-c25be95e9717",
		Author			=	"",
		SourceBook		=	"",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	},
	{
		Name			=	"Owlin",
		Guid			=	"315ce1a1-0f24-4777-90d9-06b01a93a716",
		UUID			=	"b5f04836-e2ef-4eb6-93d5-4aad7f3b1c20",
		Author			=	"",
		SourceBook		=	"",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	},
	{
		Name			=	"Myconid",
		Guid			=	"71486ac7-a05c-434e-8e3b-9e6c2d40a04a",
		UUID			=	"ada1a74c-89dd-45f9-95dd-f88bf59e3535",
		Author			=	"",
		SourceBook		=	"",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	},
	{
		Name			=	"Genasi (Elemental Power)",
		Guid			=	"97954f72-711b-4938-a5ae-6a477b2ed574",
		UUID			=	"e808d2a5-a9eb-403f-bab9-90a5114a699c",
		Author			=	"",
		SourceBook		=	"",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	},
	{
		Name			=	"HalfDragon",
		Guid			=	"16ba58e4-3ee5-4cfd-81e8-5a9f6d3f6b46",
		UUID			=	"72a06fbf-e1b3-4321-b975-a4a26d9b4b71",
		Author			=	"Jo Val Rudovous",
		SourceBook		=	"",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	},
	{
		Name			=	"Hobgoblin (https://github.com/GentlemanBabbo/Hobgoblin/tree/main)",
		Guid			=	"42152a0b-9b3c-4d63-8114-3ceba848f3e2",
		UUID			=	"575fa3d3-cf83-4716-8cc3-8d971666b051",
		Author			=	"GentlemanBabbo",
		SourceBook		=	"",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	},
	{
		Name			=	"CE_WitchElf",
		Guid			=	"1aa49383-9208-4cc0-96b6-e827819d71d0",
		UUID			=	"d19f42b3-1c1e-46cd-83e4-fd964426616f",
		Author			=	"",
		SourceBook		=	"XGtE",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	},
	{
		Name			=	"Fantastical Yuan-ti Pureblood",
		Guid			=	"94710eae-8809-42fe-ab17-5681ceae8714",
		UUID			=	"69a8edff-fdec-4ef5-aeb6-dcb15562b062",
		Author			=	"",
		SourceBook		= 	"VGtML",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	 },
	 {
		Name			=	"Fantastical Pallid Elf",
		Guid			=	"02ad19d9-bb24-44a6-9693-35cec821774c",
		UUID			=	"82704351-c1d6-4767-adef-49e25a290aad",
		Author			=	"",
		SourceBook		=	"EGtW",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	 },
	 {
		Name			=	"Fantastical Vedalken",
		Guid			=	"58474556-4b69-494d-b290-1421010d1742",
		UUID			=	"d17424ad-839d-4733-b16d-f7cb007c865f",
		Author			=	"",
		SourceBook		=	"GGtR",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	 },
	 {
		Name			=	"Fantastical Kobold Legacy",
		Guid			=	"866dee81-42b5-4647-9fb7-ec39271f6c96",
		UUID			=	"ee0bbb70-b8f7-44ec-9419-565ab963f664",
		Author			=	"",
		SourceBook		=	"VGtML",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	 },
	 {
		Name			=	"Fantastical Kalashtar",
		Guid			=	"cbd0f091-d2a7-4569-bdf8-56511cea3076",
		UUID			=	"0e35ec74-a63c-4d24-8912-4afa4a9930d8",
		Author			=	"",
		SourceBook		=	"VGtML",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"}
	 },
	 {
		Name			=	"Fantastical Bugbear",
		Guid			=	"f4361c10-b197-4490-ae30-06ce796f950e",
		UUID			=	"d01d244f-3ae2-4d15-b0ba-9aed04fc16ac",
		Author			=	"",
		SourceBook		=	"VGtML",
		Stats			=	{"2", "0", "1", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab     		= 	{"0","0","0"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	 }
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

