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

function M.writeHeader( statusCode )
    local status = getStatus( tostring(statusCode))
    mg.write("HTTP/1.1 ".. statusCode .. " " .. status .."\r\n")
    mg.write("Connection: close\r\n")
    mg.write("Content-Type: text/html; charset=utf-8\r\n")
end

statusCode=400
print(statusCode, getStatus(tostring(statusCode)))

return M
