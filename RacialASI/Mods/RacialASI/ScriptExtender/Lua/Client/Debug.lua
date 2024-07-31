-- Debug Logs
----------------------------------------------------------------

local function CheckTableUuid(t1, name, printo)
  for _, uuidIn in pairs(t1) do
    local modDataE = Ext.Mod.GetMod(uuidIn)

    if printo == "warn" then
      BasicWarning(string.format(
        "TYPE %s , modData.Info.Directory : %s , modData.Info.ModuleUUID : %s, modData.Info.Name : %s, modData.Info.Author : %s",
        name, modDataE.Info.Directory, modDataE.Info.ModuleUUID, modDataE.Info.Name, modDataE.Info.Author))
    else
      BasicPrint(string.format(
        "TYPE %s , modData.Info.Directory : %s , modData.Info.ModuleUUID : %s, modData.Info.Name : %s, modData.Info.Author : %s",
        name, modDataE.Info.Directory, modDataE.Info.ModuleUUID, modDataE.Info.Name, modDataE.Info.Author))
    end
  end
end

local function compare(t1, t2)
  local tempUuid = {}
  for _, uuidI in pairs(t1) do
    for _, uuidIn in pairs(t2) do
      local modData1 = Ext.Mod.GetMod(uuidI)
      local modData2 = Ext.Mod.GetMod(uuidIn)

      if modData1.Info.ModuleUUID ~= modData2.Info.ModuleUUID then
        table.insert(tempUuid, uuidIn)
      end
    end
  end
  return tempUuid
end

local function CheckLoadOrderUuid(dataB, name)
  local noinLoadOrder = {}
  local InloadOrder = {}
  local tempUuid = {}
  local loadOrder = Ext.Mod.GetLoadOrder()
  for _, uuidu in pairs(loadOrder) do
    table.insert(tempUuid, uuidu)
  end
  tempUuid = table.unique(tempUuid)
  for _, uuid in ipairs(tempUuid) do
    local modData = Ext.Mod.GetMod(uuid)

    for _, xo in pairs(dataB) do
      if modData.Info.ModuleUUID == xo.modGuid then
        table.insert(InloadOrder, uuid)
      else
        table.insert(noinLoadOrder, uuid)
      end
    end
  end
  InloadOrder = table.unique(InloadOrder)
  noinLoadOrder = table.unique(noinLoadOrder)
  local t1 = compare(InloadOrder, noinLoadOrder)
  t1 = table.unique(t1)
  CheckTableUuid(InloadOrder, name)
  CheckTableUuid(t1, name, "warn")
end

local logLevel_debuglua = (CONFIG and CONFIG.DEBUG_MESSAGES) or
  (McmVarsGeneralSettings ~= nil and McmVarsGeneralSettings["DebugLevel"])

if logLevel_debuglua > 2 then -- min loglevel 3
  Ext.Events.StatsLoaded:Subscribe(function ()
    CheckLoadOrderUuid(Data.Libs.RaceLibrary, "Races")
    CheckLoadOrderUuid(Data.Libs.ClassesLibrary, "Classes")
  end)
end
