---@diagnostic disable: missing-parameter
--[[
 .________        __________      .__.__       .___
 |   ____/ ____   \______   \__ __|__|  |    __| _/___________
 |____  \_/ __ \   |    |  _/  |  \  |  |   / __ |/ __ \_  __ \
 /       \  ___/   |    |   \  |  /  |  |__/ /_/ \  ___/|  | \/
/______  /\___  >  |______  /____/|__|____/\____ |\___  >__|
       \/     \/          \/                    \/    \/
        \_Clean Races ModASI
]]
--
--RAPrint(2, "RasiOnOff: ")
--RAPrint(2, RasiOnOff)
RAPrint(2, "CheatAsi30: ")
RAPrint(2, CheatAsi30)
--RAPrint(2, "DebugLevel: ")
--RAPrint(2, DebugLevel)
--RAPrint(2, "Log: ")
--RAPrint(2, Log)

RAPrint(2, "PatchAsi5eLimited: ")
RAPrint(2, PatchAsi5eLimited)
RAPrint(2, "PatchAsi5e: ")
RAPrint(2, PatchAsi5e)
RAPrint(2, "PatchAsi5eExtended: ")
RAPrint(2, PatchAsi5eExtended)
RAPrint(2, "PatchAsiLegacy: ")
RAPrint(2, PatchAsiLegacy)
RAPrint(2, "PatchAsiFlavour: ")
RAPrint(2, PatchAsiFlavour)
RAPrint(2, "PatchAsiHomebrew: ")
RAPrint(2, PatchAsiHomebrew)

RAPrint(2, "AddGnome_Tinkertools_Spells: ")
RAPrint(2, McmVarsOptions["AddGnome_Tinkertools_Spells"])
RAPrint(2, "AddHalfElf_Skills: ")
RAPrint(2, McmVarsOptions["AddHalfElf_Skills"])
RAPrint(2, "AddHalfElfDrow_Drow_DrowWeaponTraining_Passives: ")
RAPrint(2, McmVarsOptions["AddHalfElfDrow_Drow_DrowWeaponTraining_Passives"])
RAPrint(2, "RemoveHuman_HumanMilitia_HumanVersatility_Passives: ")
RAPrint(2, McmVarsOptions["RemoveHuman_HumanMilitia_HumanVersatility_Passives"])
RAPrint(2, "RemoveHalfElf_HumanMilitia_Passives: ")
RAPrint(2, McmVarsOptions["RemoveHalfElf_HumanMilitia_Passives"])
RAPrint(2, "AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives: ")
RAPrint(2, McmVarsOptions["AddUndeadGhastlyGhouls_TruePotion_and_LightSensitivity_Passives"])
RAPrint(2, "AddUnderdarkRaces_LightSensitivity_Passives: ")
RAPrint(2, McmVarsOptions["AddUnderdarkRaces_LightSensitivity_Passives"])

function print_table(node)
  local cache, stack, output = {}, {}, {}
  local depth = 1
  local output_str = "{\n"

  while true do
    local size = 0
    for k, v in pairs(node) do
      size = size + 1
    end

    local cur_index = 1
    for k, v in pairs(node) do
      if (cache[node] == nil) or (cur_index >= cache[node]) then
        if (string.find(output_str, "}", output_str:len())) then
          output_str = output_str .. ",\n"
        elseif not (string.find(output_str, "\n", output_str:len())) then
          output_str = output_str .. "\n"
        end

        -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
        table.insert(output, output_str)
        output_str = ""

        local key
        if (type(k) == "number" or type(k) == "boolean") then
          key = "[" .. tostring(k) .. "]"
        else
          key = "['" .. tostring(k) .. "']"
        end

        if (type(v) == "number" or type(v) == "boolean") then
          output_str = output_str .. string.rep('\t', depth) .. key .. " = " .. tostring(v)
        elseif (type(v) == "table") then
          output_str = output_str .. string.rep('\t', depth) .. key .. " = {\n"
          table.insert(stack, node)
          table.insert(stack, v)
          cache[node] = cur_index + 1
          break
        else
          output_str = output_str .. string.rep('\t', depth) .. key .. " = '" .. tostring(v) .. "'"
        end

        if (cur_index == size) then
          output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
        else
          output_str = output_str .. ","
        end
      else
        -- close the table
        if (cur_index == size) then
          output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
        end
      end

      cur_index = cur_index + 1
    end

    if (size == 0) then
      output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
    end

    if (#stack > 0) then
      node = stack[#stack]
      stack[#stack] = nil
      depth = cache[node] == nil and depth + 1 or depth - 1
    else
      break
    end
  end

  -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
  table.insert(output, output_str)
  output_str = table.concat(output)

  print(output_str)
end

function Core.classe5eModule()
  for _, classeMod in ipairs(Data.Libs.ClassesLibrary) do
    ClassModObject = ClasseMod:New(classeMod.Name, classeMod.modURL, classeMod.modGuid, classeMod.progressionUUID,
      classeMod.Author,
      classeMod.SourceBook, classeMod.MainClasse, classeMod.isLvl20, classeMod.isOutdated)
    ClasseMod:RemoveClassesASI(ClassModObject, 1)
  end
end

function Core.race5eModule()
  for _, raceMod in pairs(Data.Libs.RaceLibrary) do
    RaceModObject = RaceMod:New(raceMod.Name, raceMod.modURL, raceMod.modGuid, raceMod.progressionUUID,
      raceMod.Author,
      raceMod.SourceBook, raceMod.MainRace, raceMod.specialAbList, raceMod.Stats, raceMod.Sab, raceMod.bonus,
      raceMod.NoDefStats)
    if CheatAsi30 > 0 then
      RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
      RaceMod:InsertPayloadRaceASI(RaceModObject, 1, CheatAsi30)
    else
      if PatchAsiDefault == true then
        RAWarn(2, "PatchAsiDefault = true")
        RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
        RaceMod:InsertDefaultPayloadASI(RaceModObject, 1)
      else
        if VCHelpers.ModVars:IsModExist(Data.Deps.Framework_GUID.ModuleUUID, RaceModObject:GetModGuid()) then -- présent dans isLoaded
          if RaceModObject:GetSourceBook() == nil or RaceModObject:GetSourceBook() == "" then
            if PatchAsiHomebrew == true then
              RAWarn(2, "PatchAsiHomebrew = true")
              RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
              RaceMod:InsertPayloadRaceASI(RaceModObject, 1)
            else
              --desactive moi ce putain de mod Connard function
              if RaceModObject:GetNoDefStats() == true then
                RaceMod:InsertDefaultPayloadASI(RaceModObject, 1)
              end
              RADebug(2, string.format("%s Wasn't fixed. You uncheck Homebrew", raceModObject:GetName()))
            end
          end
          for _, book in pairs(Data.Libs.Books.Dnd5eLimited) do
            if book.bookRef == RaceModObject:GetSourceBook() then
              if PatchAsi5eLimited == true then
                RAWarn(2, "PatchAsi5eLimited = true")
                RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
                RaceMod:InsertPayloadRaceASI(RaceModObject, 1)
              else
                if RaceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(RaceModObject, 1)
                end
                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Limited", raceMod.Name))
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Dnd5e) do
            if book.bookRef == RaceModObject:GetSourceBook() then
              if PatchAsi5e == true then
                RAWarn(2, "PatchAsi5e = true")
                RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
                RaceMod:InsertPayloadRaceASI(RaceModObject, 1)
              else
                if RaceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(RaceModObject, 1)
                end
                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e", raceMod.Name))
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Dnd5eExtended) do
            if book.bookRef == RaceModObject:GetSourceBook() then
              if PatchAsi5eExtended == true then
                RAWarn(2, "PatchAsi5eExtended = true")
                RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
                RaceMod:InsertPayloadRaceASI(RaceModObject, 1)
              else
                if RaceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(RaceModObject, 1)
                end
                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Extended", RaceModObject:GetName()))
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Legacy) do
            if book.bookRef == RaceModObject:GetSourceBook() then
              if PatchAsiLegacy == true then
                RAWarn(2, "PatchAsiLegacy = true")
                RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
                RaceMod:InsertPayloadRaceASI(RaceModObject, 1)
              else
                if RaceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(RaceModObject, 1)
                end
                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix 5e Legacy", RaceModObject:GetName()))
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Flavours) do
            if book.bookRef == RaceModObject:GetSourceBook() then
              if PatchAsiFlavour == true then
                RAWarn(2, "PatchAsiFlavour = true")
                RaceMod:CleanOnRacesStatsLoaded(RaceModObject, 1)
                RaceMod:InsertPayloadRaceASI(RaceModObject, 1)
              else
                if RaceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(RaceModObject, 1)
                end
                RADebug(2, string.format("%s Wasn't fixed. You uncheck Fix Flavours", RaceModObject:GetName()))
              end
            end
          end
        end
      end
    end
  end
end

--- Constructor for builder5eRaces
function Core.Builder5e()
  Core.classe5eModule()
  Core.race5eModule()
  if VCHelpers.ModVars:IsModLoaded(Data.Deps.MCM_GUID.ModuleUUID) then
    RAPrint(1, "                               ")
    RAPrint(1, "                               ")
    RAPrint(1, " ----------------------------- ")
    RAPrint(1, " ----------------------------- ")
    RAPrint(1, "Config.MCM.loaded() Happy Fun Gaming!...")
  end
end
