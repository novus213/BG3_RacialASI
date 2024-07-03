Ext.Require("Shared/_Init.lua")
Ext.Require("ModInfos/_ModInfos.lua")
Ext.Require("Client/_Init.lua")

local Framework_FM_UUID = "ff9844a0-a097-4149-bbca-ee0da5b937d7" -- FM Framework
local Framework_WotD_UUID = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2" -- WOT AAsimaSE
local ModGuid_Elvens = "66b20233-cf0a-44bb-9bcf-32c0e0b09c19" -- ASTRLElvens
local ModGuid_Tieflings = "167b846f-0a0b-4e0c-a9d0-df448be1320a" -- ASTRLTieflings

local Framework_UUID = "67fbbd53-7c7d-4cfa-9409-6d737b4d92a9" -- CompatibilityFramework

-- Osi.RequestDelete(ModGuid_Elvens)

-- Check if the mod is loaded and load ASI
if Ext.Mod.IsModLoaded(Framework_UUID) and Ext.Mod.IsModLoaded(Framework_FM_UUID) then
    Ext.Require("Client/FantasticalMultiverse.lua")
end

if Ext.Mod.IsModLoaded(Framework_UUID) and Ext.Mod.IsModLoaded(Framework_WotD_UUID) then
    Ext.Require("Client/WotDAasimaSE.lua")
end

if Ext.Mod.IsModLoaded(Framework_UUID) then 
    Ext.Require("Client/CustomClasses.lua")
end

if Ext.Mod.IsModLoaded(Framework_UUID) then 
    Ext.Require("Client/CustomRaces.lua")
end

if Ext.Mod.IsModLoaded(Framework_UUID) and Ext.Mod.IsModLoaded(ModGuid_Elvens) then
    Ext.Require("Client/ASTRLElvens.lua")
end

if Ext.Mod.IsModLoaded(Framework_UUID) and Ext.Mod.IsModLoaded(ModGuid_Tieflings) then
    Ext.Require("Client/ASTRLTieflings.lua")
end