---@diagnostic disable: duplicate-set-field


---Ext.Require files at the path (Ty Focus)
---@param path string
---@param files string[]
function RequireFiles(path, files)
    for _, file in pairs(files) do
        Ext.Require(string.format("%s%s.lua", path, file))
    end
end

--setmetatable(Mods[Ext.Mod.GetMod(ModuleUUID).Info.Directory], { __index = Mods.RacialASI })

RequireFiles("Shared/", {
    "Classes/_Init",
    "Utils/_Init",
    "Globals/_Init",
    "Config/_Init",
})