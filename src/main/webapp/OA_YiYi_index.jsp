<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0046)http://127.0.0.1:8080/YiYi/servlet/admin/login -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--<base href="http://127.0.0.1:8080/YiYi/">--><base href=".">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./OA_YiYi_index_files/layui.css">
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
				<div class="layui-logo">易易二手后台系统</div>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<img src="./OA_YiYi_index_files/RCzsdCq" class="layui-nav-img">
							
							 谭兴友!
						</a>
						<!-- <dl class="layui-nav-child">
							<dd><a href="">基本资料</a></dd>
							<dd><a href="">安全设置</a></dd>
						</dl> -->
					</li>
					<li class="layui-nav-item"><a href="http://127.0.0.1:8080/YiYi/index.jsp">退出</a></li>
				<span class="layui-nav-bar"></span></ul>
			</div>

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="http://127.0.0.1:8080/YiYi/OA_main.jsp" target="mainFrame">评论管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="http://127.0.0.1:8080/YiYi/servlet/comment/query" target="mainFrame">查看评论</a></dd>								
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="http://127.0.0.1:8080/YiYi/OA_main.jsp" target="mainFrame">公告管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="http://127.0.0.1:8080/YiYi/OA_announcement_replease.jsp" target="mainFrame">发布公告</a></dd>
								<dd class=""><a href="http://127.0.0.1:8080/YiYi/servlet/announ/query" target="mainFrame">查看公告</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="http://127.0.0.1:8080/YiYi/OA_main.jsp" target="mainFrame">会员管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="http://127.0.0.1:8080/YiYi/servlet/user/queryAll" target="mainFrame">会员查看</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="http://127.0.0.1:8080/YiYi/OA_main.jsp" target="mainFrame">商家管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="http://127.0.0.1:8080/YiYi/OA_audit.jsp" target="mainFrame">申请审核</a></dd>
							</dl>
							<dl class="layui-nav-child">
								<dd class=""><a href="http://127.0.0.1:8080/YiYi/OA_history.jsp" target="mainFrame">审核记录</a></dd>
							</dl>
							<dl class="layui-nav-child">
								<dd class="layui-this"><a href="http://127.0.0.1:8080/YiYi/OA_query_seller.jsp" target="mainFrame">商家展示</a></dd>
							</dl>
						</li>
					<span class="layui-nav-bar" style="top: 317.5px; height: 0px; opacity: 0;"></span></ul>
				</div>
			</div>

			<div class="layui-body">
				<!-- 内容主体区域 -->
				<div style="padding: 15px;width: 100%;height: 100%;">
					<iframe src="./OA_YiYi_index_files/OA_main.html" id="mainFrame" name="mainFrame" width="100%" height="100%" frameborder="0"></iframe>
				</div>	
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© YiYi.com - 如有问题请联系总部
			</div>
		</div>
		
	
</body></html>