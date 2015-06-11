--require"config" @see lua_proload_file

local file = mg.get_var(mg.request_info.query_string, "file");
if not file then

    mu.writeHeader(400)

    template.render( "error.html", {
      message = "文件ID为空"
    })


else
    filename = mg.document_root .. "/" .. file
    --u.writeHeader(200, "文件下载" )
    mg.send_file(filename) -- send a file, including MIME type
end
