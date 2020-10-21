<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 引入核心标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- saved from url=(0036)index.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="">-->
<base href=".">
<title>白杨科技</title>



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
</script>
<script type="text/javascript"> 
	window.onload =function getCustomer(){
		var goods = <%=session.getAttribute("goods")%>;
			if(goods="null"){
				window.location.href="http://localhost:8080/poplar/goods?cmd=showAllGoods&flag=1";
			}
	　　}
</script>
</head>
<body>
	<!-- 顶部栏 -->
	<div class="topBar">
		<div class="container">
			<div class="topBar_list">
				<a class="navbar-brand agileinfo" href="index.jsp">白杨商城</a> <span>|</span>
				<a href="#">云服务</a> <span>|</span> <a href="#">金融</a> <span>|</span>
				<a href="#">资质证照</a> <span>|</span> <a href="sellerLogin.jsp">Merchant
					OS</a> <span>|</span> <a href="OA_adminLogin.jsp">Admin OS</a> <span>|</span>
			</div>
			<div class="shop">
				<!-- servlet/productpage/orderitem -->
				<a href="javascript:void(0);"> <i class="iconfont"
					style="font-size: 14px;"></i> 购物车
				</a>
			</div>

			<c:if test="${customer==null}">
			游客登陆
			<div class="login">
					<a href="userLogin.jsp">登录</a> <span>|</span> <a
						href="userRegist.jsp">注册</a> <span>|</span> <a href="#">消息通知</a>
				</div>
			</c:if>
			<c:if test="${customer!=null}">
			会员登录
			<div class="login">
					<a href="userinfo.jsp">${customer.customerName}</a> <span>|</span>
					<a
						href="${pageContext.request.contextPath}/customerServlet?cmd=logout">安全退出</a>
					<span>|</span> <a
						href="${pageContext.request.contextPath}/orderServlet?cmd=queryAllOrder">我的订单</a>
				</div>
			</c:if>

		</div>
	</div>
	<!-- 导航栏 -->
	<div class="header">
		<div class="container">
			<div class="site-logo">
				<a href="index.jsp"> <img src="./index_files/yilogo.jpg">
				</a>
			</div>
			<div class="site-list">
				<ul class="clearfix">
					<li class="site-category"><a href=""></a> <!-- 侧边栏 --></li>
					<li><a href="#cellphone">手机</a></li>
					<li><a href="#PC">笔记本电脑</a></li>
					<li><a href="#Cosmetics">美妆</a></li>

					<li><a href="#clothes">服饰</a></li>
					<li><a href="#">服务</a></li>
					<li><a href="#">社区</a></li>
				</ul>
			</div>
			<div class="site-search">
				<form
					action="${pageContext.request.contextPath}/goods?cmd=findGoodsByName"
					method="post">
					<input type="text" name="shop" class="search-text"> <input
						type="submit" class="search-btn iconfont" value=""
						style="font-size: 24px;">
					<div class="search-word"></div>
				</form>
			</div>
		</div>
	</div>

	<marquee scrollamount="10" hspace="17%" onmouseout="this.start()"
		onmouseover="this.stop()" direction="right" behavior="scroll" loop="2"
		height="50px" bgcolor="#fff">
		<p
			style="font-weight: bold; font-size: 30px; background: linear-gradient(to right, red, blue); -webkit-background-clip: text; color: transparent;"></p>

	</marquee>
	<!-- 主页内容 -->
	<div class="site-content">
		<div class="container">
			<div style="height: 300px;">
				<object style="border: 0px;" type="text/x-scriptlet"
					data="lunbo.html" width="100%" height="100%"></object>
			</div>

			<!-- 向导 -->
			<div class="content-sub">
				<!-- 向导左 -->
				<div class="content-channel">
					<ul class="channel-list clearfix">
						<li><a href="#"> <i class="iconfont"></i> 选购手机
						</a></li>
						<li><a href="#"> <i class="iconfont"></i> 企业团购
						</a></li>
						<li><a href="#"> <i class="iconfont"></i> F码通道
						</a></li>
						<li><a href="#"> <i class="iconfont"></i> 米粉卡
						</a></li>
						<li><a href="#"> <i class="iconfont"></i> 以旧换新
						</a></li>
						<li><a href="#"> <i class="iconfont"></i> 话费充值
						</a></li>
					</ul>
				</div>
				<!-- 向导右 -->
				<div class="content-list">
					<ul class="clearfix">
						<li><a href="productpage.jsp"> <img
								src="./index_files/a1.jpg">
						</a></li>
						<li><a href="#"> <img src="./index_files/a2.png">
						</a></li>
						<li><a href="#"> <img src="./index_files/a3.png">
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="content-banner">
			<div class="container">
				<a href="#"> <img src="./index_files/banner.jpg">
				</a>
			</div>
		</div>

	</div>
	<!-- 内容详情 -->
	<div class="content-desc">
		<div class="container">
			<!-- 标题 -->
			<div class="box-hd" id="cellphone">
				<h2>手机</h2>
				<div class="more">
					<a
						href="${pageContext.request.contextPath}/goods?cmd=showSort&kind=1">
						查看全部 <i class="iconfont"></i>
					</a>
				</div>
			</div>
			<!-- 内容 -->
			<div class="box-bd">
				<div class="row clearfix">
					<!-- 内容左边 -->
					<div class="row-l">
						<a href="productpage.jsp"> <img src="./index_files/iphone.jpg">
						</a>
					</div>
					<!-- 内容右边 -->
					<form id="form1" method="post">
						<div class="row-r">
							<ul class="u1">
								<c:forEach items="${goods}" var="g" begin="0" step="1"
									varStatus="vs" end="7">
									<c:if test="${g.goodsType=='手机'}">
										<li><input type="hidden" name="goodsId"
											value="${g.goodsId}">
											<div class="figure">
												<a
													href="${pageContext.request.contextPath}/goods?cmd=productpage&goodsId=${g.goodsId}"><img
													src="${pageContext.request.contextPath}\image\/${g.goodsImg}"></a>
											</div>
											<h3 class="title">${g.goodsName}</h3>
											<p class="desc">${g.goodsContent}</p>
											<p class="price">
												<span class="num">${g.goodsPrice}</span>元
											</p>
											<div class="flag flag-new">新品</div></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div class="container">
			<!-- 标题 -->
			<div class="box-hd" id="PC">
				<h2>笔记本电脑</h2>
				<div class="more">
					<a
						href="${pageContext.request.contextPath}/goods?cmd=showSort&kind=2">
						查看全部 <i class="iconfont"></i>
					</a>
				</div>
			</div>
			<!-- 内容 -->
			<div class="box-bd">
				<div class="row clearfix">
					<!-- 内容左边 -->
					<div class="row-l">
						<a href="productpage.jsp"> <img src="./index_files/dn9.png">
						</a>
					</div>
					<!-- 内容右边 -->
					<form id="form1" method="post">
						<div class="row-r">
							<ul class="u2">
								<c:forEach items="${goods}" var="g" begin="0" step="1"
									varStatus="vs" end="15">
									<c:if test="${g.goodsType=='电脑'}">
										<li><input type="hidden" name="goodsId"
											value="${g.goodsId}">
											<div class="figure">
												<a
													href="${pageContext.request.contextPath}/goods?cmd=productpage&goodsId=${g.goodsId}"><img
													src="${pageContext.request.contextPath}\image\/${g.goodsImg}"></a>
											</div>
											<h3 class="title">${g.goodsName}</h3>
											<p class="desc">${g.goodsContent}</p>
											<p class="price">
												<span class="num">${g.goodsPrice}</span>元
											</p>
											<div class="flag flag-new">新品</div></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div class="container">
			<!-- 标题 -->
			<div class="box-hd" id="Cosmetics">
				<h2>化妆品</h2>
				<div class="more">
					<a
						href="${pageContext.request.contextPath}/goods?cmd=showSort&kind=3">
						查看全部 <i class="iconfont"></i>
					</a>
				</div>
			</div>
			<!-- 内容 -->
			<div class="box-bd">
				<div class="row clearfix">
					<!-- 内容左边 -->
					<div class="row-l">
						<a href="productpage.jsp"> <img src="./index_files/hzp9.png">
						</a>
					</div>
					<!-- 内容右边 -->

					<div class="row-r">
						<ul class="u3">
							<c:forEach items="${goods}" var="g" begin="0" step="1"
								varStatus="vs" end="32">
								<c:if test="${g.goodsType=='化妆品'}">
									<li><input type="hidden" name="goodsId"
										value="${g.goodsId}">
										<div class="figure">
											<a
												href="${pageContext.request.contextPath}/goods?cmd=productpage&goodsId=${g.goodsId}"><img
												src="${pageContext.request.contextPath}\image\/${g.goodsImg}"></a>
										</div>
										<h3 class="title">${g.goodsName}</h3>
										<p class="desc">${g.goodsContent}</p>
										<p class="price">
											<span class="num">${g.goodsPrice}</span>元
										</p>
										<div class="flag flag-new">新品</div></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>

				</div>
			</div>
		</div>
		<div class="container">
			<!-- 标题 -->
			<div class="box-hd" id="clothes">
				<h2>服饰</h2>
				<div class="more">
					<a
						href="${pageContext.request.contextPath}/goods?cmd=showSort&kind=4">
						查看全部 <i class="iconfont"></i>
					</a>
				</div>
			</div>
			<!-- 内容 -->
			<div class="box-bd">
				<div class="row clearfix">
					<!-- 内容左边 -->
					<div class="row-l">
						<a href="productpage.jsp"> <img src="./index_files/fy9.png">
						</a>
					</div>
					<!-- 内容右边 -->

					<div class="row-r">

						<ul class="u4">
							<c:forEach items="${goods}" var="g" begin="0" step="1"
								varStatus="vs" end="23">
								<c:if test="${g.goodsType=='服装'}">
									<li><input type="hidden" name="goodsId"
										value="${g.goodsId}">
										<div class="figure">
											<a
												href="${pageContext.request.contextPath}/goods?cmd=productpage&goodsId=${g.goodsId}"><img
												src="${pageContext.request.contextPath}\image\/${g.goodsImg}"></a>
										</div>
										<h3 class="title">${g.goodsName}</h3>
										<p class="desc">${g.goodsContent}</p>
										<p class="price">
											<span class="num">${g.goodsPrice}</span>元
										</p>
										<div class="flag flag-new">新品</div></li>
								</c:if>
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
					<li class="first"><a href="#"> <i class="iconfont"></i>
							购物指南
					</a></li>
					<li><a href="#"> <i class="iconfont"></i> 合作招商
					</a></li>
					<li><a href="#"> <i class="iconfont"></i> 营销中心
					</a></li>
					<li><a href="#"> <i class="iconfont"></i> 商家帮助
					</a></li>
					<li><a href="#"> <i class="iconfont"></i> 联系我们
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
					<a href="#"> <i class="iconfont"></i> 联系客服
					</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
