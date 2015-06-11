mu.writeHeader(200)

--session id
local sid = math.random(10000) .. '-' .. os.time();
--store in database

template.render( "login.html", {
      sid = sid,
      today = os.date("%Y年%m月%d日 %A"),
      ip = mg.request_info.remote_addr,
      base = "../",
      version = system.version
})

