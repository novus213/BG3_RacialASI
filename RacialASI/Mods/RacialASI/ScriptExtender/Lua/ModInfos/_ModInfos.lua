local racialASIConfig = {
    MOD_ENABLED = 1,
    DEBUG_MESSAGES = 1,
    LOG_ENABLED = 1,
    Options = {
        AddUnderdarkRaces_LightSensitivity_Passives = nil,
        AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives = { Enabled = true },
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = nil,
        RemoveHalfElf_HumanMilitia_Passives = nil,
        AddGnome_Tinkertools_Spells = nil,
        AddGnome_ForestMinorIllusion_Spells = nil,
        AddHalfElf_Skills = nil,
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = nil
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