local M = {}

local mapping = {
  C_200 = "OK",
  C_400 = "Bad Request"

}
function getStatus( statusCode )
  statusCode = "C_" .. statusCode
  for k,v in pairs(mapping) do
    if statusCode == k then
      return v
    end
  end

  return nil
end

function M.getHeader( statusCode )
    local status = getStatus( tostring(statusCode))
    local bf = {}
    bf[#bf+1] = "HTTP/1.1 "
    bf[#bf+1] = statusCode
    bf[#bf+1] = " "
    bf[#bf+1] = status
    bf[#bf+1] = "\r\n"
    bf[#bf+1] = "Connection: close"
    bf[#bf+1] = "\r\n"
    bf[#bf+1] = "Content-Type: text/html; charset=utf-8"
    bf[#bf+1] = "\r\n"
    bf[#bf+1] = "\r\n" --must 2 lines

    return table.concat( bf )
end

function M.writeHeader( statusCode )
  mg.write (M.getHeader(statusCode) )
end

function M.isPost()
  return mg.request_info.request_method:upper() == "POST"
end

function M.isFileUpload()
  return M.isPost() and mg.request_info.content_type:lower():sub(1,19) == 'multipart/form-data'
end

function M.getHeader( key )
  if not key then
    return nil
  end
  return mg.request_info.http_headers[key]
end

function M.readPostData()
-- Read the entire body data (POST content) into "stringtab" variable.
-- Use a string builder pattern for performance reasons
local stringtab = {}

repeat
  local add_data = mg.read()
  if add_data then
    stringtab[#stringtab+1] = add_data
  end
until (add_data == nil);

return table.concat(stringtab)

end

--statusCode=400
--print(statusCode, getStatus(tostring(statusCode)))

return M
