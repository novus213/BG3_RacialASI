---@alias 


local racialASIConfig = {
    MOD_ENABLED = 1,
    DEBUG_MESSAGES = 1,
    Options = {
        AddUnderdarkRaces_LightSensitivity_Passives = { Enabled = true },
        AddUndeadGhastlyGhouls_LightSensitivity_Passives = { Enabled = true },
        RemoveHuman_HumanMilitia_HumanVersatility_Passives = { Enabled = true },
        RemoveHalfElf_HumanMilitia_Passives = { Enabled = true },
        AddGnome_Tinkertools_Spells = { Enabled = true },
        AddHalfElfDrow_Drow_DrowWeaponTraining_Passives = { Enabled = true }
    },
}

MOD_INFO = ModInfo:new("RacialASI", "RacialASI", true, racialASIConfig)