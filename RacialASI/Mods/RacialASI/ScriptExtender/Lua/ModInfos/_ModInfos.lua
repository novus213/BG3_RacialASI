local racialASIConfig = {
    MOD_ENABLED = 1,
    DEBUG_MESSAGES = 1,
    LOG_ENABLED = 1,
    Options = {
        AddUnderdarkRaces_LightSensitivity_Passives = { Enabled = true },
        AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives = { Enabled = true },
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = { Enabled = true },
        RemoveHalfElf_HumanMilitia_Passives = { Enabled = true },
        AddGnome_Tinkertools_Spells = { Enabled = true },
        AddGnome_ForestMinorIllusion_Spells = { Enabled = true },
        AddHalfElf_Skills = { Enabled = true },
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = { Enabled = true }
    },
    Settings5e = {
        PatchAsi5eLimited = false,
        PatchASI_5e = false,
        PatchASI_5eExtended = false,
        PatchASI_Legacy = false,
        PatchASI_Flavour = true,
        PatchASI_Homebrew = true
    }
}

MOD_INFO = ModInfo:new("RacialASI", "RacialASI", true, racialASIConfig)