package.path =   mg.document_root .. "/lua/?.lua;" .. package.path

template = require "resty.template"
template.caching(false) --for debug
template.document_root(mg.document_root)
--template render to
template.print = function(s)
--mg.write("-----------------------")
  mg.write(s)
--mg.write("-----------------------")
end
