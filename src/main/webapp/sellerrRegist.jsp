<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0044)http://127.0.0.1:8080/YiYi/sellerrRegist.jsp -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://127.0.0.1:8080/YiYi/">--><base href=".">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./sellerrRegist_files/loginregist.css">
<script src="./sellerrRegist_files/loginregist.js.下载"></script>
<script src="./sellerrRegist_files/jquery-3.5.1.main.js.下载"></script>
<link rel="stylesheet" type="text/css" href="./sellerrRegist_files/reset.css">
		<link rel="stylesheet" type="text/css" href="./sellerrRegist_files/fonts.css">
		<link rel="stylesheet" type="text/css" href="./sellerrRegist_files/iconfont.css">
		<link rel="stylesheet" type="text/css" href="./sellerrRegist_files/index.css">
		<link rel="stylesheet" type="text/css" href="./sellerrRegist_files/productpage.css">
		<style>
		body{
		background-color: #f3f3f3;
		}
h2{
	
	text-align:center;
	text-transform: uppercase;
	font-weight: 400;
}
.formdiv{
	width:1226px;
	height:715px;
	border:1px solid #ccc ;
	margin:60px auto ;
	background-color: white;
    border-radius: 10px;
}
</style>
<script>
//ajax邮箱重复验证
function myFunction(){
//获取表单内容
var registEmail = document.getElementById("registEmail").value ;

var xhr = new XMLHttpRequest;
xhr.open("post","servlet/seller/regist");
xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xhr.onreadystatechange = function(){
	if(xhr.readyState == 4 && xhr.status == 200){
		var result = xhr.responseText;
		var jsonData = JSON.parse(result);
		if(jsonData.isexist) {
			alert("该邮箱可以注册");
			document.getElementById("subm").removeAttribute("disabled");;
			} else {
			alert("该邮箱已注册");
			document.getElementById("subm").setAttribute("disabled","disabled");
			}
	}
}
xhr.send("registEmail="+registEmail);
}

/* function  myFunction1() {
	//获取表单内容

	var registShopName = document.getElementById("registShopName").value ;
	var xhr = new XMLHttpRequest;
	xhr.open("post","servlet/seller/regist");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = xhr.responseText;
			var jsonData = JSON.parse(result);
			if(jsonData.checkShopName) {
				alert("该店名可以注册");
				document.getElementById("subm").removeAttribute("disabled");;
				} else {
				alert("该店名已注册");
				document.getElementById("subm").setAttribute("disabled","disabled");
				}
		}
	}
	xhr.send("registEmail="+registEmail);
} */
</script>
</head>
<body>
		<!--头-->
		<div class="topBar">
			<div class="container">
				<div class="topBar_list">
					<a href="http://127.0.0.1:8080/YiYi/index.html">易易商城</a>
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/#">云服务</a>
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/#">金融</a>
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/#">资质证照</a>
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/#">Merchant OS</a>
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/OA_adminLogin.html">Admin OS</a>
					<span>|</span>
				</div>
				<div class="shop">
					<a href="http://127.0.0.1:8080/YiYi/shoppingcar.html">
						<i class="iconfont" style="font-size: 14px;"></i> 购物车(0)
					</a>
				</div>

				<!-- 游客登陆 -->
				<!-- <div class="login">
				<a href="#">登录</a>
				<span>|</span>
				<a href="#">注册</a>
				<span>|</span>
				<a href="#">消息通知</a>
			</div> -->

				<!-- 用户登录 -->
				<div class="userinfo">
					<div class="user">
						<a class="tit" href="http://127.0.0.1:8080/YiYi/">用户</a>
						<ul>
							<li>
								<a href="http://127.0.0.1:8080/YiYi/userinfo.html">个人中心</a>
							</li>
							<li>
								<a href="http://127.0.0.1:8080/YiYi/">晒单评价</a>
							</li>
							<li>
								<a href="http://127.0.0.1:8080/YiYi/">我的喜欢</a>
							</li>
							<li>
								<a href="http://127.0.0.1:8080/YiYi/">账户安全</a>
							</li>
							<li>
								<a href="http://127.0.0.1:8080/YiYi/">退出登录</a>
							</li>
						</ul>
					</div>
					<a class="link" href="http://127.0.0.1:8080/YiYi/">消息通知</a>
					<span>|</span>
					<a class="link" href="http://127.0.0.1:8080/YiYi/">我的订单</a>
					<span>|</span>
				</div>

			</div>
		</div>
		<!--主页内容-->
		<div class="formdiv">
			<form method="post" action="http://127.0.0.1:8080/YiYi/servlet/seller/add">
		<div class="control">
				<h2>商家注冊</h2>
			<div class="content">
				<div style="display: block;">
					<p>邮箱</p>
					<input type="text" placeholder="邮箱" name="registEmail" id="registEmail" onblur="myFunction()">
					<p>姓名:</p>
					<input type="text" placeholder="姓名" name="registName" id="registName">
					<p>性别:</p>
					<input type="text" placeholder="性别" name="registGender" id="registGender">
					<p>年龄:</p>
					<input type="text" placeholder="年龄" name="registAge" id="registAge">
					<p>电话:</p>
					<input type="text" placeholder="电话" name="registTelephone" id="registTelephone">
					<p>地址:</p>
					<input type="text" placeholder="地址" name="registAddress" id="registAddress">
					
				
					<p>密码:</p>
					<input type="password" placeholder="密码" name="registPassword" id="registPassword">
					<p>店名:</p>
					<input type="text" placeholder="店名" name="registShopName" id="registShopName">			
					<br>
					
					<a href="sellerLogin.html"><input type="submit" value="注册" id="subm"> </a>
				</div>
			</div>
		</div>
		</form>
		</div>					
		
		<!--尾-->
		<div class="footer">
			<div class="container">
				<div class="footer-service">
					<ul class="clearfix">
						<li class="first">
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i> 预约维修服务
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i> 预约维修服务
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i> 预约维修服务
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i> 预约维修服务
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i> 预约维修服务
							</a>
						</li>

					</ul>
				</div>
				<div class="footer-links clearfix">
					<dl class="col-links">
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl class="col-links">
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl class="col-links">
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl class="col-links">
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl class="col-links">
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl class="col-links">
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<div class="col-contact">
						<p class="iphone">400-100-10086</p>
						<p>
							周一至周日 8:00-18:00
							<br> （仅收市话费）
						</p>
						<a href="http://127.0.0.1:8080/YiYi/#">
							<i class="iconfont"></i> 联系客服
						</a>
					</div>
				</div>
			</div>
		</div>
	
</body></html>