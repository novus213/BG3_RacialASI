--[[
   _____    ______________________________.____      ___________.__                                    
  /  _  \  /   _____/\__    ___/\______   \    |     \_   _____/|  |   _______  __ ____   ____   ______
 /  /_\  \ \_____  \   |    |    |       _/    |      |    __)_ |  | _/ __ \  \/ // __ \ /    \ /  ___/
/    |    \/        \  |    |    |    |   \    |___   |        \|  |_\  ___/\   /\  ___/|   |  \\___ \ 
\____|__  /_______  /  |____|    |____|_  /_______ \ /_______  /|____/\___  >\_/  \___  >___|  /____  >
        \/        \/                    \/        \/         \/           \/          \/     \/     \/ 
         \_Astralities' Elven Anthology 1.0 Used

]]--

local AstralitiesElevens = {
    elevensFixed = {
        { Name = "ASTRL_MoonElf_LevelOne",  UUID = "934762bb-eebd-4b42-b050-540148507a4a", Strings = {"Ability(Dexterity,2)", "Ability(Charisma,1)"} },
        { Name = "ASTRL_SnowElf_LevelOne",  UUID = "02e1d9ac-bcc4-4391-9e78-5df33f60ca64", Strings = {"Ability(Constitution,2)", "Ability(Wisdom,1)"} },
        { Name = "ASTRL_SunElf_LevelOne",  UUID = "1089dddf-4e75-4e1b-bf2a-33affd0f6093", Strings = {"Ability(Dexterity,2)", "Ability(Constitution,1)"} },
        { Name = "ASTRL_LythariElf_LevelOne",  UUID = "9b37ca29-0d77-4a27-a662-8464ce9998bb", Strings = {"Ability(Dexterity,2)", "Ability(Charisma,1)"} },
    },

    elevensFloating = {
        { Name = "ASTRL_DuskElf_LevelOne",  UUID = "50d5a39d-4497-4d71-9368-d6c8c04f97dd" },
        { Name = "ASTRL_Aevendrow_LevelOne",  UUID = "025aa2fb-2d4a-4419-9124-bbbf082f1808" },
        { Name = "ASTRL_Lorendrow_LevelOne",  UUID = "2d238465-02f2-4d92-9753-c1a51b384909" },
        { Name = "ASTRL_LolthtouchedDrow_LevelOne",  UUID = "8dd9c3ff-3b51-44d5-9f52-c4fcca43ec9c" },
        { Name = "ASTRL_ZarithraDrow_LevelOne",  UUID = "8742ecd7-5d7a-40bf-8b48-3798faf16bfc" },
        { Name = "ASTRL_HalfDuskElf_LevelOne",  UUID = "26aeca77-7941-49c5-ab2a-314901e5ea12" },
        { Name = "ASTRL_HalfMoonElf_LevelOne",  UUID = "762d103c-4e05-4887-a2dc-264eaa554f02" },
        { Name = "ASTRL_HalfSnowElf_LevelOne",  UUID = "a719ffc3-fdb2-4e4d-bcef-499c11cd641d" },
        { Name = "ASTRL_HalfStarElf_LevelOne",  UUID = "d0cde5e4-240f-405e-bf3c-3178298fcfb3" },
        { Name = "ASTRL_HalfSunElf_LevelOne",  UUID = "b50c9433-037c-418d-a173-13781a93cab2" },
        { Name = "ASTRL_LythariHalfElf_LevelOne",  UUID = "c1abf705-91b3-4ad9-a1db-7083f91011b1" },
        { Name = "ASTRL_HalfAevendrow_LevelOne",  UUID = "dc9e985a-6b20-4066-ab3d-eed16191122b" },
        { Name = "ASTRL_HalfLorendrow_LevelOne",  UUID = "3140a061-8e1f-4c9e-bca2-1c0ed5a3ae65" },
    },

    elevensStar = {
        { Name = "ASTRL_StarElf_LevelOne",  UUID = "e4c4c550-d4c7-43c5-92ba-49f93691356a" }, -- Ability Score Increase. Your Charisma or Wisdom score increases by 1.
    }
}

local modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19" -- ASTRLElevens
local Framework_UUID = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9" -- CompatibilityFramework
local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"
local PassivesSunElf_UUID = "69b3308e-674c-429c-b46c-a68e3693ce52"
local VariantAbilityList = "f773e653-ff37-455b-86af-7029d7fa41c9"

local function createPayload(entry, sourceType)
    local payload = {
        modGuid = modGuid,
        Target = entry.UUID,
        FileType = "Progression"
    }

    if sourceType == "elevensFloating" then
        payload.Function = "SelectAbilityBonus"
        payload.Params = {
            Guid = AbilityList_UUID,
            Amount = "2",
            BonusType = "AbilityBonus",
            Amounts = {"2", "1"}
        }
    elseif sourceType == "elevensStar" then
        payload.Function = "SelectPassives"
        payload.Params = {
            Guid = PassivesSunElf_UUID,
            Amount = "1"
        }
        payload.Type = "Boosts"
        abilityDexSunElf = {"Ability(Dexterity,2)"}
        payload.Strings = abilityDexSunElf
    elseif sourceType == "elevensFixed" then
        payload.Type = "Boosts"
        payload.Strings = entry.Strings
    end

    return payload
end

local function insertPayload(payload, sourceType)
    if sourceType == "elevensFixed" then
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

local function AstralitiesElevensOnStatsLoaded()
    if Ext.Mod.IsModLoaded(modGuid) then
        local elevensTypes = {"elevensFixed", "elevensFloating", "elevensStar"}

        for _, sourceType in ipairs(elevensTypes) do
            local sources = AstralitiesElevens[sourceType]
            processSources(sources, sourceType)
        end
    end

      BasicPrint(" _____    ______________________________.____      ___________.__                                    ","INFO", nil, nil, true)
      BasicPrint("/  _  \\  /   _____/\\__    ___/\\______   \\    |     \\_   _____/|  |   _______  __ ____   ____   ______","INFO", nil, nil, true)
      BasicPrint("/  /_\\  \\ \\_____  \\   |    |    |       _/    |      |    __)_ |  | _/ __ \\  \\/ // __ \\ /    \\ /  ___/","INFO", nil, nil, true)
     BasicPrint("/    |    \\/        \\  |    |    |    |   \\    |___   |        \\|  |_\\  ___/\\   /\\  ___/|   |  \\\\___ \\ ","INFO", nil, nil, true)
    BasicPrint("\\____|__  /_______  /  |____|    |____|_  /_______ \\ /_______  /|____/\\___  >\\_/  \\___  >___|  /____  >","INFO", nil, nil, true)
    BasicPrint("          \\/        \\/                    \\/        \\/         \\/           \\/          \\/     \\/     \\/ ","INFO", nil, nil, true)
    BasicPrint("           \\\\_Astralities' Eleven Anthology 1.0 Used","INFO", nil, nil, true)
    BasicPrint("                               ")
    BasicWarning("============> Ability bonuses inserted to Astralities Elevens")
    BasicPrint("                               ")
    BasicPrint("                               ")
end

if Ext.Mod.IsModLoaded(Framework_UUID) and Ext.Mod.IsModLoaded(modGuid) then
    Ext.Events.StatsLoaded:Subscribe(AstralitiesElevensOnStatsLoaded)
end