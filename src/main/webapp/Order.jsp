<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0036)Order.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="">--><base href=".">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./Order_files/reset.css">
<link rel="stylesheet" type="text/css" href="./Order_files/fonts.css">
<link rel="stylesheet" type="text/css" href="./Order_files/iconfont.css">
<link rel="stylesheet" type="text/css" href="./Order_files/index.css">
<link rel="stylesheet" type="text/css" href="./Order_files/productpage.css">
<link rel="stylesheet" type="text/css" href="./Order_files/base.css">
<link rel="stylesheet" type="text/css" href="./Order_files/checkOut.css">
<script src="./Order_files/jquery-3.5.1.min.js.下载" type="text/javascript" charset="utf-8"></script>
	
 <link rel="stylesheet" href="./Order_files/bootstrap.min.css">
  <script src="./Order_files/jquery.min.js.下载"></script>
  <script src="./Order_files/popper.min.js.下载"></script>
  <script src="./Order_files/bootstrap.min.js.下载"></script>	
	
<script type="text/javascript">
	//全局加载
	$(function(){
		$.post(
				"servlet/order/query",
				function(data) {
					var json = JSON.parse(data);
					var list = json.myOrderList;
					for(i in list){
						var order = list[i];
						$("#dd").append(
								"<div class='item-row'>"
								+"<div class='col col-1'>"+"<div class='g-info'>"
								+"<a href='#' class='d_num'>"+order.order_number+"</a>"
								+"</div>"+"<div class='g-info'>"
								+"<a href='#'>"+order.goods_name+"</a>"
								+"</div>"+"</div>"
								+"<div class='col col-2'>"+order.goods_price+"元</div>"
								+"<div class='col col-3'>"+order.goods_count +"</div>"
								+"<div class='col col-4'>"+order.total_price +"元</div>"
							+"</div>"
								);
						}
				}
		);
	});
	

	
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

	//返回购物车方法：
	function return_car() {
		//获取订单编号
		 var number = $(".d_num").text(); 
		//ajax发送到后台
		$.post("servlet/order/delete",{"number":number},function(data){
			var json = JSON.parse(data);
			if(json.fanhui){
				window.location.href = "servlet/productpage/orderitem";
			}
		});
	}
	function pay(){
		//获取总价	
		var total_cost = $("#totalPrice").text();
		//获取订单编号
		 var number = $(".d_num").text(); 
		/* alert("支付成功") */
		//ajax发送到后台
		$.post("servlet/order/haspay",{"hasPay":number}
		);
		//点击开启模态框
		  
		$("#commitModal5").show();
	
		setTimeout(function(){window.location.href = "PaySuccess.html";},3000);
		}
</script>
<style>
			.modal2 {
				/* display: block; */
				background: rgba(0, 0, 0, 0.6);
				position: fixed;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				z-index: 10;
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
				height: 400px;
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

			.ewm {
				width: 300px;
				height: 300px;
			}

			.btn-new {
				background: #fff;
				border: #357ebd solid 1px;
				border-radius: 3px;
				color: #428bca;
				display: inline-block;
				font-size: 12px;
				padding: 2px 5px;
				text-decoration: none;
				text-align: center;
				min-width: 60px;
				position: relative;
				transition: color .1s ease;
			}

			.modal-header,
			.modal-footer {
				padding: 10px 20px;
			}

			.modal-header {
				border-bottom: #eee solid 1px;
				height: 20px;
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
				
			</div>
			
			
			<!-- 用户登录 -->
			<div class="userinfo">

				<div class="user">
					<div class="userInfo" style="background-color: #333333;">
						<span onclick="personalToggle()" style="color: #b0b0b0; font-size: 12px">欢迎您: 钟南山!
						</span>
					</div>
					<ul id="personal">
						<li><a href="userinfo.html">个人中心</a></li>
						<li><a href="servlet/user/logout">退出登录</a></li>
					</ul>
				</div>
				
			</div>
			


		</div>
	</div>
	<!-- 导航栏 -->
	<div id="context1" style="height: 130px; display: none; width: 250px; background-color: white; position: absolute; overflow: scroll; right: 203px; top: 116px; z-index: 100; border: 1px #ccc solid">
	</div>

	<!--收货地址body部分开始-->
	<div class="border_top_cart">
		<div class="container">
			<div class="checkout-box">
				<form id="checkoutForm" action="#" method="post">
					<div class="checkout-box-bd">
						<!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
						<input type="hidden" name="Checkout[addressState]" id="addrState" value="0">
						<!-- 收货地址 -->
						<div class="xm-box">
							<div class="box-hd ">
								<h2 class="title">收货人信息</h2>
							</div>
							<div class="box-bd">
								<div class="clearfix xm-address-list" id="checkoutAddrList">
									<dl class="item">
										<font style="color: red;"><b>收货人：</b></font>
										<dt>
											<strong class="itemConsignee">钟南山</strong> <span class="itemTag tag">地址</span>
										</dt>
										<dd>
											联系电话：
											<p class="tel itemTel">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17318221814</p>
											地址：
											<p class="itemRegion">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 贵州省凯里市</p>
										</dd>

									</dl>

								</div>
							</div>
							<!-- 收货地址 END-->

						<!-- 	<div id="checkoutPayment">

								支付方式
								<div class="xm-box">
									<div class="box-hd ">
										<h2 class="title">支付配送</h2>
									</div>
									<div class="box-bd">
										<ul id="checkoutPaymentList"
											class="checkout-option-list clearfix J_optionList">
											<li class="item selected"><input type="radio"
												name="Checkout[pay_id]" checked="checked" value="1">
												<p>
													在线支付 <span></span>
												</p></li>

											<li class="item selected"><input type="radio"
												data-price="0" name="Checkout[shipment_id]"
												checked="checked" value="1">
												<p>
													快递配送（免运费） <span></span>
												</p></li>
										</ul>
									</div>
								</div>
								支付方式 END
								<hr style="border: 1px solid red">
							</div> -->

						</div>
						<div class="checkout-box-ft">
							<!-- 商品清单 -->
							 
							<div id="checkoutGoodsList" class="checkout-goods-box">
								<div class="xm-box">
									<div class="box-hd">
										<h2 class="title">确认订单信息</h2>
										
									</div>
									<div class="box-bd">
										<dl class="checkout-goods-list">
											<dt class="clearfix">
												<span class="col ">订单编号</span>
												<span class="col col-1">商品名称</span> 
												<span class="col col-2">购买价格</span>
												<span class="col col-3">购买数量</span> 
												<span class="col col-4">小计（元）</span>
											</dt>										
													<dd class="item clearfix" id="dd">
							
													<div class="item-row"><div class="col col-1"><div class="g-info"><a href="#" class="d_num">B7C2392C1193427394EBB5332A48F1BB-</a></div><div class="g-info"><a href="#">iphonex</a></div></div><div class="col col-2">2999元</div><div class="col col-3">1</div><div class="col col-4">2999元</div></div><div class="item-row"><div class="col col-1"><div class="g-info"><a href="#" class="d_num">B152A5380C0148A39D44A54DA6613FB3-</a></div><div class="g-info"><a href="#">电脑戴尔m6500</a></div></div><div class="col col-2">4000元</div><div class="col col-3">1</div><div class="col col-4">4000元</div></div><div class="item-row"><div class="col col-1"><div class="g-info"><a href="#" class="d_num">27C9EB0CB08D4A04ABC50C9F6935B901-</a></div><div class="g-info"><a href="#">神州i7</a></div></div><div class="col col-2">3599元</div><div class="col col-3">1</div><div class="col col-4">3599元</div></div></dd>
												
										</dl>
										<div class="checkout-count clearfix">
											<div class="checkout-price">
												<p class="checkout-total">
													应付总额：<span><strong id="totalPrice">3599.0</strong></span>元
												</p>
											</div>
										</div>

										
									</div>
								</div>

								<!--S 加价购 产品选择弹框 -->
								<div class="modal hide modal-choose-pro" id="J_choosePro-664">
									<div class="modal-header">
										<span class="close" data-dismiss="modal"><i class="iconfont"></i></span>
										<h3>选择产品</h3>
										<div class="more">
											<div class="xm-recommend-page clearfix">
												<a class="page-btn-prev   J_carouselPrev iconfont" href="javascript: void(0);"></a><a class="page-btn-next  J_carouselNext iconfont" href="javascript: void(0);"></a>
											</div>
										</div>
									</div>
									<div class="modal-body J_chooseProCarousel">
										<div class="J_carouselWrap modal-choose-pro-list-wrap">
											<ul class="clearfix J_carouselList">
											</ul>
										</div>
									</div>
								</div>

							</div>
							<!-- 商品清单 END -->
							<input type="hidden" id="couponType" name="Checkout[couponsType]">
							<input type="hidden" id="couponValue" name="Checkout[couponsValue]">
							<div class="checkout-confirm">

								<a href="shoppingcar.html" class="btn btn-lineDakeLight btn-back-cart" onclick="return_car()">返回购物车</a>
									<a href="321.html"> 扫码支付 </a>
									
							</div>
						</div>
					</div>
				</form>
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
			<!-- 模态框 -->
			<div class="modal2" id="commitModal5" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-header">
					<span class="btn-close" id="close" aria-hidden="true"></span>
				</div>
				<div class="modal-body">
					<img src="./Order_files/zizhu.png" class="ewm">
				</div>
				<div class="modal-footer">
					<!-- <button class="btn-new" id='cancel' >取 消</button> -->
				</div>
			</div>
		</div>

		<script src="./Order_files/jquery.min.js(1).下载"></script>

	<!-- 	<script>
			$(document).ready(function() {
				//点击开启
				$("#btonn").click(function() {
					$("#commitModal5").show();
				});

				//点击取消
				$("#cancel").click(function() {
					$("#commitModal5").hide();
				});
			});
		</script> -->
			
  			
			

</body></html>