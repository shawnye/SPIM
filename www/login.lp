<? mg.write("HTTP/1.1 200 OK") ?>
<? mg.write("Content-Type: text/html")
-- Apache、IIS、Nginx等绝大多数web服务器，都不允许静态文件响应POST请求，否则会返回“HTTP/1.1 405 Method not allowed”错误
--这里的变量不应local ，否则下面的chunk不可见
?>

<!doctype html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>SPIM登录</title>
  <meta name="robots" content="noindex,nofollow,noarchive">
  <link rel="SHORTCUT ICON" href="favicon.ico" type="image/x-icon" >
  <link rel="stylesheet" type="text/css" href="styles/common.css" />
  <script type="text/javascript" src="scripts/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="scripts/my-jquery-plugin.js"></script>

<style type="text/css">

.login_form_div{
	width: 400px;

}
.login_table{
	border-collapse: collapse;
	text-align: left;
	width: 400px;
}
.login_table caption {
		border:1px solid black;
		text-align: center;
		font-size: larger;
}
.error{
	color:red;
	background: lightyellow;
}
.buttons{
	text-align: right;
}
.desc{
	color:gray;
	font-size: 11pt;
}
.html_alert{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	if(!(window.File && window.FileReader && window.FileList)){
		$('.html_alert').css('display','block');
	}


	$('.login_form_div').center({'toTop': 50});//中间靠上50px

});

</script>
</head>
<body>
<div class="login_form_div">

<form action="login.lua" id="loginForm" method="post" autocomplete="off" >
<noscript><div style="color:red;"><img alt="error" src="images/exclamation.gif">警告：您的浏览器安全设置禁止了脚本运行，导致系统无法正常运行。</div></noscript>
<table class="login_table" border="1">
	<caption class="title">个人信息系统登录</caption>
	<tbody>
		<tr>
			<td colspan="2" style="text-align: center;font-size: 11pt;background-color: #ccffcc;">
			今天是 <?=os.date("%Y年%m月%d日 %A") ?>
			</td>
		</tr>
		<tr class="html_alert">
			<td colspan="2" style="font-size: 11pt;color:red;">
			<img alt="error" src="images/exclamation.gif">您的浏览器不支持HTML5特性。<br/>
			请使用支持<a href="http://baike.baidu.com/view/951383.htm?fr=aladdin" target="_blank">HTML5</a>的浏览器, 注:不支持IE4 ~ IE8浏览器。
			</td>
		</tr>

		<tr>
			<td>帐号：</td>
			<td><input type="text" name="account" id="account"  maxlength="50"/></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password" id="password"  maxlength="25" /></td>
		</tr>

		<tr >
			<td colspan="2"  >
				<div class="buttons"><input type="submit" value="登录&gt;&gt;"/>&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</td>
		</tr>

		<tr >
			<td colspan="2"  >
				<div class="desc">来访IP：<?=mg.request_info.remote_addr?> &nbsp;|&nbsp;版本：</div>
			</td>
		</tr>

	</tbody>
</table>
</form>

</div>
</body>
</html>
