depsServ = {
    MCM_GUID       = "755a8a72-407f-4f0d-9a33-274ac0f0b53d"
}

if not Ext.Mod.IsModLoaded(MCM_GUID) then return end

-- Function to get MCM setting values
function MCMGet(settingID)
    return Mods.BG3MCM.MCMAPI:GetSettingValue(settingID, ModuleUUID)
end

local function OnSessionLoaded()
    mcmVars = {
        RASI = MCMGet("RASI"),
        AddGnomeTinkertoolsSpells = MCMGet("addGnome_tinkertools_spells"),
        AddHalfElfDrowDrowDrowWeaponTraining_Passives = MCMGet("addHalfElfDrow_drow_drowWeaponTraining_passives"),
        ActiveBookBoost = MCMGet("active_book_boost")
        --[[
            mcmVars["AddGnomeTinkertoolsSpells"]
        ]]--
    }
end

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)

-- Register a net listener to handle settings changes dynamically
Ext.RegisterNetListener("MCM_Saved_Setting", function(call, payload)
    local data = Ext.Json.Parse(payload)
    if not data or data.modGUID ~= ModuleUUID or not data.settingId then
        return
    end

    if mcmVars[data.settingId] ~= nil then
        mcmVars[data.settingId] = data.value
    end
end)