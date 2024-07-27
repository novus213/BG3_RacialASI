--- VoltionCabinet table

--- Constructor for tablelength
---@param tbl table
---@return integer sizeOf table
function table.getLength(tbl)
  local count = 0
  for _ in pairs(tbl) do count = count + 1 end
  return count
end



--- Constructor for dump
---@param tbl table
---@return string
function table.dump(tbl)
   if type(tbl) == 'table' then
      local s = '{ '
      for k,v in pairs(tbl) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. table.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(tbl)
   end
end

--- Constructor for empty
---@param tbl table
---@return boolean
function table.empty(tbl)
    tbl = nil
    collectgarbage()
    return true
end