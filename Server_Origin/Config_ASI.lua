-- -------------------------------------------------------------------------- --
--                             Config IO functions                            --
-- -------------------------------------------------------------------------- --
local default_config_asi_tbl={}



-- settings configuration
local CONFIG_ASI = {
    defaultSettings = {},
    path = Paths.RacialASI_json_file_path,
    __configChanged = false,
}

function CONFIG_ASI:load()
    local success, error_message = pcall(function()
        local fileConfig = JSON.LuaTableFromFile(self.path) or {}
        self.__configChanged = false

        if next(fileConfig) == nil then
            BasicPrint("Creating default RacialASI.json file at : " .. self.path)
            -- Initialize with default values if the fileConfig is empty
            for key, value in pairs(default_config_asi_tbl) do
                fileConfig[key] = value
            end
            self.__configChanged = true
        end

        for k, v in pairs(fileConfig) do
            self.defaultSettings[k] = v
        end
    end)

    if success then
        BasicPrint("Config.load() - RacialASI.json loaded successfully.","INFO", nil, nil, true)
    else
        BasicWarning("Config.load() - RacialASI.json " .. error_message)
    end
    
    if self.__configChanged == true then
        self:save()
    end
    return default_config_asi_tbl
end

function CONFIG_ASI:save()
    BasicPrint("save() - RacialASI.json saved successfully.")
    local dataToSave = {}
    for k, v in pairs(self.defaultSettings) do
        dataToSave[k] = v
    end
    JSON.LuaTableToFile(dataToSave, self.path)
    self.__configChanged = false
end

function CONFIG_ASI:checkStructure()
    local defaultConfig = default_config_asi_tbl
    for key, value in pairs(defaultConfig) do
        if self.defaultSettings[key] == nil then
            self.defaultSettings[key] = value
            BasicWarning("checkStructure() - Added missing key : " .. key .. " to the configuration file")
            self.__configChanged = true
        elseif type(self.defaultSettings[key]) ~= type(value) then
            BasicWarning(string.format(
                "checkStructure() - Config key '%s' has incorrect type. Reverting to default.", key))
            self.defaultSettings[key] = value
            self.__configChanged = true
        end
    end
    if self.__configChanged == true then
        self:save() -- Save after checking structure 
    end
end

function LoadconfigASI()
    CONFIG_ASI.__configChanged = true
    CONFIG_ASI:save()
    return CONFIG_ASI:load()
end

function CONFIG_ASI:upgrade()
    self.__configChanged = true
    self:save()
end

function CONFIG_ASI:init()
    Files.ClearLogFile()
    -- Load the config from the file or create a new one if it doesn't exist
    self:load()

    -- Check the Config Structure and correct it if needed
    self:checkStructure()

    if CONFIG.data.VERSION ~= MOD_INFO.VERSION then
        BasicWarning("Config.Init() - RacialASI.json - Detected version mismatch, upgrading file...")
        self:upgrade()
    else
        BasicPrint("Config.Init() - RacialASI.json - VERSION check passed")
    end
end


---@param dataASI string table of default options
function InitConfigASI(dataASI)
    if dataASI then
        default_config_asi_tbl=dataASI
        setmetatable(CONFIG_ASI, {
            __index = function(self, key)
                return self.defaultSettings[key]
            end,
            __newindex = function(self, key, value)
                self.defaultSettings[key] = value
                self.__configChanged = true
                self:save(Paths.RacialASI_json_file_path)
            end,
        
            __tostring = function(self)
                return JSON.Stringify(self.defaultSettings)
            end
        })
        if not default_config_asi_tbl then return end
    else
        return
    end
    CONFIG_ASI:init()
    return CONFIG_ASI
end