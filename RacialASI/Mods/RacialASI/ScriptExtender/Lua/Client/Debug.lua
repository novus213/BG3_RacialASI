-- Debug Logs
----------------------------------------------------------------

local function CheckTableUuid(t1, name, printo, prog)
  for _, uuidIn in pairs(t1) do
    local modDataE = Ext.Mod.GetMod(uuidIn)
    local str = t1[_].ModuleUUID
    if modDataE ~= nil and modDataE.Info.ModuleUUID ~= nil and str ~= "b9149c8e-52c8-46e5-9cb6-fc39301c05fe" then --AbilityList_UUID
     -- CLUtils.RegisterModToDictionary(modDataE.Info.Directory, modDataE.Info.ModuleUUID, modDataE.Info.Name,
      --  modDataE.Info.Author)
    end
    if printo == "warn" then
      BasicWarning(string.format(
        "TYPE %s , modData.Info.Directory : %s , modData.Info.ModuleUUID : %s, modData.Info.Name : %s, modData.Info.Author : %s",
        name, modDataE.Info.Directory, modDataE.Info.ModuleUUID, modDataE.Info.Name, modDataE.Info.Author))
      if prog ~= {} then
        for i, v in ipairs(prog) do
          BasicWarning(v)
        end
      end
    else
      BasicPrint(string.format(
        "TYPE %s , modData.Info.Directory : %s , modData.Info.ModuleUUID : %s, modData.Info.Name : %s, modData.Info.Author : %s",
        name, modDataE.Info.Directory, modDataE.Info.ModuleUUID, modDataE.Info.Name, modDataE.Info.Author))
      if prog ~= {} then
        for i, v in ipairs(prog) do
          BasicPrint(v)
        end
      end
    end
  end
end

local function compare(t1, t2)
  local tempUuid = {}
  for _, uuidI in pairs(t1) do
    for _, uuidIn in pairs(t2) do
      local modData1 = Ext.Mod.GetMod(uuidI)
      local modData2 = Ext.Mod.GetMod(uuidIn)

      if (modData1.Info.ModuleUUID ~= modData2.Info.ModuleUUID) and (modData1.Info.Name == modData2.Info.Name) then
        table.insert(tempUuid, uuidIn)
      end
    end
  end
  return tempUuid
end

local function staticData(ud, typ)
  --[[
"CompanionPreset"
"CharacterCreationPreset"
"Progression"
"Origin"
]]
  --
  local res = Ext.StaticData.Get(ud, typ)

  for k, v in pairs(res) do
   print(k .. " : " .. tostring(v))
   end
  --local tmpdt = {}
  --for k, v in pairs(res) do
  --  local str = tostring(k) .. " : " .. tostring(v)
  --  table.insert(tmpdt, str)
  --end
  --return tmpdt
end

local function CheckLoadOrderUuid(dataB, name)
  local noinLoadOrder = {}
  local InloadOrder = {}
  local tempUuid = {}
  local loadOrder = Ext.Mod.GetLoadOrder()
  local tProgression = {}
  for _, uuidu in pairs(loadOrder) do
    table.insert(tempUuid, uuidu)
  end
  tempUuid = table.unique(tempUuid)
  for _, uuid in ipairs(tempUuid) do
    local modData = Ext.Mod.GetMod(uuid)
    for _, xo in pairs(dataB) do
      if modData.Info.ModuleUUID == xo.modGuid then
        table.insert(InloadOrder, uuid)
        if xo.progressionUUID[1] ~= nil and xo.progressionUUID[1] ~= "aaaa" and name == "Races" then
          --tProgression = staticData(xo.progressionUUID[1], "Progression")
          print(xo.progressionUUID[1])
        end
      else
        table.insert(noinLoadOrder, uuid)
      end
    end
  end
  InloadOrder = table.unique(InloadOrder)
  noinLoadOrder = table.unique(noinLoadOrder)
  local t1 = compare(InloadOrder, noinLoadOrder)
  t1 = table.unique(t1)
  --CheckTableUuid(InloadOrder, name, nil, tProgression)
  --CheckTableUuid(t1, name, "warn", tProgression)
end

local logLevel_debuglua = (CONFIG and CONFIG.DEBUG_MESSAGES) or
  (McmVarsGeneralSettings ~= nil and McmVarsGeneralSettings["DebugLevel"])

if logLevel_debuglua > 2 then -- min loglevel 3
  Ext.Events.StatsLoaded:Subscribe(function ()
    CheckLoadOrderUuid(Data.Libs.RaceLibrary, "Races")
    CheckLoadOrderUuid(Data.Libs.ClassesLibrary, "Classes")
  end)
end
