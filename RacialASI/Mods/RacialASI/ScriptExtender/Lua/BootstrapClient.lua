---@diagnostic disable: missing-parameter
deps = {
    Framework_FM_GUID       = "ff9844a0-a097-4149-bbca-ee0da5b937d7", -- FM Framework
    Framework_WotD_GUID     = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2", -- WOT AAsimaSE
    ASTRL_Elvens_GUID       = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19", -- ASTRLElvens
    ASTRL_Tieflings_GUID    = "167b846f-0a0b-4e0c-a9d0-df448be1320a", -- ASTRLTieflings
    Framework_GUID          = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9", -- CompatibilityFramework
    MCM_GUID                = "755a8a72-407f-4f0d-9a33-274ac0f0b53d", -- MCM (not the TV channel ^^)
    AbilityList_UUID        = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"
}

if not Ext.Mod.IsModLoaded(deps.Framework_GUID) then return end

---Libraries
Ext.Require("Libs/OptionsActionsLib.lua")
Ext.Require("Shared/_Init.lua")

Ext.Require("Client/CleanRacesModASI.lua")
Ext.Require("Client/5eBuilder.lua")


Ext.Require("ModInfos/_ModInfos.lua")

Ext.Require("Client/_Init.lua")

-- Check if the mod is loaded and load ASI
if Ext.Mod.IsModLoaded(deps.Framework_GUID) and Ext.Mod.IsModLoaded(deps.Framework_FM_GUID) then
    Ext.Require("Client/FantasticalMultiverse.lua")
end

if Ext.Mod.IsModLoaded(deps.Framework_GUID) and Ext.Mod.IsModLoaded(deps.Framework_WotD_GUID) then
    Ext.Require("Client/WotDAasimaSE.lua")
end

if Ext.Mod.IsModLoaded(deps.Framework_GUID) then
    Ext.Require("Client/CustomClasses.lua")
end

if Ext.Mod.IsModLoaded(deps.Framework_GUID) then
    Ext.Require("Client/CustomRaces.lua")
end

if Ext.Mod.IsModLoaded(deps.Framework_GUID) and Ext.Mod.IsModLoaded(deps.ASTRL_Elvens_GUID) then
    Ext.Require("Client/ASTRLElvens.lua")
end

if Ext.Mod.IsModLoaded(deps.Framework_GUID) and Ext.Mod.IsModLoaded(deps.ASTRL_Tieflings_GUID) then
    Ext.Require("Client/ASTRLTieflings.lua")
end