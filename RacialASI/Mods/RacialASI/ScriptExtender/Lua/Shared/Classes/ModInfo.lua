---@diagnostic disable: duplicate-doc-field
---@diagnostic disable: duplicate-set-field


--- ModInfo class represents information about a Lua mod.
---@class ModInfo
---@field FOLDER_NAME string The folder name of the mod.
---@field MOD_NAME string The name of the mod, used for prints.
---@field REQUIRE_CONFIG boolean Whether the mod requires a configuration file.
---@field DEFAULT_CONFIG table The default configuration table for the mod.
---@field MOD_UUID string The UUID of the mod.
---@field VERSION string The version of the mod.
ModInfo = {}


--- Constructor for ModInfo class.
---@param folderName string The folder name of the mod.
---@param modName string The name of the mod.
---@param requireConfig? boolean Whether the mod requires a configuration.
---@param defaultModConfigTable? table The default configuration table for the mod
---@param userVars? table userVars to register
---@param modVars? table modVars to register
---@return ModInfo instance an instance of the ModInfo class.
function ModInfo:new(folderName, modName, requireConfig, defaultModConfigTable, userVars, modVars)
    local instance = {
        FOLDER_NAME = folderName,
        MOD_NAME = modName,
        REQUIRE_CONFIG = requireConfig,
        DEFAULT_CONFIG=defaultModConfigTable,
        MOD_UUID = ModuleUUID,
        VERSION = string.format("%d.%d.%d.%d",
            Ext.Mod.GetMod(ModuleUUID).Info.ModVersion[1],
            Ext.Mod.GetMod(ModuleUUID).Info.ModVersion[2],
            Ext.Mod.GetMod(ModuleUUID).Info.ModVersion[3],
            Ext.Mod.GetMod(ModuleUUID).Info.ModVersion[4]),
    }
    setmetatable(instance, self)
    self.__index = self
    return instance
end
