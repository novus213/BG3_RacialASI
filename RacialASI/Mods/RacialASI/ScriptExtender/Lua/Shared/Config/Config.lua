-- -------------------------------------------------------------------------- --
--                             Config IO functions                            --
-- -------------------------------------------------------------------------- --
local default_config_tbl={}



local CONFIG = {
    data = {},
    path = Paths.config_json_file_path,
    __configChanged = false,
}

function CONFIG:load()
    local success, error_message = pcall(function()
        local fileConfig = JSON.LuaTableFromFile(self.path) or {}
        self.__configChanged = false

        if next(fileConfig) == nil then
            BasicPrint("Creating default config file at : " .. self.path)
            -- Initialize with default values if the fileConfig is empty
            for key, value in pairs(default_config_tbl) do
                fileConfig[key] = value
            end
            self.__configChanged = true
        end

        for k, v in pairs(fileConfig) do
            self.data[k] = v
        end
    end)

    if not success then
        BasicWarning("Config.load() - " .. error_message)
    end
    if self.__configChanged == true then
        self:save()
    end
end

function CONFIG:save()
    BasicPrint("save() - Config file saved")
    local dataToSave = {}
    for k, v in pairs(self.data) do
        dataToSave[k] = v
    end
    JSON.LuaTableToFile(dataToSave, self.path)
    self.__configChanged = false
end

function CONFIG:checkStructure()
    local defaultConfig = default_config_tbl
    for key, value in pairs(defaultConfig) do
        if self.data[key] == nil then
            self.data[key] = value
            BasicWarning("checkStructure() - Added missing key : " .. key .. " to the configuration file")
            self.__configChanged = true
        elseif type(self.data[key]) ~= type(value) then
            BasicWarning(string.format(
                "checkStructure() - Config key '%s' has incorrect type. Reverting to default.", key))
            self.data[key] = value
            self.__configChanged = true
        end
    end
    if self.__configChanged == true then
        self:save() -- Save after checking structure
    end
end

function CONFIG:upgrade()
    self.data["VERSION"] = MOD_INFO.VERSION
    self.__configChanged = true
    self:save()
end

function CONFIG:init()
    Files.ClearLogFile()
    BasicPrint(
        string.format("Config.Init() - %s mod by FallenStar VERSION : %s starting up... ", MOD_INFO.MOD_NAME,
        MOD_INFO.VERSION),
        "INFO", nil, nil, true)

    -- Load the config from the file or create a new one if it doesn't exist
    self:load()

    -- Check the Config Structure and correct it if needed
    self:checkStructure()

    if self.data.VERSION ~= MOD_INFO.VERSION then
        BasicWarning("Config.Init() - Detected version mismatch, upgrading file...")
        self:upgrade()
    else
        BasicPrint("Config.Init() - VERSION check passed")
    end

    BasicDebug("Config.Init() - DEBUG MESSAGES ARE ENABLED")
    BasicDebug(self)
end



function InitConfig()
    if MOD_INFO then
        default_config_tbl=MOD_INFO.DEFAULT_CONFIG
        default_config_tbl["VERSION"]=MOD_INFO.VERSION or "1"
        setmetatable(CONFIG, {
            __index = function(self, key)
                return self.data[key]
            end,
            __newindex = function(self, key, value)
                self.data[key] = value
                self.__configChanged = true
                self:save(Paths.config_json_file_path)
            end,
        
            __tostring = function(self)
                return JSON.Stringify(self.data)
            end
        })
        if not default_config_tbl then return end
    else
        return
    end
    CONFIG:init()
    return CONFIG
end
