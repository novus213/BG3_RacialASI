--MOD_UUID = ModuleUUID
SE_VERSION = Ext.Utils.Version()

-- CurrentVersion = string.format("%d.%d.%d.%d",
--     Ext.Mod.GetMod(MOD_UUID).Info.ModVersion[1],
--     Ext.Mod.GetMod(MOD_UUID).Info.ModVersion[2],
--     Ext.Mod.GetMod(MOD_UUID).Info.ModVersion[3],
--     Ext.Mod.GetMod(MOD_UUID).Info.ModVersion[4])

PersistentVars = {}
_ = nil
NULLUUID="00000000-0000-0000-0000-000000000000"

Paths = {
    config_json_file_path = "config.json",
    logPath = "log.txt",
    RacialASI_json_file_path = "RacialASI.json",
}

--For concat function
MAX_PREFIX_LENGTH = 25

--Colors for print functions
TEXT_COLORS = {
    black = 30,
    red = 31,
    green = 32,
    yellow = 33,
    cyan = 34,
    magenta = 35,
    blue = 36,
    white = 37,
}

--Background Colors for print function
BACKGROUND_COLORS = {
    black = 40,
    red = 41,
    green = 42,
    yellow = 43,
    blue = 44,
    magenta = 45,
    cyan = 46,
    white = 47,
}