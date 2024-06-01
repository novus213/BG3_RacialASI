---@diagnostic disable: duplicate-set-field
JSON = {}
Files = {}
-- ------------------------------------------------------------------------------------------------------
-- File I/O Stuff credit to the kv camp event author, I basically just made their code/functions worse --
-- ------------------------------------------------------------------------------------------------------

--- Saves the given content to the specified file path.
--- @param path string The path to save the file to, relative to the mod folder.
--- @param content string The content to save to the file.
--- @return boolean result True if the save was successful, false otherwise.
function Files.Save(path, content)
    path = Files.Path(path)
    return Ext.IO.SaveFile(path, content)
end

--- Loads the content of the file at the given path.
--- @param path string The path of the file to load, relative to the mod folder.
function Files.Load(path)
    path = Files.Path(path)
    return Ext.IO.LoadFile(path)
end

--- Concatenates the folder name and file path to get the full path.
---@param filePath string The file path relative to the folder.
---@return string fullPath The full path including the folder name.
function Files.Path(filePath)
    return MOD_INFO.FOLDER_NAME .. "/" .. filePath
end

--- Parses a JSON string into a Lua table.
---@param json_str string|table The JSON string to parse.
---@return table
function JSON.Parse(json_str)
    return Ext.Json.Parse(json_str)
end

--- Stringifies the given Lua data structure into a JSON string.
---@param data any The data to stringify
---@return string The JSON string representation of the input data
function JSON.Stringify(data)
    return Ext.Json.Stringify(data)
end

---Moves a file from the old path to the new path.
---The content of the file is loaded, saved to the new path, and then the original file is cleared .
---Mainly used to clear the log file.
---@param oldPath string The path of the file to be moved.
---@param newPath string The destination path for the moved file.
---@return boolean result true if the move operation is successful, otherwise false.
function Files.Move(oldPath, newPath)
    local content = Files.Load(oldPath)
    if content then
        Files.Save(newPath, content)
        Files.Save(oldPath, "")
        return true
    else
        BasicError("Files.Move() - Failed to read file from oldPath: '" .. (oldPath or "") .. "'")
        return false
    end
end

---Converts a Lua table to a JSON formated string and saves it to the specified file path.
---@param lua_table table The Lua table to be converted to JSON.
---@param filePath string The path of the file where the JSON string will be saved.
function JSON.LuaTableToFile(lua_table, filePath)
    local json_str = JSON.Stringify(lua_table)
    Files.Save(filePath, json_str)
end

---Loads a JSON string from a file and parses it into a Lua table.
---@param filePath string The path of the file containing the JSON string.
---@return table|nil table_or_nil Lua table parsed from the JSON string, or nil if parsing fails.
function JSON.LuaTableFromFile(filePath)
    local json_str = Files.Load(filePath)
    if json_str and json_str ~= "" then
        return JSON.Parse(json_str)
    else
        return nil
    end
end
