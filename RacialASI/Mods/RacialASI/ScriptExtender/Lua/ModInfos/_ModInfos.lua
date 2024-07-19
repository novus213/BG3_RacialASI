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
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = { Enabled = true }
    },
    Settings5e = {
        IgnoreAll = false,
        Ignore5eLimited = false,
        Ignore5e = false,
        Ignore5eExtended = false,
        IgnoreFlavours = false,
        IgnoreLegacy = false,
        IgnoreHomebrew = false
    }
}

MOD_INFO = ModInfo:new("RacialASI", "RacialASI", true, racialASIConfig)