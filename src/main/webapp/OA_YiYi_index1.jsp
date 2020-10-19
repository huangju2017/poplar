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
						href="" target="mainFrame">评论管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="${pageContext.request.contextPath }/reviewServlet?cmd=findreview" target="mainFrame">查看评论</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item layui-nav-itemed"><a href="#"
						target="mainFrame">公告管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="#" target="mainFrame">发布公告</a>
							</dd>
							<dd class="">
								<a href="#" target="mainFrame">查看公告</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item layui-nav-itemed"><a href=""
						target="mainFrame">会员管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a
									href="${pageContext.request.contextPath }/customerServlet?cmd=findCustomer"
									target="mainFrame">会员查看</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item layui-nav-itemed"><a href="#"
						target="mainFrame">员工管理<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="#" target="mainFrame">申请审核</a>
							</dd>
						</dl>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="#" target="mainFrame">审核记录</a>
							</dd>
						</dl>
						<dl class="layui-nav-child">
							<dd class="">
								<a href="OA_query_seller.jsp" target="mainFrame">员工展示</a>
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
		<%-- <div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px; width: 100%; height: 100%;">
				<table class="table table-striped table-hover">
					<thead>
						<tr>

							<th>管理员编号</th>
							<th>管理员姓名</th>
							<th>密码</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${root1}" var="u" begin="0" step="1"
							varStatus="vs">
						<tr>
							<td>${root1.rootId }</td>
							<td>${root1.rootName }</td>
							<td>${root1.rootPassword }</td>
								<td><a
									href="${pageContext.request.contextPath }/rootServlet?cmd=deleteEmp&id=${root1.rootId}"
									class="btn btn-danger">删除</a></td>
						</tr>
						</c:forEach>
						<!-- 按钮：用于打开模态框 -->
						<!--  <button   type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myModal">
    添加信息
  </button> -->
					</tbody>
				</table>
			</div>
		</div>



		<div class="container">



			<!-- 添加模态框 -->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">模态框头部</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- 模态框主体 -->
						<div class="modal-body">
							<form
								action="${pageContext.request.contextPath }/rootServlet?cmd=addEmp"
								method="post" onsubmit="">
								<p>
									编&emsp;&emsp;号:<input type="text" name="empNumber"
										id="empNumber" maxlength="14"> <span
										id="empNumberSpan"></span>
								</p>
								<p>
									姓&emsp;&emsp;名: <input type="text" name="empName" id="empName">
									<span id="empNameSpan"></span>
								</p>
								<p>
									密&emsp;&emsp;码:<input type="Password" name="empPassword"
										id="empPassword"> <span id="empPasswordSpan"></span>
								</p>

								<p>
									<input type="reset" class="btn btn-danger">
									&emsp;&emsp;&emsp; <input type="submit" value="确认添加"
										class="btn btn-success">

								</p>
							</form>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">关闭</button>
						</div>

					</div>
				</div>
			</div>



		</div> --%>


		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© YiYi.com - 如有问题请联系总部
		</div>
	</div>


</body>
</html>