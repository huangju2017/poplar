<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- saved from url=(0038)MyOrder.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="">-->
<base href=".">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./MyOrder_files/reset.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/fonts.css">
<link rel="stylesheet" type="text/css"
	href="./MyOrder_files/iconfont.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/index.css">
<link rel="stylesheet" type="text/css"
	href="./MyOrder_files/productpage.css">
<link rel="stylesheet" type="text/css" href="./MyOrder_files/dd.css">
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/fenye.css">
<script src="./MyOrder_files/jquery-3.5.1.min.js.下载"
	type="text/javascript" charset="utf-8"></script>
<script src="js/shoppingCartVerification1.js" type="text/javascript"
	charset="utf-8"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	text-align: center;
}

table thead tr th, table tbody tr td {
	text-align: center;
}
</style>

<script type="text/javascript">
	/*  $(function(){
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
		 }); */
	function personalToggle() {
		var personal = document.getElementById("personal");
		if (personal.style.display == "block") {
			personal.style.display = "none";
		} else {
			personal.style.display = "block";
		}
	}
	$(function() {
		fenye2();
	});
	function fenye2() {
		var tabPage;
		tabPage({
			pageMain : '#pageMain',
			pageNav : '#pageNav',
			pagePrev : '#prev',
			pageNext : '#next',
			curNum : 5,
			/*每页显示的条数*/
			activeClass : 'active',
			/*高亮显示的class*/
			ini : 0
		/*初始化显示的页面*/
		});

		function tabPage(tabPage) {
			var pageMain = $(tabPage.pageMain);
			/*获取内容列表*/
			var pageNav = $(tabPage.pageNav);
			/*获取分页*/
			var pagePrev = $(tabPage.pagePrev);
			/*上一页*/
			var pageNext = $(tabPage.pageNext);
			/*下一页*/

			var curNum = tabPage.curNum;
			/*每页显示数*/
			var len = Math.ceil(pageMain.find("tr").length / curNum);
			/*计算总页数*/
			console.log(len);
			var pageList = '';
			/*生成页码*/
			var iNum = 0;
			/*当前的索引值*/

			for (var i = 0; i < len; i++) {
				pageList += '<a href="javascript:;">' + (i + 1) + '</a>';
			}
			pageNav.html(pageList);
			/*头一页加高亮显示*/
			pageNav.find("a:first").addClass(tabPage.activeClass);

			/*******标签页的点击事件*******/
			pageNav.find("a").each(
					function() {
						$(this)
								.click(
										function() {
											pageNav.find("a").removeClass(
													tabPage.activeClass);
											$(this).addClass(
													tabPage.activeClass);
											iNum = $(this).index();
											$(pageMain).find("tr").hide();
											for (var i = ($(this).html() - 1)
													* curNum; i < ($(this)
													.html())
													* curNum; i++) {
												$(pageMain).find("tr").eq(i)
														.show()
											}

										});
					})

			$(pageMain).find("tr").hide();
			/************首页的显示*********/
			for (var i = 0; i < curNum; i++) {
				$(pageMain).find("tr").eq(i).show()
			}

			/*下一页*/
			pageNext.click(function() {
				$(pageMain).find("tr").hide();
				if (iNum == len - 1) {
					alert('已经是最后一页');
					for (var i = (len - 1) * curNum; i < len * curNum; i++) {
						$(pageMain).find("tr").eq(i).show()
					}
					return false;
				} else {
					pageNav.find("a").removeClass(tabPage.activeClass);
					iNum++;
					pageNav.find("a").eq(iNum).addClass(tabPage.activeClass);
					//                    ini(iNum);
				}
				for (var i = iNum * curNum; i < (iNum + 1) * curNum; i++) {
					$(pageMain).find("tr").eq(i).show()
				}
			});
			/*上一页*/
			pagePrev.click(function() {
				$(pageMain).find("tr").hide();
				if (iNum == 0) {
					alert('当前是第一页');
					for (var i = 0; i < curNum; i++) {
						$(pageMain).find("tr").eq(i).show()
					}
					return false;
				} else {
					pageNav.find("a").removeClass(tabPage.activeClass);
					iNum--;
					pageNav.find("a").eq(iNum).addClass(tabPage.activeClass);
				}
				for (var i = iNum * curNum; i < (iNum + 1) * curNum; i++) {
					$(pageMain).find("tr").eq(i).show()
				}
			})

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
<script type="text/javascript">
	function delFun(orderId) {
		var flag = confirm("是否确定删除该订单");
		if (flag) {
			//跳转页面
			location.href = "${pageContext.request.contextPath }/orderServlet?cmd=delOrder&orderId="
					+ orderId;
		}
	}
</script>
</head>
<body>

	<!-- 顶部栏 -->
	<div class="topBar">
		<div class="container">
			<div class="topBar_list">
				<a href="index.jsp">白杨商城</a> <span>|</span> <a href="#">云服务</a> <span>|</span>
				<a href="#">金融</a> <span>|</span> <a href="#">资质证照</a> <span>|</span>
				<a href="sellerLogin.jsp">Merchant OS</a> <span>|</span> <a
					href="OA_adminLogin.jsp">Admin OS</a> <span>|</span>
			</div>
			<div class="shop">
				<a href="javascript:void(0);"> <i class="iconfont"
					style="font-size: 14px;"></i> 购物车
				</a>
			</div>

			<!-- 用户登录 -->
			<div class="userinfo">

				<div class="user">
					<div class="userInfo" style="background-color: #333333;">
						<span onclick="personalToggle()"
							style="color: #b0b0b0; font-size: 12px">${customer.customerName}
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
					href="${pageContext.request.contextPath }/orderServlet?cmd=queryAllOrder">我的订单</a>
				<span>|</span>
			</div>



		</div>
	</div>
	<!-- 导航栏 -->
	<h1 style="text-align: center; margin-top: 20px">我的订单</h1>
	<div class="box">
		<table class="table table-striped table-hover">
			<thead>
				<tr>

					<th>订单编号</th>
					<th>商品名称</th>
					<th>商品单价</th>
					<th>商品数量</th>
					<th>支付状态</th>
					<th>成交时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="pageMain">

				<c:forEach items="${myorders }" var="Order" begin="0" step="1"
					varStatus="vs">
					<tr>

						<td>${Order.orderNumber }</td>
						<td>${Order.goodsName }</td>
						<td>${Order.goodsPrice }</td>
						<td>${Order.orderGoodsCount}</td>
						<td>${Order.payStatus }</td>
						<td>${ Order.createTime }</td>
						<td><a href="javascript:delFun(${Order.orderId}) "
							class="btn btn-danger">删除</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div id="pageBox">
			<span class="btn btn-outline-secondary" id="prev">上一页</span>
			<ul id="pageNav">
				<a href="javascript:;" class="active">1</a>
				<a href="javascript:;">2</a>
				<a href="javascript:;">3</a>
				<a href="javascript:;">4</a>
				<a href="javascript:;">5</a>
				<a href="javascript:;">6</a>
				<a href="javascript:;">7</a>
				<a href="javascript:;">8</a>
			</ul>
			<span class="btn btn-outline-secondary" id="next">下一页</span>
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