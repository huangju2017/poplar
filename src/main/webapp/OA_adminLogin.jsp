<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0044)http://127.0.0.1:8080/YiYi/OA_adminLogin.jsp -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://127.0.0.1:8080/YiYi/">--><base href=".">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./OA_adminLogin_files/loginregist.css">
<script src="./OA_adminLogin_files/loginregist.js.下载"></script>
<style>
h2{
	text-align:center;
	text-transform: uppercase;
	font-weight: 400;
}
</style>
</head>
<body>
<form method="post" action="login">
		<div class="control">
				<h2>管理员登录</h2>
			<div class="content">
				<div style="display: block;">
					<p>账号:</p>
					<input type="text" placeholder="Username" name="adminName">
					<p>密码:</p>
					<input type="password" placeholder="Password" name="adminPassword">
					<p class="error"></p>
					<br>
					<a href="OA_YiYi_index.html">登录</a><input type="submit" value="登录"> 
				</div>
			</div>
		</div>
		</form>

</body></html>