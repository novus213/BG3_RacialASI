---@diagnostic disable: duplicate-set-field, duplicate-doc-alias

-- -------------------------------------------------------------------------- --
--                             Messages functions                             --
-- -------------------------------------------------------------------------- --

---@alias MESSAGETYPE string | "INFO"|"WARNING"|"ERROR"|"DEBUG"

local PrintTypes = {
    INFO = 1,
    ERROR = 2,
    WARNING = 3,
    DEBUG = 4
}


local printError = Ext.Utils.PrintError
local printWarning = Ext.Utils.PrintWarning
function ConcatPrefix(prefix, message)
    local paddedPrefix = prefix .. string.rep(" ", MAX_PREFIX_LENGTH - #prefix) .. " : "

    if type(message) == "table" then
        local serializedMessage = JSON.Stringify(message)
        return paddedPrefix .. serializedMessage
    else
        return paddedPrefix .. tostring(message)
    end
end

--Blatantly stolen from KvCampEvents, mine now
local function ConcatOutput(...)
    local varArgs = { ... }
    local outStr = ""
    local firstDone = false
    for _, v in pairs(varArgs) do
        if not firstDone then
            firstDone = true
            outStr = tostring(v)
        else
            outStr = outStr .. " " .. tostring(v)
        end
    end
    return outStr
end

--- Prints a formatted message to the console and logs it if logging is enabled.
---@param content any The content of the message to be printed and logged.
---@param messageType? MESSAGETYPE The type of the message (e.g., "INFO", "ERROR", "WARNING").
--- Defaults to "INFO" if not provided.
---@param textColor? number The ANSI color code for the text. Defaults to blue if not provided.
---@param customPrefix? string A custom prefix for the message. Defaults to MOD_NAME if not provided.
---@param rainbowText? boolean If true, the text will be displayed in rainbow colors. Defaults to false.
---@param prefixLength? number The length of the prefix. Defaults to 15 if not provided.
function BasicPrint(content, messageType, textColor, customPrefix, rainbowText, prefixLength)
    local logLevel = (CONFIG and CONFIG.DEBUG_MESSAGES) or 3
    prefixLength = prefixLength or 15
    messageType = messageType or "INFO"
    local textColorCode = textColor or TEXT_COLORS.blue -- Default to blue
    customPrefix = customPrefix or (MOD_INFO and MOD_INFO.MOD_NAME) or "FALLEN_DEFAULT"
    if CONFIG and CONFIG.LOG_ENABLED == 1 then
        Files.LogMessage(ConcatOutput(ConcatPrefix(customPrefix .. "  [" .. messageType .. "]", content)))
    end

    if logLevel <= 0 then
        return
    end

    if PrintTypes[messageType] and logLevel >= PrintTypes[messageType] then
        local padding = string.rep(" ", prefixLength - #customPrefix)
        local message = ConcatOutput(ConcatPrefix(customPrefix .. padding .. "  [" .. messageType .. "]", content))
        local coloredMessage = rainbowText and GetRainbowText(message) or
            string.format("\x1b[%dm%s\x1b[0m", textColorCode, message)
        if messageType == "ERROR" then
            printError(coloredMessage)
        elseif messageType == "WARNING" then
            printWarning(coloredMessage)
        else
            print(coloredMessage)
        end
    end
end

---Prints an error message to the console and logs it if logging is enabled.
---@param content any The content of the error message to be printed and logged.
---@param textColor? number The ANSI color code for the text. Defaults to red if not provided.
function BasicError(content, textColor)
    BasicPrint(content, "ERROR", TEXT_COLORS.red)
end

---Prints a warning message to the console and logs it if logging is enabled.
---@param content any The content of the error message to be printed and logged.
---@param textColor? number The ANSI color code for the text. Defaults to yellow if not provided.
function BasicWarning(content, textColor)
    BasicPrint(content, "WARNING", TEXT_COLORS.yellow)
end

---Prints a debug message to the console and logs it if logging is enabled.
---@param content any The content of the error message to be printed and logged.
---@param textColor? number The ANSI color code for the text. Defaults to blue if not provided.
function BasicDebug(content, textColor)
    BasicPrint(content, "DEBUG", textColor)
end

---Applies a rainbow color effect to a given string.
---@param text string The input text to be colored with a rainbow effect.
---@return string coloredText input text with rainbow colors applied.
function GetRainbowText(text)
    local coloredText = ""
    local len = #text
    local step = 360 / len
    local hue = 0

    for i = 1, len do
        local char = text:sub(i, i)
        local r, g, b = HSVToRGB(hue, 1, 1)
        coloredText = coloredText .. string.format("\x1b[38;2;%d;%d;%dm%s\x1b[0m", r, g, b, char)
        hue = (hue + step) % 360
    end

    return coloredText
end

---@param h integer hue
---@param s integer saturation
---@param v integer value
---@return integer r red
---@return integer g green
---@return integer b blue
function HSVToRGB(h, s, v)
    local c = v * s
    local hp = h / 60
    local x = c * (1 - math.abs(hp % 2 - 1))
    local r, g, b = 0, 0, 0

    if hp >= 0 and hp <= 1 then
        r, g, b = c, x, 0
    elseif hp >= 1 and hp <= 2 then
        r, g, b = x, c, 0
    elseif hp >= 2 and hp <= 3 then
        r, g, b = 0, c, x
    elseif hp >= 3 and hp <= 4 then
        r, g, b = 0, x, c
    elseif hp >= 4 and hp <= 5 then
        r, g, b = x, 0, c
    elseif hp >= 5 and hp <= 6 then
        r, g, b = c, 0, x
    end

    local m = v - c
    return math.floor((r + m) * 255), math.floor((g + m) * 255), math.floor((b + m) * 255)
end

---BasicPrint but supports string.format syntax
---@param content any
---@param ... any
function Fprint(content, ...)
    content = string.format(content, ...)
    BasicPrint(content)
end

---BasicDebug but supports string.format syntax
---@param content any
---@param ... any
function DFprint(content, ...)
    content = string.format(content, ...)
    BasicDebug(content)
end
