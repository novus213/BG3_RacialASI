--- Define Actions and Payloads
optionActions = {
    AddGnome_Tinkertools_Spells = {
        actions = {
            {
                action = "InsertSelectors",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "aa2257a9-1779-4d8b-be65-8a08eede07fa",
                        FileType = "Progression",
                        Function = "AddSpells",
                        Params = {
                            Guid = "5fdb4bd0-8122-4ce6-9191-fffc951cf3a3",                      -- Used in All
                            PrepareType = "AlwaysPrepared", -- Used in SelectSpells, AddSpells. Values: Default, AlwaysPrepared
                            CooldownType = "UntilRest"     -- Used in SelectSpells, AddSpells. Values: Default, UntilRest
                        }
                    }
                }
            }
        }
    },
    AddUnderdarkRaces_LightSensitivity_Passives = {
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "4a634f24-bdcb-4559-b8be-7847133ad1c3",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "bd012f5b-0a0b-424e-ab7c-186dbd82ab30",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "58dae581-c25a-4dfb-8a57-589bf4b34f62",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "dc9e985a-6b20-4066-ab3d-eed16191122b", --ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "3140a061-8e1f-4c9e-bca2-1c0ed5a3ae65", -- ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- Deep Gnome Osi.AddExplorationExperience(GetHostCharacter(), 9000000)
                        Target = "938b6f72-18a6-4af0-924b-5292251d32bf",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "MagicResistance", "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- sunstone Gnome
                        Target = "3d7c0866-0357-43e1-ace0-b9c7f8bd90be",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "MagicResistance", "SunlightSensitivity" }
                    }
                }
            }
        }
    },
    AddUndeadGhastlyGhouls_LightSensitivity_Passives = {
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- UndeadGhastly Ghouls
                        Target = "a21579fc-b7d7-4295-bf5c-d2111be3f13a",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity", "Fenrules_Undeath", "Fenrules_UndyingFervor", "NECROTIC_REGENERATION_TECHNICAL" }
                    }
                }
            }
        }
    },
    RemoveHuman_HumanMilitia_HumanVersatility_Passives = {
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "139e1b8c-dfa1-4b2d-895c-efb170736093", -- Larian Human Passives
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "HumanMilitia", "HumanVersatility" }
                    }
                }
            }
        }
    },
    RemoveHalfElf_HumanMilitia_Passives = {
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "a1729574-2f7b-4561-91d8-3766cf940420",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "HumanMilitia" }
                    }
                }
            }
        }
    },
    AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = { -- ProficiencyBonus(Skill,Stealth) woodElf
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- half Drow
                        Target = "58dae581-c25a-4dfb-8a57-589bf4b34f62",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "dc9e985a-6b20-4066-ab3d-eed16191122b", --ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "3140a061-8e1f-4c9e-bca2-1c0ed5a3ae65", -- ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    }
                }
            }
        }
    }
    -- Removed first and ten level passives (Illithid Disguise excluded) from Ghoul and added Undeath trait that replace and improve these passives
}


optionActionsReverse = {
    AddGnome_Tinkertools_Spells = {
        actions = {
            {
                action = "RemoveSelectors",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "aa2257a9-1779-4d8b-be65-8a08eede07fa",
                        FileType = "Progression",
                        Function = "AddSpells",
                        Params = {
                            Guid = "5fdb4bd0-8122-4ce6-9191-fffc951cf3a3",                      -- Used in All
                            PrepareType = "AlwaysPrepared", -- Used in SelectSpells, AddSpells. Values: Default, AlwaysPrepared
                            CooldownType = "UntilRest"     -- Used in SelectSpells, AddSpells. Values: Default, UntilRest
                        }
                    }
                }
            }
        }
    },
    AddUnderdarkRaces_LightSensitivity_Passives = {
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "4a634f24-bdcb-4559-b8be-7847133ad1c3",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "bd012f5b-0a0b-424e-ab7c-186dbd82ab30",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "58dae581-c25a-4dfb-8a57-589bf4b34f62",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "dc9e985a-6b20-4066-ab3d-eed16191122b", --ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "3140a061-8e1f-4c9e-bca2-1c0ed5a3ae65", -- ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "LightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- Deep Gnome Osi.AddExplorationExperience(GetHostCharacter(), 9000000)
                        Target = "938b6f72-18a6-4af0-924b-5292251d32bf",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "MagicResistance", "SunlightSensitivity" }
                    },
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- sunstone Gnome
                        Target = "3d7c0866-0357-43e1-ace0-b9c7f8bd90be",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "MagicResistance", "SunlightSensitivity" }
                    }
                }
            }
        }
    },
    AddUndeadGhastlyGhouls_LightSensitivity_Passives = {
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- UndeadGhastly Ghouls
                        Target = "a21579fc-b7d7-4295-bf5c-d2111be3f13a",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "SunlightSensitivity", "Fenrules_Undeath", "Fenrules_UndyingFervor", "NECROTIC_REGENERATION_TECHNICAL" }
                    }
                }
            }
        }
    },
    RemoveHuman_HumanMilitia_HumanVersatility_Passives = {
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "139e1b8c-dfa1-4b2d-895c-efb170736093", -- Larian Human Passives
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "HumanMilitia", "HumanVersatility" }
                    }
                }
            }
        }
    },
    RemoveHalfElf_HumanMilitia_Passives = {
        actions = {
            {
                action = "InsertPassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019",
                        Target = "a1729574-2f7b-4561-91d8-3766cf940420",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = { "HumanMilitia" }
                    }
                }
            }
        }
    },
    AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = { -- ProficiencyBonus(Skill,Stealth) woodElf
        actions = {
            {
                action = "RemovePassives",
                payloads = {
                    {
                        modGuid = "1ebf4a1c-01d4-41ed-8aa1-5b3975c6d019", -- half Drow
                        Target = "58dae581-c25a-4dfb-8a57-589bf4b34f62",
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "dc9e985a-6b20-4066-ab3d-eed16191122b", --ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    },
                    {
                        modGuid = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19",
                        Target = "3140a061-8e1f-4c9e-bca2-1c0ed5a3ae65", -- ASTRL_HalfLorendrow_LevelOne
                        FileType = "Progression",
                        Type = "PassivesAdded",
                        Strings = {"Drow_DrowWeaponTraining"}
                    }
                }
            }
        }
    }
    -- Removed first and ten level passives (Illithid Disguise excluded) from Ghoul and added Undeath trait that replace and improve these passives
}