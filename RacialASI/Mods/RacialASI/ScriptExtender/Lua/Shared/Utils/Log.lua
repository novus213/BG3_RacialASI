---@diagnostic disable: duplicate-set-field

-- -------------------------------------------------------------------------- --
--                                    LOGS                                    --
-- -------------------------------------------------------------------------- --


local logBuffer = ""         -- Initialize an empty log buffer
local logBufferMaxSize = 512 -- Maximum buffer size before flushing
local function GetTimestamp()
    local time = Ext.Utils.MonotonicTime()
    local milliseconds = time % 1000
    local seconds = math.floor(time / 1000) % 60
    local minutes = math.floor((time / 1000) / 60) % 60
    local hours = math.floor(((time / 1000) / 60) / 60) % 24
    return string.format("[%02d:%02d:%02d.%03d]",
        hours, minutes, seconds, milliseconds)
end

--- Appends a timestamped message to the log buffer.
--- The log buffer is flushed if its size exceeds the maximum specified above (default is 512).
---@param message string The message to be logged.
function Files.LogMessage(message)
    local logMessage = GetTimestamp() .. " " .. message
    logBuffer = logBuffer .. logMessage .. "\n"

    -- Check if the buffer size exceeds the maximum, then flush it
    if #logBuffer >= logBufferMaxSize then
        Files.FlushLogBuffer()
    end
end

--- Flushes the log buffer by appending its content to the log file.
--- The log buffer is cleared after flushing.
function Files.FlushLogBuffer()
    if logBuffer ~= "" then
        local logPath = Paths.logPath
        local fileContent = Files.Load(logPath) or ""
        Files.Save(logPath, fileContent .. logBuffer)
        logBuffer = "" -- Clear the buffer
    end
end

--- Clears the content of the log file specified in the configuration.
function Files.ClearLogFile()
    local logPath = Paths.logPath
    if Files.Load(logPath) then
        Files.Save(logPath, "")
    end
end