--require"config" @see lua_proload_file

local file = mg.get_var(mg.request_info.query_string, "file");
if not file then

    local u = require"mgutils"
    u.writeHeader(400)

    template.render( "error.html", {
      message = "文件ID为空"
    })


else
    filename = mg.document_root .. "/" .. file
    mg.send_file(filename)
end
