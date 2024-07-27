local racialASIConfig = {
    MOD_ENABLED = 1,
    DEBUG_MESSAGES = 1,
    LOG_ENABLED = 0,
    Options = {
        AddUnderdarkRaces_LightSensitivity_Passives = "notoptional",
        AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives = { Enabled = true },
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = "notoptional",
        RemoveHalfElf_HumanMilitia_Passives = "notoptional",
        AddGnome_Tinkertools_Spells = "notoptional",
        AddGnome_ForestMinorIllusion_Spells = "notoptional",
        AddHalfElf_Skills = "notoptional",
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = "notoptional"
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