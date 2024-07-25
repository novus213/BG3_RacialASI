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

Deps = {
    Framework_FM_GUID       = "ff9844a0-a097-4149-bbca-ee0da5b937d7", -- FM Framework
    Framework_WotD_GUID     = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2", -- WOT AAsimaSE
    ASTRL_Elvens_GUID       = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19", -- ASTRLElvens
    ASTRL_Tieflings_GUID    = "167b846f-0a0b-4e0c-a9d0-df448be1320a", -- ASTRLTieflings
    Framework_GUID          = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9", -- CompatibilityFramework
    MCM_GUID                = "755a8a72-407f-4f0d-9a33-274ac0f0b53d", -- MCM (not the TV channel ^^)
    AbilityList_UUID        = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe" -- Ability List Default all stats +x
}