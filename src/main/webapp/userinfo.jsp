<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0039)userinfo.html -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
			body {
				background-color: #f3f3f3;
			}

			.main .box-main {
				margin-top: 30px;
			}
		</style>

		<!--<base href="">-->
		<base href=".">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./userinfo_files/reset.css">
		<link rel="stylesheet" type="text/css" href="./userinfo_files/fonts.css">
		<link rel="stylesheet" type="text/css" href="./userinfo_files/index.css">
		<link rel="stylesheet" type="text/css" href="./userinfo_files/car.css">
		<link rel="stylesheet" href="./userinfo_files/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
		  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		  <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
		  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="topBar">
			<div class="container">
				<div class="topBar_list">
					<a href="index.html">白杨商城</a>
					<span>|</span>
					<a href="#">云服务</a>
					<span>|</span>
					<a href="#">金融</a>
					<span>|</span>
					<a href="#">资质证照</a>
					<span>|</span>
					<!-- <a href="#">Merchant OS</a> -->
					<span>|</span>
					<!-- <a href="OA_adminLogin.html">Admin OS</a> -->
					<span>|</span>
				</div>


				<!-- 用户登录 -->

			</div>
		</div>
		<!-- 导航栏 -->
		<div class="header">

			<div class="main">
				<div class="box-top">
					<img src="./userinfo_files/yilogo.jpg">
					<span class="tit"><a href="">白杨会员</a></span>
					<span class="btn btn-outline-secondary exit" style="padding: 0 20px 13px 20px"><a href="">返回首页</a></span>
				</div>



				<div class="box-main">
					<!-- <div class="photo"></div> -->
					<div class="update-photo">
						<div class="tx"><img alt="" src="./userinfo_files/touxiang.jpg" width="100px" height="100px"></div>
						<!-- <span><a href="">修改</a></span> -->
					</div>

					<div class="userinfo">
						<div class="tit">
							<h3 class="sjupdate">基础资料</h3>
							<a href="" data-toggle="modal" data-target="#myModal" class="btn btn-outline-secondary bj" style="padding: 0 20px 13px 20px;height: 28px">
								<i>编辑资料</i></a>
							<!-- <a href="" data-toggle="modal" data-target="#myModal"
								data-articleid="${article.articleId }"
								data-articletitle="${article.articleTitle }"
								data-articlecontent="${article.articleContent }"
								data-articleauthor="${article.articleAuthor }" onclick="showUpdateDate(this)">
								<button class="btn btn-success">修改</button></a> -->
						</div>
						<div class="jbxx">
							<div class="hang">
								<i class="y"></i>
								<a class="x"></a>
							</div>
							<div class="hang">
								<i class="y">昵称:</i>
								<a class="x">${user.userName}</a>
							</div>
							<div class="hang">
								<i class="y">性别:</i>
								<a class="x">${user.gender}</a>
							</div>
							<div class="hang">
								<i class="y">年龄:</i>
								<a class="x">${user.age}</a>
							</div>
							<div class="hang">
								<i class="y">电话:</i>
								<a class="x">${user.phone}</a>
							</div>
							<div class="hang">
								<i class="y">地址:</i>
								<a class="x">${user.address}</a>
							</div>
							<div class="hang">
								<i class="y">密码:</i>
								<a class="x">******</a>
							</div>
							<div class="hang">
								<i class="y">Email:</i>
								<a class="x">${user.email}</a>
							</div>
						</div>
					</div>

					<div class="gjuserinfo">


					</div>
				</div>
			</div>
			
			
			
			<!-- 脚部 -->
			<div class="footer" style="padding-top: 50px">
				<div class="container">
					<div class="footer-service">
						<ul class="clearfix">
							<li class="first">
								<a href="#">
									<i class="iconfont"></i>
									购物指南
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									合作招商
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									营销中心
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									商家帮助
								</a>
							</li>
							<li>
								<a href="#">
									<i class="iconfont"></i>
									联系我们
								</a>
							</li>

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
								周一至周日 8:00-18:00
								<br>
								（仅收市话费）
							</p>
							<a href="#">
								<i class="iconfont"></i>
								联系客服
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
		
		<!-- 放最后面 -->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form class="form-horizontal" role="form"
					action="${pageContext.request.contextPath }/ArticleController?op=update" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">修改文章</h4>
						</div>
						<div class="modal-body">
		
							<div class="form-group">
								<label for="articleId" class="col-sm-2 control-label">文章编号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="articleId"
										name="articleId" readonly="readonly" />
								</div>
							</div>
							<div class="form-group">
								<label for="articleTitle" class="col-sm-2 control-label">文章标题</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="articleTitle"
										name="articleTitle" />
								</div>
							</div>
							<div class="form-group">
								<label for="articleContent" class="col-sm-2 control-label">文章内容</label>
								<div class="col-sm-8">
									<textarea rows="5" class="form-control" name="articleContent"
										id="articleContent"></textarea>
								</div>
							</div>
		
							<div class="form-group">
								<label for="articleAuthor" class="col-sm-2 control-label">文章作者</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="articleAuthor"
										name="articleAuthor" />
								</div>
							</div>
		
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="submit" class="btn btn-primary">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</form>
			</div>
			<!-- /.modal -->
		</div>

	</body>
</html>
