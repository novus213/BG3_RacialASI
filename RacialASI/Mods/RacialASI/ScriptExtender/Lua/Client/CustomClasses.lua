--[[
_________                 __                   _________ .__
\_   ___ \ __ __  _______/  |_  ____   _____   \_   ___ \|  | _____    ______ ______ ____   ______
/    \  \/|  |  \/  ___/\   __\/  _ \ /     \  /    \  \/|  | \__  \  /  ___//  ___// __ \ /  ___/
\     \___|  |  /\___ \  |  | (  <_> )  Y Y  \ \     \___|  |__/ __ \_\___ \ \___ \\  ___/ \___ \
 \______  /____//____  > |__|  \____/|__|_|  /  \______  /____(____  /____  >____  >\___  >____  >
        \/           \/                    \/          \/          \/     \/     \/     \/     \/
        \_Custom Races from Nexus
Argelia source Mixed
]]--

local listUUID = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe"

local classMods = {
    {
        Class = "Mystic",
        modGuid = "b2ac3aa8-ce29-4d53-be47-7121845f3c1c",
        UUID = "0482322d-723e-4705-a41a-99e27902311c"
    },
    {
        Class = "Magus",
        modGuid = "a827da36-4086-4d47-9945-f45555555555",
        UUID = "452d6137-7720-4d04-b950-f45555555555"
    },
    {
        Class = "BloodHunter",
        modGuid = "411d5c6e-2bd5-4e4e-ab72-67dcc37b8c0e",
        UUID = "b85c5b64-347c-4ece-b45c-fe55a6fa2762"
    },
    {
        Class = "Artificer",
        modGuid = "88fadf2c-152d-404e-b863-c12273559e1c",
        UUID = "c1965de9-87f1-47ee-93c7-43c54f685f2d"
    },
    {
        Class = "Troubadour",
        modGuid = "130082f8-4789-44ab-a4d0-a459459a5bf1",
        UUID = "985ddb6d-4ad1-4cdd-99ff-661f5176115c"
    },
    {
        Class = "DeathKnight",
        modGuid = "3eb9981c-15b7-4973-9c15-bb680808ebeb",
        UUID = "9406edff-5e57-4eb6-ab0d-a2cc7d5d8b8a"
    },
    {
        Class = "Witcher (no 5e class)",
        modGuid = "f3e00b63-f4ba-4893-81c4-d982884118af",
        UUID = "ed7b629c-01e1-488d-88db-61851c63da27"
    },
    {
        Class = "Homebrew Ambusher Class (no 5e class)",
        modGuid = "68d429bb-16c5-4895-9cc4-b01e6d842843",
        UUID = "5ef72e3c-717a-4250-860e-0813e3c42a36"
    },
    {
        Class = "EldritchScholar (no 5e class)",
        modGuid = "55f6108e-ab45-484f-a5f9-8b3a5318586c",
        UUID = "a5842466-38b2-40fa-862a-7e48831e551d"
    },
    {
        Class = "The Fathomless Patron for Warlocks",
        modGuid = "5d30acc9-66aa-482b-8802-33aad93995e4",
        UUID = "da7173e8-0faa-4929-a505-3e1228c16b82"
    },
    {
        Class = "Genie Warlock 2024", -- warning mod bugged
        modGuid = "0cb5018a-f898-4446-9b9e-8f7a6c3fa9ea",
        UUID = "37a9d834-26fa-4bf0-aec2-9e8522139d72"
    },
    {
        Class = "The Celestia Patron for Warlocks 2023",
        modGuid = "9bf0dff3-59b9-4cdb-9003-dede17813444",
        UUID = "b7a111c9-e398-4f99-9759-b19a993d97a2"
    },
    {
        Class = "The Celestia Patron for Warlocks 2024",
        modGuid = "015ff10e-b018-4bea-ab81-35b2a198623d",
        UUID = "a7767dc5-e6ab-4e05-96fd-f0424256121c" -- same uuid ????
    },
    { 
        Class = "HexBlade",
        modGuid = "e1eb6d1a-5922-4964-bfd7-c971e71e351a",
        UUID = "20015e25-8aa9-41bf-b959-aa587ba0aa27"
    },
    { 
        Class = "The First Vampire",
        modGuid = "69b724c2-1e84-44a4-961a-c225c7e319de",
        UUID = "20015e25-8aa9-41bf-b959-aa587ba0aa27" 
    },
    {
        Class = "Shadow Sorcerer",
        modGuid = "38291fe1-40a3-4af7-bbbd-c9a55f3e39c0",
        UUID = "42af9bda-9ac0-4564-920b-f9ca1588d6ee" -- same uuid ????
    },
    {
        Class = "Elemancer Sorcerer Edited to level 12 max by Nathyiel. Original mod by Backburner26",
        modGuid = "d40b8322-5d61-492d-9a0c-e75be1a1bbb2",
        UUID = "42af9bda-9ac0-4564-920b-f9ca1588d6ee" -- same uuid ????
    },
    {
        Class = "Elemancer Sorcerer lvl 12",
        modGuid = "d40b8322-5d61-492d-9a0c-e75be1a1bbb2",
        UUID = "42af9bda-9ac0-4564-920b-f9ca1588d6ee" -- same uuid ????
    },
    {
        Class = "Arlequin",
        modGuid = "32cf2ce3-b7f1-48c2-85b3-6ed38a09de1a",
        UUID = "c43581ac-0262-4dd9-958b-1eeed88b10f0"
    },
    {
        Class = "Pugilist",
        modGuid = "0f14ab9a-0670-4cc8-a48b-609b1097983b",
        UUID = "41c5ac54-bd32-4f5b-9feb-c30afb255857"
    }
}

local function createPayload(uuid, modGuid)
    return {
        TargetUUID = uuid,
        FileType = "Progression",
        Function = "SelectAbilityBonus",
        ListUUID = listUUID,
        modGuid = modGuid
    }
end

local function removeSelectors(mod)
    if mod.modGuid and Ext.Mod.IsModLoaded(mod.modGuid) then
        local payload = createPayload(mod.UUID, mod.modGuid)
        Mods.SubclassCompatibilityFramework.Api.RemoveSelectors({payload})
        return mod.Class  -- Return the class name if selectors were removed
    end
end

local function CustomClassesOnStatsLoaded()
    local removedClasses = {}  -- Table to store classes with removed selectors
    for _, mod in ipairs(classMods) do
        local removedClass = removeSelectors(mod)
        if removedClass then
            table.insert(removedClasses, removedClass) -- Add to the list if removed
        end
    end

    if #removedClasses > 0 then  -- Check if any selectors were removed
        local classList = table.concat(removedClasses, ", ") -- Create comma-separated list
        BasicPrint("  _________                 __                   _________ .__                                      ","INFO", nil, nil, true)
        BasicPrint("\\_   ___ \\ __ __  _______/  |_  ____   _____   \\_   ___ \\|  | _____    ______ ______ ____   ______","INFO", nil, nil, true)
        BasicPrint("/    \\  \\/|  |  \\/  ___/\\   __\\/  _ \\ /     \\  /    \\  \\/|  | \\__  \\  /  ___//  ___// __ \\ /  ___/","INFO", nil, nil, true)
        BasicPrint("\\     \\___|  |  /\\___ \\  |  | (  <_> )  Y Y  \\ \\     \\___|  |__/ __ \\_\\___ \\ \\___ \\\\  ___/ \\___ \\ ","INFO", nil, nil, true)
        BasicPrint(" \\______  /____//____  > |__|  \\____/|__|_|  /  \\______  /____(____  /____  >____  >\\___  >____  >","INFO", nil, nil, true)
        BasicPrint("        \\/           \\/                    \\/          \\/          \\/     \\/     \\/     \\/     \\/ ","INFO", nil, nil, true)
        BasicPrint("        \\_Custom Races from Nexus","INFO", nil, nil, true)
        BasicWarning(string.format("============> Selectors removed from %d mods: %s", #removedClasses, classList))
    end
end

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
    Ext.Events.StatsLoaded:Subscribe(CustomClassesOnStatsLoaded)
end
