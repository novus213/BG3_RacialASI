local racialASIConfig = {
    MOD_ENABLED = 1,
    DEBUG_MESSAGES = 1,
    LOG_ENABLED = 1,
    Options = {
        AddUnderdarkRaces_LightSensitivity_Passives = "notuse",
        AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives = { Enabled = true },
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = "notuse",
        RemoveHalfElf_HumanMilitia_Passives = "notuse",
        AddGnome_Tinkertools_Spells = "notuse",
        AddGnome_ForestMinorIllusion_Spells = "notuse",
        AddHalfElf_Skills = "notuse",
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = "notuse"
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