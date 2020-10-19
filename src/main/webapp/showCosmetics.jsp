<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.zr.poplar.pojo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>易易二手交易网</title>
		<link rel="stylesheet" type="text/css" href="./index_files/reset.css">
<link rel="stylesheet" type="text/css" href="./index_files/fonts.css">
<link rel="stylesheet" type="text/css" href="./index_files/iconfont.css">
<link rel="stylesheet" type="text/css" href="./index_files/index.css">
<link rel="stylesheet" type="text/css" href="./index_files/layui.css">

<script src="./index_files/jquery-3.5.1.min.js.下载"
	type="text/javascript" charset="utf-8"></script>
<script src="./index_files/goodsAjax.js.下载" type="text/javascript"
	charset="utf-8"></script>
<script src="./index_files/shoppingCartVerification.js.下载"
	type="text/javascript" charset="utf-8"></script>
<script src="./index_files/layui.js.下载" type="text/javascript"
	charset="utf-8"></script>
		<script type="text/javascript">
	/**
	 * 打开或关闭个人中心菜单
	 */
	function personalToggle() {
		var personal = document.getElementById("personal");
		if(personal.style.display=="block") {
			personal.style.display = "none";
		} else {
			personal.style.display = "block";
		}
	}
	
	</script>
</head>
<body>
	<!-- 顶部栏 -->
		<div class="topBar">
			<div class="container">
				<div class="topBar_list">
					<a href="index.jsp">易易商城</a>
					<span>|</span>
					<a href="#">云服务</a>
					<span>|</span>
					<a href="#">金融</a>
					<span>|</span>					
					<a href="#">资质证照</a>
					<span>|</span>
					<a href="sellerLogin.jsp">Merchant OS</a>
					<span>|</span>
					<a href="OA_adminLogin.jsp">Admin OS</a>
					<span>|</span>
				</div>
				<div class="shop">
				<!-- servlet/productpage/orderitem -->
					<a href="javascript:void(0);">
						<i class="iconfont" style="font-size: 14px;">&#xe61b;</i>
						购物车(<span style="color: white;">0</span>)
					</a>
				</div>

		<%
			//获得Sesison缓存中用户数据(对象)
			Customer user = (Customer) session.getAttribute("customer");
			//判断Session中是否缓存了用户数据
			if(user != null ) {
		%>	
				<!-- 用户登录 -->
				<div class="userinfo">

					<div class="user">
						<div class="userInfo" style="background-color: #333333;"><span onclick="personalToggle()" style="color: #b0b0b0;font-size: 12px">欢迎您: <%=user.getCustomerName() %>!</span></div>
						<ul id="personal" >
							<li><a href="userinfo.jsp">个人中心</a></li>
							<li><a href="">晒单评价</a></li>
							<li><a href="">我的喜欢</a></li>
							<li><a href="">账户安全</a></li>
							<li><a href="servlet/user/logout">退出登录</a></li>
						</ul>
					</div>
					<a class="link" href="">消息通知</a>
					<span>|</span>
					<a class="link" href="">我的订单</a>
					<span>|</span>
					</div>
				<% } else { %>
				 游客登陆 
				 <div class="login">
				<a href="userLogin.jsp">登录</a>
				<span>|</span>
				<a href="userRegist.jsp">注册</a>
				<span>|</span>
				<a href="#">消息通知</a>
				</div> <% } %>
				

			</div>
		</div>
		<!-- 导航栏 -->
		<div class="header">
			<div class="container">
				<div class="site-logo">
					<a href="index.jsp">
						<img src="images/yilogo.jpg">
					</a>
				</div>
				<div class="site-list">
					
				</div>
				<div class="site-search">
					<form action="servlet/goods/goodssearch">
						<input type="text" name="shop" class="search-text">
						<input type="submit" class="search-btn iconfont" value="&#xe60b;" style="font-size: 24px;">
						<div class="search-word">
							
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<marquee scrollamount="10" hspace="17%" onMouseOut="this.start()" onMouseOver="this.stop()" direction="right"  behavior="scroll" loop="2"  height="50px" direction="down" bgcolor="#fff">
				<p style=" font-weight: bold; font-size: 30px; background: linear-gradient(to right, red, blue);-webkit-background-clip: text;
        color: transparent;"><%=session.getAttribute("announcement")==null ? "" : session.getAttribute("announcement") %></p>
        
			</marquee>
		<!-- 主页内容 -->
	
		<!-- 内容详情 -->
		<div class="content-desc">
			<div class="container">
				<!-- 标题 -->
				<div class="box-hd" id="cellphone">
					<h2>化妆品</h2>
					
				</div>
				<!-- 内容 -->
				<div class="box-bd">
					<div class="row clearfix">
						
						<!-- 内容右边 -->
						<div class="row-r">
							<ul>
					<c:forEach var="s" items="${showSort}">
									<li>
									<!-- 图像 -->
									<div class="figure">
										<a href="${pageContext.request.contextPath}/goods?cmd=productpage&goodsId=${s.goodsId}" class="">
											<img src="${pageContext.request.contextPath}\image\/${s.goodsImg}">
										</a>
									</div>
									<!-- 标题 -->
									<h3 class="title">
											${s.goodsName }
									</h3>
									<p class="desc">${s.goodsContent}</p>
									<p class="price">
										<span class="num">${s.goodsPrice}</span>元
									</p>
									<div class="flag flag-new">${s.goodsType}</div>
								</c:forEach>								
							</ul>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<!-- 脚部 -->
		<div class="footer">
			<div class="container">
				<div class="footer-service">
					<ul class="clearfix">
						<li class="first">
							<a href="#">
								<i class="iconfont">&#xe629;</i>
								购物指南
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont">&#xe629;</i>
								合作招商
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont">&#xe629;</i>
								营销中心
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont">&#xe629;</i>
								商家帮助
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont">&#xe629;</i>
								联系我们
							</a>
						</li>

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
							周一至周日 8:00-18:00
							<br>
							（仅收市话费）
						</p>
						<a href="#">
							<i class="iconfont">&#xe641;</i>
							联系客服
						</a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>