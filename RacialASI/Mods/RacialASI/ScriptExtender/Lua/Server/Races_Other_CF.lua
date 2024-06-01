local Framework_UUID = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9"
local AbilityList_UUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

local RaceModsFloating = {
    {
        Race = "Fairy (Flutter and Whimsy)",
        modGuid = "673c5b7b-a274-4916-ad89-4e3c591e1187",
        UUID = "7b4d6e73-c54f-41ed-bd69-c25be95e9717"
    },
    {
        Race = "Genasi (Elemental Power)",
        modGuid = "97954f72-711b-4938-a5ae-6a477b2ed574",
        UUID = "e808d2a5-a9eb-403f-bab9-90a5114a699c"
    },
    {
        Race = "Owlin",
        modGuid = "315ce1a1-0f24-4777-90d9-06b01a93a716",
        UUID = "b5f04836-e2ef-4eb6-93d5-4aad7f3b1c20"
    },
    {
        Name = "Myconid",
        UUID = "ada1a74c-89dd-45f9-95dd-f88bf59e3535",
        modGuid = "71486ac7-a05c-434e-8e3b-9e6c2d40a04a"
    }
}

local RaceModsFloating_111 = {
    {
        Race = "Adapted Kender Race from Dragonlance: Shadow of the Dragon Queen (EOTB Version)",
        modGuid = "56fe7a47-e0d6-404e-b2d5-fd6e88cae6ae",
        UUID = "7551c355-8311-4c2f-b91b-9877ef608267"
    }
}

local RaceModsFloating_11 = { -- bugg a tester
    {
        Race = "Variant Human - Fantastical",
        modGuid = "5e53f556-ba7a-46fd-9dee-ba1ff456d8db",
        UUID = "0b88cad4-c5d0-4cde-a661-a8ede3f7d113"
    }
}

local RaceModsFloating_1 = {
    {
        Race = "Undead (Ghastly Ghouls) Wight",
        modGuid = "f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        UUID = "677de788-81da-4f2f-b0d1-75c6aa9a1c35", -- SelectAbilityBonus(b9149c8e-52c8-46e5-9cb6-fc39301c05fe,AbilityBonus,1);
    },
    {
        Race = "Whispers of the Fey - Changelings", -- SelectAbilityBonus(b9149c8e-52c8-46e5-9cb6-fc39301c05fe,AbilityBonus,1)
        modGuid = "eaf83c50-1f22-4ce8-a825-25f07caf9faa",
        UUID = "fa7bf84a-a1d6-46b2-a779-739424d20b5b",
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
        Race = "Aasimar(Radiant Soul)", 
        UUID = "4c2c61ae-5904-4576-a8c5-efecce67ab82", 
        modGuid = "ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
        Strings = {"Ability(Charisma,2)", "Ability(Wisdom,1)"}
    },
    {   Race = "Aasimar(Radiant Consumption)", 
        UUID = "56d62681-9769-4ad7-9bbf-4f72db44f070", 
        modGuid = "ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
        Strings = {"Ability(Charisma,2)", "Ability(Consumption,1)"}
    },
    { 
        Race = "Aasimar(Necrotic Shroud)",
        UUID = "1b07140b-98c1-42e8-b4ec-072622862dc2",
        modGuid = "ab267ed4-b3b5-4b4f-a62c-7dbc95c968fa",
        Strings = {"Ability(Charisma,2)", "Ability(Strength ,1)"}
    },
    {
        Race = "Satyr (Wine and Revelry)",
        modGuid = "68315895-8bd4-4d53-aefc-1b853ffc1461",
        UUID = "eb3ac23d-3f7f-44d5-ad6a-bb99232d63bd",
        Strings = {"Ability(Dexterity,1)", "Ability(Charisma,2)"}
    },
    {
        Race = "Transient Guests Are We - Playable Dhampir",
        modGuid = "7a4aaaca-88a7-41c4-98d6-de2df39496fe",
        UUID = "58971151-461d-4556-8db7-5894af1dceb2",
        Strings = {"Ability(Dexterity,1)", "Ability(Charisma,2)"}
    },
    {
        Race = "Followers Of Zerthimon (Githzerai)",
        modGuid = "ae6eacb7-f346-418f-89a9-f0e4c697baab",
        UUID = "8e8928df-70b1-43c0-bc86-40b32c455bee",
        Strings = {"Ability(Intelligence,1)", "Ability(Wisdom,2)"}
    }, 
    {
        Race = "Followers Of Zerthimon (Githzerai)",
        modGuid = "d6d1028e-68fb-4e94-83d8-e8951f55b86a",
        UUID = "8e8928df-70b1-43c0-bc86-40b32c455bee",
        Strings = {"Ability(Intelligence,1)", "Ability(Wisdom,2)"}
    },
    {
        Race = "Fey (Eladrin)",
        modGuid = "abc09812-ed4d-43ff-9a93-ee46487e81d9",
        UUID = "c2c089df-c622-4074-ab18-a4bde879a055",
        Strings = {"Ability(Wisdom,1)", "Ability(Dexterity,2)"}
    },
    {
        Race = "Firbolgs (Forest Friends)",
        modGuid = "ecfb9910-1b38-4bbc-a873-4f2812fff276",
        UUID = "7eede716-00f0-43aa-ad18-f001f8c7c283",
        Strings = {"Ability(Strength,1)", "Ability(Wisdom,2)"}
    },
    {
        Race = "Homebrew Gnome Subrace based on the Maztica Trilogy",
        modGuid = "7c7407ec-e2a8-4deb-a6dc-6cbc7bea2894",
        UUID = "3d7c0866-0357-43e1-ace0-b9c7f8bd90be",
        Strings = {"Ability(Dexterity,1)", "Ability(Intelligence,2)"}
    },
    {
        Race = "Enter Maztica: Desert Dwarf Subrace",
        modGuid = "1a3a0820-48e3-45b4-822a-7ee31e5d25c5",
        UUID = "75c28431-cd41-4256-af2e-0cadd4f8c2f8",
        Strings = {"Ability(Dexterity,1)", "Ability(Constitution,2)"}
    },
    {
        Race = "Beyond Faerûn: Tinker Gnome Subrace",
        modGuid = "0b1613ac-1610-4ac4-ba8b-effe33317fd1",
        UUID = "a0ae2974-b54a-4e17-ba69-cde2f7448338",
        Strings = {"Ability(Intelligence,2)", "Ability(Dexterity,2)"}
    },
    {
        Race = "Adapted Whisper Gnome Subrace based on the Eberron Campaign",
        modGuid = "f13d31f7-c897-494c-a988-bca2a71ccddc",
        UUID = "d45a8d46-8a68-4065-98da-9cc84bb2e3b1",
        Strings = {"Ability(Dexterity,2)", "Ability(Constitution,2)"}
    },
    {
        Race = "Adapted Ghostwise Halfling Subrace",
        modGuid = "f8f5f704-d463-4616-a321-9460060538ff",
        UUID = "0194f214-ffce-4e74-94b6-09e76a270e49",
        Strings = {"Ability(Dexterity,2)", "Ability(Wisdom,1)"}
    },
    {
        Race = "Enter Maztica: Wild Halfling Subrace",
        modGuid = "9e7836a9-b1a9-4d4e-9089-563c43f4fb1e",
        UUID = "e8ccff14-10b6-43f7-bbfa-22ab2104f4fc",
        Strings = {"Ability(Dexterity,2)", "Ability(Wisdom,1)"}
    },
    {
        Race = "dryad race inspired by BG3's dryads",
        modGuid = "e61be041-6c93-4576-a4b1-ad183e726f02",
        UUID = "c5671549-0282-4b60-a68d-47b676e9e2b9",
        Strings = {"Ability(Wisdom,2)"}
    },
    {
        Race = "Whispers of the Fey - Changelings", -- SelectAbilityBonus(b9149c8e-52c8-46e5-9cb6-fc39301c05fe,AbilityBonus,1)
        modGuid = "eaf83c50-1f22-4ce8-a825-25f07caf9faa",
        UUID = "fa7bf84a-a1d6-46b2-a779-739424d20b5b",
        Strings = {"Ability(Charisma,2)"}
    },
    {
        Race = "Whispers of the Fey - Goblins Greenskin",
        modGuid = "ca81f091-bf1b-4bb6-90dd-1c4ef83fd798",
        UUID = "5a317953-08ea-4424-ad93-05a0a66b4748",
        Strings = {"Ability(Dexterity,2)", "Ability(Constitution,1)"}
    },
    {
        Race = "Whispers of the Fey - Goblins Dankwood",
        modGuid = "ca81f091-bf1b-4bb6-90dd-1c4ef83fd798",
        UUID = "453c15bb-0ead-4766-b747-961066c84ee1",
        Strings = {"Ability(Dexterity,2)", "Ability(Wisdom,1)"}
    },
    {
        Race = "Yuan-ti",
        modGuid = "b2d490bc-6e10-4bc2-89e0-69c8f68cd453",
        UUID = "139dba60-4895-496a-ab48-bbd45719f317",
        Strings = {"Ability(Intelligence,1)", "Ability(Wisdom,2)"}
    },
    {
        Race = "Undead (Ghastly Ghouls) Lich",
        modGuid = "f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        UUID = "7123242e-9e00-4b9e-8e4f-aa1b0477fe13",
        Strings = {"Ability(Intelligence,2)", "Ability(Wisdom,1)"}
    },
    {
        Race = "Undead (Ghastly Ghouls) Wight",
        modGuid = "f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        UUID = "677de788-81da-4f2f-b0d1-75c6aa9a1c35", -- SelectAbilityBonus(b9149c8e-52c8-46e5-9cb6-fc39301c05fe,AbilityBonus,1);
        Strings = {"Ability(Charisma,1)"}
    },
    {
        Race = "Undead (Ghastly Ghouls) Mummy",
        modGuid = "f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        UUID = "3a4465df-49a2-4278-9d16-f17ed876aede",
        Strings = {"Ability(Intelligence,1)", "Ability(Wisdom,2)"}
    },
    {
        Race = "Undead (Ghastly Ghouls) Ghoul",
        modGuid = "f3d4e722-e576-43ce-a585-cfffcfcbcf40",
        UUID = "cfabed72-38b8-424d-a07d-058fbd4dd1a9",
        Strings = {"Ability(Intelligence,1)"}
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
        elseif bonusType == "floating_1" then
            payload.Function = "SelectAbilityBonus"
            payload.Params = {
                Guid = AbilityList_UUID,
                Amount = "1",
                BonusType = "AbilityBonus",
                Amounts = { "1" }
            }
        elseif bonusType == "floating_11" then
            payload.Function = "SelectAbilityBonus"
            payload.Params = {
                Guid = AbilityList_UUID,
                Amount = "2",
                BonusType = "AbilityBonus",
                Amounts = { "1", "1" } -- SelectAbilityBonus(b9149c8e-52c8-46e5-9cb6-fc39301c05fe,AbilityBonus,1,1)
            }
        elseif bonusType == "floating_111" then
                payload.Function = "SelectAbilityBonus"
                payload.Params = {
                   Guid = AbilityList_UUID,
                   Amount = "3",
                   BonusType = "AbilityBonus",
                   Amounts = {"1", "1", "1" }
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
        if (bonusType == "floating_111" or bonusType == "floating_11" or bonusType == "floating_1" or bonusType == "floating") then
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

    for _, mod in ipairs(RaceModsFloating_111) do
        if insertBonuses(mod, "floating_111") then
            table.insert(insertedModNames, mod.Race)
        end
    end

    for _, mod in ipairs(RaceModsFloating_11) do
        if insertBonuses(mod, "floating_11") then
            table.insert(insertedModNames, mod.Race)
        end
    end

    for _, mod in ipairs(RaceModsFloating_1) do
        if insertBonuses(mod, "floating_1") then
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
        Ext.Utils.Print("[RacialASI_Progression] Ability bonuses inserted to " .. 
                 #insertedModNames .. " mods: " .. 
                 table.concat(insertedModNames, ", "))
    end
end

if Ext.Mod.IsModLoaded(Framework_UUID) then 
    Ext.Events.StatsLoaded:Subscribe(CustomRacesOnStatsLoaded)
end
