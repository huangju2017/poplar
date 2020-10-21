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
<script
	src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function checkAll() {

		var box = document.getElementById("boxid");
		var coms = document.getElementsByName("com");
		if (box.checked == false) {
			for (var i = 0; i < coms.length; i++) {
				coms[i].checked = false;

			}
		} else {
			for (var i = 0; i < coms.length; i++) {
				coms[i].checked = true;

			}
		}
	};
</script>
</head>
<body>
	<div class="container">
		<H2 align="center">会员查看</H2>
		<form action="" method="post" id="form1">
			<table class="table table-striped table-hover">
				<tr>
					<th><input type="checkbox" onchange="checkAll()" id="boxid" /></th>

					<th>名字</th>
					<th>年龄</th>
					<th>性别</th>
					<th>地址</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>密码</th>
					<!-- <th>创建时间</th> -->
				</tr>
				<c:forEach var="user" items="${customers }" varStatus="st">
					<tr>
						<td><input type="checkbox" name="com"
							value="${user.customerId }" /></td>
						<td>${user.customerName }</td>
						<td>${user.age }</td>
						<td>${user.gendar }</td>
						<td>${user.address }</td>
						<td>${user.phone }</td>
						<td>${user.email }</td>
						<td>******</td>
						<%-- <td><fmt:formatDate value="${user.creation_time }" pattern="yyyy年MM月dd日"/></td> --%>

					</tr>
				</c:forEach>
				<c:if test="${customers==null || customers.size()<1 }">
					<td colspan="1">未查找到数据</td>
				</c:if>
			</table>
		</form>
	</div>
</body>
</html>