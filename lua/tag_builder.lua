require "string_helper"

local M = {}

--print((" asd sad a dsa "):trim() .. ',')
M.escape = function ( data , doTrim)
  if data and type(data) == 'string' then
    return data:gsub("[<>&\"]",
        {
          ["&"]="&amp;", --特殊符号必须用[]
          ["<"]="&lt;",
          [">"]="&gt;",
          ["\""]="&quot;"
        }
      ):trim(doTrim)
  end

  return data
end

M.buildTag = function ( tagName, attribs , subtags, inline, indents)
  if inline == nil then
    inline = false
  end
  if indents == nil then
    indents = 0
  end
  local tag = {}
  tag[#tag+1] = string.rep('\t', indents)
  tag[#tag+1] = "<"
  tag[#tag+1] = tagName
  for k,v in pairs(attribs) do
      tag[#tag+1] = " "
      tag[#tag+1] = k
      tag[#tag+1] = "="
      tag[#tag+1] = "\""
      tag[#tag+1] = M.escape(v)
      tag[#tag+1] = "\""

  end
  tag[#tag+1] = ">"
  if inline == false  then
    tag[#tag+1] = "\n"
  end
  if subtags then
    tag[#tag+1] = subtags --M.escape (subtags)
    if inline == false  then
      tag[#tag+1] = "\n"
    end
  end

  if not inline then
    tag[#tag+1] = string.rep('\t', indents)
  end

  tag[#tag+1] = "</"
  tag[#tag+1] = tagName
  tag[#tag+1] = ">"

  return table.concat( tag )
end

--[[
  options:{ 1=male ,2=female,...}
]]
M.buildSelectTag = function ( attribs , options , indents)
     local optionTags = {}
     if indents == nil then
       indents = 0
     end
     local selectedValue = attribs.value
    for k,v in pairs(options) do
      if selectedValue == k then
        optionTags[#optionTags + 1] = M.buildTag( "option", {value=M.escape(v), selected="selected"} , M.escape(v), true, indents+1 )
      else
        optionTags[#optionTags + 1] = M.buildTag( "option", {value=M.escape(v)} , M.escape(v), true, indents+1 )

      end
    end

   return M.buildTag( "select", attribs , table.concat( optionTags, "\n"), false, indents)
end

M.buildInputTag = function ( type, attribs ,indents)
  attribs.type=type
  return M.buildTag( "input", attribs , nil, true, indents)
end



M.createTableFromText = function ( tsv , firstLineAsTitle,  attribs)

end

M.createTable = function ( t , attribs)

  local tb = {}
  local trs = {}
  local indents = 1


  for k,v in pairs(t) do
    local tdk = M.buildTag("td",{} , M.escape(k) , true, indents + 2)
    local tdv = M.buildTag("td",{} , M.escape(v) , true, indents + 2)
    trs[#trs+1] = M.buildTag("tr",{} ,tdk  .. '\n' .. tdv , false, indents + 1)

  end
  tb[#tb+1] = M.buildTag("tbody",{} ,table.concat( trs, "\n") , false, indents)

  return  M.buildTag("table",attribs ,table.concat( tb, "\n") , false)
end


M.createList = function ( list , attribs )
  --[[
  if delim == nil then
    delim = "\n"
  end
  ]]
  local lis = {}
  for v in list:gmatch("[^\n]+") do
    v = v:trim()
    if v ~= '' then
      lis[#lis+1] = M.buildTag("li",{} , M.escape(v) , true,  1)
    end
  end

  return  M.buildTag("ul" ,attribs, table.concat( lis, "\n") , false)

end
--[[
M.test = function( )
  local tag = M.buildTag('input',
  {id="order_id",name="order_name", type="text", value="1232321313"},
  M.escape("测试<abc\"de&f> ") ,
  true)

  return tag
end


--]]

--print(M.buildSelectTag({name="test",id="sel" }, {M="male", F="female"}))

print(
M.createList([[
    接入间名称
    交接箱编码
    主干
    直列
  ]] , { class="menu"}  )
)

print(
M.createTable( {server="tomcat", version="  1.3  "} , { class="form_table", border=1}  )
)

return M
