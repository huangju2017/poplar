<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 引入核心标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						var goodsId = $(this).parent().parent().children()
								.first().children().val();
						/* alert(sel+" : "+goodsId); */
						var fromData = {
							"sel" : sel,
							"goodsId" : goodsId
						}
						$.post("${pageContext.request.contextPath}/goods?cmd=lowerOrUpper&flag=2",fromData, function(data) {
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
	$(document)
			.on(
					"click",
					"#on3",
					function() {
						var price = $(this).parent().parent().children()
								.first().children().last().val();

						alert(goodsId + price);
						var fromData = {
							"price" : price,
							"goodsId" : goodsId
						}
						var fromData = {
							"price" : price,
							"goodsId" : goodsId
						}
						$
								.post(
										"${pageContext.request.contextPath}/goods?cmd=changeGoods&flag=2",
										fromData,
										function(data) {
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
		form.action = "${pageContext.request.contextPath}/goods?cmd=deleteGoods&flag=2";
		form.submit();
	}

	$(function(){
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
		$
				.ajax({
					url : "${pageContext.request.contextPath}/goods?cmd=addGoods&flag=2",//请求服务器路径
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
							<form
								action="${pageContext.request.contextPath}/goods?cmd=changeGoods"
								method="post">
								<input type="text" class="goodsId" name="goodsID1">
								<div class="form-group">
									<label for="gname">商品名称:</label> <input type="text"
										class="form-control" id="gname1" name="gname1" value="">
								</div>
								<div class="form-group">
									<label for="gprice">商品价格:</label> <input type="text"
										class="form-control" id="gprice1" name="gprice1" value="">
								</div>
								<div class="form-group">
									<label for="gcount">商品数量:</label> <input type="text"
										class="form-control" id="gcount1 " name="gcount1" value="">
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
										class="form-control" id="gdes1" name="gdes1" value="">
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
								<th>商品类型</th>
								<th>商品描述</th>
								<th>商品状态</th>
								<th>上架时间</th>
							</tr>
						</thead>
						<tbody id="pageMain">
							<c:forEach items="${goods}" var="g" begin="0" step="1"
								varStatus="vs">

								<!--id="containet"-->


								<tr style="display: table-row;">
									<td class="yincang"><input type="checkbox" id="gid"
										name="com" value="${g.goodsId}"></td>
									<td class="yincang">${vs.count }</td>
									<td class="yincang">${g.goodsName}</td>
									<td class="yincang"><img
										src="${pageContext.request.contextPath}\image\/${g.goodsImg}"></td>
									<td class="yincang"><a id="upprice" data-toggle="modal"
										data-target="#myModal1">${g.goodsPrice}</a></td>
									<td class="yincang">${g.goodsNumber}</td>
									<td class="yincang">${g.goodsType}</td>
									<td class="yincang">${g.goodsContent}</td>
									<td class="yincang">${g.goodsStatus}<br> <select
										id="sel"><option>已入库</option>
											<option>上架</option>
											<option>下架</option></select></td>
									<td class="yincang">${g.dateTime}</td>
								</tr>
							</c:forEach>
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

</body>
</html>