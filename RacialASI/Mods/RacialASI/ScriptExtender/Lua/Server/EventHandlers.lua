EHandlers = {}

function EHandlers.SyncVarsCharCS()
  Ext.Osiris.RegisterListener("DB_TUT_CharacterCreation_Started", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      -- hide race / subrace / classe ruleSets
      local res = Ext.StaticData.GetGuidResource("03f972eb-de3c-4cdb-9050-e8e3fa0526eb", "ClassDescription")
      res.ResourceUUID = "00000000-0000-0000-0000-000000000000"
        Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end

function EHandlers.SyncVarsLSGame()
  Ext.Osiris.RegisterListener("DB_LevelGameplayLoadedOnce_WaitForGameplay", 4, "before", function ()
    if McmVarsGeneralSettings["RASI"] == true and Ext.IsServer() then
      Ext.Require("Core/Builder5e.lua")
      Core.Builder5e()
    end
  end)
end
