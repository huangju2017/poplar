<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String basePath = request.getScheme() + "://" + request.getLocalAddr() + ":" + request.getLocalPort()
		+ request.getContextPath() + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>" />
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function checkAll(){
				var commain = document.getElementById("checkmain")
				var coms = document.getElementsByName("cID");
				for (var i=0 ;i<coms.length;i++) {
					coms[i].checked = commain.checked ;
				}
			}
			function del(){
				
				//获得选中的数量
				var count = $("#form1 input[name=cID]:checked").length;
				//判断是否未选中数据项
				if(count<1) {
					parent.alert("请选择要删除的评论!");
					return;
				}
				var form=$("#form1").get(0);
				form.action="servlet/comment/delete";
				form.submit();
			}
		</script>
</head>
<body>
<div class="container">
			<h2>所有评论</h2>
			<form  id="form1" method="post">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><input type="checkbox" onchange="checkAll()" id="checkmain"/></th>
						<th>评论编号</th>
						<th>评论者</th>
						<th>被评价商品</th>
						<th>评论内容</th>
						<th>评论时间</th>

					</tr>
				</thead>
				<tbody>
				<c:forEach var="comments" items="${commentList }">
					<tr>
						<td><input type="checkbox"  id="checkmain" name="cID" value="${comments.reviewId }"></td>
						<td>${comments.reviewId }</td>
						<td>${comments.customerName }</td>
						<td>${comments.goodsName }</td>
						<td>${comments.reviewContent }</td>
						<td><fmt:formatDate value="${comments.reviwDate}" pattern="yyyy年MM月dd日"/></td>
					</tr>
				</c:forEach>
				
				<c:if test="${commentList==null || commentList.size()<1 }">
					<td colspan="6">未查找到数据</td>
				</c:if>	
				</tbody>
			</table>
			<input type="button" value="删除评论" class="btn btn-outline-danger" style="margin-left: 500px;margin-top: 30px;" onclick="del()"/>
			</form>
		</div>
</body>
</html>