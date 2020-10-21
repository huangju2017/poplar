<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- saved from url=(0046)http://127.0.0.1:8080/YiYi/servlet/admin/login -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--<base href="http://127.0.0.1:8080/YiYi/">-->
<base href=".">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="./OA_YiYi_index_files/layui.css">
<script src="./OA_YiYi_index_files/layui.js.下载"></script>
<script>
	//JavaScript代码区域
	layui.use('element', function() {
		var element = layui.element;

	});
</script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">白杨后台系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->

			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="./OA_YiYi_index_files/RCzsdCq" class="layui-nav-img">


				</a> <!-- <dl class="layui-nav-child">
							<dd><a href="">基本资料</a></dd>
							<dd><a href="">安全设置</a></dd>
						</dl> --></li>
				<li class="layui-nav-item"><a
					href="http://localhost:8080/poplar/">退出</a></li>
				<span class="layui-nav-bar"></span>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="${pageContext.request.contextPath }/reviewServlet?cmd=findreview" target="mainFrame">评论管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="${pageContext.request.contextPath }/reviewServlet?cmd=findreview" target="mainFrame">查看评论</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item layui-nav-itemed"><a href="${pageContext.request.contextPath }/customerServlet?cmd=findCustomer"
						target="mainFrame">会员管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a
									href="${pageContext.request.contextPath }/customerServlet?cmd=findCustomer"
									target="mainFrame">会员查看</a>
							</dd>
						</dl></li>
						<li class="layui-nav-item layui-nav-itemed"><a href="${pageContext.request.contextPath }/goods?cmd=showAllGoods&flag=3"
						target="mainFrame">商品管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="OA_goods_query.jsp" target="mainFrame">商品信息</a>
							</dd>
						</dl>
						</dl></li> 
					<li class="layui-nav-item layui-nav-itemed"><a href="OA_query_seller.jsp"
						target="mainFrame">员工管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="OA_query_seller.jsp" target="mainFrame">员工信息</a>
							</dd>
						</dl></li>
					<span class="layui-nav-bar"
						style="top: 317.5px; height: 0px; opacity: 0;"></span>
				</ul>
			</div>
		</div>
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px; width: 100%; height: 100%;">
				<iframe src="OA_main.jsp" id="mainFrame" name="mainFrame"
					width="100%" height="100%" frameborder="0"></iframe>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© YiYi.com - 如有问题请联系总部
		</div>
	</div>


</body>
</html>