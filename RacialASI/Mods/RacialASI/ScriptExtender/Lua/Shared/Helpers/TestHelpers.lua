-- From BGSE https://github.com/Norbyte/bg3se/blob/main/BG3Extender/LuaScripts/Tests/TestHelpers.lua#L62

RegisteredTests = {}

function RegisterTests(category, tests)
  if RegisteredTests[category] == nil then
    RegisteredTests[category] = {}
  end

  for i, test in pairs(tests) do
    table.insert(RegisteredTests[category], test)
  end
end

function RunTests()
  RADebug(4, " --- STARTING TESTS --- ")

  for category, tests in pairs(RegisteredTests) do
    RADebug(4, " --- Category: " .. category)
    for i, test in ipairs(tests) do
      RunTest(test, _G[test])
    end
  end

  RADebug(4, " --- FINISHING TESTS --- ")
end

Ext.RegisterConsoleCommand("se_test", function ()
  RunTests()
end)

function Assert(expr)
  if not expr then
    RADebug(4, "Assertion failed")
  end
end

function AssertEquals(value, expectation)
  local equals
  if type(expectation) == "table" then
    equals = (Ext.Json.Stringify(expectation) == Ext.Json.Stringify(value))
  else
    equals = (expectation == value)
  end

  if not equals then
    RADebug(4, "Expressions not equal: expected " ..
      Ext.Json.Stringify(expectation, false, true) .. " , got " .. Ext.Json.Stringify(value, false, true))
  end
end

function AssertType(value, expectation)
  local ty = type(value)
  if ty ~= expectation then
    RADebug(4, "Expressions type not equal: expected " .. expectation .. " , got " .. ty)
  end
end

function AssertEqualsFloat(value, expectation)
  if math.abs(expectation - value) > 0.00001 then
    RADebug(4, "Expressions not equal: expected " .. expectation .. " , got " .. value)
  end
end

function AssertPropertyEquals(k, expectation, value)
  if Ext.Utils.IsIterable(expectation) then
    if type(value) == "table" then
      AssertEqualsProperties(expectation, value)
    else
      local mt = getmetatable(value)
      if mt == "bg3se::Array" then
        AssertEqualsArray(expectation, value)
      elseif mt == "bg3se::Set" then
        AssertEqualsSet(expectation, value)
      elseif mt == "bg3se::Map" or mt == "bg3se::Object" then
        AssertEqualsProperties(expectation, value)
      else
        RADebug(4, "Don't know how to assert userdata: " .. mt)
      end
    end
    return
  end

  local equals
  if type(expectation) == "number" then
    equals = (math.abs(expectation - value) < 0.00001)
  else
    equals = (expectation == value)
  end

  if not equals then
    if type(expectation) == "number" then
      RADebug(4, "Property value not equal: " .. k .. ": " .. expectation .. " = " .. value)
    else
      RADebug(4, "Property value not equal: " ..
        k .. ": " .. Ext.Json.Stringify(expectation, false, true) .. " = " .. Ext.Json.Stringify(value, false, true))
    end
  end
end

function AssertEqualsArray(expectation, value)
  if #expectation ~= #value then
    RADebug(4, "Array length not equal: " .. #expectation .. " = " .. #value)
  end

  for k, exp in ipairs(expectation) do
    local val = value[k]
    AssertPropertyEquals(k, exp, val)
  end
end

function AssertEqualsSet(expectation, value)
  if #expectation ~= #value then
    RADebug(4, "Set length not equal: " .. #expectation .. " = " .. #value)
  end

  for k, exp in ipairs(expectation) do
    if value[exp] ~= true then
      RADebug(4, "Value not in set: " .. exp)
    end
  end
end

function AssertEqualsProperties(expectation, value)
  for k, exp in pairs(expectation) do
    local val = value[k]

    AssertPropertyEquals(k, exp, val)
  end
end

function AssertContains(arr, element)
  for _, v in pairs(arr) do
    if v == element then
      return
    end
  end

  RADebug(4, "Element not in table: " .. element)
end

function AssertValid(val)
  if not Ext.Types.Validate(val) then
    RADebug(4, "Structure not valid: " .. val)
  end
end

function RunTest(name, fun)
  local result, err = xpcall(fun, debug.traceback)
  if result then
    RADebug(4, "Test OK: " .. name)
  else
    RADebug(4, "Test FAILED: " .. name)
    RADebug(4, err)
  end
end
