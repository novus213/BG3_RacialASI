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

RAPrint(2, "RaceHiddener: ")
RAPrint(2, RaceHiddener)

RAPrint(2, "ClasseHiddener: ")
RAPrint(2, ClasseHiddener)

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

function Core.classe5eModule()
  for _, classeMod in ipairs(Data.Libs.ClassesLibrary) do
    local classModObject = ClasseMod:New(classeMod.Name, classeMod.modURL, classeMod.modGuid, classeMod.progressionUUID,
      classeMod.Author,
      classeMod.SourceBook, classeMod.MainClasse, classeMod.isLvl20, classeMod.isOutdated, classeMod.cdUUID)
    ClasseMod:RemoveClassesASI(classModObject, 1)
    if PatchAsiDefault == true then
      RAWarn(2, "Classe : PatchAsiDefaultDefault = true")
    else
      if VCHelpers.ModVars:IsModExist(Data.Deps.Framework_GUID.ModuleUUID, classModObject:GetModGuid()) then -- présent dans isLoaded
        if classModObject:GetSourceBook() == nil or classModObject:GetSourceBook() == "" then
          if PatchAsiHomebrew == true then
            RAWarn(2, "Classe : PatchAsiDefaultHomebrew = true")
          else
            RAWarn(2, "Classe : PatchAsiDefaultHomebrew = false")
            if ClasseHiddener then
              RADebug(2, string.format("%s is hidden. You uncheck Homebrew", classModObject:GetName()))
              ClasseMod:HideClassesAndSubClassesByRulesSet(classModObject)
            end
          end
        end
        for _, book in pairs(Data.Libs.Books.Dnd5eLimited) do
          if book.bookRef == classModObject:GetSourceBook() then
            if PatchAsi5eLimited == true then
              RAWarn(2, "Classe : PatchAsiDefault5eLimited = true")
            else
              RAWarn(2, "Classe : PatchAsiDefault5eLimited = false")
              if ClasseHiddener then
                RADebug(2, string.format("%s is hidden. You uncheck Fix 5e Limited", classModObject:GetName()))
                ClasseMod:HideClassesAndSubClassesByRulesSet(classModObject)
              end
            end
          end
        end
        for _, book in pairs(Data.Libs.Books.Dnd5e) do
          if book.bookRef == classModObject:GetSourceBook() then
            if PatchAsi5e == true then
              RAWarn(2, "Classe : PatchAsiDefault5e = true")
            else
              RAWarn(2, "Classe : PatchAsiDefault5e = false")
              if ClasseHiddener then
                RADebug(2, string.format("%s is hidden. You uncheck Fix 5e", classModObject:GetName()))
                ClasseMod:HideClassesAndSubClassesByRulesSet(classModObject)
              end
            end
          end
        end
        for _, book in pairs(Data.Libs.Books.Dnd5eExtended) do
          if book.bookRef == classModObject:GetSourceBook() then
            if PatchAsi5eExtended == true then
              RAWarn(2, "Classe : PatchAsiDefault5eExtended = true")
            else
              RAWarn(2, "Classe : PatchAsiDefault5eExtended = false")
              if ClasseHiddener then
                RADebug(2, string.format("%s is hidden. You uncheck Fix 5e Extended", classModObject:GetName()))
                ClasseMod:HideClassesAndSubClassesByRulesSet(classModObject)
              end
            end
          end
        end
        for _, book in pairs(Data.Libs.Books.Legacy) do
          if book.bookRef == classModObject:GetSourceBook() then
            if PatchAsiLegacy == true then
              RAWarn(2, "Classe : PatchAsiDefaultLegacy = true")
            else
              RAWarn(2, "Classe : PatchAsiDefaultLegacy = false")
              if ClasseHiddener then
                RADebug(2, string.format("%s is hidden. You uncheck Fix 5e Legacy", classModObject:GetName()))
                ClasseMod:HideClassesAndSubClassesByRulesSet(classModObject)
              end
            end
          end
        end
        for _, book in pairs(Data.Libs.Books.Flavours) do
          if book.bookRef == classModObject:GetSourceBook() then
            if PatchAsiFlavour == true then
              RAWarn(2, "Classe : PatchAsiDefaultFlavour = true")
            else
              RAWarn(2, "Classe : PatchAsiDefaultFlavour = false")
              if ClasseHiddener then
                RADebug(2, string.format("%s is hidden You uncheck Fix Flavours", classModObject:GetName()))
                ClasseMod:HideClassesAndSubClassesByRulesSet(classModObject)
              end
            end
          end
        end
      end
    end
  end
end

function Core.race5eModule()
  for _, raceMod in pairs(Data.Libs.RaceLibrary) do
    local raceModObject = RaceMod:New(raceMod.Name, raceMod.modURL, raceMod.modGuid, raceMod.progressionUUID,
      raceMod.Author,
      raceMod.SourceBook, raceMod.MainRace, raceMod.specialAbList, raceMod.Stats, raceMod.Sab, raceMod.bonus,
      raceMod.presetUUID, raceMod.oPresetUUID, raceMod.compPresetUUID, raceMod.NoDefStats)
    if CheatAsi30 > 0 then
      RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
      RaceMod:InsertPayloadRaceASI(raceModObject, 1, CheatAsi30)
    else
      if PatchAsiDefault == true then
        RAWarn(2, "Race : PatchAsiDefaultDefault = true")
        RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
        RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
      else
        if VCHelpers.ModVars:IsModExist(Data.Deps.Framework_GUID.ModuleUUID, raceModObject:GetModGuid()) then -- présent dans isLoaded
          if raceModObject:GetSourceBook() == nil or raceModObject:GetSourceBook() == "" then
            if PatchAsiHomebrew == true then
              RAWarn(2, "Race : PatchAsiDefaultHomebrew = true")
              RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
              RaceMod:InsertPayloadRaceASI(raceModObject, 1)
            else
              RAWarn(2, "Race : PatchAsiDefaultHomebrew = false")
              if RaceHiddener then
                RADebug(2, string.format("%s is hidden. You uncheck Homebrew", raceModObject:GetName()))
                RaceMod:HideRacesAndSubRaceByRulesSet(raceModObject)
              end
              if raceModObject:GetNoDefStats() == true then
                RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Dnd5eLimited) do
            if book.bookRef == raceModObject:GetSourceBook() then
              if PatchAsi5eLimited == true then
                RAWarn(2, "Race : PatchAsiDefault5eLimited = true")
                RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                RaceMod:InsertPayloadRaceASI(raceModObject, 1)
              else
                RAWarn(2, "Race : PatchAsiDefault5eLimited = false")
                if RaceHiddener then
                  RADebug(2, string.format("%s is hidden. You uncheck Fix 5e Limited", raceMod.Name))
                  RaceMod:HideRacesAndSubRaceByRulesSet(raceModObject)
                end

                if raceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                end
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Dnd5e) do
            if book.bookRef == raceModObject:GetSourceBook() then
              if PatchAsi5e == true then
                RAWarn(2, "Race : PatchAsiDefault5e = true")
                RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                RaceMod:InsertPayloadRaceASI(raceModObject, 1)
              else
                RAWarn(2, "Race : PatchAsiDefault5e = false")
                if RaceHiddener then
                  RADebug(2, string.format("%s is hidden. You uncheck Fix 5e", raceMod.Name))
                  RaceMod:HideRacesAndSubRaceByRulesSet(raceModObject)
                end

                if raceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                end
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Dnd5eExtended) do
            if book.bookRef == raceModObject:GetSourceBook() then
              if PatchAsi5eExtended == true then
                RAWarn(2, "Race : PatchAsiDefault5eExtended = true")
                RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                RaceMod:InsertPayloadRaceASI(raceModObject, 1)
              else
                RAWarn(2, "Race : PatchAsiDefault5eExtended = false")
                if RaceHiddener then
                  RADebug(2, string.format("%s is hidden. You uncheck Fix 5e Extended", raceModObject:GetName()))
                  RaceMod:HideRacesAndSubRaceByRulesSet(raceModObject)
                end
                if raceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                end
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Legacy) do
            if book.bookRef == raceModObject:GetSourceBook() then
              if PatchAsiLegacy == true then
                RAWarn(2, "Race : PatchAsiDefaultLegacy = true")
                RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                RaceMod:InsertPayloadRaceASI(raceModObject, 1)
              else
                RAWarn(2, "Race : PatchAsiDefaultLegacy = false")
                if RaceHiddener then
                  RADebug(2, string.format("%s is hidden. You uncheck Fix 5e Legacy", raceModObject:GetName()))
                  RaceMod:HideRacesAndSubRaceByRulesSet(raceModObject)
                end

                if raceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                end
              end
            end
          end
          for _, book in pairs(Data.Libs.Books.Flavours) do
            if book.bookRef == raceModObject:GetSourceBook() then
              if PatchAsiFlavour == true then
                RAWarn(2, "Race : PatchAsiDefaultFlavour = true")
                RaceMod:CleanOnRacesStatsLoaded(raceModObject, 1)
                RaceMod:InsertPayloadRaceASI(raceModObject, 1)
              else
                RAWarn(2, "Race : PatchAsiDefaultFlavour = false")
                if RaceHiddener then
                  RADebug(2, string.format("%s is hidden You uncheck Fix Flavours", raceModObject:GetName()))
                  RaceMod:HideRacesAndSubRaceByRulesSet(raceModObject)
                end

                if raceModObject:GetNoDefStats() == true then
                  RaceMod:InsertDefaultPayloadASI(raceModObject, 1)
                end
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
