<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0038)MyOrder.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="">--><base href=".">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./MyOrder_files/reset.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/fonts.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/iconfont.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/index.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/productpage.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/dd.css">
<script src="./MyOrder_files/jquery-3.5.1.min.js.下载" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">

	 $(function(){
		 $.post("servlet/order/myorder",function(data){
			var json = JSON.parse(data);
			var list = json.myOrderList;
			for(i in list){
				var order = list[i];
				$("#tab").append(
						"<tr>"
						+"<td>"+order.order_number+"</td>"
						+"<td>"+order.creat_time+"</td>"
						+"<td>"+order.goods_name+"</td>"
						+"<td>"+order.goods_price+"</td>"
						+"<td>"+order.goods_count +"</td>"
						+"<td>"+order.total_price +"</td>"
						+"<td>"+order.pay_state +"</td>"
						+"<td>"+order.send_state +"</td>"
					+"</tr>"
						);
				}
			 });
		 });
	function personalToggle() {
		var personal = document.getElementById("personal");
		if (personal.style.display == "block") {
			personal.style.display = "none";
		} else {
			personal.style.display = "block";
		}
	}
	function gm() {

		if ($('.sum').text() == "0.0") {
			alert("零个商品不能购买");
			return;
		}
		$.post("servlet/productpage/shoppingCartVerification", function(data) {
			//转换成JSON对象
			var json = JSON.parse(data);
			//alert(json.success);
			if (json.success) {
				/* window.location.href="servlet/productpage/orderitem" */
				var money = $(".sum").text();

				var formdata = {
					"total_price" : money
				}
				$.post("servlet/pay", formdata, function(data) {
					var json = JSON.parse(data);
					if (json.success) {
						window.location.href = "aplay.jsp";
					}
				});
			} else {
				alert("请先登录");
			}
		});
	}
</script>
</head>
<body>

	<!-- 顶部栏 -->
	<div class="topBar">
		<div class="container">
			<div class="topBar_list">
				<a href="index.html">易易商城</a> <span>|</span> <a href="#">云服务</a> <span>|</span>
				<a href="#">金融</a> <span>|</span> <a href="#">资质证照</a> <span>|</span>
				<a href="#">Merchant OS</a> <span>|</span> <a href="OA_adminLogin.html">Admin OS</a> <span>|</span>
			</div>
			<div class="shop">
				<a href="javascript:void(0);"> <i class="iconfont" style="font-size: 14px;"></i> 购物车(<span style="color: white;">0</span>)
				</a>
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
						<li><a href="">晒单评价</a></li>
						<li><a href="">我的喜欢</a></li>
						<li><a href="">账户安全</a></li>
						<li><a href="servlet/user/logout">退出登录</a></li>
					</ul>
				</div>
				<a class="link" href="">消息通知</a> <span>|</span> <a class="link" href="">我的订单</a> <span>|</span>
			</div>
			


		</div>
	</div>
	<!-- 导航栏 -->
	<h1 style="text-align: center;margin-top: 20px">我的订单</h1>
	<div class="box">
		<table border="0" cellspacing="1" cellpadding="10">
			<thead>
			<tr>
				<th>订单编号</th>
				<th>成交时间</th>
				<th>商品名称</th>
				<th>商品单价</th>
				<th>商品数量</th>
				<th>总计</th>
				<th>支付状态</th>
				<th>发货状态</th>
			</tr>
			</thead>
			<tbody id="tab">
			<tr><td>B7C2392C1193427394EBB5332A48F1BB-</td><td>2020-07-17 04:26:52.0</td><td>iphonex</td><td>2999</td><td>1</td><td>2999</td><td>未支付</td><td>未发货</td></tr><tr><td>B152A5380C0148A39D44A54DA6613FB3-</td><td>2020-07-17 04:31:35.0</td><td>电脑戴尔m6500</td><td>4000</td><td>1</td><td>4000</td><td>未支付</td><td>未发货</td></tr></tbody>
		
		</table>
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

</body></html>