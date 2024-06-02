---@alias 


local racialASIConfig = {
    MOD_ENABLED = 1,
    DEBUG_MESSAGES = 3,
    Options = {
        LightSensitivity_UnderdarkRaces = { Enabled = true },
        LightSensitivity_UndeadGhastlyGhouls = { Enabled = true },
        RemoveHumanPassives = { Enabled = false },
        RemoveHalfElfPassives = { Enabled = false },
        AddSelectors_Gnome = { Enabled = true }
    },
}

MOD_INFO = ModInfo:new("RacialASI", "RacialASI", true, racialASIConfig)