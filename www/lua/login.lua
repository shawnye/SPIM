local qs = mg.request_info.query_string
local post = mu.readPostData()


mu.writeHeader(200)

 mg.write([[
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>测试</title>
</head>
<body>

<div>
  帐号=]] ..mg.get_var(post, 'account')  .. [[ <br/>
  密码=]] ..mg.get_var(post, 'password')  .. [[
</div>

 </body>
</html>
]])
