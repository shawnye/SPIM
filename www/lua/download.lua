require"config"
require"template"



--if error get error page
local t = Template{
  file = mg.document_root .. "/error.html"
}



local file = mg.get_var(mg.request_info.query_string, "file");
if not file then
    local data = {
      message = "文件ID为空"
    }

    local page =  t:merge(data)
    local u = require"mgutils"
    u.writeHeader(400)
    mg.write(page)

else
    filename = mg.document_root .. "/" .. file
    mg.send_file(filename)
end
