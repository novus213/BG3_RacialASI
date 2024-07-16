searchedBook = "PHB"

--[[Books = { Officials Sources list ]]
Dnd5eLimited = { --[[ Core Rule Books (5e Limited) --]]
	{bookRef = "PHB",			bookName = "Player’s Handbook",								},
	{bookRef = "DMG",			bookName = "Dungeon Master’s Guide",						},
	{bookRef = "MM",			bookName = "Monster Manual",								},
}
Dnd5e = { --[[  Complements Books (5e) --]]
	{bookRef = "VGtM",			bookName = "Volo’s Guide to Monsters"						},
	{bookRef = "XGtE",			bookName = "Xanathar’s Guide to Everything"					},
	{bookRef = "MToF",			bookName = "Mordenkainen’s Tome of Foes"					},
	{bookRef = "TCoE",			bookName = "Tasha’s Cauldron of Everything"					},
	{bookRef = "FToD",			bookName = "Fizban’s Treasury of Dragons"					},
	{bookRef = "MPMotM",		bookName = "Monsters of the Multiverse"						},
	{bookRef = "BPGotG",		bookName = "Bigby Presents: Glory of the Giants"			},
	{bookRef = "TBoMT",			bookName = "The Book of Many Things"						},
}
Dnd5eExtended = { --[[ Campains settings (5e Extended) --]]
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
Flavours = {	--[[ Flavours --]]
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
	

	

function checkBook()
	for _, book in pairs(Dnd5eLimited) do
		if book.bookRef == searchedBook then
			do print("We Found it! - " .. book.bookName .. " in a Dnd5e Limited Book")
				break
			end
		end
	end
	for _, book in pairs(Dnd5e) do
		if book.bookRef == searchedBook then
			do print("We Found it! - " .. book.bookName .. " in a Dnd5e Book")
				break
			end
		end
	end
	for _, book in pairs(Dnd5eExtended) do
		if book.bookRef == searchedBook then
			do print("We Found it! - " .. book.bookName .. " in a Dnd5e Extended Book")
				break
			end
		end
	end
	for _, book in pairs(Flavours) do
		if book.bookRef == searchedBook then
			do print("We Found it! - " .. book.bookName .. " in a Flavour Book")
				break
			end
		end
	end
end