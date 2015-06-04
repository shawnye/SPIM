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

statusCode=400
print(statusCode, getStatus(tostring(statusCode)))

return M
