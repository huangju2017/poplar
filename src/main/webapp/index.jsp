<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0036)index.html -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!--<base href="">-->
		<base href=".">
		<title>白杨商城</title>



		<link rel="stylesheet" type="text/css" href="./index_files/reset.css">
		<link rel="stylesheet" type="text/css" href="./index_files/fonts.css">
		<link rel="stylesheet" type="text/css" href="./index_files/iconfont.css">
		<link rel="stylesheet" type="text/css" href="./index_files/index.css">
		<link rel="stylesheet" type="text/css" href="./index_files/layui.css">

		<script src="./index_files/jquery-3.5.1.min.js.下载" type="text/javascript" charset="utf-8"></script>
		<script src="./index_files/goodsAjax.js.下载" type="text/javascript" charset="utf-8"></script>
		<script src="./index_files/shoppingCartVerification.js.下载" type="text/javascript" charset="utf-8"></script>
		<script src="./index_files/layui.js.下载" type="text/javascript" charset="utf-8"></script>

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
					<a class="navbar-brand agileinfo" href="index.html">白杨商城</a>
					<span>|</span>
					<a href="#">云服务</a>
					<span>|</span>
					<a href="#">金融</a>
					<span>|</span>
					<a href="#">资质证照</a>
					<span>|</span>

					<a href="${pageContext.request.contextPath }/sellerLogin.jsp">Merchant OS</a>

					<span>|</span>
					<a href="${pageContext.request.contextPath }/OA_adminLogin.jsp">Admin OS</a>
					<span>|</span>
				</div>
				<div class="shop">
					<!-- servlet/productpage/orderitem -->
					<a href="shoppingcar.html">
						<i class="iconfont" style="font-size: 14px;"></i>
						购物车(<span style="color: white;">0</span>)
					</a>
				</div>


				游客登陆
				<div class="login">
					<a href="${pageContext.request.contextPath }/userLogin.jsp">登录</a>
					<span>|</span>
					<a href="${pageContext.request.contextPath }/userRegist.jsp">注册</a>
					<span>|</span>
					<a href="http://localhost:8080/poplar/userinfo.jsp">个人中心</a>
				</div>


			</div>
		</div>
		<!-- 导航栏 -->
		<div class="header">
			<div class="container">
				<div class="site-logo">
					<a href="index.html">
						<img src="./index_files/yilogo.jpg">
					</a>
				</div>
				<div class="site-list">
					<ul class="clearfix">
						<li class="site-category">
							<a href=""></a>
							<!-- 侧边栏 -->

						</li>
						<li>
							<a href="#cellphone">手机</a>
						</li>
						<li>
							<a href="#PC">笔记本电脑</a>
						</li>
						<li>
							<a href="#Cosmetics">美妆</a>
						</li>

						<li>
							<a href="#clothes">服饰</a>
						</li>
						<li>
							<a href="#">服务</a>
						</li>
						<li>
							<a href="#">社区</a>
						</li>
					</ul>
				</div>
				<div class="site-search">
					<form action="servlet/goods/goodssearch">
						<input type="text" name="shop" class="search-text">
						<input type="submit" class="search-btn iconfont" value="" style="font-size: 24px;">
						<div class="search-word">

						</div>
					</form>
				</div>
			</div>
		</div>

		<marquee scrollamount="10" hspace="17%" onmouseout="this.start()" onmouseover="this.stop()" direction="right"
		 behavior="scroll" loop="2" height="50px" bgcolor="#fff">
			<p style=" font-weight: bold; font-size: 30px; background: linear-gradient(to right, red, blue);-webkit-background-clip: text;
        color: transparent;"></p>

		</marquee>
		<!-- 主页内容 -->
		<div class="site-content">
			<div class="container">
				<!-- 轮播图 -->
				<!-- <div class="site-slider">
					<a href="#">
						<img src="images/yuan.jpg">
					</a>
					<span class="next"></span>
					<span class="prev"></span>
					<div class="slider-item">
						<a href="#"></a>
						<a href="#"></a>
						<a href="#"></a>
						<a href="#"></a>
						<a href="#"></a>
					</div>
				</div> -->
				<div style="height: 300px;"><object style="border:0px;" type="text/x-scriptlet" data="lunbo.html" width="100%"
					 height="100%"></object>
				</div>

				<!-- 向导 -->
				<div class="content-sub">
					<!-- 向导左 -->
					<div class="content-channel">
						<ul class="channel-list clearfix">
							<li>
								<a href="#">
									<i class="iconfont"></i>
									选购手机
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									企业团购
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									F码通道
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									米粉卡
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									以旧换新
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									话费充值
								</a>
							</li>
						</ul>
					</div>
					<!-- 向导右 -->
					<div class="content-list">
						<ul class="clearfix">
							<li>
								<a href="productpage.html">
									<img src="./index_files/a1.jpg">
								</a>
							</li>
							<li>
								<a href="#">
									<img src="./index_files/a2.png">
								</a>
							</li>
							<li>
								<a href="#">
									<img src="./index_files/a3.png">
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="content-banner">
				<div class="container">
					<a href="#">
						<img src="./index_files/banner.jpg">
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
						<a href="servlet/goods/all_phone">
							查看全部
							<i class="iconfont"></i>
						</a>
					</div>
				</div>
				<!-- 内容 -->
				<div class="box-bd">
					<div class="row clearfix">
						<!-- 内容左边 -->
						<div class="row-l">
							<a href="productpage.html">
								<img src="./index_files/iphone.jpg">
							</a>
						</div>
						<!-- 内容右边 -->
						<div class="row-r">
							<ul class="u1">

								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/sj5.jpg"></a></div>
									<h3 class="title">iphonex</h3>
									<p class="desc">9成新iphonex</p>
									<p class="price"><span class="num">2999</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/sj4.jpg"></a></div>
									<h3 class="title">iponex 银色 港澳版 64G</h3>
									<p class="desc">8成新iponex</p>
									<p class="price"><span class="num">999</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/sj3.jpg"></a></div>
									<h3 class="title">华为荣耀10 幻夜黑 6G+64G 全网通</h3>
									<p class="desc">9成新，华为荣耀10 幻夜黑 6G+64G 全网通</p>
									<p class="price"><span class="num">3999</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/sj2.jpg"></a></div>
									<h3 class="title">二手vivo</h3>
									<p class="desc">9成新二手vivo</p>
									<p class="price"><span class="num">1599</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/sj1.jpg"></a></div>
									<h3 class="title">iphone7 plus</h3>
									<p class="desc">9成新，iphone7 plus</p>
									<p class="price"><span class="num">4999</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/figure8.jpg"></a></div>
									<h3 class="title">小米8</h3>
									<p class="desc">小米，手机</p>
									<p class="price"><span class="num">5999</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/figure6.jpg"></a></div>
									<h3 class="title">小米6</h3>
									<p class="desc">小米，手机</p>
									<p class="price"><span class="num">3599</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/figure1.jpg"></a></div>
									<h3 class="title">小米5</h3>
									<p class="desc">全新，手机，小米</p>
									<p class="price"><span class="num">2999</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<!-- 标题 -->
				<div class="box-hd" id="PC">
					<h2>笔记本电脑</h2>
					<div class="more">
						<a href="servlet/goods/all_PC">
							查看全部
							<i class="iconfont"></i>
						</a>
					</div>
				</div>
				<!-- 内容 -->
				<div class="box-bd">
					<div class="row clearfix">
						<!-- 内容左边 -->
						<div class="row-l">
							<a href="productpage.html">
								<img src="./index_files/dn9.png">
							</a>
						</div>
						<!-- 内容右边 -->
						<div class="row-r">
							<ul class="u2">

								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn5.jpg"></a></div>
									<h3 class="title">神州i7</h3>
									<p class="desc">神州二手笔记本电脑，9成新</p>
									<p class="price"><span class="num">3599</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn8.jpg"></a></div>
									<h3 class="title">苹果笔记本电脑 4英寸xc2 i7四核 16 512G</h3>
									<p class="desc">苹果笔记本电脑 ,8成新苹果笔记本电脑 4英寸xc2 i7四核</p>
									<p class="price"><span class="num">3299</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn7.jpg"></a></div>
									<h3 class="title">戴尔i7</h3>
									<p class="desc">9成新戴尔i7</p>
									<p class="price"><span class="num">3599</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn6.jpg"></a></div>
									<h3 class="title">惠普8740W i7</h3>
									<p class="desc">便宜使用不久</p>
									<p class="price"><span class="num">4500</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn4.jpg"></a></div>
									<h3 class="title">电脑戴尔m6500</h3>
									<p class="desc">9成新电脑戴尔m6500</p>
									<p class="price"><span class="num">4000</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn3.jpg"></a></div>
									<h3 class="title">惠普i7四代独显</h3>
									<p class="desc">8-7成新，惠普</p>
									<p class="price"><span class="num">2599</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn2.jpg"></a></div>
									<h3 class="title">大屏粉色索尼sve15125ycp</h3>
									<p class="desc">用了3个月，8-9成新</p>
									<p class="price"><span class="num">1599</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/dn1.jpg"></a></div>
									<h3 class="title">超博惠普810</h3>
									<p class="desc">惠普810</p>
									<p class="price"><span class="num">1599</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<!-- 标题 -->
				<div class="box-hd" id="Cosmetics">
					<h2>化妆品</h2>
					<div class="more">
						<a href="servlet/goods/all_cosmetics">
							查看全部
							<i class="iconfont"></i>
						</a>
					</div>
				</div>
				<!-- 内容 -->
				<div class="box-bd">
					<div class="row clearfix">
						<!-- 内容左边 -->
						<div class="row-l">
							<a href="productpage.html">
								<img src="./index_files/hzp9.png">
							</a>
						</div>
						<!-- 内容右边 -->
						<div class="row-r">
							<ul class="u3">

								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp8.jpg"></a></div>
									<h3 class="title">香奈儿山茶花五件套保湿补水护肤品</h3>
									<p class="desc">香奈儿化妆品，9成新</p>
									<p class="price"><span class="num">139</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp7.jpg"></a></div>
									<h3 class="title">香奈儿彩妆9件套彩妆初学者</h3>
									<p class="desc">香奈儿化妆品，9成新</p>
									<p class="price"><span class="num">239</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp6.jpg"></a></div>
									<h3 class="title">泊泉雅蜗牛水润化妆品套装</h3>
									<p class="desc">泊泉雅化妆品，9成新泊泉雅蜗牛水润化妆品套装</p>
									<p class="price"><span class="num">89</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp5.jpg"></a></div>
									<h3 class="title">麦吉丽4色立体腮红</h3>
									<p class="desc">麦吉丽化妆品，9成新麦吉丽4色立体腮红</p>
									<p class="price"><span class="num">59</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp4.jpg"></a></div>
									<h3 class="title">安利雅姿恒时凝颜</h3>
									<p class="desc">化妆品，9成新安利雅姿恒时凝颜</p>
									<p class="price"><span class="num">39</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp3.jpg"></a></div>
									<h3 class="title">Nars化妆品9件套</h3>
									<p class="desc">9成新，化妆品</p>
									<p class="price"><span class="num">88</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp2.jpg"></a></div>
									<h3 class="title">MD四件套</h3>
									<p class="desc">用了三天MD四件</p>
									<p class="price"><span class="num">99</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/hzp1.jpg"></a></div>
									<h3 class="title">Mac口红</h3>
									<p class="desc">用了一，口红</p>
									<p class="price"><span class="num">79</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
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
						<a href="servlet/goods/all_cloths">
							查看全部
							<i class="iconfont"></i>
						</a>
					</div>
				</div>
				<!-- 内容 -->
				<div class="box-bd">
					<div class="row clearfix">
						<!-- 内容左边 -->
						<div class="row-l">
							<a href="productpage.html">
								<img src="./index_files/fy9.png">
							</a>
						</div>
						<!-- 内容右边 -->
						<div class="row-r">
							<ul class="u4">

								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf12.jpg"></a></div>
									<h3 class="title">牛仔连衣裙</h3>
									<p class="desc">仔背带裙，全新</p>
									<p class="price"><span class="num">456</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf12.jpg"></a></div>
									<h3 class="title">软牛仔背带裙女夏新款韩版宽松洋气减龄吊带连衣裙套装两件套短款</h3>
									<p class="desc">香奈儿化妆品，9成新</p>
									<p class="price"><span class="num">59</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf10.jpg"></a></div>
									<h3 class="title">运动裤</h3>
									<p class="desc">男士运动裤 上身好看</p>
									<p class="price"><span class="num">456</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf8.jpg"></a></div>
									<h3 class="title">柒牌男装短袖T恤衫夏季青年男士翻领商务休闲t恤POLO</h3>
									<p class="desc">9成新</p>
									<p class="price"><span class="num">521</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf7.jpg"></a></div>
									<h3 class="title">衬衣雪纺连衣裙女夏短袖ol收腰显瘦衬衫裙</h3>
									<p class="desc">9成新衬衣雪纺连衣裙女夏短袖ol收腰显瘦衬衫裙</p>
									<p class="price"><span class="num">89</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf2.jpg"></a></div>
									<h3 class="title">COS女装 纯棉牛仔背带连衣裙白色2020春夏新品</h3>
									<p class="desc">牛仔裤。女装</p>
									<p class="price"><span class="num">129</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf1.jpg"></a></div>
									<h3 class="title">丝绸裙子</h3>
									<p class="desc">新款牌杭州真丝连衣裙女中长款重磅桑蚕丝修身丝绸裙子夏季</p>
									<p class="price"><span class="num">159</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
								<li>
									<div class="figure"><a href="productpage.html"><img src="./index_files/yf9.jpg"></a></div>
									<h3 class="title">免烫天丝棉 男士休闲裤男商务直筒宽松中年夏季薄款男西裤男裤子</h3>
									<p class="desc">8-7成新，免烫天丝棉 男士休闲裤男商务直筒宽松中年夏季薄款男西裤男裤子</p>
									<p class="price"><span class="num">109</span>元</p>
									<div class="flag flag-new">新品</div>
								</li>
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
								<i class="iconfont"></i>
								购物指南
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont"></i>
								合作招商
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont"></i>
								营销中心
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont"></i>
								商家帮助
							</a>
						</li>
						<li>
							<a href="#">
								<i class="iconfont"></i>
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
							<i class="iconfont"></i>
							联系客服
						</a>
					</div>
				</div>
			</div>
		</div>

	</body>
</html>
