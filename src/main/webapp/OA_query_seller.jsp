<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/fenye.css" />
<script src="js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="js/fenye.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	//全局加载
	$(function() {
		/* alert("hfs"); */
		$.post("rootServlet?cmd=showAllEmp", function(data) {
			/* alert("jfidj"); */
			var json = JSON.parse(data);
			var root = json.root;
			for (i in root) {
				var seller = root[i];
				$("#pageMain").append(
						"<tr>" + "<td>" + seller.empId + "</td>" + "<td>"
								+ seller.empNumber + "</td>" + "<td>"
								+ seller.empName + "</td>" + "<td>"
								+ seller.empPassword + "</td>"
								+ "<td><a href='rootServlet?cmd=deleteEmp&id="
								+ seller.empId + "'>" + "删除" + "</a></td>"
								+ "</tr>");
			}
			fenye();
		});
	});
	function fenye() {
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
</script>
<style type="text/css">
h2 {
	margin-top: -10px;
	color: #D9D3D1;
	text-shadow: 5px 5px 5px #273067;
	text-align: center;
	font-size: 50px;
	font-weight: bold;
	letter-spacing: 20px;
}

.table-striped tr th {
	width: 200px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	text-align: center;
}

.yincang {
	max-width: 200px;
	text-align: center;
	line-height: 50px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.yincang img {
	max-height: 100px;
	max-width: 100px;
}
</style>
</head>
<body>
	<div class="container">
		<H2 align="center">员工信息</H2>
		<form action="" method="post" id="form1">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<!-- <th><input type="checkbox" onchange="checkAll()" id="checkmain"/></th> -->

						<th>员工编号</th>
						<th>员工账号</th>
						<th>员工姓名</th>
						<th>员工密码</th>
						<th>员工操作</th>


					</tr>
				</thead>

				<tbody id="pageMain">

				</tbody>

				<%-- 	<c:if test="${sList==null || sList.size()<1 }">
					<td colspan="6">未查找到数据</td>
				</c:if> --%>
			</table>
		</form>
		<button type="button" class="btn btn-primary btn-lg btn-block"
			data-toggle="modal" data-target="#myModal">添加信息</button>

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



		</div>

		<div id="pageBox">
			<span class="btn btn-outline-secondary" id="prev">上一页</span>
			<ul id="pageNav"></ul>
			<span class="btn btn-outline-secondary" id="next">下一页</span>

		</div>
	</div>
</body>
</html>