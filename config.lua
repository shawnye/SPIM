package.path =   mg.document_root .. "/lua/?.lua;" .. package.path

system = {
  version = '0.1'

}



mu = require"mgutils"


template = require "resty.template"
template.caching(false) --for debug
template.document_root(mg.document_root)
--template render to
template.print = function(s)
--mg.write("-----------------------")
  mg.write(s)
--mg.write("-----------------------")
end

--session_manager using sqlite3
--session_table: sid, user, login_time, ip...
--session_attributes
