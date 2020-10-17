<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- saved from url=(0046)http://127.0.0.1:8080/YiYi/servlet/admin/login -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
				<div class="layui-logo">员工后台</div>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<img src="./OA_YiYi_index_files/RCzsdCq" class="layui-nav-img">
							
							
						</a>
						<!-- <dl class="layui-nav-child">
							<dd><a href="">基本资料</a></dd>
							<dd><a href="">安全设置</a></dd>
						</dl> -->
					</li>
					
					<li class="layui-nav-item"><a href="http://localhost:8080/poplar/">&nbsp;&nbsp;退出</a></li>
				<span class="layui-nav-bar"></span></ul>
			</div>

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="#" target="mainFrame">评论管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="#" target="mainFrame">查看评论</a></dd>								
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="#" target="mainFrame">公告管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="#" target="mainFrame">发布公告</a></dd>
								<dd class=""><a href="#" target="mainFrame">查看公告</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="#" target="mainFrame">会员管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="#" target="mainFrame">会员查看</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="#" target="mainFrame">商家管理<span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd class=""><a href="#" target="mainFrame">申请审核</a></dd>
							</dl>
							<dl class="layui-nav-child">
								<dd class=""><a href="#" target="mainFrame">审核记录</a></dd>
							</dl>
							<dl class="layui-nav-child">
								<dd class="layui-this"><a href="#" target="mainFrame">商家展示</a></dd>
							</dl>
						</li>
					<span class="layui-nav-bar" style="top: 317.5px; height: 0px; opacity: 0;"></span></ul>
				</div>
			</div>

			<div class="layui-body">
				<!-- 内容主体区域 -->
				<div style="padding: 15px;width: 100%;height: 100%;">
					<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>序号</th>
				<th>会员姓名</th>
				<th>密码</th>
				<th>性别</th>
				<th>年龄</th>
				<th>电话号码</th>
				<th>地址</th>
				<th>邮箱</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${emp1}" var="u" begin="0" step="1" varStatus="vs">
				<tr>
					<td>${u.customerId }</td>
					<td>${u.customerName }</td>
					<td>${u.password }</td>
					<td>${u.gender }</td>
					<td>${u.age }</td>
					<td>${u.phone }</td>
					<td>${u.address }</td>
					<td>${u.email }</td>
					<td>
						<a href="${pageContext.request.contextPath }/empServlet?cmd=deleteEmp&id=${u.customerId}" class="btn btn-danger">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
				</div>	
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© YiYi.com - 如有问题请联系总部
			</div>
		</div>
		
	
</body></html>