<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" type="text/css" href="font2/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/reset2.css" />
<link rel="stylesheet" type="text/css" href="css/indexx.css" />
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/car.js"></script>
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

	//获取结算时候的金额
	var total_price;
	//声明商品名
	var goods_name;
	//声明商品数量
	var goods_count;
	//声明商品的价格
	var goods_price;
	//声明商品ID
	var goods_id;
	//声明一个数组来装装数据
	var orderlist = new Array()

	function totalPrice() {
		var total_number = 0;
		total_price = 0;
		$('.j-checkbox:checked').each(
				function(i, v) {
					var number = parseInt($(v).closest('.item-box').find(
							'.goods-num').val());
					//alert("number:"+number);
					total_number += number;
					//alert("total_name:"+total_number);
					var row_price = parseFloat($(v).closest('.item-box').find(
							'.car-total').html());
					total_price += row_price;
					//alert("total_price:"+total_price);

				});
		$('.amount-sum em').html(total_number);
		total_price = total_price.toFixed(2);

	}
	function pay() {
		totalPrice();
		if (total_price == 0) {
			$("#commitModal").show();
			return;
		}
		var total_number = 0;
		total_price = 0;
		$('.j-checkbox:checked').each(
				function(i, v) {
					var number = parseInt($(v).closest('.item-box').find(
							'.goods-num').val());
					total_number += number;
					var row_price = parseFloat($(v).closest('.item-box').find(
							'.car-total').html());
					var shoppcarid = parseInt($(v).closest('.item-box').find(
							'.j-checkbox').val());
					total_price += row_price;
					//goods_name = $(this).parent().parent().children(".car-name").text();			
					goods_count = $(this).parent().parent().children(
							".change-goods-num").children(".goods-num").val();
					/* goods_price = $(this).parent().parent().children(".car-price").text();	 */
					goods_id = $(this).parent().parent().children(
							".car-goodsID").text();
					orderlist.push({/* "goodsname":goods_name, */
						"goodscount" : goods_count,/* "goodsprice":goods_price ,*/
						"total_price" : total_price,
						"shoppingcar" : shoppcarid,
						"goodsid" : goods_id
					});
				});
		$('.amount-sum em').html(total_number);
		total_price = total_price.toFixed(2);

		$.post("orderServlet?cmd=addOrder", {
			"data" : JSON.stringify(orderlist)
		}, function(data) {
			var json = JSON.parse(data);
			if (json.ok) {
				alert("支付成功");
				window.location.href = "orderServlet?cmd=queryAllOrder";
			}
		});
	}
</script>
</head>
<body>
	<div class="topBar">
		<div class="container">
			<div class="topBar_list">
				<a href="index.jsp">白杨商城</a> <span>|</span> <a href="#">云服务</a> <span>|</span>
				<a href="#">金融</a> <span>|</span> <a href="#">资质证照</a> <span>|</span>
				<c:if test="${customer}==null">
					<a href="sellerLogin.jsp">Merchant OS</a>
					<span>|</span>
					<a href="OA_adminLogin.jsp">Admin OS</a>
					<span>|</span>
				</c:if>
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
						<a href="userinfo.jsp"><span onclick="personalToggle()"
							style="color: #b0b0b0; font-size: 12px">${customer.customerName}</span></a>
					</div>
				</div>
				<a class="link" href="">消息通知</a> <span>|</span> <a class="link"
					href="${pageContext.request.contextPath}/orderServlet?cmd=queryAllOrder">我的订单</a> <span>|</span>
			</div>
			<c:if test="${customer==null}">
			游客登陆
			<div class="login">
					<a href="userLogin.jsp">登录</a> <span>|</span> <a
						href="userRegist.jsp">注册</a> <span>|</span> <a href="#">消息通知</a>
				</div>
			</c:if>

		</div>
	</div>
	<!-- 导航栏 -->
	<div class="header">
		<div class="container">
			<div class="site-logo">
				<a href="index.html"> <img src="./index_files/yilogo.jpg">
				</a>
			</div>
			<div class="site-list">
				<ul class="clearfix">
					<li class="site-category"><a href=""></a> <!-- 侧边栏 --></li>
					<li><a href="#">小米手机</a></li>
					<li><a href="#">红米</a></li>
					<li><a href="#">电视</a></li>
					<li><a href="#">笔记本</a></li>
					<li><a href="#">家电</a></li>
					<li><a href="#">新品</a></li>
					<li><a href="#">路由器</a></li>
					<li><a href="#">智能硬件</a></li>
					<li><a href="#">服务</a></li>
					<li><a href="#">社区</a></li>
				</ul>
			</div>
			<div class="site-search">
				<form action="">
					<input type="text" name="shop" class="search-text"> <input
						type="submit" class="search-btn iconfont" value="&#xe60b;"
						style="font-size: 24px;">
					<div class="search-word">
						<a href="#">小米9</a> <a href="#">小米9 SE</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 主页内容 -->
	<div align="center" style="margin: auto; width: 1226px;">
		<div class="cart-warp">
			<div class="w list-head">
				<div class="t-checkall">
					<input id="checkall" class="input" type="checkbox" /> <label
						for="checkall"></label>全选
				</div>
				<div class="car-img">商品图片</div>
				<div class="car-name">商品名称</div>
				<div class="car-price">单价</div>
				<div class="car-num">数量</div>
				<div class="car-total">小计</div>
				<div class="car-action">操作</div>
			</div>
			<div class="w list-body">
				<c:forEach var="oqlist" items="${showShoppingCars}" varStatus="st">
					<div class="item-box">
						<div class="t-check">
							<input id="input${st.count }" class="j-checkbox" type="checkbox"
								value="${oqlist.shoppingCarId }" /> <label
								for="input${st.count }"></label>
						</div>
						<div class="car-img">
							<img
								src="${pageContext.request.contextPath}\image\/${oqlist.goodsImg}"
								alt="" />
						</div>
						<div class="car-name">${oqlist.goodsName }</div>
						<div name="goodsid" class="car-goodsID" style="display: none;">${oqlist.goodsId }</div>
						<div name="" class="car-price">${oqlist.goodsPrice }</div>
						<div class="change-goods-num">
							<a href="javascript:;" class="J_minus">-</a> <input
								name="ordergoodscount" type="text" class="goods-num"
								value="${oqlist.shoppingcarSum}" /> <a href="javascript:;"
								class="J_plus">+</a>
						</div>
						<div class="car-total">${oqlist.sumGoodsnumber }</div>
						<div class="car-action">
							<a href="javascript:;" title="删除" class="iconfont iconclose"
								style="font-size: 18px; font-weight: bold;"></a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="cart-bar w" id="J_cartBar">
				<div class="operation">
					<!-- 	<a href="javascript:;" class="remove-batch">删除所选商品</a>
						<a href="javascript:;" class="clear-all">清理购物车</a> -->
				</div>
				<div class="toolbar-right">
					<div class="amount-sum">
						已经选<em>3</em>件商品
					</div>
					<div class="price-sum" name="totalPrice">
						总价:<em>￥67.20</em>
					</div>
					<div class="btn-area">
						<input type="button" value="结算" onclick="pay()"
							style="width: 100%; height: 100%; background-color: #ff6700;" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 脚部 <-->
	</-->
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
	<div class="modal" id="commitModal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-header">
				<span class="btn-close" id="close" aria-hidden="true"></span>
			</div>
			<div class="modal-body">
				<span class="tit">请勾选商品哦！</span>
			</div>
			<div class="modal-footer">
				<button class="btn-new" id="cancel">取 消</button>
			</div>
		</div>
	</div>
	<style>
.modal {
	display: block;
	background: rgba(0, 0, 0, 0.6);
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 100000;
	width: 100%;
	height: 100%;
	font-size: 12px;
}

.btn-close:hover {
	color: #919191;
}

.modal-dialog {
	background: #fefefe;
	border: #333 solid 1px;
	width: 500px;
	height: 200px;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	left: 0;
	right: 0;
	margin: 0 auto;
}

.modal-body {
	padding: 10px 20px;
	overflow: auto;
	text-align: center;
}

.modal-header h2 {
	font-size: 20px;
}

.modal-footer {
	border-top: #eee solid 1px;
	text-align: right;
	position: absolute;
	width: 100%;
	box-sizing: border-box;
	bottom: 0;
}

.tit {
	margin: 10px;
	font-size: 25px
}

.btn-new {
	background: #fff;
	border: #357ebd solid 1px;
	border-radius: 3px;
	color: #428bca;
	display: inline-block;
	font-size: 25px;
	padding: 2px 5px;
	text-decoration: none;
	text-align: center;
	min-width: 60px;
	position: relative;
	transition: color .1s ease;
}

.modal-header, .modal-footer {
	padding: 10px 20px;
}

.modal-header {
	border-bottom: #eee solid 1px;
	height: 20px;
}
</style>
</body>
</html>