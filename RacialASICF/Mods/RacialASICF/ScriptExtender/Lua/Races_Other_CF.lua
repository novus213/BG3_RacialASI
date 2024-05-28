local Framework_UUID = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9"
local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

local RaceModsFloating = {
    {
        Race = "Whispers of the Fey - Goblins",
        modGuid = "ca81f091-bf1b-4bb6-90dd-1c4ef83fd798",
        UUID = "fa9d4980-1b18-43e6-974b-4e3a2abae183"
    },
    {
        Race = "Whispers of the Fey - Changelings",
        modGuid = "eaf83c50-1f22-4ce8-a825-25f07caf9faa",
        UUID = "fa7bf84a-a1d6-46b2-a779-739424d20b5b"
    },
    {
        Race = "Fairy (Flutter and Whimsy)",
        modGuid = "673c5b7b-a274-4916-ad89-4e3c591e1187",
        UUID = "7b4d6e73-c54f-41ed-bd69-c25be95e9717"
    },
    {
        Race = "Undead (Ghastly Ghouls)",
        modGuid = "f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        UUID = "a21579fc-b7d7-4295-bf5c-d2111be3f13a"
    },
    {
        Race = "Fey (Eladrin)",
        modGuid = "abc09812-ed4d-43ff-9a93-ee46487e81d9",
        UUID = "c2c089df-c622-4074-ab18-a4bde879a055"
    },
    {
        Race = "Followers Of Zerthimon Githzerai)",
        modGuid = "ae6eacb7-f346-418f-89a9-f0e4c697baab",
        UUID = "8e8928df-70b1-43c0-bc86-40b32c455bee"
    }, 
    {
        Race = "Followers Of Zerthimon (Githzerai)",
        modGuid = "d6d1028e-68fb-4e94-83d8-e8951f55b86a",
        UUID = "8e8928df-70b1-43c0-bc86-40b32c455bee"
    },
    {
        Race = "Firbolgs (Forest Friends)",
        modGuid = "ecfb9910-1b38-4bbc-a873-4f2812fff276",
        UUID = "7eede716-00f0-43aa-ad18-f001f8c7c283"
    },
    {
        Race = "Genasi (Elemental Power)",
        modGuid = "97954f72-711b-4938-a5ae-6a477b2ed574",
        UUID = "e808d2a5-a9eb-403f-bab9-90a5114a699c"
    },
    {
        Race = "Satyr (Wine and Revelry)",
        modGuid = "68315895-8bd4-4d53-aefc-1b853ffc1461",
        UUID = "eb3ac23d-3f7f-44d5-ad6a-bb99232d63bd"
    },
    {
        Race = "Kender (Collectors from Krynnspace - Kender Race)",
        modGuid = "56fe7a47-e0d6-404e-b2d5-fd6e88cae6ae",
        UUID = "7551c355-8311-4c2f-b91b-9877ef608267"
    }

}

local raceModsFixed = {
    {
        Race = "Halfling (Haunted Warriors)",
        modGuid = "f8f5f704-d463-4616-a321-9460060538ff",
        UUID = "0194f214-ffce-4e74-94b6-09e76a270e49",
        Strings = {"Ability(Dexterity,2)", "Ability(Wisdom,1)"}
    },
    {
        Race = "Halfling (Haunted Warriors UT)",
        modGuid = "f8f5f704-d463-4616-a321-9460060538ff",
        UUID = "0194f214-ffce-4e74-94b6-09e76a270e49",
        Strings = {"Ability(Dexterity,2)", "Ability(Wisdom,1)"}
    }
}

local function createPayload(mod, bonusType)
    local payload = {
        modGuid = mod.modGuid,
        Target = mod.UUID,
        FileType = "Progression"
    }
    if bonusType == "floating" then
        payload.Function = "SelectAbilityBonus"
        payload.Params = {
            Guid = AbilityList_UUID,
            Amount = "2",
            BonusType = "AbilityBonus",
            Amounts = { "2", "1" }
        }
    else
        payload.Type = "Boosts"
        payload.Strings = mod.Strings
    end
    return payload
end

local function insertBonuses(mod, bonusType)
    if mod.modGuid and Ext.Mod.IsModLoaded(mod.modGuid) then
        local payload = createPayload(mod, bonusType)
        if bonusType == "floating" then
            Mods.SubclassCompatibilityFramework.Api.InsertSelectors({ payload })
        else
            Mods.SubclassCompatibilityFramework.Api.InsertBoosts({ payload })
        end
        return true
    end
    return false
end

local function CustomRacesOnStatsLoaded()
    local insertedModNames = {}

    for _, mod in ipairs(RaceModsFloating) do
        if insertBonuses(mod, "floating") then
            table.insert(insertedModNames, mod.Race)
        end
    end

    for _, mod in ipairs(raceModsFixed) do
        if insertBonuses(mod, "fixed") then
            table.insert(insertedModNames, mod.Race)
        end
    end

    -- Log the results
    if #insertedModNames > 0 then 
        Ext.Utils.Print("[PHB_Progression] Ability bonuses inserted to " .. 
                 #insertedModNames .. " mods: " .. 
                 table.concat(insertedModNames, ", "))
    end
end

if Ext.Mod.IsModLoaded(Framework_UUID) then 
    Ext.Events.StatsLoaded:Subscribe(CustomRacesOnStatsLoaded)
end
