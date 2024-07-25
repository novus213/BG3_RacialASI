---@diagnostic disable: missing-parameter

Ext.Require("Shared/_Init.lua")

if not Ext.Mod.IsModLoaded(Data.Deps.Framework_GUID) then return end

---Libraries / Shared / Customs
Ext.Require("Libs/OptionsActionsLib.lua")
Ext.Require("ModInfos/_ModInfos.lua")

if VCHelpers.ModVars:IsModLoaded(Data.Deps.MCM_GUID) then
    BasicPrint("    ____             _       __   ___   _____ ____   ____________","INFO", nil, nil, true)
    BasicPrint("   / __ \\____ ______(_)___ _/ /  /   | / ___//  _/  / ____/ ____/","INFO", nil, nil, true)
    BasicPrint("  / /_/ / __ `/ ___/ / __ `/ /  / /| | \\__ \\ / /   /___ \\/ __/   ","INFO", nil, nil, true)
    BasicPrint(" / _, _/ /_/ / /__/ / /_/ / /  / ___ |___/ // /   ____/ / /___   ","INFO", nil, nil, true)
    BasicPrint("/_/ |_|\\__,_/\\___/_/\\__,_/_/  /_/  |_/____/___/  /_____/_____/   ","INFO", nil, nil, true)
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint(
        string.format("Config.MCM.Init() - %s mod by Fenrules VERSION : %s starting up... ", MOD_INFO.MOD_NAME,
        MOD_INFO.VERSION),
        "INFO", nil, nil, true)
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint(" .________        __________      .__.__       .___            ","INFO", nil, nil, true)
    BasicPrint(" |   ____/ ____   \\______   \\__ __|__|  |    __| _/___________ ","INFO", nil, nil, true)
    BasicPrint(" |____  \\_/ __ \\   |    |  _/  |  \\  |  |   / __ |/ __ \\_  __ \\","INFO", nil, nil, true)
    BasicPrint(" /       \\  ___/   |    |   \\  |  /  |  |__/ /_/ \\  ___/|  | \\/","INFO", nil, nil, true)
    BasicPrint("/______  /\\___  >  |______  /____/|__|____/\\____ |\\___  >__|   ","INFO", nil, nil, true)
    BasicPrint("       \\/     \\/          \\/                    \\/    \\/       ","INFO", nil, nil, true)
    BasicPrint("        \\_5e Builder Races cleaner/builderAsi & Classes cleaner ModASI","INFO", nil, nil, true)
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
    Ext.Require("Client/Builder5e.lua")
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint("_________ .__                         __________                              __________    _____         .__       .__      _____    _________.___ ","INFO", nil, nil, true)
    BasicPrint("\\_   ___ \\|  |   ____ _____    ____   \\______   \\_____    ____  ____   ______ \\______   \\  /  _  \\   ____ |__|____  |  |    /  _  \\  /   _____/|   |","INFO", nil, nil, true)
    BasicPrint("/    \\  \\/|  | _/ __ \\\\__  \\  /    \\   |       _/\\__  \\ _/ ___\\/ __ \\ /  ___/  |       _/ /  /_\\  \\_/ ___\\|  \\__  \\ |  |   /  /_\\  \\ \\_____  \\ |   |","INFO", nil, nil, true)
    BasicPrint("\\     \\___|  |_\\  ___/ / __ \\|   |  \\  |    |   \\ / __ \\\\  \\__\\  ___/ \\___ \\   |    |   \\/    |    \\  \\___|  |/ __ \\|  |__/    |    \\/        \\|   |","INFO", nil, nil, true)
    BasicPrint(" \\______  /____/\\___  >____  /___|  /  |____|_  /(____  /\\___  >___  >____  >  |____|_  /\\____|__  /\\___  >__(____  /____/\\____|__  /_______  /|___|","INFO", nil, nil, true)
    BasicPrint("        \\/          \\/     \\/     \\/          \\/      \\/     \\/    \\/     \\/          \\/         \\/     \\/        \\/              \\/        \\/      ","INFO", nil, nil, true)
    BasicPrint("        \\_Clean Classes ModASI","INFO", nil, nil, true)
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
end

Ext.Require("Client/_Init.lua")

if not VCHelpers.ModVars:IsModLoaded(Data.Deps.MCM_GUID) then
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
    BasicPrint(" .________        __________      .__.__       .___            ","INFO", nil, nil, true)
    BasicPrint(" |   ____/ ____   \\______   \\__ __|__|  |    __| _/___________ ","INFO", nil, nil, true)
    BasicPrint(" |____  \\_/ __ \\   |    |  _/  |  \\  |  |   / __ |/ __ \\_  __ \\","INFO", nil, nil, true)
    BasicPrint(" /       \\  ___/   |    |   \\  |  /  |  |__/ /_/ \\  ___/|  | \\/","INFO", nil, nil, true)
    BasicPrint("/______  /\\___  >  |______  /____/|__|____/\\____ |\\___  >__|   ","INFO", nil, nil, true)
    BasicPrint("       \\/     \\/          \\/                    \\/    \\/       ","INFO", nil, nil, true)
    BasicPrint("        \\_Clean Races ModASI","INFO", nil, nil, true)
    BasicPrint(" ----------------------------- ")
    BasicPrint(" ----------------------------- ")
    BasicPrint("                               ")
    BasicPrint("                               ")
    Ext.Require("Client/Builder5e.lua")
end