
local function checkHumanFM()
	if VCHelpers.ModVars:isModLoaded(deps.Framework_FM_GUID) then
        return {
			humanMainRace	=	false,
			humanUUID		=	"139e1b8c-dfa1-4b2d-895c-efb170736093", --Human default Fantastic M
			modGuid				=	deps.Framework_FM_GUID,
			Author			=	"Fantastic Multiverse",
        }
	else
        return {
			humanMainRace	=	true,
			humanUUID		=	"dbde4d66-d3e4-4c3f-ae87-fd6e2d1cd276", --Human default Larian,
			modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
			Author			=	"Larian"
        }
	end
end

local HumanFix = checkHumanFM()

RaceLibrary = {

--[[
.____                 .__                ____   ____             .__.__  .__
|    |   _____ _______|__|____    ____   \   \ /   /____    ____ |__|  | |  | _____
|    |   \__  \\_  __ \  \__  \  /    \   \   Y   /\__  \  /    \|  |  | |  | \__  \
|    |___ / __ \|  | \/  |/ __ \|   |  \   \     /  / __ \|   |  \  |  |_|  |__/ __ \_
|_______ (____  /__|  |__(____  /___|  /    \___/  (____  /___|  /__|____/____(____  /
        \/    \/              \/     \/                 \/     \/                  \/
         \_Larian Vanilla
]]--

	{
		Name 				=	"Human default",
		modURL				= 	{"https://bg3.wiki/wiki/Human", "https://baldursgate3.wiki.fextralife.com/Human"},
		modGuid 			=	HumanFix["modGuid"],
		progressionUUID		=	{
									[1]	=	HumanFix["humanUUID"]
								},
		raceLsxUUID			=	"",
		Author				=	HumanFix["Author"],
		SourceBook			=	"PHB",
		MainRace			=	HumanFix["humanMainRace"],
		Stats				=	{"1", "1", "1", "1", "1", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Elf default",
		modURL				= 	{"https://bg3.wiki/wiki/Elf", "https://baldursgate3.wiki.fextralife.com/Elf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"",
		progressionUUID		=	{
									[1]	=	"496486a4-b5f2-4f91-90ea-6cad9023952e",
									[2]	=	"",
									[3]	=	"",
									[4]	=	"",
									[5]	=	""
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true
	},
	{
		Name				=	"High Elf default",
		modURL				= 	{"https://bg3.wiki/wiki/Elf", "https://baldursgate3.wiki.fextralife.com/Elf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"5fd1dfd5-b5bd-4152-a04a-87fb3faba1e9",
		progressionUUID		=	{
									[1]	=	"db13a1fb-7d64-4309-a1c8-e2a5c752ded5",
									[2]	=	"3d2b0fe9-ba54-4c5d-bdf9-2d67939276aa",
									[3]	=	"31068b3c-7a1a-4a44-bf3b-72010ba560be",
									[4]	=	"1567ea04-775f-4d2c-b752-cc47e69e9dae"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "2", "0", "1", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Wood Elf default",
		modURL				= 	{"https://bg3.wiki/wiki/Elf", "https://baldursgate3.wiki.fextralife.com/Elf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"c0210455-03b5-437c-9d80-3cc4e3c61a9f",
		progressionUUID		=	{
									[1]	=	"b262db2c-7a80-4c76-a1e8-0efdb9c1db13"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "2", "0", "0", "1", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Bonus				=	{"ProficiencyBonus(Skill,Stealth)"}
	},
	{
		Name				=	"Drow default",
		modURL				= 	{"https://bg3.wiki/wiki/Drow", "https://baldursgate3.wiki.fextralife.com/Drow"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"a43498f5-d72f-4a05-b721-1feea9acb3ad",
		progressionUUID		=	{
									[1]	=	"4a634f24-bdcb-4559-b8be-7847133ad1c3",
									[2]	=	"bd4b36f8-4835-4b1d-b432-3021011cabe6",
									[3]	=	"334e0ddd-33cb-468f-a232-40cfe9ad23da",
									[5]	=	"db485b48-fc71-4de4-a62d-47675659678b"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true,
		Stats				=	{"0", "2", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dwarf default",
		modURL				= 	{"https://bg3.wiki/wiki/Dwarf", "https://baldursgate3.wiki.fextralife.com/Dwarf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"d93def5b-a2df-4675-8a33-e47c9647eeae",
		progressionUUID		=	{
									[1]	=	"3c9a0bd8-bb0f-4a42-b77f-7a9a1cff2e5d"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true
	},
	{
		Name				=	"Dwarf - Duergar default",
		modURL				= 	{"https://bg3.wiki/wiki/Dwarf", "https://baldursgate3.wiki.fextralife.com/Dwarf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"0f8458cb-9edd-401d-8066-86ba8e1529cf",
		progressionUUID		=	{
									[1]	=	"bd012f5b-0a0b-424e-ab7c-186dbd82ab30",
									[3]	=	"02828bce-0bee-4010-a614-f4e46d0aba12",
									[5]	=	"77f416e5-406b-40ee-a2ff-dea281c32c8f"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"1", "0", "2", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dwarf - Mountian default",
		modURL				= 	{"https://bg3.wiki/wiki/Dwarf", "https://baldursgate3.wiki.fextralife.com/Dwarf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"c19dc7fa-0a57-459c-ae4a-648472cbb8fe",
		progressionUUID		=	{
									[1]	=	"3576f8c6-e515-49c5-808c-b68b77154ffd"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "2", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dwarf - Hill default",
		modURL				= 	{"https://bg3.wiki/wiki/Dwarf", "https://baldursgate3.wiki.fextralife.com/Dwarf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"fa449725-ed8a-4d8c-8908-9ff1469c2e21",
		progressionUUID		=	{
									[1]	=	"207d038e-1add-4335-81d1-b0861f524c19",
									[2]	=	"d06d7fea-98ee-42a4-a298-8db698c88644",
									[3]	=	"c968fd3c-59b4-46e3-bbe0-ddd53f6a4d58",
									[4]	=	"eebb77af-b7ee-4a48-84f9-5d4272745de8",
									[5]	=	"4bf7aa2d-5abe-42a9-ad3e-8764f8532de8",
									[6]	=	"c6d8c5b5-3143-4f1e-aeaf-563f0715199f"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "0", "2", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Half-Elf default",
		modURL				= 	{"https://bg3.wiki/wiki/Half-Elf", "https://baldursgate3.wiki.fextralife.com/Half-Elf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"5f06db9e-31b0-41d9-bfbe-3446323c4bf6",
		progressionUUID		=	{
									[1]	=	"a1729574-2f7b-4561-91d8-3766cf940420",
									[2]	=	"a35fe910-7525-4989-ba34-f9f76ff818ec",
									[3]	=	"25c0008d-57ca-4b88-a0f2-1dfbd5597f69"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true,
		Stats				=	{"0", "0", "2", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Half-Elf - Half High Elf default",
		modURL				= 	{"https://bg3.wiki/wiki/Half-Elf", "https://baldursgate3.wiki.fextralife.com/Half-Elf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"9efb7794-dc6f-45f3-8cf9-74ad5286c792",
		progressionUUID		=	{
									[1]	=	"43bfa29a-fd63-4f47-850e-6714f0333022"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "0", "0", "2"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab					=	{"1","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Half-Elf - Half Wood Elf default",
		modURL				= 	{"https://bg3.wiki/wiki/Half-Elf", "https://baldursgate3.wiki.fextralife.com/Half-Elf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"685d3b16-1f7f-49b3-906d-d7726276926b",
		progressionUUID		=	{
									[1]	=	"cb0f84ec-1b1d-4ecc-9ab5-76261e332f5a"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "0", "0", "2"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab					=	{"1","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Half-Elf - Half Drow default",
		modURL				= 	{"https://bg3.wiki/wiki/Half-Elf", "https://baldursgate3.wiki.fextralife.com/Half-Elf"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"4ef615e7-e401-4304-bedc-5c229caa1dc2",
		progressionUUID		=	{
									[1]	=	"58dae581-c25a-4dfb-8a57-589bf4b34f62",
									[2]	=	"f49fff52-8267-426c-ab23-176fc36f8c4e",
									[3]	=	"87d2588b-bd2e-43df-ace0-2c2d3efea0ca",
									[5]	=	"60758c3f-d9c5-4f1a-a253-cf2a5e60b627"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "0", "0", "2"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab					=	{"1","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Gnome default",
		modURL				= 	{"https://bg3.wiki/wiki/Gnome", "https://baldursgate3.wiki.fextralife.com/Gnome"},
		Comments			=	"The Alpha Main Race !",
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"c1d4adfe-9f00-44b4-a433-a45250d00631",
		progressionUUID		=	{
									[1]	=	"d48f8fb3-4351-4b5d-a28c-946fd33be726"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true
	},
	{
		Name				=	"Gnome - Rock default",
		modURL				= 	{"https://bg3.wiki/wiki/Gnome", "https://baldursgate3.wiki.fextralife.com/Gnome"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"1e9f254e-6aa4-4e54-9937-82065b3182ee",
		progressionUUID		=	{
									[1]	=	"aa2257a9-1779-4d8b-be65-8a08eede07fa"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "0", "1", "2", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Gnome - Deep default",
		modURL				=	{"https://bg3.wiki/wiki/Gnome", "https://baldursgate3.wiki.fextralife.com/Gnome"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"0f6d9f53-a2d0-422b-beea-a2fdfd88628a",
		progressionUUID		=	{
									[1]	=	"938b6f72-18a6-4af0-924b-5292251d32bf"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "1", "0", "2", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Gnome - Forest default",
		modURL				=	{"https://bg3.wiki/wiki/Gnome", "https://baldursgate3.wiki.fextralife.com/Gnome"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"f0a6b572-9612-403f-981c-978c21225845",
		progressionUUID		=	{
									[1]	=	"a63bbb3c-c37c-4578-94e6-7d1c4c063d5c"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "1", "0", "2", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Halfling default",
		modURL				=	{"https://bg3.wiki/wiki/Halfling", "https://baldursgate3.wiki.fextralife.com/Halfling"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"7e1ae395-6f2a-456b-ab64-1012c18065d4",
		progressionUUID		=	{
									[1]	=	"963edcba-c572-4f51-b447-8810bbb43a8e"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true
	},
	{
		Name				=	"Halfling - Lightfoot default",
		modURL				=	{"https://bg3.wiki/wiki/Halfling", "https://baldursgate3.wiki.fextralife.com/Halfling"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"fa29312c-6ec6-4bf9-9613-6d99feb57467",
		progressionUUID		=	{
									[1]	=	"bc2d257b-a405-4f58-891e-3083c5f71127"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "2", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Halfling - Strongheart default",
		modURL				=	{"https://bg3.wiki/wiki/Halfling", "https://baldursgate3.wiki.fextralife.com/Halfling"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"786cb743-3286-462b-af46-3b1ba84c801e",
		progressionUUID		=	{
									[1]	=	"b7a39730-2820-40c7-be96-2c134fead68a"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "2", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling default",
		modURL				=	{"https://bg3.wiki/wiki/Tiefling", "https://baldursgate3.wiki.fextralife.com/Tiefling"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"1640733f-c32b-4d9d-9132-5ca6e985155c",
		progressionUUID		=	{
									[1]	=	"56529178-3df2-4067-b1c0-e35fe82fbd37"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true
	},
	{
		Name				=	"Tiefling - Asmodeus default",
		modURL				=	{"https://bg3.wiki/wiki/Tiefling", "https://baldursgate3.wiki.fextralife.com/Tiefling"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"5ae9c280-64fd-43fb-85f3-40d1796c5b24",
		progressionUUID		=	{
									[1]	=	"a8b18f0c-fe70-4f13-9dbc-23f4dbc3d648",
									[2]	=	"2d07c1b4-baec-4bdb-a75a-ca513ad8df46",
									[3]	=	"bf3c33f5-4b95-4048-91f5-d8ff6f7a9cdd",
									[5]	=	"76ced3c8-2244-477b-bab3-ba741db463d3"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "1", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Mephistopheles default",
		modURL				=	{"https://bg3.wiki/wiki/Tiefling", "https://baldursgate3.wiki.fextralife.com/Tiefling"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"0d83cb0b-1f39-47bb-97bc-a6e49cd8a5c5",
		progressionUUID		=	{
									[1]	=	"bdd1cf22-1b3c-4bc6-8313-898a49fcfe49",
									[2]	=	"10ae22cc-08d8-4c19-aa28-06fffb0782c2",
									[3]	=	"5b3c1a37-18a8-40cf-8bf6-cad43b3ff0cc",
									[5]	=	"a9e766ce-7641-4fac-9510-99389b86546f"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "1", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Zariel default",
		modURL				=	{"https://bg3.wiki/wiki/Tiefling", "https://baldursgate3.wiki.fextralife.com/Tiefling"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"957ba6a9-68f4-4190-a432-25675d00f434",
		progressionUUID		=	{
									[1]	=	"89d57acd-85ff-4da6-b989-9b82d0241e46",
									[2]	=	"786ed4d4-7dd8-4ae6-b5a8-4a9e6572bc78",
									[3]	=	"09be3a4b-3360-414e-b3fb-1e4a04b63331",
									[5]	=	"0394d93d-5f86-42e6-821b-91777c6e120b"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"1", "0", "0", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn default",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"e2472b4f-682a-4ac8-b11c-723f921fd7a1",
		progressionUUID		=	{
									[1]	=	"cabc4d46-f08e-4a48-8937-0bd1067ab43d"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true
	},
	{
		Name				=	"Dragonborn - Black defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"445a41db-995d-4e35-892a-4ab0e34d4594",
		progressionUUID		=	{
									[1]	=	"f5a766a1-9379-47ed-bfeb-cccbba64346f"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Blue defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"dbe8c9aa-8a1d-49d2-b0b1-816966fe2c8c",
		progressionUUID		=	{
									[1]	=	"fc46455a-24f8-4b5f-9340-05806e44257b"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Brass defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"d5338f29-2047-40a7-ad72-f65241150858",
		progressionUUID		=	{
									[1]	=	"ec92e1f3-b8cf-42a8-aefc-29c053d22c44"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Bronze defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"829ed0e9-25dc-49ca-aee2-2494bbca180b",
		progressionUUID		=	{
									[1]	=	"02abcdb7-301c-4ed5-9a39-223359e8d5fa"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Copper defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"f0747c54-dccd-4a1b-89d3-adee8bcc8b76",
		progressionUUID		=	{
									[1]	=	"37b52fb8-71be-45c7-889d-aca8110e931b"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Gold defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"8aeadd65-f951-4004-8f65-b3cd127e1e6d",
		progressionUUID		=	{
									[1]	=	"f6fa4014-79fc-4c9c-910b-8e3738424cac"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Green defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"cc914fb7-e0eb-49f0-a195-20d11917bf1a",
		progressionUUID		=	{
									[1]	=	"b7e781e6-fa09-4a35-993a-b59e1e52a66f"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Red defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"ed5b3a12-7f18-46c2-8fe9-1ff96d44ed96",
		progressionUUID		=	{
									[1]	=	"c0202100-b905-4791-8eaa-1c110fe0bd02"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - Silver defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"ccbbbf91-53a4-4777-9676-5469d3d5b821",
		progressionUUID		=	{
									[1]	=	"04ec0b37-ddb6-405d-989a-4f3e25ed1dfe"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Dragonborn - White defaut",
		modURL				=	{"https://bg3.wiki/wiki/Dragonborn", "https://baldursgate3.wiki.fextralife.com/Dragonborn"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"91577000-c8f7-465b-b56f-eb6d87d173d2",
		progressionUUID		=	{
									[1]	=	"e557c3b8-7cc1-43f8-bd8a-6838ff01e6d1"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	false,
		Stats				=	{"2", "0", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	--[[

		TAG ?? not a race ??

		Full-illithid !!!!!! Ability Score Increase. Your Intelligence score increases by 2, and either your Wisdom or Charisma score increases by 1.
		modURL				=	{"https://bg3.wiki/wiki/Full-illithid", "https://baldursgate3.wiki.fextralife.com/Full-illithid"},
		Stats			=	{"1", "0", "0", "2", "0", "0"},
		Sab				=	{"1"}

		ability uuid 002d957b-ed24-4efa-afdb-ccf86bac00dd


		Partial-illithid   !!!! Ability Score Increase. Your Intelligence score increases by 2, and either your Wisdom or Charisma score increases by 1.
		modURL				=	{"https://bg3.wiki/wiki/Partial-illithid", "https://baldursgate3.wiki.fextralife.com/Partial-illithid"},
		Stats			=	{"0", "0", "0", "2", "0", "0"},
		Sab				=	{"1"}

		ability uuid 002d957b-ed24-4efa-afdb-ccf86bac00dd
   },  ]]--

	{
		Name				=	"Half-Orc default",
		modURL				=	{"https://bg3.wiki/wiki/Half-Orc", "https://baldursgate3.wiki.fextralife.com/Half-Orc"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"74e2e44d-e8c0-4b99-a6dc-c02f43cea8a6",
		progressionUUID		=	{
									[1]	=	"816fa8c7-7648-48f7-8309-cb4e7383e45f"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true,
		Stats				=	{"2", "0", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Githyanki default",
		modURL				=	{"https://bg3.wiki/wiki/Githyanki", "https://baldursgate3.wiki.fextralife.com/Githyanki"},
		modGuid				=	"28ac9ce2-2aba-8cda-b3b5-6e922f71b6b8", --GustavDev modGuid
		progressionTable	=	"81e2cb57-6a12-4429-b3a5-f72549355b3b",
		progressionUUID		=	{
									[1]	=	"f653d537-bc14-4fea-b7d2-25734ec928a2",
									[2]	=	"1781a8fd-d8ce-4fc5-8674-6a176813917f",
									[3]	=	"851880cb-3b5d-4129-9b25-3bb17d849f87",
									[5]	=	"37ad7172-291b-4a05-b226-2734170fb4fa"
								},
		Author				=	"Larian",
		SourceBook			=	"PHB",
		MainRace			=	true,
		Stats				=	{"2", "0", "0", "1", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},

--[[
   _____    ______________________________.____      ___________.__        _____.__  .__
  /  _  \  /   _____/\__    ___/\______   \    |     \__    ___/|__| _____/ ____\  | |__| ____    ____  ______
 /  /_\  \ \_____  \   |    |    |       _/    |       |    |   |  |/ __ \   __\|  | |  |/    \  / ___\/  ___/
/    |    \/        \  |    |    |    |   \    |___    |    |   |  \  ___/|  |  |  |_|  |   |  \/ /_/  >___ \
\____|__  /_______  /  |____|    |____|_  /_______ \   |____|   |__|\___  >__|  |____/__|___|  /\___  /____  >
        \/        \/                    \/        \/                    \/                   \//_____/     \/
         \_Astralities' Tiefling Compendium from Nexus
]] --

	{
		Name				=	"Tiefling - Baalzebul",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"e07d88b1-b935-4a65-b1be-0e8cd2a93ed5",
		progressionUUID		=	{
									[1]	=	"ad21229c-c202-4c86-af26-b5c47d36ff01",
									[3]	=	"8e3b8d4f-cea8-4fa3-bcc6-76ce59c2818b",
									[5]	=	"97db1ad7-b238-402f-b570-1aad9ffe6447"
								},
		Author				=	"Astralities",
		SourceBook			=	"MToF",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "1", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Dispater",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"aca218d9-207d-48ef-836d-3230d981480b",
		progressionUUID		=	{
									[1]	=	"535fb417-7341-4710-b500-0ac5602de515",
									[3]	=	"48aff9cf-c102-4a52-9575-17dfe8030b42",
									[5]	=	"04a8fd56-e281-47d2-bda2-17a91d4001e6"
								},
		Author				=	"Astralities",
		SourceBook			=	"MToF",
		MainRace			=	false,
		Stats				=	{"0", "1", "0", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Fierna",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"fe2e40ea-bcc8-48f3-a89a-c798c382d4d7",
		progressionUUID		=	{
									[1]	=	"929b6fe8-7415-43c7-9e2b-a3c87962e77d",
									[3]	=	"af89b2ed-0c02-4749-aa87-8ba1439ffd9a",
									[5]	=	"f06cbf74-4d0a-4857-af3e-f9dc1a17b0c2"
								},
		Author				=	"Astralities",
		SourceBook			=	"MToF",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "0", "1", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Glasya",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"bda111b8-ff84-4df0-99c4-20cafcb9cace",
		progressionUUID		=	{
									[1]	=	"1a215890-3ffc-4c4e-bf19-b70aa67c25cf",
									[3]	=	"d7e7274d-3a3d-417c-9a85-f4180695957a",
									[5]	=	"22982f8d-d5c6-42e4-bc54-9dbe9b819056"
								},
		Author				=	"Astralities",
		SourceBook			=	"MToF",
		MainRace			=	false,
		Stats				=	{"0", "1", "0", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Levistus",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"cddee309-0cec-4e7d-939f-06ce8aaf0da4",
		progressionUUID		=	{
									[1]	=	"62899e1e-d6b6-448d-847c-085a07d1f41d",
									[3]	=	"78dc5b0a-3a0a-411d-a366-2773e0f5b8cf",
									[5]	=	"6628fcdf-d284-4178-8c59-04d43e064010"
								},
		Author				=	"Astralities",
		SourceBook			=	"MToF",
		MainRace			=	false,
		Stats				=	{"0", "0", "1", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Mammon",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"cfb80dea-6416-42d0-a7b5-3e319ab54feb",
		progressionUUID		=	{
									[1]	=	"bf7c8b2d-5b6e-467e-b080-d85de151f57a",
									[3]	=	"a7e30644-2ee6-4313-a531-7477aa6f987b",
									[5]	=	"7a1a907c-176c-40ca-859c-a467877c38bb"
								},
		Author				=	"Astralities",
		SourceBook			=	"MToF",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "1", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Tiefling - Variant",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"a7025e87-add5-4aa9-8b2c-4928511196b3",
		progressionUUID		=	{
									[1]	=	"da92f08b-96fd-42b2-80f1-45b7bc9e703f",
									[3]	=	"d439510c-1339-4c93-bd3a-2ba7c46bcfcf",
									[5]	=	"2c7cc48e-1efa-45a4-bae9-aed10f7c5a6e"
								},
		Author				=	"Astralities",
		SourceBook			=	"SCAG",
		MainRace			=	false,
		specialAbList		=	"0a42b87b-a001-4091-8072-a611a85fa465",
		Stats				=	{"0", "0", "0", "1", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab					=	{"2"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Tiefling - Winged",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"ac94f1e6-88dd-4beb-9467-134811dc6f06",
		progressionUUID		=	{
									[1]	=	"e2519a78-67c8-41d2-a276-fc4889511346",
									[3]	=	"3daaf875-ee4e-4a26-9a44-e252f2490cd7",
									[5]	=	"4f8d673d-6db0-48f1-b2bd-c6d86cc80bdb"
								},
		Author				=	"Astralities",
		SourceBook			=	"MToF",
		MainRace			=	false,
		Stats				=	{"0", "0", "0", "1", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab					=	{"2"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Tiefling - Nightborn",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"47f87ed4-7729-4c69-9c4c-7cc9b9c7811d",
		progressionUUID		=	{
									[1]	=	"fa15d3e5-3f15-4d59-857a-804098843516",
									[3]	=	"ad85fe1c-be40-4f37-8ce9-0db26849a69e",
									[5]	=	"d1268beb-5fb4-44ed-8f98-328c60daef3a"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Sab					=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Tiefling - Fey'ri",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"a0dc01cd-44c5-4c71-8c65-498cabcf3def",
		progressionUUID		=	{
									[1]	=	"3d807581-2721-4ba2-82bf-d91b345f7d81",
									[3]	=	"c19d58fc-739f-4377-bb70-bcf74d73cafb",
									[5]	=	"6240ba4e-c4d3-47c6-8494-85c69babf983"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Sab					=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Tiefling - Elamshinae",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"ada184db-1af2-4046-9d17-9b8b0043bcc9",
		progressionUUID		=	{
									[1]	=	"b42939aa-ce0d-40c7-8b0b-98cc4c122214",
									[3]	=	"d277c372-5655-4fce-be70-c28c0d566aa7",
									[5]	=	"29ff2b08-3644-4eed-9fe3-d0e6b38a33fb"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Sab					=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Tiefling - Velkyn'bol",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"4de5c941-f169-4d2e-818e-d9ff72d0c7fc",
		progressionUUID		=	{
									[1]	=	"3968f318-3ba4-4325-86f4-88ba7c01d999",
									[3]	=	"0933e57a-8a31-470a-916a-df1817583d78",
									[5]	=	"eb3049dc-64ad-4d72-9b52-dab23ef7b8b1"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Sab					=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Tiefling - Isilmnir'el",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/2418"},
		modGuid				=	"167b846f-0a0b-4e0c-a9d0-df448be1320a",
		progressionTable	=	"688d197b-a2c9-4c91-b353-83d684c3ade4",
		progressionUUID		=	{
									[1]	=	"c9ebad8c-3f9c-42ff-a2c2-53e83578df8c",
									[3]	=	"0df6b198-3714-4ed4-a53e-52d3e6ab1ba9",
									[5]	=	"51758fa9-8f2d-48b8-81ec-098d4f630f37"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Sab					=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},

--[[
   _____    ______________________________.____      ___________.__
  /  _  \  /   _____/\__    ___/\______   \    |     \_   _____/|  | ___  __ ____   ____   ______
 /  /_\  \ \_____  \   |    |    |       _/    |      |    __)_ |  | \  \/ // __ \ /    \ /  ___/
/    |    \/        \  |    |    |    |   \    |___   |        \|  |_/\   /\  ___/|   |  \\___ \
\____|__  /_______  /  |____|    |____|_  /_______ \ /_______  /|____/>\_/  \___  >___|  /____  >
        \/        \/                    \/        \/         \/      \/          \/     \/     \/
         \_Astralities' Elven Anthology from Nexus

]] --

	{
		Name 				= 	"Elf - Moon",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/10230"},
		modGuid 			=	"66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
		progressionTable	=	"",
		progressionUUID		=	{
									[1]	=	"934762bb-eebd-4b42-b050-540148507a4a"
								},
		Author				=	"Astralities",
		SourceBook			=	"SCAG",
		MainRace			=	false,
		Stats				=	{"0", "2", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 				= 	"Elf - Snow",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/10230"},
		modGuid 			=	"66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
		progressionTable	=	"",
		progressionUUID		=	{
									[1]	=	"02e1d9ac-bcc4-4391-9e78-5df33f60ca64"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Stats				=	{"0", "0", "2", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 				= 	"Elf - Sun",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/10230"},
		modGuid 			=	"66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
		progressionTable	=	"",
		progressionUUID		=	{
									[1]	=	"1089dddf-4e75-4e1b-bf2a-33affd0f6093"
								},
		Author				=	"Astralities",
		SourceBook			=	"SCAG",
		MainRace			=	false,
		Stats				=	{"0", "2", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 				= 	"Elf - Lythari",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/10230"},
		modGuid 			=	"66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
		progressionTable	=	"",
		progressionUUID		=	{
									[1]	=	"9b37ca29-0d77-4a27-a662-8464ce9998bb"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Stats				=	{"0", "2", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 				= 	"Elf - Star",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/10230"},
		modGuid 			=	"66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
		progressionTable	=	"",
		progressionUUID		=	{
									[1]	=	"e4c4c550-d4c7-43c5-92ba-49f93691356a"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		specialAbList		=	"002d957b-ed24-4efa-afdb-ccf86bac00dd",
		Stats				=	{"0", "2", "0", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab					=	{"1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Elf - Dusk",
		modURL				=	{"https://www.nexusmods.com/baldursgate3/mods/10230"},
		modGuid				=	"66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
		progressionTable	=	"",
		progressionUUID		=	{
									[1]	=	"50d5a39d-4497-4d71-9368-d6c8c04f97dd"
								},
		Author				=	"Astralities",
		SourceBook			=	"",
		MainRace			=	false,
		Sab					=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},

--[[
 __      __       __ ________       _____                .__                   ____________________
/  \    /  \_____/  |\______ \     /  _  \ _____    _____|__| _____ _____     /   _____/\_   _____/
\   \/\/   /  _ \   __\    |  \   /  /_\  \\__  \  /  ___/  |/     \\__  \    \_____  \  |    __)_
 \        (  <_> )  | |    `   \ /    |    \/ __ \_\___ \|  |  Y Y  \/ __ \_  /        \ |        \
  \__/\  / \____/|__|/_______  / \____|__  (____  /____  >__|__|_|  (____  / /_______  //_______  /
       \/                    \/          \/     \/     \/         \/     \/          \/         \/
        \_ WotD Aasimar - Script Extender Edition from Nexus
]]--
	{
		Name				=	"Protector",
		modGuid				=	"4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
		progressionUUID	=	{
								[1]	=	"63e0259e-4721-4f7e-bb75-c5d26a55dc74"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"VGtML",
		MainRace		=	false,
		Stats			=	{"0", "0", "0", "0", "1", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Scourge",
		modGuid				=	"4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
		progressionUUID	=	{
								[1]	=	"2d88948b-45ec-42ce-8dc9-755b6987a8f6"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"VGtML",
		MainRace		=	false,
		Stats			=	{"0", "0", "1", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fallen",
		modGuid				=	"4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
		progressionUUID	=	{
								[1]	=	"adab8d9e-904b-436e-ba9b-9657dd5216c6"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"VGtML",
		MainRace		=	false,
		Stats			=	{"1", "0", "0", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Herault / Variant",
		modGuid				=	"4806bd2a-929b-406e-b1d4-2e0e9cc23bb2",
		progressionUUID	=	{
								[1]	=	"70ed9582-33c5-44c1-8710-2fbf8281543d"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"VGtML",
		MainRace		=	false,
		Stats			=	{"0", "0", "0", "0", "1", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},


--[[
_________                 __                   __________
\_   ___ \ __ __  _______/  |_  ____   _____   \______   \_____    ____  ____   ______
/    \  \/|  |  \/  ___/\   __\/  _ \ /     \   |       _/\__  \ _/ ___\/ __ \ /  ___/
\     \___|  |  /\___ \  |  | (  <_> )  Y Y  \  |    |   \ / __ \\  \__\  ___/ \___ \
 \______  /____//____  > |__|  \____/|__|_|  /  |____|_  /(____  /\___  >___  >____  >
        \/           \/                    \/          \/      \/     \/    \/     \/
         \_Custom Races from Nexus
]]--

	{
		Name 			=	"Aasimar Main",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1824"},
		modGuid 		=	"ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
		progressionUUID	=	{
								[1]	=	"06e918ad-be2c-48b6-a098-0288539de744",
		raceLsxUUID		=	"31c1d14f-2a46-4507-b9ba-b993bdffd298"
							},
		Author			=	"DarthRen",
		SourceBook		=	"VGtML",
		MainRace		=	true
	},
	{
		Name 			=	"Aasimar(Radiant Soul)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1824"},
		modGuid 		=	"ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
		progressionUUID	=	{
								[1]	=	"4c2c61ae-5904-4576-a8c5-efecce67ab82"
							},
		Author			=	"DarthRen",
		SourceBook		=	"VGtML",
		MainRace		=	false,
		Stats			=	{"0", "0", "0", "0", "1", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 			=	"Aasimar(Radiant Consumption)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1824"},
		modGuid 		=	"ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
		progressionUUID	=	{
								[1]	=	"56d62681-9769-4ad7-9bbf-4f72db44f070"
							},
		Author			=	"DarthRen",
		SourceBook		=	"VGtML",
		MainRace		=	false,
		Stats			=	{"0", "0", "1", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 			=	"Aasimar(Necrotic Shroud)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1824"},
		modGuid 		=	"ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
		progressionUUID	=	{
								[1]	=	"1b07140b-98c1-42e8-b4ec-072622862dc2"
							},
		Author			=	"DarthRen",
		SourceBook		=	"VGtML",
		MainRace		=	false,
		Stats			=	{"0", "0", "1", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 			=	"Raven Queen's Chosen - Shadar-Kai",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1305"},
		modGuid 		=	"c36d595f-70d1-44f1-8ca6-4ad14186f489",
		progressionUUID	=	{
								[1]	=	"2f7edf7e-0a6b-4018-9715-1cb8aa238e4a"
							},
		Author			=	"NellsRelo",
		SourceBook		=	"MToF",
		Comments		=	"The Sea Elves and the Shadar-kai, originally published as playtest material in this Unearthed Arcana,\
were officially released today (May 29, 2018) as part of Mordenkainen's Tome of Foes;\
the Eladrin elf subrace was included as well.\
The Avariel and Grugach, as far as I know, were not released.",
		MainRace		=	false,
		Stats			=	{"0", "2", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name 			=	"Shadar-Kai with Drow dialogue tags",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2476"},
		modGuid 		= 	"c36d595f-70d1-44f1-8ca6-4ad14186f489",
        progressionUUID	=	{
								[1]	=	"96ad7abb-8a86-4939-913d-71f84191f7d7"
							},
		Author			=	"WintersPast",
		SourceBook		=	"MToF",
		Comments		=	"The Sea Elves and the Shadar-kai, originally published as playtest material in this Unearthed Arcana,\
were officially released today (May 29, 2018) as part of Mordenkainen's Tome of Foes;\
the Eladrin elf subrace was included as well.\
The Avariel and Grugach, as far as I know, were not released.",
		MainRace		=	false,
		Stats			=	{"0", "2", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fairy (Flutter and Whimsy)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5127"},
		modGuid				=	"673c5b7b-a274-4916-ad89-4e3c591e1187",
		progressionUUID	=	{
								[1]	=	"7b4d6e73-c54f-41ed-bd69-c25be95e9717"
							},
		Author			=	"labotor",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
--
-- Owlin by HornbirdDotMod - https://www.nexusmods.com/baldursgate3/mods/8113
--
	{
		Name				=	"Owlin",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/8113"},
		modGuid				=	"c1e87b16-c845-4254-b831-bb22b13016fb", -- old "315ce1a1-0f24-4777-90d9-06b01a93a716",
		progressionUUID	=	{
								[1]	=	"da629716-fd76-477d-9934-0473904fe04b", -- old "b5f04836-e2ef-4eb6-93d5-4aad7f3b1c20"
							},
		Author			=	"HornbirdDotMod",
		SourceBook		=	"SACoC",
		MainRace		=	true
	},
	{
		Name				=	"Owlin - Forest",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/8113"},
		modGuid				=	"c1e87b16-c845-4254-b831-bb22b13016fb", -- old "315ce1a1-0f24-4777-90d9-06b01a93a716",
		progressionUUID	=	{
								[1]	=	"9bb01d19-30fb-4478-bf55-d98dcacb228b"
							},
		Author			=	"HornbirdDotMod",
		SourceBook		=	"SACoC",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Owlin - Snow",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/8113"},
		modGuid				=	"c1e87b16-c845-4254-b831-bb22b13016fb", -- old "315ce1a1-0f24-4777-90d9-06b01a93a716",
		progressionUUID	=	{
								[1]	=	"837d45f1-17fb-407b-8c3c-ed83427036cf"
							},
		Author			=	"HornbirdDotMod",
		SourceBook		=	"SACoC",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
--
-- Myconid by Porridge - https://www.nexusmods.com/baldursgate3/mods/5535
--
	{
		Name				=	"Myconid",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5535"},
		modGuid				=	"71486ac7-a05c-434e-8e3b-9e6c2d40a04a",
		progressionUUID	=	{
								[1]	=	"ada1a74c-89dd-45f9-95dd-f88bf59e3535"
							},
		Author			=	"Porridge",
		SourceBook		=	"",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
--
-- Elemental Power - Genasi by tekunset - https://www.nexusmods.com/baldursgate3/mods/4741
--
	{
		Name				=	"Genasi",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4741"},
		modGuid				=	"97954f72-711b-4938-a5ae-6a477b2ed574",
		progressionUUID	=	{
								[1]	=	"e808d2a5-a9eb-403f-bab9-90a5114a699c"
							},
		Author			=	"tekunset",
		SourceBook		=	"MPMotM",
		MainRace		=	true
	},
	{
		Name				=	"Genasi - Fire",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4741"},
		modGuid				=	"97954f72-711b-4938-a5ae-6a477b2ed574",
		progressionUUID	=	{
								[1]	=	"ce1b1155-fc91-4dde-9ebb-ec06c103b944"
							},
		Author			=	"tekunset",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Genasi - Air",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4741"},
		modGuid				=	"97954f72-711b-4938-a5ae-6a477b2ed574",
		progressionUUID	=	{
								[1]	=	"1b933d13-bb4b-4806-97ed-92ef7dc75738"
							},
		Author			=	"tekunset",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Genasi - Earth",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4741"},
		modGuid				=	"97954f72-711b-4938-a5ae-6a477b2ed574",
		progressionUUID	=	{
								[1]	=	"ffcdbf2d-9500-46a0-9827-a8898e7e0553"
							},
		Author			=	"tekunset",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Genasi - Water",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4741"},
		modGuid				=	"97954f72-711b-4938-a5ae-6a477b2ed574",
		progressionUUID	=	{
								[1]	=	"ca4b22d5-24b2-43f2-a550-b9d9e7d4d7bc"
							},
		Author			=	"tekunset",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
--
-- Half-Dragon by Val aka Jo - https://www.nexusmods.com/baldursgate3/mods/2634
--
	{
		Name				=	"Half-Dragon",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2634"},
		modGuid				=	"16ba58e4-3ee5-4cfd-81e8-5a9f6d3f6b46",
		progressionUUID	=	{
								[1]	=	"72a06fbf-e1b3-4321-b975-a4a26d9b4b71"
							},
		Author			=	"Val aka Jo",
		SourceBook		=	"",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
--
-- Hobgoblin by GentlemanBabbo - https://github.com/GentlemanBabbo/Hobgoblin/tree/main
--
	{
		Name				=	"Hobgoblin",
		modURL			=	{"https://github.com/GentlemanBabbo/Hobgoblin/tree/main"},
		modGuid				=	"42152a0b-9b3c-4d63-8114-3ceba848f3e2",
		progressionUUID	=	{
								[1]	=	"575fa3d3-cf83-4716-8cc3-8d971666b051"
							},
		Author			=	"GentlemanBabbo",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
--
-- Witch Elf by CovenElf - https://www.nexusmods.com/baldursgate3/mods/3490
--
	{
		Name				=	"Witch Elf",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3490"},
		modGuid				=	"1aa49383-9208-4cc0-96b6-e827819d71d0",
		progressionUUID	=	{
								[1]	=	"d19f42b3-1c1e-46cd-83e4-fd964426616f"
							},
		Author			=	"CovenElf",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
--
-- Wine and Revelry - Satyr by labotor - https://www.nexusmods.com/baldursgate3/mods/428
--
    {
        Name				=	"Satyr",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/428"},
        modGuid				=	"68315895-8bd4-4d53-aefc-1b853ffc1461",
        progressionUUID	=	{
								[1]	=	"eb3ac23d-3f7f-44d5-ad6a-bb99232d63bd"
							},
		Author			=	"labotor",
		SourceBook		=	"",
		MainRace		=	true,
		Stats			=	{"0", "1", "0", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Transient Guests Are We - Dhampir by Ne Dragon - https://www.nexusmods.com/baldursgate3/mods/4750
--
    {
        Name				=	"Dhampir",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4750"},
        modGuid				=	"7a4aaaca-88a7-41c4-98d6-de2df39496fe",
        progressionUUID	=	{
								[1]	=	"58971151-461d-4556-8db7-5894af1dceb2"
							},
		Author			=	"Ne Dragon",
		SourceBook		=	"VRGtR",
		MainRace		=	true,
		Stats			=	{"0", "1", "0", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Dhampir by Sassandra Baerne - https://www.nexusmods.com/baldursgate3/mods/4761
--
    {
        Name				=	"Dhampir", -- look unused
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4761"},
        modGuid				=	"5114d845-2c0f-441c-a01b-91a1847a48bc",
        progressionUUID	=	{
								[1]	=	"b5f04836-e2ef-4eb6-93d5-4aad7f3b1c20", --Warning, conflit avec playable Undead (legacy) and Mori's Astral Elves
							},
		Author			=	"Sassandra Baerne",
		SourceBook		=	"P",
		MainRace		=	true
    },
    {
        Name				=	"Dhampir - RU_SHI",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4761"},
        modGuid				=	"5114d845-2c0f-441c-a01b-91a1847a48bc",
        progressionUUID	=	{
								[1]	=	"042e6092-1602-4338-b6f9-cc7987f3bff4"
							},
		Author			=	"Sassandra Baerne",
		Comments		=	"Progression UUID conflict with playable undead",
		SourceBook		=	"P",
		MainRace		=	false,
		Stats			=	{"2", "-2", "0", "2", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Dhampir - SVETOCHER",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4761"},
        modGuid				=	"5114d845-2c0f-441c-a01b-91a1847a48bc",
        progressionUUID	=	{
								[1]	=	"ceae071e-2ff2-4043-a2b8-a7fc1ab16065"
							},
		Author			=	"Sassandra Baerne",
		SourceBook		=	"P",
		MainRace		=	false,
		Stats			=	{"2", "0", "-2", "0", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Dhampir - AJIBACHANA",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4761"},
        modGuid				=	"5114d845-2c0f-441c-a01b-91a1847a48bc",
        progressionUUID	=	{
								[1]	=	"65930b4d-75ca-4968-93b0-dde6662d5882"
							},
		Author			=	"Sassandra Baerne",
		SourceBook		=	"P",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "2", "-2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Dhampir - ANCIENTBORN",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4761"},
        modGuid				=	"5114d845-2c0f-441c-a01b-91a1847a48bc",
        progressionUUID	=	{
								[1]	=	"ebd122f3-9223-4cc0-ac98-3810995dde9b"
							},
		Author			=	"Sassandra Baerne",
		SourceBook		=	"P",
		MainRace		=	false,
		Stats			=	{"2", "0", "-2", "0", "2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Followers Of Zerthimon - Githzerai by Kaz - https://www.nexusmods.com/baldursgate3/mods/3460
--
    {
        Name				=	"Githzerai (1.4)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3460"},
        modGuid				=	"ae6eacb7-f346-418f-89a9-f0e4c697baab",
        progressionUUID	=	{
								[1]	=	"8e8928df-70b1-43c0-bc86-40b32c455bee"
							},
		Author			=	"Kaz",
		SourceBook		=	"PAitM",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "1", "2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Githzerai (1.5)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3460"},
        modGuid				=	"d6d1028e-68fb-4e94-83d8-e8951f55b86a",
        progressionUUID	=	{
								[1]	=	"8e8928df-70b1-43c0-bc86-40b32c455bee"
							},
		Author			=	"Kaz",
		SourceBook		=	"PAitM",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "1", "2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Fey Eladrin by tepkunset - https://www.nexusmods.com/baldursgate3/mods/7037
--
    {
        Name				=	"Fey Eladrin (Spirited Seasons)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/7037"},
        modGuid				=	"abc09812-ed4d-43ff-9a93-ee46487e81d9",
        progressionUUID	=	{
								[1]	=	"c2c089df-c622-4074-ab18-a4bde879a055"
							},
		Author			=	"tepkunset",
		SourceBook		=	"MToF",
		MainRace		=	true
    },
    {
        Name				=	"Fey Eladrin - Winter (Spirited Seasons)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/7037"},
        modGuid				=	"abc09812-ed4d-43ff-9a93-ee46487e81d9",
        progressionUUID	=	{
								[1]	=	"83132733-dfd4-45d6-b117-8d33b5550c8e"
							},
		Author			=	"tepkunset",
		SourceBook		=	"MToF",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Fey Eladrin - Spring (Spirited Seasons)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/7037"},
        modGuid				=	"abc09812-ed4d-43ff-9a93-ee46487e81d9",
        progressionUUID	=	{
								[1]	=	"734b5fab-6654-49be-971a-e0d0ddede50d"
							},
		Author			=	"tepkunset",
		SourceBook		=	"MToF",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Fey Eladrin - Summer (Spirited Seasons)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/7037"},
        modGuid				=	"abc09812-ed4d-43ff-9a93-ee46487e81d9",
        progressionUUID	=	{
								[1]	=	"39d96060-532d-4814-9098-a6c0524d3b73"
							},
		Author			=	"tepkunset",
		SourceBook		=	"MToF",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Fey Eladrin - Autumn (Spirited Seasons)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/7037"},
        modGuid				=	"abc09812-ed4d-43ff-9a93-ee46487e81d9",
        progressionUUID	=	{
								[1]	=	"09e3d698-1ef6-46ef-b768-f19b94d46127"
							},
		Author			=	"tepkunset",
		SourceBook		=	"MToF",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Forest Friends - Firbolgs by tepkunset - https://www.nexusmods.com/baldursgate3/mods/7757
--
    {
        Name				=	"Firbolgs",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/7757"},
        modGuid				=	"ecfb9910-1b38-4bbc-a873-4f2812fff276",
        progressionUUID	=	{
								[1]	=	"7eede716-00f0-43aa-ad18-f001f8c7c283"
							},
		Author			=	"tepkunset",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Stats			=	{"1", "0", "0", "0", "2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Enter Maztica - unstone Gnome by SydMeier - https://www.nexusmods.com/baldursgate3/mods/9205
--
    {
        Name				=	"Enter Maztica: Sunstone Gnome Subrace",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/9205"},
        modGuid				=	"7c7407ec-e2a8-4deb-a6dc-6cbc7bea2894",
        progressionUUID	=	{
								[1]	=	"3d7c0866-0357-43e1-ace0-b9c7f8bd90be"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "2", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Enter Maztica - Desert Dwarf by SydMeier - https://www.nexusmods.com/baldursgate3/mods/9210
--
    {
        Name				=	"Desert Dwarf",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/9210"},
        modGuid				=	"1a3a0820-48e3-45b4-822a-7ee31e5d25c5",
        progressionUUID	=	{
								[1]	=	"75c28431-cd41-4256-af2e-0cadd4f8c2f8"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "2", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Beyond Faerun - Tinker Gnome by SydMeier - https://www.nexusmods.com/baldursgate3/mods/9547
--
    {
        Name				=	"Tinker Gnome",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/9547"},
        modGuid				=	"0b1613ac-1610-4ac4-ba8b-effe33317fd1",
        progressionUUID	=	{
								[1]	=	"a0ae2974-b54a-4e17-ba69-cde2f7448338"
							},
		Author			=	"SydMeier",
		SourceBook		=	"ERftLW",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "2", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Beyond Faerun - Whisper Gnome by SydMeier - https://www.nexusmods.com/baldursgate3/mods/9546
--
    {
        Name				=	"Whisper Gnome",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/9546"},
        modGuid				=	"f13d31f7-c897-494c-a988-bca2a71ccddc",
        progressionUUID	=	{
								[1]	=	"d45a8d46-8a68-4065-98da-9cc84bb2e3b1"
							},
		Author			=	"SydMeier",
		SourceBook		=	"ERftLW",
		MainRace		=	false,
		Stats			=	{"0", "2", "2", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Haunted Warriors - Ghostwise Halfling by SydMeier - https://www.nexusmods.com/baldursgate3/mods/8617
--
    {
        Name				=	"Ghostwise Halfling",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/8617"},
        modGuid				=	"f8f5f704-d463-4616-a321-9460060538ff",
        progressionUUID	=	{
								[1]	=	"0194f214-ffce-4e74-94b6-09e76a270e49"
							},
		Author			=	"SydMeier",
		SourceBook		=	"SCAG",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Enter Maztica - Wild Halfling by SydMeier - https://www.nexusmods.com/baldursgate3/mods/9211
--
    {
        Name				=	"Wild Halfling",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/9211"},
        modGuid				=	"9e7836a9-b1a9-4d4e-9089-563c43f4fb1e",
        progressionUUID	=	{
								[1]	=	"e8ccff14-10b6-43f7-bbfa-22ab2104f4fc"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Heart Of The Forest - Dryad by EmeraldTechno - https://www.nexusmods.com/baldursgate3/mods/6443
--
    {
        Name				=	"Dryad",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/6443"},
        modGuid				=	"e61be041-6c93-4576-a4b1-ad183e726f02",
        progressionUUID	=	{
								[1]	=	"c5671549-0282-4b60-a68d-47b676e9e2b9"
							},
		Author			=	"EmeraldTechno",
		SourceBook		=	"",
		MainRace		=	true,
    },
    {
        Name				=	"Dryad - Spring",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/6443"},
        modGuid				=	"e61be041-6c93-4576-a4b1-ad183e726f02",
        progressionUUID	=	{
								[1]	=	"40fdbfe4-2f41-4609-bb4c-ddb7bc49b5c4"
							},
		Author			=	"EmeraldTechno",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },
    {
        Name				=	"Dryad - Summer",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/6443"},
        modGuid				=	"e61be041-6c93-4576-a4b1-ad183e726f02",
        progressionUUID	=	{
								[1]	=	"64615482-5cd6-4bac-beba-bdd5dff19b89"
							},
		Author			=	"EmeraldTechno",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },
    {
        Name				=	"Dryad - Autumn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/6443"},
        modGuid				=	"e61be041-6c93-4576-a4b1-ad183e726f02",
        progressionUUID	=	{
								[1]	=	"9693b4ad-6ac7-401c-a6ab-5503785edfac"
							},
		Author			=	"EmeraldTechno",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },
    {
        Name				=	"Dryad - Winter",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/6443"},
        modGuid				=	"e61be041-6c93-4576-a4b1-ad183e726f02",
        progressionUUID	=	{
								[1]	=	"40ef0562-ac1b-4c5c-9831-5e3c4ce04c20"
							},
		Author			=	"EmeraldTechno",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },
--
-- Whispers of the Fey - Changelings by Trips ♥ - https://www.nexusmods.com/baldursgate3/mods/3110
--
    {
        Name				=	"Whispers of the Fey - Changelings", -- SelectAbilityBonus(b9149c8e-52c8-46e5-9cb6-fc39301c05fe,AbilityBonus,1)
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3110"},
        modGuid				=	"eaf83c50-1f22-4ce8-a825-25f07caf9faa",
        progressionUUID	=	{
								[1]	=	"fa7bf84a-a1d6-46b2-a779-739424d20b5b"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "0", "0", "2"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab				=	{"1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },
--
-- Whispers of the Fey - Goblins by Trips ♥ - https://www.nexusmods.com/baldursgate3/mods/3254
--
	{
		Name				=	"Goblins",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3254"},
		modGuid				=	"ca81f091-bf1b-4bb6-90dd-1c4ef83fd798",
		progressionUUID	=	{
								[1]	=	"fa9d4980-1b18-43e6-974b-4e3a2abae183"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"VGtM",
		MainRace		=	true
	},
	{
        Name				=	"Goblins Greenskin",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3254"},
        modGuid				=	"ca81f091-bf1b-4bb6-90dd-1c4ef83fd798",
        progressionUUID	=	{
								[1]	=	"5a317953-08ea-4424-ad93-05a0a66b4748"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"VGtM",
		MainRace		=	false,
		Stats			=	{"0", "2", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Goblins Dankwood",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3254"},
        modGuid				=	"ca81f091-bf1b-4bb6-90dd-1c4ef83fd798",
        progressionUUID	=	{
								[1]	=	"453c15bb-0ead-4766-b747-961066c84ee1"
							},
		Author			=	"Trips ♥",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Secrets of the Serpent - Yuan-ti by Trips ♥ - https://www.nexusmods.com/baldursgate3/mods/7922
--
    {
        Name				=	"Yuan-ti",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/7922"},
        modGuid				=	"b2d490bc-6e10-4bc2-89e0-69c8f68cd453",
        progressionUUID	=	{
								[1]	=	"139dba60-4895-496a-ab48-bbd45719f317"
							},
		Author			=	"tepkunset and neonbutchery",
		SourceBook		=	"",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "1", "2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Automaton Figgyinchains by GentlemanBabbo - https://github.com/GentlemanBabbo/Automaton/blob/main/
--
    {
        Name				=	"Automaton Figgyinchains",
		modURL			=	{"https://github.com/GentlemanBabbo/Automaton/blob/main/"},
        modGuid				=	"a56867c9-8260-4685-b8a5-6cc94be41152",
        progressionUUID	=	{
								[1]	=	"3615e5db-c3ac-4b3b-bd01-f618d1cd95b5"
							},
		Author			=	"GentlemanBabbo",
		SourceBook		=	"",
		MainRace		=	true,
		Stats			=	{"0", "0", "1", "1", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- The Nine Hells Unchained - Imp by SydMeier - https://www.nexusmods.com/baldursgate3/mods/10849
--
    {
        Name				=	"Imp",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"602818c4-ec05-4af9-9cb7-dedf06ec04a8"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	true
    },
    {
        Name				=	"Imp - Avernus",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"7ef3086e-0caa-4c31-ae61-03ff3f153c03"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Dis",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"ef5929ca-ed90-4050-9439-a9d0e080ee92"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Minauros",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"359d1af0-33b8-4949-b865-e7fb99e2590c"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Phlegethos",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"afbb84c9-612b-4300-a521-22abf2f65f06"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Stygia",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"c459c4d9-f97c-48db-b09d-c38482d03092"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Malbolge",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"ba346fb4-ddcf-45d8-9d61-1818763b710c"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Maladomini",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"f568ce77-922d-47ed-9163-05c4c1eb8fa6"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Cania",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"764e9049-246b-42f9-a71d-6b13272b34d7"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
    {
        Name				=	"Imp - Nessus",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/10849"},
        modGuid				=	"4b268977-b9ec-47fd-95e7-9b977969ba28",
        progressionUUID	=	{
								[1]	=	"f157b7c5-95fb-43dd-a32b-02b9c710d637"
							},
		Author			=	"SydMeier",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "1", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Avariel Elf by Ren - https://www.nexusmods.com/baldursgate3/mods/3680
--
    {
        Name				=	"Avariel Elf",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3680"},
        modGuid				=	"11675ee8-a7be-443b-9edb-125f33d21ce1",
        progressionUUID	=	{
								[1]	=	"77b6f9ec-7d6a-44b2-b110-88bf025eb586"
							},
		Author			=	"Ren",
		SourceBook		=	"",
		MainRace		=	true,
		Stats			=	{"0", "2", "0", "0", "0", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab				=	{"1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },
--
-- Orc Half-Elf by Soriyumi - https://www.nexusmods.com/baldursgate3/mods/5943
--
    {
        Name				=	"Orc Half-Elf",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5943"},
        modGuid				=	"d25f0ed3-efe7-4194-bdc6-671f784d7cef",
        progressionUUID	=	{
								[1]	=	"128ae023-fef6-4fa1-ade9-e338e60b8b56"
							},
		Author			=	"Soriyumi",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"1", "1", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
--
-- Skeleton by Rexsaze - https://www.nexusmods.com/baldursgate3/mods/4949
--
    {
        Name				=	"Skeleton race Rexsaze (playableundead)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/4949"},
        modGuid				=	"315ce1a1-0f24-4777-90d9-06b01a93a716",
        progressionUUID	=	{
								[1]	=	"042e6092-1602-4338-b6f9-cc7987f3bff4"
							},
		Author			=	"Sutherex",
		SourceBook		=	"",
		MainRace		=	true,
		Stats			=	{"0", "0", "1", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
	{
        Name 			= 	"Adapted Kender Race from Dragonlance: Shadow of the Dragon Queen",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/8465"},
        modGuid 		= 	"56fe7a47-e0d6-404e-b2d5-fd6e88cae6ae",
        progressionUUID	=	{
								[1]	=	"7551c355-8311-4c2f-b91b-9877ef608267"
							},
		Author			=	"8465",
		SourceBook		=	"DSotDQ",
		Comments		=	"The Alpha Race :-D",
		MainRace		=	false,
		Sab				=	{"1","1","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },
--[[
__________.__  __    __              __________                  __       _____             .___      
\______   \__|/  |__/  |_  __________\______   \_____    _______/  |_    /     \   ____   __| _/______
 |    |  _/  \   __\   __\/ __ \_  __ \     ___/\__  \  /  ___/\   __\  /  \ /  \ /  _ \ / __ |/  ___/
 |    |   \  ||  |  |  | \  ___/|  | \/    |     / __ \_\___ \  |  |   /    Y    (  <_> ) /_/ |\___ \ 
 |______  /__||__|  |__|  \___  >__|  |____|    (____  /____  > |__|   \____|__  /\____/\____ /____  >
		\/                    \/                     \/     \/                 \/            \/    \/ 
		 \_BitterPast Mods
]]--

--
-- Underdark's Chosen - Drow RP by BitterPast - https://www.nexusmods.com/baldursgate3/mods/3485
--
	{
		Name				=	"Assassin Drow",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/3485"},
		modGuid				=	"76015234-1bb4-42dc-adb9-c86c7f4cbb39",
		progressionUUID	=	{
								[1]	=	"4a634f24-bdcb-4559-b8be-7847133ad1c3"
							},
		Author			=	"BitterPast",
		SourceBook		=	"",
		MainRace		=	true,
		Stats			=	{"0", "2", "0", "0", "0", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},

--[[
  ________.__                     __  .__            ________.__                 .__            ____ ___           .___                 .___ __________                      
 /  _____/|  |__ _____    _______/  |_|  | ___.__.  /  _____/|  |__   ____  __ __|  |   ______ |    |   \____    __| _/____ _____     __| _/ \______   \_____    ____  ____  
/   \  ___|  |   \__  \  /  ___/\   __\  |<   |  | /   \  ___|  |  \ /  _ \|  |  \  |  /  ___/ |    |   /    \  / __ |/ __ \__   \   / __ |   |       _/\__  \ _/ ___\/ __ \ 
\    \_\  \   Y  \/ __ \_\___ \  |  | |  |_\___  | \    \_\  \   Y  (  <_> )  |  /  |__\___ \  |    |  /   |  \/ /_/ \  ___/ / __ \_/ /_/ |   |    |   \ / __ \  \__\  ___/ 
 \______  /___|  (____  /____  > |__| |____/ ____|  \______  /___|  /\____/|____/|____/____  > |______/|___|  /\____ |\___  >____  /\____ |   |____|_  /(____ /\___  >___  >
        \/     \/     \/     \/            \/              \/     \/                       \/               \/      \/    \/     \/      \/          \/      \/     \/   \/
        \_Ghastly Ghouls - Playable Undead Race 3.01 Used
]]--

--[[
{
        Name				=	"Undead (Ghastly Ghouls) MAIN",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5895"},
        modGuid				=	"f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        progressionUUID	=	{
								[1]	=	""
							},
		Author			=	"Ghouls0Rules",
		SourceBook		=	"",
		MainRace		=	true,
    },
]]--

	{
        Name				=	"Undead (Ghastly Ghouls) Lich",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5895"},
        modGuid				=	"f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        progressionUUID	=	{
								[1]	=	"7123242e-9e00-4b9e-8e4f-aa1b0477fe13"
							},
		Author			=	"Ghouls0Rules",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "0", "0", "2", "1", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
	{
        Name				=	"Undead (Ghastly Ghouls) Ghoul",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5895"},
        modGuid				=	"f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        progressionUUID	=	{
								[1]	=	"cfabed72-38b8-424d-a07d-058fbd4dd1a9"
							},
		Author			=	"Ghouls0Rules",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "0", "0", "1", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
	{
        Name				=	"Undead (Ghastly Ghouls) Mummy",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5895"},
        modGuid				=	"f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        progressionUUID	=	{
								[1]	=	"3a4465df-49a2-4278-9d16-f17ed876aede"
							},
		Author			=	"Ghouls0Rules",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "0", "0", "1", "2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
    },
	{
        Name				=	"Undead (Ghastly Ghouls) Wight",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/5895"},
        modGuid				=	"f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        progressionUUID	=	{
								[1]	=	"677de788-81da-4f2f-b0d1-75c6aa9a1c35", -- SelectAbilityBonus(b9149c8e-52c8-46e5-9cb6-fc39301c05fe,AbilityBonus,1);
							},
		Author			=	"Ghouls0Rules",
		SourceBook		=	"",
		MainRace		=	false,
		Stats			=	{"0", "0", "0", "0", "0", "1"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
		Sab				=	{"1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
    },

--[[
___________              __                   __  .__              .__       _____        .__   __  .__
\_   _____/____    _____/  |______    _______/  |_|__| ____ _____  |  |     /     \  __ __|  |_/  |_|__|__  __ ___________  ______ ____  
 |    __) \__  \  /    \   __\__  \  /  ___/\   __\  |/ ___\\__  \ |  |    /  \ /  \|  |  \  |\   __\  \  \/ // __ \_  __ \/  ___// __ \ 
 |     \   / __ \|   |  \  |  / __ \_\___ \  |  | |  \  \___ / __ \|  |__ /    Y    \  |  /  |_|  | |  |\   /\  ___/|  | \/\___ \\  ___/ 
 \___  /  (____  /___|  /__| (____  /____  > |__| |__|\___  >____  /____/ \____|__  /____/|____/__| |__| \_/  \___  >__|  /____  >\___  >
     \/        \/     \/          \/     \/               \/     \/               \/                              \/           \/     \/ 
      \_Fantastical Multiverse from Nexus
]]--

	{
		Name 			=	"Variant Human - Fantastical",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"5e53f556-ba7a-46fd-9dee-ba1ff456d8db",
		progressionUUID	=	{
								[1]	=	"0b88cad4-c5d0-4cde-a661-a8ede3f7d113"
							},
		Author			=	"Dungeons and Souls",
		Comments		=	"optional feat rules from the Player’s Handbook, \
		your Dungeon Master might allow these variant traits, all of which replace the human’s Ability Score Increase trait.",
		SourceBook		=	"PHB",
		MainRace		=	false,
		Sab				=	{"1","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Astral Elf",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"e7071309-78a8-4fad-949b-d4dd326dd39b",
		progressionUUID	=	{
								[1]	=	"06e918ad-be2c-48b6-a098-0288539de744"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"SAiS",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Reborn(Humanoid)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"07a0478e-ba76-4fc7-a671-1c13c66ede2e",
		progressionUUID	=	{
								[1]	=	"1253592f-5c8b-41b5-9ae7-b83b08ab92bb"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"VRGtR",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Downcast",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"21d14d75-2e99-4e85-82ad-7139c69b85fe",
		progressionUUID	=	{
								[1]	=	"aa03e8ed-a301-4e4a-bfde-ff7144e1fbb1"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"GHPG",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Elezen",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"3b7799fa-3dc0-47da-bf9f-fc590f7e2cdf",
		progressionUUID	=	{
								[1]	=	"9be04b6b-c89f-4e67-8431-d0cd9b97db15"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"EFFXIV",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Dhampir(Lineage)",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"f34c3aca-0b14-4001-af29-27e130cf5c5c",
		progressionUUID	=	{
								[1]	=	"de9b4cc2-94af-46d8-ab7d-31b00d81df03"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"VRGtR",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Orc",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"9cbbf22a-2af4-48c7-970a-fb61a6c20b15",
		progressionUUID	=	{
								[1]	=	"6c7094a4-bc8c-4613-9de6-5d9edec8e403"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"PHB",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Kender",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"4508d3bd-e721-47a4-894d-0e61c7b0380d",
		progressionUUID	=	{
								[1]	=	"727ce5d7-2c90-4cbb-bd52-6bd45067e27b"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"DSotDQ",
		MainRace		=	true,
		Sab				=	{"1","1","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Water Genasi",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"95d5279b-e063-459d-81d2-d4fa0cec27ca",
		progressionUUID	=	{
								[1]	=	"43759dcb-f50f-4c22-906c-d79c40a3dbb0"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Shadar-kai",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"6abf0f64-62d6-4e80-a141-5582e29783e7",
		progressionUUID	=	{
								[1]	=	"24991da3-14d0-4c65-85c6-9c62168415eb"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Air Genasi",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"35fd2505-5eff-45c5-96e9-98d848f35da4",
		progressionUUID	=	{
								[1]	=	"58af38d8-b039-4a75-91fa-4ef079318d8b"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Earth Genasi",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"3fe9bc5e-2723-4044-a06b-060aed98e40b",
		progressionUUID	=	{
								[1]	=	"47372143-e2a7-4cc5-9810-7caea80bd46a"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Firbolg",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"2b5c5a5b-5da3-4c65-b852-92ff75dda75a",
		progressionUUID	=	{
								[1]	=	"003cf78d-7db5-444e-9a2f-e41f9836c8c3"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Fire Genasi",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"410f1b65-e8a1-4f13-b4e8-ae25e5460a7e",
		progressionUUID	=	{
								[1]	=	"5a33238e-313f-4cce-8bac-f36db533b704"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Githzerai",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"dc812cdf-7fdb-4372-81c7-72df0e00f542",
		progressionUUID	=	{
								[1]	=	"8ffe5132-b5ad-424c-befb-eb4fc640a18b"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"PAitM",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "1", "2", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fantastical Goliath",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"ff15d50f-57d4-48d9-80ce-0ee75a669010",
		progressionUUID	=	{
								[1]	=	"d3ca9791-8f41-4819-9e2e-5c3f6dfb7778"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Kobold",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"d41e6098-288c-49ba-a861-1ab082f8e4b9",
		progressionUUID	=	{
								[1]	=	"9572fef0-12c6-4730-94ad-1471d54e7172"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Lizardfolk",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"44aeee6c-5a35-4733-89a1-420451c6a559",
		progressionUUID	=	{
								[1]	=	"fc81b68e-2835-4791-8a22-bfedee977765"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Minotaur",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"35e9d7e9-716d-4fdb-8b0b-6dac2526389d",
		progressionUUID	=	{
								[1]	=	"82319b4e-f38e-49b0-81cd-59953d54d824"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Sea Elf",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"13871336-692e-4af3-9e52-68cdf58330fb",
		progressionUUID	=	{
								[1]	=	"08bcd922-ef05-49e0-8e6f-3f6574c4d54c"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Triton",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"41e6aeb8-e8ae-41b8-b303-8ad2f8b43f61",
		progressionUUID	=	{
								[1]	=	"328aafb6-9e72-4702-b3ab-10bdbc5e953e"
							},
		Author			=	"",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Yuan-ti",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"bea5a09a-b394-4a52-9166-659cbc1bf183",
		progressionUUID	=	{
								[1]	=	"3fbd5365-bb01-4741-965d-2be2f11156bd"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"MPMotM",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Ogresh",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"0cc2683d-c407-40d6-ad65-8c5f95d7ef4b",
		progressionUUID	=	{
								[1]	=	"11d3fa5d-3e88-4c8c-b21c-e183d7208533"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"GHPG",
		MainRace		=	true,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Fantastical Yuan-ti Pureblood",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"94710eae-8809-42fe-ab17-5681ceae8714",
		progressionUUID	=	{
								[1]	=	"69a8edff-fdec-4ef5-aeb6-dcb15562b062"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"VGtML",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "1", "0", "2"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fantastical Pallid Elf",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"02ad19d9-bb24-44a6-9693-35cec821774c",
		progressionUUID	=	{
								[1]	=	"82704351-c1d6-4767-adef-49e25a290aad"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"EGtW",
		MainRace		=	false,
		Stats			=	{"0", "2", "0", "0", "1", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fantastical Vedalken",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"58474556-4b69-494d-b290-1421010d1742",
		progressionUUID	=	{
								[1]	=	"d17424ad-839d-4733-b16d-f7cb007c865f"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"GGtR",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "2", "1", "0"}, --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fantastical Kobold Legacy",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"866dee81-42b5-4647-9fb7-ec39271f6c96",
		progressionUUID	=	{
								[1]	=	"ee0bbb70-b8f7-44ec-9419-565ab963f664"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"VGtML",
		MainRace		=	true,
		Stats			=	{"0", "2", "0", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fantastical Kalashtar",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"cbd0f091-d2a7-4569-bdf8-56511cea3076",
		progressionUUID	=	{
								[1]	=	"0e35ec74-a63c-4d24-8912-4afa4a9930d8"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"VGtML",
		MainRace		=	true,
		Stats			=	{"0", "0", "0", "0", "2", "1"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},
	{
		Name				=	"Fantastical Bugbear",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/215"},
		modGuid				=	"f4361c10-b197-4490-ae30-06ce796f950e",
		progressionUUID	=	{
								[1]	=	"d01d244f-3ae2-4d15-b0ba-9aed04fc16ac"
							},
		Author			=	"Dungeons and Souls",
		SourceBook		=	"VGtML",
		MainRace		=	true,
		Stats			=	{"2", "1", "0", "0", "0", "0"} --[[ "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma" ]]
	},

--[[
___________.__       ___.                          ___________                                                          _____  ________                                             
\_   _____/|__|______\_ |__ _____    ____   ______ \__    ___/______   ____ _____    ________ _________ ___.__.   _____/ ____\ \______ \____________     ____   ____   ____   ______
 |    __)  |  \___   /| __ \\__  \  /    \ /  ___/   |    |  \_  __ \_/ __ \\__  \  /  ___/  |  \_  __ <   |  |  /  _ \   __\   |    |  \_  __ \__  \   / ___\ /  _ \ /    \ /  ___/
 |     \   |  |/    / | \_\ \/ __ \|   |  \\___ \    |    |   |  | \/\  ___/ / __ \_\___ \|  |  /|  | \/\___  | (  <_> )  |     |    `   \  | \// __ \_/ /_/  >  <_> )   |  \\___ \ 
 \___  /   |__/_____ \|___  (____  /___|  /____  >   |____|   |__|    \___  >____  /____  >____/ |__|   / ____|  \____/|__|    /_______  /__|  (____  /\___  / \____/|___|  /____  >
     \/             \/    \/     \/     \/     \/                         \/     \/     \/              \/                             \/           \//_____/             \/     \/ 
     \_Fizbans Treasury of Dragons
]]--

	{
		Name				=	"Amethyst Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1793"},
		modGuid				=	"1e64a434-4318-42fe-9388-e6aa49505094",
		progressionUUID	=	{
								[1]	=	"862da67a-a65a-4cae-b9da-aceb974bc6e2"
							},
		Author			=	"3XC4L1B3R",
		SourceBook		=	"PHB",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Crystal Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1793"},
		modGuid				=	"1e64a434-4318-42fe-9388-e6aa49505094",
		progressionUUID	=	{
								[1]	=	"f416a104-9a39-47ee-a96f-755f60f63d3e"
							},
		Author			=	"3XC4L1B3R",
		SourceBook		=	"PHB",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Emerald Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1793"},
		modGuid				=	"1e64a434-4318-42fe-9388-e6aa49505094",
		progressionUUID	=	{
								[1]	=	"8c099c31-cc1b-4aa2-b6ba-43b46b607e5d"
							},
		Author			=	"3XC4L1B3R",
		SourceBook		=	"PHB",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Sapphire Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1793"},
		modGuid				=	"1e64a434-4318-42fe-9388-e6aa49505094",
		progressionUUID	=	{
								[1]	=	"aff81767-f832-4599-b980-e4123cec0306"
							},
		Author			=	"3XC4L1B3R",
		SourceBook		=	"PHB",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Topaz Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/1793"},
		modGuid				=	"1e64a434-4318-42fe-9388-e6aa49505094",
		progressionUUID	=	{
								[1]	=	"f9d85bdb-2930-42b9-ace1-78b9187e8546"
							},
		Author			=	"3XC4L1B3R",
		SourceBook		=	"PHB",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},

--[[
____________________ ________  ________ ________                                    ___.                           _________    ___.                               ___________                                  .__               
\______   \______   \\_____  \/  _____/ \______ \____________     ____   ____   ____\_ |__   ___________  ____    /   _____/__ _\_ |______________    ____  ____   \_   _____/__  ______________    ____   _____|__| ____   ____  
 |    |  _/|    |  _/ /  ____/   __  \   |    |  \_  __ \__  \   / ___\ /  _ \ /    \| __ \ /  _ \_  __ \/    \   \_____  \|  |  \ __ \_  __ \__  \ _/ ___\/ __ \   |    __)_\  \/  /\____ \__  \  /    \ /  ___/  |/  _ \ /    \ 
 |    |   \|    |   \/       \  |__\  \  |    `   \  | \// __ \_/ /_/  >  <_> )   |  \ \_\ (  <_> )  | \/   |  \  /        \  |  / \_\ \  | \// __ \\  \__\  ___/   |        \>    < |  |_> > __ \|   |  \\___ \|  (  <_> )   |  \
 |______  /|______  /\_______ \_____  / /_______  /__|  (____  /\___  / \____/|___|  /___  /\____/|__|  |___|  / /_______  /____/|___  /__|  (____  /\___  >___  > /_______  /__/\_ \|   __(____  /___|  /____  >__|\____/|___|  /
        \/        \/         \/     \/          \/           \//_____/             \/    \/                  \/          \/          \/           \/     \/    \/          \/      \/|__|       \/     \/     \/               \/ 
        \_BB26 Dragonborn Subrace Expansion
]]--
	{
		Name				=	"Pink Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"50ee17bb-bc53-4d03-8100-0dd6c6bb48f8"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Shadow Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},

		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"e216af62-5c9d-492b-8d2f-bf669d70b078"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Solar Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"a36bfa8a-afeb-4ff3-9985-8726cc45a8c8"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Lunar Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"edfcb043-f704-4a84-a5ba-a9098787eb81"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Deep Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"097c8ee7-0525-4a9f-b614-24d1dd46aac6"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Moonstone Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"c990525f-e49b-4f82-b31f-e5dff0afed0a"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Grey Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"f011eebf-9545-4972-98d1-841c61b0ccae"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Yellow Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"f75743c6-8a0e-49a6-b9b1-4a001ea0ffb2"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Orange Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"039b3255-28c6-43a1-a40c-4fbbec842cb4"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	},
	{
		Name				=	"Purple Dragonborn",
		modURL			=	{"https://www.nexusmods.com/baldursgate3/mods/2116"},
		modGuid				=	"05fa72c7-be18-4398-b0c6-a5c11fc897f6",
		progressionUUID	=	{
								[1]	=	"19f4eded-03fb-4363-90c2-689bff080c4b"
							},
		Author			=	"Backburner26",
		SourceBook		=	"",
		MainRace		=	false,
		Sab				=	{"2","1"} --[[ valeurs autorisé : {"0","0","0"} ou {"0","0"} ou {"0"} ]]
	}
}

--[[ 
Todo

PHB
variant human mods
- https://www.nexusmods.com/baldursgate3/mods/3468
- https://www.nexusmods.com/baldursgate3/mods/10232
- https://www.nexusmods.com/baldursgate3/mods/875



5e Extended
- Playable Genasi race - https://www.nexusmods.com/baldursgate3/mods/4557
- Mori's Astral Elves - https://www.nexusmods.com/baldursgate3/mods/7718
- Astral Elves 5E - https://www.nexusmods.com/baldursgate3/mods/1780
- Astral Elves - https://www.nexusmods.com/baldursgate3/mods/1388
- Astral Half-Elves - https://www.nexusmods.com/baldursgate3/mods/9676
- Playable Ogre M-F - https://www.nexusmods.com/baldursgate3/mods/425  		Stats			=	{"4", "-1", "3", "-3", "-2", "-2"}

Half-homebrew
- Demon Player Race - https://www.nexusmods.com/baldursgate3/mods/3703
- Half-Dragon - https://www.nexusmods.com/baldursgate3/mods/2634
- Half Demon (Cambion) Realistic - https://www.nexusmods.com/baldursgate3/mods/4905
- Displacer Player Race and Hireling - https://www.nexusmods.com/baldursgate3/mods/5002

Homebrew
- The Dunmer - Playable Dark Elf Race - https://www.nexusmods.com/baldursgate3/mods/4076
- Tiger Race Mod by Babbo - https://www.nexusmods.com/baldursgate3/mods/10532
- Coven of the Underdark - Vampiric Drow Subrace - https://www.nexusmods.com/baldursgate3/mods/10456
- Inner Planes Unleashed - Mephit Race - https://www.nexusmods.com/baldursgate3/mods/10814
- Animal's Essence - Playable BeastFolk Race - https://www.nexusmods.com/baldursgate3/mods/9768
- The Godkin - https://www.nexusmods.com/baldursgate3/mods/9564
- Playable Dire Wolf Race - https://www.nexusmods.com/baldursgate3/mods/2264
- Playable Skeletons - https://www.nexusmods.com/baldursgate3/mods/565
- Emerald's Catbugs (Homebrew Race) - https://www.nexusmods.com/baldursgate3/mods/8919
- Wolfkind Race by Team TechnoBabble - https://www.nexusmods.com/baldursgate3/mods/8591
- Stoneborn Race - Homebrew by Team TechnoBabble - https://www.nexusmods.com/baldursgate3/mods/7782

BitterPast - Collection
- Vastly Superior Gnomes - https://www.nexusmods.com/baldursgate3/mods/3364
- Human Zombie-WhiteWalker RP - https://www.nexusmods.com/baldursgate3/mods/3370
- Sins of the Father - Dark Urge RP - https://www.nexusmods.com/baldursgate3/mods/3822
- Metallic and Chromatic Dragonborn Combined - https://www.nexusmods.com/baldursgate3/mods/3450
- Berserker Dragonborn Combined - https://www.nexusmods.com/baldursgate3/mods/3394
- Assassin RP Elf and Halfling - https://www.nexusmods.com/baldursgate3/mods/3437
- Undead Dragonborn Traits - https://www.nexusmods.com/baldursgate3/mods/3372
- Variant Human RP - https://www.nexusmods.com/baldursgate3/mods/3468
- The Dwarf King - https://www.nexusmods.com/baldursgate3/mods/3378
- Wood Elf Beastmaster Combined - https://www.nexusmods.com/baldursgate3/mods/3395
- Barbarian Half-Orc and others Combined - https://www.nexusmods.com/baldursgate3/mods/3371
- Arcane Trickster Drow Race Combined - https://www.nexusmods.com/baldursgate3/mods/3373
- Slightly Better Dragonborn - https://www.nexusmods.com/baldursgate3/mods/3300
]]--