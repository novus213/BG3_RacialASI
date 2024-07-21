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
        PatchASI_5eLimited = true,
        PatchASI_5e = true,
        PatchASI_5eExtended = true,
        PatchASI_Legacy = true,
        PatchASI_Flavour = true,
        PatchASI_Homebrew = true,
        PatchASI_Default = false
    }
}

MOD_INFO = ModInfo:new("RacialASI", "RacialASI", true, racialASIConfig)