require "soo"

local  io = io

--[[
  template file should be utf8 encoded
]]
Template = class{
  name = "default" ,-- for reference
  file = nil,
  merge = false,
  debug = false
}

--[[ $a, $b_c1 $_zz , starts with letter, ]]
local  pattern = "$(%a+[%w_]+)"

function Template:toString()
  return self.name
end

function Template:merge( data )
  if not self.file then
    return nil, "file name is empty"
  end
  local lc = 0
  fd = assert(io.open(self.file))

  local merged = {}
  for line in fd:lines() do
    if self.debug then
       lc = lc + 1
    end
    if data then
      line = line:gsub(pattern, data)
    end

    merged[#merged+1] = line
    if self.debug then
      print("[".. lc .. "] ", line)
    end
  end

  fd:close()

  if self.debug then
      print("total lines", lc)
  end

  return table.concat( merged, "\n" )

end


--[[
--instance
local t = Template{
  file = "../error.html",
  debug = true
}

page = t:merge({message="测试 "})
print("page",page)
--]]
