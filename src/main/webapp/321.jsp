<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <base href="<%=basePath%>" /> --%>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" type="text/css" href="font2/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/productpage.css" />
<link rel="stylesheet" type="text/css" href="css/dd.css" />
<link rel="stylesheet" type="text/css" href="font2/iconfont.css"/>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="js/jquery-3.5.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/jjnumber.js" type="text/javascript" charset="utf-8"></script>
<script src="js/shoppingCartVerification1.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	/**
	 * 打开或关闭个人中心菜单
	 */
	function personalToggle() {
		var personal = document.getElementById("personal");
		if (personal.style.display == "block") {
			personal.style.display = "none";
		} else {
			personal.style.display = "block";
		}
	}
	//页面跳转到支付成功页面	
	function jumpurl(){  
		  location="MyOrder.html";  
		} 
	//setTimeout("jumpurl()",3000);  
</script>
<style type="text/css">
	body{
		background-color: #F7EFEF;
	}
	h2{
				margin-top: -10px;
				color: #28a745;
				text-shadow: 5px 5px 5px #273067;
				text-align: center;
				font-size: 50px;
				font-weight: bold;
				letter-spacing: 20px;
				line-height: 100px;
				}
				.box{
					padding: 30px;
					width: 1000px;
					height: 300px;
					 margin-top: 100px;
				 	text-align: center;
				 	border: 1px solid #E3E3E3;
				 	background-color: white;
				 	border-radius: 15px;
				 	
				}
				.box a{
					margin-top: 30px;
					font-size: 20px;
					
				}
				.box  span{
					color: #28a745;
				}
</style>
</head>
<body>

	<!-- 顶部栏 -->
	<div class="topBar">
		<div class="container">
			<div class="topBar_list">
				<a href="index.html">易易商城</a> <span>|</span> <a href="#">云服务</a> <span>|</span>
				<a href="#">金融</a> <span>|</span> <a href="#">资质证照</a> <span>|</span>
				<a href="#">Merchant OS</a> <span>|</span> <a
					href="OA_adminLogin.html">Admin OS</a> <span>|</span>
			</div>
			<div class="shop">
				<a href="javascript:void(0);"> <i class="iconfont"
					style="font-size: 14px;">&#xe61b;</i> 购物车(<span
					style="color: white;">0</span>)
				</a>
			</div>
			
			<!-- 用户登录 -->
			<div class="userinfo">

				<div class="user">
					<div class="userInfo" style="background-color: #333333;">
						<span onclick="personalToggle()"
							style="color: #b0b0b0; font-size: 12px">欢迎您:
						</span>
					</div>
					<ul id="personal">
						<li><a href="userinfo.html">个人中心</a></li>
						<li><a href="">晒单评价</a></li>
						<li><a href="">我的喜欢</a></li>
						<li><a href="">账户安全</a></li>
						<li><a href="servlet/user/logout">退出登录</a></li>
					</ul>
				</div>
				<a class="link" href="">消息通知</a> <span>|</span> <a class="link"
					href="">我的订单</a> <span>|</span>
			</div>
			
			<div class="login">
				<a href="userLogin.html">登录</a> <span>|</span> <a
					href="userRegist.html">注册</a> <span>|</span> <a href="#">消息通知</a>
			</div>
			


		</div>
	</div>
	<!-- 导航栏 -->
	<div class="box">
		<span class="iconfont icondui" style="font-size: 50px;"></span>
		<h2>支付成功</h2>
		<a href="MyOrder.html" class="btn btn-outline-success">3秒后系统会自动跳转至我的订单，也可点击本处直接跳</a> 
	</div>
	<!-- 脚部 -->
	<div class="footer">
		<div class="container">
			<div class="footer-service">
				<ul class="clearfix">
					<li class="first"><a href="#"> <i class="iconfont">&#xe629;</i>
							购物指南
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 合作招商
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 营销中心
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 商家帮助
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 联系我们
					</a></li>

				</ul>
			</div>
			<div class="footer-links clearfix">
				<dl class="col-links">
					<dt>购物流程</dt>
					<dd>会员介绍</dd>
					<dd>常见问题</dd>
					<dd>联系客服</dd>
				</dl>
				<dl class="col-links">
					<dt>配送方式</dt>
					<dd>商家配送</dd>
					<dd>三方配送</dd>
					<dd>上门自提</dd>
				</dl>
				<dl class="col-links">
					<dt>支付方式</dt>
					<dd>在线支付</dd>
					<dd>分期付款</dd>
					<dd>货到付款</dd>

				</dl>
				<dl class="col-links">
					<dt>帮助中心</dt>
					<dd>账户管理</dd>
					<dd>购物指南</dd>
					<dd>订单操作</dd>

				</dl>
				<dl class="col-links">
					<dt>售后服务</dt>
					<dd>退款说明</dd>
					<dd>返修/退换货</dd>
					<dd>取消订单</dd>
					<dd>售后政策</dd>
				</dl>
				<dl class="col-links">
					<dt>特殊服务</dt>
					<dd>租借对象</dd>
					<dd>电脑除尘</dd>
					<dd>校花带饭</dd>
					<dd>DD代喝</dd>
				</dl>
				<div class="col-contact">
					<p class="iphone">400-110-10086</p>
					<p>
						周一至周日 8:00-18:00 <br> （仅收市话费）
					</p>
					<a href="#"> <i class="iconfont">&#xe641;</i> 联系客服
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>