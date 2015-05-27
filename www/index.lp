<? mg.write("HTTP/1.1 200 OK") ?>
<? mg.write("Content-Type: text/html") ?>
<!-- Apache、IIS、Nginx等绝大多数web服务器，都不允许静态文件响应POST请求，否则会返回“HTTP/1.1 405 Method not allowed”错误 -->

<!doctype html>
<?    pu = require"tag_builder" --这里不应local ，否则下面的chunk不可见 ?>
<html>
 <head>
  <meta charset="UTF-8">
  <title>(<?=_VERSION?>) 页面测试(HTML5)</title>
  <script src="scripts/common.js" type="text/javascript" charset="utf-8" async defer></script>
  <script src="scripts/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8" async defer></script>
  <link rel="stylesheet" href="styles/common.css">
  <link rel="icon" href="/favicon.png">
  <script type="text/javascript">
    $(document).ready(function(){
      $("tr:even").css("background","yellow")
    });
  </script>
  <style type="text/css" media="screen">
    table {
      border-collapse: collapse;
    }
  </style>
 </head>
 <body>
 document_root=<?=mg.document_root?>
 <form action="test_post.lp" method="get" >  
 <table border = "1">
  <caption>标题</caption>
  <thead>
    <tr>
      <th>序号</th>
      <th>姓名</th>
      <th>性别</th>
      <th>链接</th>
     
    </tr>
  </thead>
  <tbody>


    <?
    --需要循环时才这样麻烦
    --建立循环模板，尽量使用html
      local template = [[
    <tr>
      <td>$c1</td>
      <td><input type="text" name="name_$c2" ></td>
      <td>$c3</td>
      <td><a href="javascript:void(0)" title="$c4">$c4</a></td>
      
    </tr>
      ]]

      --开始循环
      for i=1,5 do

        local t = template:gsub("%$(%w+)", {
            c1=i,
            --c2=pu.buildInputTag("input",{id="t1" .. tostring(i),name="tname"}),
            c2=i,
            c3=pu.buildSelectTag({name="test_" .. tostring(i), value="N" ,id="sel" .. tostring(i)},{M="男", F="女",N="未设置"}),
            c4="地址" .. tostring(i)
          }) --gsub返回两个值！
        mg.write(t)

      end
    ?>

  </tbody>
</table>
 <input type="submit" name="ok" value="提交">
<a href="download.lp" target="_blank">下载文件</a>
 </form>




来自 <?=mg.request_info.remote_addr?>
<hr/>
package.path=<?=package.path ?>
<br/>
package.cpath=<?=package.cpath ?>

 
 </body>
</html>
