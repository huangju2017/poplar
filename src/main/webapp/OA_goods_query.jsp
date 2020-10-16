<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://127.0.0.1:8080/YiYi/">-->
<base href=".">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/nav.css">
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/style.css">
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/iconfont.css">
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/index.css">
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/reset.css">
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/fonts.css">
<link rel="stylesheet" type="text/css"
	href="./OA_goods_query_files/fenye.css">
<link href="./OA_goods_query_files/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="./OA_goods_query_files/bootstrap.min.css">
<script src="./OA_goods_query_files/jquery.min.js.下载"></script>
<script src="./OA_goods_query_files/fenye.js.下载" type="text/javascript"
	charset="utf-8"></script>
<script src="./OA_goods_query_files/shoppingCartVerification1.js.下载"
	type="text/javascript" charset="utf-8"></script>
<script src="./OA_goods_query_files/popper.min.js.下载"></script>
<script src="./OA_goods_query_files/bootstrap.min.js.下载"></script>
<script src="./OA_goods_query_files/jquery-1.10.2.js.下载"></script>
<script src="./OA_goods_query_files/jquery.min.js(1).下载"></script>
<script type="text/javascript" src="./OA_goods_query_files/nav.js.下载"></script>
<script type="text/javascript">
	var goodsId = 0;

	$(document).on(
			"click",
			"#upprice",
			function() {
				goodsId = $(this).parent().parent().children().first()
						.children().val();

			})
	$(document).on(
			"change",
			"#sel",
			function() {
				var sel = $(this).val();
				var goodsId = $(this).parent().parent().children().first()
						.children().val();
				/* alert(sel+" : "+goodsId); */
				var fromData = {
					"sel" : sel,
					"goodsId" : goodsId
				}
				$.post("servlet/goods/select", fromData, function(data) {
					var json = JSON.parse(data);
					if (json.success) {
						alert("更改成功");
					}
				})
			});

	function checkAll() {
		var commain = document.getElementById("checkmain")
		var coms = document.getElementsByName("com");
		for (var i = 0; i < coms.length; i++) {
			coms[i].checked = commain.checked;
		}
	}
	function updateGoods() {
		window.location.href = "OA_updateGoods.jsp"
	}

	function modalClose() {
		$('#myModal6').modal('hide');
		$(".modal-backdrop").remove();
		$("body").removeClass('modal-open');
	}
	function modalClose1() {
		$('#myModal1').modal('hide');
		$(".modal-backdrop").remove();
		$("body").removeClass('modal-open');
	}
	//修改商品价格
	$(document).on(
			"click",
			"#on3",
			function() {
				var price = $(this).parent().parent().children().first()
						.children().last().val();

				alert(goodsId + price);
				var fromData = {
					"price" : price,
					"goodsId" : goodsId
				}
				var fromData = {
					"price" : price,
					"goodsId" : goodsId
				}
				$.post("servlet/goods/upprice", fromData, function(data) {
					var json = JSON.parse(data);
					if (json.success) {
						alert("更改成功");
						window.location.href = "OA_goods_query.jsp";
					}
				})
				setTimeout(modalClose1, 1);
			});
	function go() {
		$("#on").click(function() {
			setTimeout(modalClose, 1000);
		});
	}

	function modalClose2() {
		$('#myModal2').modal('hide');
		$(".modal-backdrop").remove();
		$("body").removeClass('modal-open');
	}
	function modalClose3() {
		$.each($('input:checkbox:checked'), function() {
			var id = $(this).val();
			$(".goodsId").val(id);
		});
	}
	function ok() {
		setTimeout(modalClose2, 1000);
		alert($(".goodsId").val());
	}

	//下架商品
	function del() {
		var form = $("#form1").get(0);
		form.action = "servlet/goods/delete";
		form.submit();
	}
	//出库点击
	function outLibrary() {
		$.get("servlet/goods/outLibrary", function(data) {
			var json = JSON.parse(data);
			var libraryList = json.libraryList;
			$("#tab tr:nth-child(n+1)").remove();
			for (i in libraryList) {
				var library = libraryList[i];
				var coun = parseInt(i) + 1;
				$("#pageMain2").append(
						"<tr>" + "<td class='yincang'>" + coun + "</td>"
								+ "<td class='yincang'>" + library.sname
								+ "</td>" + "<td class='yincang'>"
								+ library.order_count + "</td>"
								+ "<td class='yincang'>" + library.outTime
								+ "</td>" + "</tr>");

			}
			fenye2();
		})
	}
	/**
	 * 模态框分页
	 * 
	 */
	function fenye2() {
		var tabPage;
		tabPage({
			pageMain : '#pageMain2',
			pageNav : '#pageNav2',
			pagePrev : '#prev2',
			pageNext : '#next2',
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
	/**
	 * 上传文件
	 */
	function upload() {

		//获得选择文件的控件
		var uploadFileField = $("#uploadFile");
		//获得选择的文件路径
		var uploadFile = uploadFileField.val();
		//要上传的数据
		var goods_Name = $("#gname").val();
		var mall_price = $("#gprice").val();
		var goods_Number = $("#gcount").val();
		var goods_Class = $("#gtype option:selected").text();
		var describes = $("#gdes").val();
		//var sendData = {
		//"uploadFile": uploadFileField.get(0).files[0], 
		//"goods_Name": goods_Name,
		//"mall_price": mall_price,
		//"goods_Number": goods_Number,
		//"goods_Class": goods_Class,
		//"describes": describes,
		//};
		//判断是否未选择文件
		if (!uploadFile) {
			alert("请选择文件!");
			return;
		}
		//创建表单数据对象
		var formData = new FormData();
		//封装文件给表单数据对象
		formData.append("uploadFile", uploadFileField.get(0).files[0]);
		formData.append("goods_Name", goods_Name);
		formData.append("mall_price", mall_price);
		formData.append("goods_Number", goods_Number);
		formData.append("goods_Class", goods_Class);
		formData.append("describes", describes);

		//JQuery AJAX上传文件
		$.ajax({
			url : "${pageContext.request.contextPath}/goods?cmd=addGoods",//请求服务器路径
			data : formData, //要发送到服务器的数据。
			type : "post", //向服务器提交数据的方法
			dataType : "json", //服务器响应的数据类型。
			cache : false,
			processData : false,
			contentType : false,
			success : function(data) {
				//判断上传文件是否成功
				if (data.success) {
					alert("上传文件成功!");

				} else {
					alert("上传文件失败!");
				}
			},
			xhr : function() {
				//创建xhr对象
				var xhr = new XMLHttpRequest();
				//绑定上传进度改变事件
				xhr.upload.onprogress = function() {
					//初始化进度
					var percentComplete = 100;
					//判断上传文件的总大小是否>0
					if (event.lengthComputable) {
						var percentComplete = parseInt(event.loaded
								/ event.total * 100);
					}
					//获得进度条
					var progressBar = $(".progress-bar");
					//修改进度
					progressBar.css("width", percentComplete + "%");
					progressBar.text(percentComplete + "%");

					setTimeout(modalClose, 1);
				}
				return xhr;
			}
		});
	}
	/**
	 * 初始化上传相关控件
	 */
	function initUpload() {
		//获得进度条
		var progressBar = $(".progress-bar");
		//重置进度
		progressBar.css("width", "0%");
		progressBar.text("0%");
		//重置上传完成信息
		$("#finishMessage").text("");
		//获取文件对象
		var file = $("#uploadFile").get(0).files[0];

		//创建正在表达式
		var regexp = new RegExp("^image/[A-Za-z0-9_]{2,}$");
		//判断是否式图像
		if (regexp.test(file.type)) {
			//创建文件读取器
			var reader = new FileReader();
			//注册文件读取完成事件
			reader.onload = function(event) {
				//alert(event.target.result);
				//获取图像元素对象
				var img = $("#image");
				//设置图像路径
				img.attr("src", event.target.result);
			};
			//读取文件
			reader.readAsDataURL(file);
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
	width: 100px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	text-align: center;
}

.yincang {
	max-width: 100px;
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
<body style="">
	<!--头-->
	<div class="topBar">
		<div class="container">
			<div class="topBar_list">
				<a href="http://127.0.0.1:8080/YiYi/index.jsp">易易商城</a> <span>|</span>
				<a href="http://127.0.0.1:8080/YiYi/#">云服务</a> <span>|</span> <a
					href="http://127.0.0.1:8080/YiYi/#">金融</a> <span>|</span> <a
					href="http://127.0.0.1:8080/YiYi/#">资质证照</a> <span>|</span>
			</div>


			<!-- 用户登录 -->
			<div class="userinfo">

				<div class="user">
					<div class="userInfo" style="background-color: #333333;">
						<span onclick="personalToggle()"
							style="color: #b0b0b0; font-size: 12px">欢迎您: z,m,s!</span>
					</div>
					<ul id="personal">
						<li><a href="http://127.0.0.1:8080/YiYi/userinfo.jsp">个人中心</a></li>
						<li><a href="http://127.0.0.1:8080/YiYi/">账户安全</a></li>
						<li><a
							href="http://127.0.0.1:8080/YiYi/servlet/seller/logout">退出登录</a></li>
					</ul>
				</div>
				<a class="link" href="http://127.0.0.1:8080/YiYi/index.jsp">返回首页</a>
				<span>|</span>
			</div>



		</div>
	</div>
	<!-- 导航栏 -->
	<div class="header">
		<div class="container">
			<div class="site-logo">
				<a href="http://127.0.0.1:8080/YiYi/index.html"> <img
					src="./OA_goods_query_files/yilogo.jpg">
				</a>
			</div>
			<div class="site-list">
				<style type="text/css">
body {
	background-color: #F7EFEF;
}
/*店铺名*/
.shun {
	outline: none;
	text-decoration: none;
	position: relative;
	font-size: 4em;
	line-height: 1;
	color: #9e9ba4;
	display: inline-block;
}

.shun-shun {
	text-transform: uppercase;
	font-weight: 900;
	overflow: hidden;
	line-height: 0.8;
	color: #b2b0a9;
}

.shun-shun:hover {
	color: #b2b0a9;
}

.shun-shun:after {
	content: '';
	position: absolute;
	gi height: 16px;
	width: 100%;
	top: 50%;
	margin-top: -8px;
	right: 0;
	background: #F9F9F9;
	transform: translate3d(-100%, 0, 0);
	transition: transform 0.4s;
	transition-timing-function: cubic-bezier(0.7, 0, 0.3, 1);
}

.shun-shun:hover:after {
	transform: translate3d(100%, 0, 0);
}

.shun-shun:before {
	content: attr(data-letters);
	position: absolute;
	z-index: 2;
	overflow: hidden;
	color: #424242;
	white-space: nowrap;
	width: 0%;
	transition: width 0.4s 0.3s;
}

.shun-shun:hover:before {
	width: 100%;
}
/*搜索框*/
div.search {
	margin-top: -40px;
	margin-left: 500px;
}

.bar form {
	position: relative;
	width: 400px;
	margin: 0 auto;
}

.bar input, .bar button {
	border: none;
	outline: none;
}

.bar input {
	width: 100%;
	height: 42px;
	padding-left: 13px;
}

.bar button {
	height: 42px;
	width: 42px;
	cursor: pointer;
	position: absolute;
}

.bar form {
	height: 42px;
}

.bar input {
	width: 220px;
	border-radius: 42px;
	border: 2px solid #324B4E;
	background: pink;
	transition: .3s linear;
	float: right;
}

.bar input:focus {
	width: 400px;
	background: white;
}

.bar button {
	background: none;
	top: -2px;
	right: 0;
}

.bar button:before {
	content: "\f002";
	font-family: FontAwesome;
	color: #324b4e;
}
</style>

				<a href="http://127.0.0.1:8080/YiYi/#" class="shun shun-shun"
					data-letters="zms的店"
					style="text-align: center; text-decoration: none; display: block; padding: 26px 10px 38px;">商铺名字</a>


			</div>
		</div>
	</div>
	<div class="wrap">
		<!--主页内容-->
		<div align="center"
			style="margin: auto; width: 1226px; padding: 10px; background-color: #fff;">
			<div class="container">
				<h2 style="margin-top: 50px;">本店商品</h2>
				<div style="float: left; width: 1226px; margin-top: 30px;">
					<!-- <input type="button" value="删除商品" class="btn btn-outline-danger" style="margin-left: -775px;" onclick="del()" />
					<button class="btn btn-outline-secondary" data-toggle="modal" data-target="#myModal" style="margin-left: 20px;">入库商品</button>
					<button class="btn btn-outline-secondary" data-toggle="modal" data-target="#myModal2" style="margin-left: 20px;" onclick="modalClose3()">修改信息</button>
					<button class="btn btn-outline-secondary" data-toggle="modal" data-target="#myModal3" style="margin-left: 20px;"onclick="outLibrary()">商品出库信息</button> -->
					<!-- <div class="search bar">
						<form>
							<input type="text" placeholder="请输入您要搜索的内容...">
							<button type="submit"></button>
						</form>
					</div> -->
				</div>

				<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"
							style="padding: 30px; width: 200px; margin-left: -10px; margin-top: 300px;">
							<div class="form-group">
								<label for="gprice">商品价格:</label> <input type="text"
									class="form-control" id="price4" value="">
							</div>
							<div class="modal-footer" style="width: 156px;">
								<button type="button" id="on3" class="btn btn-primary">确认</button>
								<button type="button" id="showdown2" class="btn btn-primary"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 商品出库入口 -->
				<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"
							style="padding: 30px; width: 1226px; margin-left: -364px;">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">商品入库信息</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
							</div>
							<!--模态框分页-->
							<table id="tab" class="table table-striped">
								<thead>
									<tr>
										<th>序号</th>
										<th>商品名称</th>
										<th>出库数量</th>
										<th>操作时间</th>
									</tr>
								</thead>
								<tbody id="pageMain2">
									<!--id="containet"-->

								</tbody>
							</table>
							<div id="pageBox2">
								<span class="btn btn-outline-secondary" id="prev2">上一页</span>
								<ul id="pageNav2"></ul>
								<span class="btn btn-outline-secondary" id="next2">下一页</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 商品修改 -->
				<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"
							style="padding: 30px; width: 800px; margin-left: -180px;">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">修改信息</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
							</div>
							<form action="http://127.0.0.1:8080/YiYi/servlet/goods/update"
								method="post">
								<input type="checkbox" class="goodsId" name="goodsID1">
								<div class="form-group">
									<label for="gname">商品名称:</label> <input type="text"
										class="form-control" id="gname1" name="gname1">
								</div>
								<div class="form-group">
									<label for="gprice">商品价格:</label> <input type="text"
										class="form-control" id="gprice1" name="gprice1">
								</div>
								<div class="form-group">
									<label for="gcount">商品数量:</label> <input type="text"
										class="form-control" id="gcount1" name="gcount1">
								</div>
								<div class="form-group">
									<label for="gtype">商品类型:</label> <select class="form-control"
										id="gtype1" name="gtype1">
										<option disabled="" selected="" hidden="" value="">请选择商品类型</option>
										<option value="1">电脑</option>
										<option value="2">手机</option>
										<option value="3">服装</option>
										<option value="4">化妆品</option>
										<option value="5">其他</option>
									</select>
								</div>
								<div class="form-group">
									<label for="gdes">商品描述:</label> <input type="text"
										class="form-control" id="gdes1" name="gdes1">
								</div>
								<div class="modal-footer">
									<input type="submit" id="on2" class="btn btn-primary"
										style="margin-left: 100px;" onclick="ok()" value="确认">
									<button type="reset" class="btn btn-primary"
										style="margin-left: 100px; margin-right: 100px;">重置</button>
									<button type="button" id="showdown2" class="btn btn-primary"
										data-dismiss="modal">关闭</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 商品上架 -->
				<div class="modal fade" id="myModal6" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"
							style="padding: 30px; width: 800px; margin-left: -180px;">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">新品信息</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
							</div>
							<form>
								<div class="form-group">
									<label for="gname">商品名称:</label> <input type="text"
										class="form-control" id="gname">
								</div>
								<div class="form-group">
									<label for="gprice">商品价格:</label> <input type="text"
										class="form-control" id="gprice">
								</div>
								<div class="form-group">
									<label for="gcount">商品数量:</label> <input type="text"
										class="form-control" id="gcount">
								</div>
								<div class="form-group">
									<label for="gtype">商品类型:</label> <select class="form-control"
										id="gtype">
										<option disabled="" selected="" hidden="" value="">请选择商品类型</option>
										<option value="1">电脑</option>
										<option value="2">手机</option>
										<option value="3">服装</option>
										<option value="4">化妆品</option>
										<option value="5">其他</option>
									</select>
								</div>
								<div class="form-group">
									<label for="gdes">商品描述:</label> <input type="text"
										class="form-control" id="gdes">
								</div>

								<div
									style="position: relative; width: 400px; margin: 30px auto 0px;">

									<p>
										<input type="file" id="uploadFile" onchange="initUpload()">
									</p>

									<div class="progress" style="width: 400px;">
										<div class="progress-bar" role="progressbar" aria-valuenow=""
											aria-valuemin="0" aria-valuemax="100" style="min-width: 2em;">0%</div>
									</div>
									<div id="finishMessage"></div>
									<div
										style="width: 200px; height: 200px; padding: 5px; border: solid 1px #C1C1C1; border-radius: 3px">
										<img id="image" src=""
											style="width: 100%; height: 100%; opacity: 1">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" id="on" class="btn btn-primary"
										style="margin-left: 100px;" onclick="upload()">上架</button>
									<button type="reset" class="btn btn-primary"
										style="margin-left: 100px; margin-right: 100px;">重置</button>
									<button type="button" id="showdown" class="btn btn-primary"
										data-dismiss="modal">关闭</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<form id="form1" method="post">
					<table class="table table-striped" style="margin-top: 130px;">
						<thead>
							<tr>
								<th><input type="checkbox" onchange="checkAll()"
									id="checkmain"></th>
								<th>商品编号</th>
								<th>商品名称</th>
								<th>商品图片</th>
								<th>商品价格</th>
								<th>商品总数量</th>
								<th>出库数量</th>
								<th>商品类型</th>
								<th>商品描述</th>
								<th>商品状态</th>
								<th>上架时间</th>
							</tr>
						</thead>
						<tbody id="pageMain">
							<!--id="containet"-->


							<tr style="display: table-row;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="114"></td>
								<td class="yincang">1</td>
								<td class="yincang">软牛仔背带裙女夏新款韩版宽松洋气减龄吊带连衣裙套装两件套短款</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf12.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">59</a></td>
								<td class="yincang">123</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">香奈儿化妆品，9成新</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-16 14:30:32.0</td>
							</tr>
							<tr style="display: table-row;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="77"></td>
								<td class="yincang">2</td>
								<td class="yincang">运动裤</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf10.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">456</a></td>
								<td class="yincang">69</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">男士运动裤 上身好看</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-10 22:13:10.0</td>
							</tr>
							<tr style="display: table-row;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="76"></td>
								<td class="yincang">3</td>
								<td class="yincang">柒牌男装短袖T恤衫夏季青年男士翻领商务休闲t恤POLO</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf8.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">521</a></td>
								<td class="yincang">100</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">9成新</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-10 21:58:46.0</td>
							</tr>
							<tr style="display: table-row;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="69"></td>
								<td class="yincang">4</td>
								<td class="yincang">神州i7</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn5.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">3599</a></td>
								<td class="yincang">20</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">神州二手笔记本电脑，9成新</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 18:52:37.0</td>
							</tr>
							<tr style="display: table-row;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="53"></td>
								<td class="yincang">5</td>
								<td class="yincang">香奈儿山茶花五件套保湿补水护肤品</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp8.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">139</a></td>
								<td class="yincang">80</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">香奈儿化妆品，9成新</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:22:50.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="52"></td>
								<td class="yincang">6</td>
								<td class="yincang">香奈儿彩妆9件套彩妆初学者</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp7.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">239</a></td>
								<td class="yincang">70</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">香奈儿化妆品，9成新</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:22:06.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="51"></td>
								<td class="yincang">7</td>
								<td class="yincang">泊泉雅蜗牛水润化妆品套装</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp6.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">89</a></td>
								<td class="yincang">70</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">泊泉雅化妆品，9成新泊泉雅蜗牛水润化妆品套装</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:21:02.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="50"></td>
								<td class="yincang">8</td>
								<td class="yincang">麦吉丽4色立体腮红</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp5.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">59</a></td>
								<td class="yincang">90</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">麦吉丽化妆品，9成新麦吉丽4色立体腮红</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:19:35.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="49"></td>
								<td class="yincang">9</td>
								<td class="yincang">安利雅姿恒时凝颜</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp4.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">39</a></td>
								<td class="yincang">50</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">化妆品，9成新安利雅姿恒时凝颜</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:18:28.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="48"></td>
								<td class="yincang">10</td>
								<td class="yincang">苹果笔记本电脑 4英寸xc2 i7四核 16 512G</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn8.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">3299</a></td>
								<td class="yincang">20</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">苹果笔记本电脑 ,8成新苹果笔记本电脑 4英寸xc2 i7四核</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:15:54.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="47"></td>
								<td class="yincang">11</td>
								<td class="yincang">戴尔i7</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn7.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">3599</a></td>
								<td class="yincang">20</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">9成新戴尔i7</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:14:08.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="46"></td>
								<td class="yincang">12</td>
								<td class="yincang">衬衣雪纺连衣裙女夏短袖ol收腰显瘦衬衫裙</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf7.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">89</a></td>
								<td class="yincang">100</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">9成新衬衣雪纺连衣裙女夏短袖ol收腰显瘦衬衫裙</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 10:02:58.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="45"></td>
								<td class="yincang">13</td>
								<td class="yincang">iphonex</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/sj5.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">2999</a></td>
								<td class="yincang">30</td>
								<td class="yincang">1</td>
								<td class="yincang">手机</td>
								<td class="yincang">9成新iphonex</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 09:59:01.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="44"></td>
								<td class="yincang">14</td>
								<td class="yincang">iponex 银色 港澳版 64G</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/sj4.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">999</a></td>
								<td class="yincang">5</td>
								<td class="yincang">0</td>
								<td class="yincang">手机</td>
								<td class="yincang">8成新iponex</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 09:57:57.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="43"></td>
								<td class="yincang">15</td>
								<td class="yincang">华为荣耀10 幻夜黑 6G+64G 全网通</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/sj3.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">3999</a></td>
								<td class="yincang">100</td>
								<td class="yincang">0</td>
								<td class="yincang">手机</td>
								<td class="yincang">9成新，华为荣耀10 幻夜黑 6G+64G 全网通</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 09:56:51.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="42"></td>
								<td class="yincang">16</td>
								<td class="yincang">二手vivo</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/sj2.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">1599</a></td>
								<td class="yincang">20</td>
								<td class="yincang">0</td>
								<td class="yincang">手机</td>
								<td class="yincang">9成新二手vivo</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 09:55:47.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="41"></td>
								<td class="yincang">17</td>
								<td class="yincang">iphone7 plus</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/sj1.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">4999</a></td>
								<td class="yincang">400</td>
								<td class="yincang">0</td>
								<td class="yincang">手机</td>
								<td class="yincang">9成新，iphone7 plus</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 09:50:52.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="3"></td>
								<td class="yincang">18</td>
								<td class="yincang">COS女装 纯棉牛仔背带连衣裙白色2020春夏新品</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf2.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">129</a></td>
								<td class="yincang">150</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">牛仔裤。女装</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 07:38:35.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="1"></td>
								<td class="yincang">19</td>
								<td class="yincang">丝绸裙子</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf1.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">159</a></td>
								<td class="yincang">250</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">新款牌杭州真丝连衣裙女中长款重磅桑蚕丝修身丝绸裙子夏季</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 07:35:27.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="40"></td>
								<td class="yincang">20</td>
								<td class="yincang">免烫天丝棉 男士休闲裤男商务直筒宽松中年夏季薄款男西裤男裤子</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf9.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">109</a></td>
								<td class="yincang">20</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">8-7成新，免烫天丝棉 男士休闲裤男商务直筒宽松中年夏季薄款男西裤男裤子</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 00:31:56.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="39"></td>
								<td class="yincang">21</td>
								<td class="yincang">夏季亚麻短袖T恤套装</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf6.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">400</a></td>
								<td class="yincang">100</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">古风男装夏季亚麻短袖T恤套装
									中国风绣花刺绣唐装汉服棉麻体恤潮夏季亚麻短袖T恤套装夏季亚麻短袖T恤套装</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 00:08:41.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="38"></td>
								<td class="yincang">22</td>
								<td class="yincang">花花公子短袖衬衫</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf5.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">429</a></td>
								<td class="yincang">50</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">男夏季韩版潮修身休闲寸衫商务正装工男士白衬衣花花公子短袖衬衫</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 00:07:58.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="37"></td>
								<td class="yincang">23</td>
								<td class="yincang">惠普8740W i7</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn6.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">4500</a></td>
								<td class="yincang">20</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">便宜使用不久</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 00:06:43.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="36"></td>
								<td class="yincang">24</td>
								<td class="yincang">电脑戴尔m6500</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn4.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">4000</a></td>
								<td class="yincang">30</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">9成新电脑戴尔m6500</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 00:04:08.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="35"></td>
								<td class="yincang">25</td>
								<td class="yincang">Nars化妆品9件套</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp3.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">88</a></td>
								<td class="yincang">30</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">9成新，化妆品</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 00:02:10.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="34"></td>
								<td class="yincang">26</td>
								<td class="yincang">MD四件套</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp2.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">99</a></td>
								<td class="yincang">1</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">用了三天MD四件</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-08 00:00:06.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="33"></td>
								<td class="yincang">27</td>
								<td class="yincang">Mac口红</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp1.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">79</a></td>
								<td class="yincang">1</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">用了一，口红</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 23:58:05.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="32"></td>
								<td class="yincang">28</td>
								<td class="yincang">Angle化妆品</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/hzp.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">59</a></td>
								<td class="yincang">50</td>
								<td class="yincang">0</td>
								<td class="yincang">化妆品</td>
								<td class="yincang">用了三天，化妆品</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 23:56:33.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="31"></td>
								<td class="yincang">29</td>
								<td class="yincang">惠普i7四代独显</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn3.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">2599</a></td>
								<td class="yincang">30</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">8-7成新，惠普</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 23:55:02.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="30"></td>
								<td class="yincang">30</td>
								<td class="yincang">大屏粉色索尼sve15125ycp</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn2.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">1599</a></td>
								<td class="yincang">30</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">用了3个月，8-9成新</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 23:53:46.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="29"></td>
								<td class="yincang">31</td>
								<td class="yincang">超博惠普810</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/dn1.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">1599</a></td>
								<td class="yincang">20</td>
								<td class="yincang">0</td>
								<td class="yincang">电脑</td>
								<td class="yincang">惠普810</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 23:52:33.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="28"></td>
								<td class="yincang">32</td>
								<td class="yincang">ZABA裙女中长款连衣裙2020夏新款裙子潮</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf4.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">99</a></td>
								<td class="yincang">300</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">9成新，裙子</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 23:50:25.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="27"></td>
								<td class="yincang">33</td>
								<td class="yincang">TeenieWeenie小熊卡通牛仔背带裙女中长款连衣裙2020夏新款裙子潮</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/yf3.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">139</a></td>
								<td class="yincang">300</td>
								<td class="yincang">0</td>
								<td class="yincang">服装</td>
								<td class="yincang">裙子</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 23:43:38.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="26"></td>
								<td class="yincang">34</td>
								<td class="yincang">小米8</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/figure8.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">5999</a></td>
								<td class="yincang">450</td>
								<td class="yincang">0</td>
								<td class="yincang">手机</td>
								<td class="yincang">小米，手机</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 16:35:59.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="25"></td>
								<td class="yincang">35</td>
								<td class="yincang">小米6</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/figure6.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">3599</a></td>
								<td class="yincang">200</td>
								<td class="yincang">0</td>
								<td class="yincang">手机</td>
								<td class="yincang">小米，手机</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-07 14:49:14.0</td>
							</tr>
							<tr style="display: none;">
								<td class="yincang"><input type="checkbox" id="gid"
									name="com" value="2"></td>
								<td class="yincang">36</td>
								<td class="yincang">小米5</td>
								<td class="yincang"><img
									src="./OA_goods_query_files/figure1.jpg"></td>
								<td class="yincang"><a id="upprice" data-toggle="modal"
									data-target="#myModal1">2999</a></td>
								<td class="yincang">100</td>
								<td class="yincang">0</td>
								<td class="yincang">手机</td>
								<td class="yincang">全新，手机，小米</td>
								<td class="yincang">已上架<br>
								<select id="sel"><option>已入库</option>
										<option>上架</option>
										<option>下架</option></select></td>
								<td class="yincang">2020-07-05 00:37:54.0</td>
							</tr>
						</tbody>
					</table>
				</form>
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
			<div class="leftNav-item">
				<ul>
					<li title="点击回到页面顶部" class="for-top"><i
						class="iconfont iconfanhuidingbu"></i> <a href="javascript:;"
						class="rota">回到顶部</a></li>
					<li title="点击添加入库商品"><i class="iconfont iconnavicon-rkyw"></i>
						<a href="javascript:void(0)" data-toggle="modal"
						data-target="#myModal6" class=" rota">入库商品</a></li>
					<li title="点击查看出库信息"><i class="iconfont iconnavicon-ckyw"></i>
						<a href="javascript:void(0)" data-toggle="modal"
						data-target="#myModal3" class="rota" onclick="outLibrary()">出库信息</a>
					</li>
					<li title="点击修改信息"><i class="iconfont iconxiugai1"></i> <a
						href="javascript:void(0)" data-toggle="modal"
						data-target="#myModal2" class="rota" onclick="modalClose3()">修改信息</a>
					</li>
					<li title="点击删除商品"><i class="iconfont iconshanchu"></i> <a
						href="javascript:void(0)" onclick="del()" class="rota">删除商品</a></li>
					<li lay-data="img" data-fooc="../images/zizhu.png"><i
						class="iconfont iconshang"></i><a href="javascript:;" class="rota">小额打赏</a>
					</li>

				</ul>
			</div>
		</div>
	</div>
	<!--尾-->
	<div class="footer">
		<div class="container">
			<div class="footer-service">
				<ul class="clearfix">
					<li class="first"><a href="http://127.0.0.1:8080/YiYi/#">
							<i class="iconfont"></i> 预约维修服务
					</a></li>
					<li><a href="http://127.0.0.1:8080/YiYi/#"> <i
							class="iconfont"></i> 预约维修服务
					</a></li>
					<li><a href="http://127.0.0.1:8080/YiYi/#"> <i
							class="iconfont"></i> 预约维修服务
					</a></li>
					<li><a href="http://127.0.0.1:8080/YiYi/#"> <i
							class="iconfont"></i> 预约维修服务
					</a></li>
					<li><a href="http://127.0.0.1:8080/YiYi/#"> <i
							class="iconfont"></i> 预约维修服务
					</a></li>

				</ul>
			</div>
			<div class="footer-links clearfix">
				<dl class="col-links">
					<dt>帮助中心</dt>
					<dd>账户管理</dd>
					<dd>购物指南</dd>
					<dd>订单操作</dd>
				</dl>
				<dl class="col-links">
					<dt>帮助中心</dt>
					<dd>账户管理</dd>
					<dd>购物指南</dd>
					<dd>订单操作</dd>
				</dl>
				<dl class="col-links">
					<dt>帮助中心</dt>
					<dd>账户管理</dd>
					<dd>购物指南</dd>
					<dd>订单操作</dd>
				</dl>
				<dl class="col-links">
					<dt>帮助中心</dt>
					<dd>账户管理</dd>
					<dd>购物指南</dd>
					<dd>订单操作</dd>
				</dl>
				<dl class="col-links">
					<dt>帮助中心</dt>
					<dd>账户管理</dd>
					<dd>购物指南</dd>
					<dd>订单操作</dd>
				</dl>
				<dl class="col-links">
					<dt>帮助中心</dt>
					<dd>账户管理</dd>
					<dd>购物指南</dd>
					<dd>订单操作</dd>
				</dl>
				<div class="col-contact">
					<p class="iphone">400-100-10086</p>
					<p>
						周一至周日 8:00-18:00 <br> （仅收市话费）
					</p>
					<a href="http://127.0.0.1:8080/YiYi/#"> <i class="iconfont"></i>
						联系客服
					</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>