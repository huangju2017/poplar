<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.zr.poplar.pojo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>易易二手交易网</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" type="text/css" href="font2/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script src="js/jquery-3.5.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/goodsAjax.js" type="text/javascript" charset="utf-8"></script>
<script src="js/shoppingCartVerification.js" type="text/javascript"
	charset="utf-8"></script>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
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
</script>
</head>
<body>
	<!-- 顶部栏 -->
	<div class="topBar">
		<div class="container">
			<div class="topBar_list">
				<a href="index.jsp">易易商城</a> <span>|</span> <a href="#">云服务</a> <span>|</span>
				<a href="#">金融</a> <span>|</span> <a href="#">资质证照</a> <span>|</span>
				<a href="sellerLogin.jsp">Merchant OS</a> <span>|</span> <a
					href="OA_adminLogin.jsp">Admin OS</a> <span>|</span>
			</div>
			<div class="shop">
				<!-- servlet/productpage/orderitem -->
				<a href="javascript:void(0);"> <i class="iconfont"
					style="font-size: 14px;">&#xe61b;</i> 购物车(0)
				</a>
			</div>

			<%
				//获得Sesison缓存中用户数据(对象)
			Customer user = (Customer) session.getAttribute("user");
			//判断Session中是否缓存了用户数据
			if (user != null) {
			%>
			<!-- 用户登录 -->
			<div class="userinfo">

				<div class="user">
					<div class="userInfo" style="background-color: #333333;">
						<span onclick="personalToggle()"
							style="color: #b0b0b0; font-size: 12px">欢迎您: <%=user.getCustomerName()%>!
						</span>
					</div>
					<ul id="personal">
						<li><a href="userinfo.jsp">个人中心</a></li>
						<li><a href="">晒单评价</a></li>
						<li><a href="">我的喜欢</a></li>
						<li><a href="">账户安全</a></li>
						<li><a href="servlet/user/logout">退出登录</a></li>
					</ul>
				</div>
				<a class="link" href="">消息通知</a> <span>|</span> <a class="link"
					href="">我的订单</a> <span>|</span>
			</div>
			<%
				} else {
			%>
			游客登陆
			<div class="login">
				<a href="userLogin.jsp">登录</a> <span>|</span> <a
					href="userRegist.jsp">注册</a> <span>|</span> <a href="#">消息通知</a>
			</div>
			<%
				}
			%>


		</div>
	</div>
	<!-- 导航栏 -->
	<div class="header">
		<div class="container">
			<div class="site-logo">
				<a href="index.jsp"> <img src="images/yilogo.jpg">
				</a>
			</div>
			<div class="site-list">
				<ul class="clearfix">
					<li class="site-category"><a href=""></a> <!-- 侧边栏 --></li>
					<li><a href="#cellphone">手机</a></li>
					<!--<li>
							<a href="#">耳机</a>
						</li>
						<li>
							<a href="#">IPad</a>
						</li>-->
					<li><a href="#">笔记本电脑</a></li>
					<li><a href="#">家电</a></li>

					<li><a href="#">鞋包</a></li>
					<li><a href="#">智能硬件</a></li>
					<li><a href="#">服务</a></li>
					<li><a href="#">社区</a></li>
				</ul>
			</div>
			<div class="site-search">
				<form action="servlet/goods/goodssearch">
					<input type="text" name="shop" class="search-text"> <input
						type="submit" class="search-btn iconfont" value="&#xe60b;"
						style="font-size: 24px;">
					<div class="search-word">
						<!-- <a href="#">小米9</a>
							<a href="#">小米9 SE</a> -->
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 主页内容 -->
	<div class="site-content"></div>
	<!-- 内容详情 -->
	<div class="content-desc">
		<div class="container" style="width: 1250px">


			<!-- 内容 -->
			<div class="box-bd" style="width: 1250px">
				<div class="row clearfix">
					<!-- 内容左边 -->
					<!-- <div class="row-l">
							<a href="productpage.jsp">
								<img src="images/iphone.jpg">
							</a>
						</div> -->
					<!-- 内容右边 -->
					<div class="row-r" style="width: 100%">
						<ul>

							<c:forEach var="s" items="${goodsList}" varStatus="st">
								<li>
									<!-- 图像 -->
									<div class="figure">
										<a
											href="${pageContext.request.contextPath}/goods?cmd=productpage&goodsId=${s.goodsId}"
											class=""> <img
											src="${pageContext.request.contextPath}\image\/${s.goodsImg}">
										</a>
									</div> <!-- 标题 -->
									<h3 class="title">${s.goodsName }</h3>
									<p class="desc">${s.goodsContent}</p>
									<p class="price">
										<span class="num">${s.goodsPrice}</span>元
									</p>
									<div class="flag flag-new">${s.goodsType}</div>
								</li>

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
					<li class="first"><a href="#"> <i class="iconfont">&#xe629;</i>
							预约维修服务
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 预约维修服务
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 预约维修服务
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 预约维修服务
					</a></li>
					<li><a href="#"> <i class="iconfont">&#xe629;</i> 预约维修服务
					</a></li>

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