---@diagnostic disable: duplicate-set-field

setmetatable(Mods[Ext.Mod.GetMod(ModuleUUID).Info.Directory], { __index = Mods.VolitionCabinet,
Mods.KendersLabsCoreLibs })

DevelReady = Ext.Utils:Version() >= 17 or Ext.Debug.IsDeveloperMode()

local deps = {
    VCModuleUUID = "f97b43be-7398-4ea5-8fe2-be7eb3d4b5ca",
    KLCLModuleUUID = "47e1154e-e169-4e4a-80b6-d117171ccd15"
}
if not Ext.Mod.IsModLoaded(Deps.VCModuleUUID) then
    Ext.Utils.Print(
        "Volition Cabinet is missing and is a hard requirement. PLEASE MAKE SURE IT IS ENABLED IN YOUR MOD MANAGER.")
end

if not Ext.Mod.IsModLoaded(Deps.KLCLModuleUUID) then
    Ext.Utils.Print(
        "BG3 Kender's Labs Core Libs is missing and is a hard requirement. PLEASE MAKE SURE IT IS ENABLED IN YOUR MOD MANAGER.")
end

function MCMGet(settingID)
    return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
end

---Ext.Require files at the path
---@param path string
---@param files string[]
function RequireFiles(path, files)
    for _, file in pairs(files) do
        Ext.Require(string.format("%s%s.lua", path, file))
    end
end

--setmetatable(Mods[Ext.Mod.GetMod(ModuleUUID).Info.Directory], { __index = Mods.RacialASI })

RequireFiles("Shared/", {
    "MetaClass",
    "Utils/_Init",
    "Globals/_Init",
    "Config/_Init",
    "Classes/_Init",
    "Helpers/_Init",
})

local MODVERSION = Ext.Mod.GetMod(ModuleUUID).Info.ModVersion
if MODVERSION == nil then
    RAWarn(0, "loaded (version unknown)")
else
    -- Remove the last element (build/revision number) from the MODVERSION table
    table.remove(MODVERSION)

    local versionNumber = table.concat(MODVERSION, ".")
    RAPrint(0, "Mod RacialASI version " .. versionNumber .. " loaded")
end