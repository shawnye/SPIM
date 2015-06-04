require"config"


local template = require "resty.template"
template.caching(false) --for debug
template.document_root(mg.document_root)
--template render to
template.print = function(s)
--mg.write("-----------------------")
  mg.write(s)
--mg.write("-----------------------")
end



local file = mg.get_var(mg.request_info.query_string, "file");
if not file then
    local data = {
      message = "文件ID为空"
    }

    --local page =  t:merge(data)

    local u = require"mgutils"
    mg.write (u.getHeader(400) )

    template.render( "error.html", data )


else
    filename = mg.document_root .. "/" .. file
    mg.send_file(filename)
end
