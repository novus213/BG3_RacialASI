--[[
   _____    ______________________________.____      ___________.__        _____.__  .__
  /  _  \  /   _____/\__    ___/\______   \    |     \__    ___/|__| _____/ ____\  | |__| ____    ____  ______
 /  /_\  \ \_____  \   |    |    |       _/    |       |    |   |  |/ __ \   __\|  | |  |/    \  / ___\/  ___/
/    |    \/        \  |    |    |    |   \    |___    |    |   |  \  ___/|  |  |  |_|  |   |  \/ /_/  >___ \
\____|__  /_______  /  |____|    |____|_  /_______ \   |____|   |__|\___  >__|  |____/__|___|  /\___  /____  >
        \/        \/                    \/        \/                    \/                   \//_____/     \/
         \_Astralities' Tiefling Compendium 3.1 Used
Argelia source mixed
]] --

local AstralitiesTieflings = {
    tieflingsFixed = {
        {
            Name = "ASTRL_Baalzebul_Tiefling",
            UUID = "ad21229c-c202-4c86-af26-b5c47d36ff01",
            Strings = {"Ability(Charisma,2)", "Ability(Intelligence,1)"}
        },
        {
            Name = "ASTRL_Dispater_Tiefling",
            UUID = "535fb417-7341-4710-b500-0ac5602de515",
            Strings = {"Ability(Charisma,2)", "Ability(Dexterity,1)"}
        },
        {
            Name = "ASTRL_Fierna_Tiefling",
            UUID = "929b6fe8-7415-43c7-9e2b-a3c87962e77d",
            Strings = {"Ability(Charisma,2)", "Ability(Wisdom,1)"}
        },
        {
            Name = "ASTRL_Glasya_Tiefling",
            UUID = "1a215890-3ffc-4c4e-bf19-b70aa67c25cf",
            Strings = {"Ability(Charisma,2)", "Ability(Dexterity,1)"}
        },
        {
            Name = "ASTRL_Levistus_Tiefling",
            UUID = "62899e1e-d6b6-448d-847c-085a07d1f41d",
            Strings = {"Ability(Charisma,2)", "Ability(Constitution,1)"}
        },
        {
            Name = "ASTRL_Mammon_Tiefling",
            UUID = "bf7c8b2d-5b6e-467e-b080-d85de151f57a",
            Strings = {"Ability(Charisma,2)", "Ability(Intelligence,1)"}
        },
        {
            Name = "ASTRL_Variant_Tiefling",
            UUID = "da92f08b-96fd-42b2-80f1-45b7bc9e703f",
            Strings = {"Ability(Intelligence,1)"}
        },
        {
            Name = "ASTRL_Winged_Tiefling",
            UUID = "e2519a78-67c8-41d2-a276-fc4889511346",
            Strings = {"Ability(Intelligence,1)"}
        }
    },
    tieflingsFloating = {
        {Name = "ASTRL_Nightborn_Tiefling", UUID = "fa15d3e5-3f15-4d59-857a-804098843516"},
        {Name = "ASTRL_Feyri_Tiefling", UUID = "3d807581-2721-4ba2-82bf-d91b345f7d81"},
        {Name = "ASTRL_Elamshinae_Tiefling", UUID = "b42939aa-ce0d-40c7-8b0b-98cc4c122214"},
        {Name = "ASTRL_Velkynbol_Tiefling", UUID = "3968f318-3ba4-4325-86f4-88ba7c01d999"},
        {Name = "ASTRL_Isilmnirel_Tiefling", UUID = "c9ebad8c-3f9c-42ff-a2c2-53e83578df8c"}
    },
    tieflingsCustomList = {
        {Name = "ASTRL_Variant_Tiefling", UUID = "da92f08b-96fd-42b2-80f1-45b7bc9e703f"},
        {Name = "ASTRL_Winged_Tiefling", UUID = "e2519a78-67c8-41d2-a276-fc4889511346"}
    }
}

local modGuid = "167b846f-0a0b-4e0c-a9d0-df448be1320a" -- ASTRLTieflings
local Framework_UUID = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9" -- CompatibilityFramework
local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"
local VariantAbilityList = "0a42b87b-a001-4091-8072-a611a85fa465"

local function createPayload(entry, sourceType)
    local payload = {
        modGuid = modGuid,
        Target = entry.UUID,
        FileType = "Progression"
    }

    if sourceType == "tieflingsFloating" then
        payload.Function = "SelectAbilityBonus"
        payload.Params = {
            Guid = AbilityList_UUID,
            Amount = "2",
            BonusType = "AbilityBonus",
            Amounts = {"2", "1"}
        }
    elseif sourceType == "tieflingsCustomList" then
        payload.Function = "SelectAbilityBonus"
        payload.Params = {
            Guid = VariantAbilityList,
            Amount = "1",
            BonusType = "AbilityBonus",
            Amounts = {"2"}
        }
    elseif sourceType == "tieflingsFixed" then
        payload.Type = "Boosts"
        payload.Strings = entry.Strings
    end

    return payload
end

local function insertPayload(payload, sourceType)
    if sourceType == "tieflingsFixed" then
        Mods.SubclassCompatibilityFramework.Api.InsertBoosts({payload})
    else
        Mods.SubclassCompatibilityFramework.Api.InsertSelectors({payload})
    end
end

local function processSources(sources, sourceType)
    for _, entry in ipairs(sources) do
        local payload = createPayload(entry, sourceType)
        insertPayload(payload, sourceType)
    end
end

local function AstralitiesTieflingsOnStatsLoaded()
    if Ext.Mod.IsModLoaded(modGuid) then
        local tieflingsTypes = {"tieflingsFixed", "tieflingsFloating", "tieflingsCustomList"}

        for _, sourceType in ipairs(tieflingsTypes) do
            local sources = AstralitiesTieflings[sourceType]
            processSources(sources, sourceType)
        end
    end
    BasicPrint(
        "     _____    ______________________________.____      ___________.__        _____.__  .__                      ",
        "INFO",
        nil,
        nil,
        true
    )
    BasicPrint(
        "    /  _  \\  /   _____/\\__    ___/\\______   \\    |     \\__    ___/|__| _____/ ____\\  | |__| ____    ____  ______",
        "INFO",
        nil,
        nil,
        true
    )
    BasicPrint(
        "   /  /_\\  \\ \\_____  \\   |    |    |       _/    |       |    |   |  |/ __ \\   __\\|  | |  |/    \\  / ___\\/  ___/",
        "INFO",
        nil,
        nil,
        true
    )
    BasicPrint(
        "  /    |    \\/        \\  |    |    |    |   \\    |___    |    |   |  \\  ___/|  |  |  |_|  |   |  \\/ /_/  >___ \\ ",
        "INFO",
        nil,
        nil,
        true
    )
    BasicPrint(
        "  \\____|__  /_______  /  |____|    |____|_  /_______ \\   |____|   |__|\\___  >__|  |____/__|___|  /\\___  /____  >",
        "INFO",
        nil,
        nil,
        true
    )
    BasicPrint(
        "          \\/        \\/                    \\/        \\/                    \\/                   \\//_____/     \\/ ",
        "INFO",
        nil,
        nil,
        true
    )
    BasicPrint("           \\_Astralities' Tiefling Compendium 3.1 Used", "INFO", nil, nil, true)
    BasicPrint("                               ")
    BasicWarning("============> Ability bonuses inserted to Astralities Tieflings")
    BasicPrint("                               ")
    BasicPrint("Config.loaded() Happy Fun Gaming! ", "INFO", nil, nil, true)
    BasicPrint("                               ")
end

if Ext.Mod.IsModLoaded(Framework_UUID) and Ext.Mod.IsModLoaded(modGuid) then
    Ext.Events.StatsLoaded:Subscribe(AstralitiesTieflingsOnStatsLoaded)
end
