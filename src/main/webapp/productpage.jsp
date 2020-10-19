<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0042)http://127.0.0.1:8080/YiYi/productpage.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://127.0.0.1:8080/YiYi/">--><base href=".">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./productpage_files/reset.css">
		<link rel="stylesheet" type="text/css" href="./productpage_files/fonts.css">
		<link rel="stylesheet" type="text/css" href="./productpage_files/iconfont.css">
		<link rel="stylesheet" type="text/css" href="./productpage_files/index.css">
		<link rel="stylesheet" type="text/css" href="./productpage_files/pinglun.css"> 
		<link rel="stylesheet" type="text/css" href="./productpage_files/productpage.css">
		<script src="./productpage_files/jquery-3.5.1.min.js.下载" type="text/javascript" charset="utf-8"></script>
		<script src="js/jjnumber.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/shoppingCartVerification1.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		$(function(){
			$.post("servlet/comment/goodsComment",function(data){
				var json=JSON.parse(data);
				if (json.success) {	
					var commentlist=json.commentlist;
					for(i in commentlist){
						var comment=commentlist[i];
						$("#comment").append(
							"<div>"
							+"<img src='images/touxiang.jpg' style='width: 63px;height: 63px '>"
							+"<p style='margin-left: 67px; margin-top: -50px;'>"+comment.name+"</p>"
							+"<p style='margin-left: 67px; margin-top: 10px;'>"+comment.commentDateTime+"</p>"
							+"<div class='pl-text'>"
							+"<div class='pl' >"+comment.comment+"</div>"
							+"</div>"
							+"</div>"
							
						);
					}
				}
				
			});
	})
	function send(){
		var Comment=$("#Comment").val();
		 var fromdata={
				"Comment":Comment
		}
		$.post("servlet/comment/add",fromdata,function(data){
			var json=JSON.parse(data);
			if(json.success){
				window.location.href = "productpage.jsp";
			}
			else{
				alert("请先登录");
			}
		}) 
	}
	/**
	 * 打开或关闭个人中心菜单
	 */
	function personalToggle() {
		var personal = document.getElementById("personal");
		if(personal.style.display=="block") {
			personal.style.display = "none";
		} else {
			personal.style.display = "block";
		}
	}
	//立即购买
	function gm(){
		
		if($('.sum').text()=="0.0"){
			alert("零个商品不能购买");
			return;
		}
		//获取商品id
		var gid = $("#gid").text();
		//获取商品名
		var gname = $("#gname").text();
		//获取商品价格
		var gprice = $("#gprice").text();
		//获取物品数量
		var countnum = $("#countnum").text();
		
		$.post("servlet/order/buyNow",{"goodsid":gid,"goodsname":gname,"goodsprice":gprice,"countnum":countnum},function(data){
			var json = JSON.parse(data);
			if(json.ok){
				window.location.href = "Order.jsp";
			}
		});
	}
	</script>
</head>
<body>
	
<!-- 顶部栏 -->
		<div class="topBar">
			<div class="container">
				<div class="topBar_list">
					<a href="index.jsp">易易商城</a>
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/#">云服务</a>
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/#">金融</a>
					<span>|</span>					
					<a href="http://127.0.0.1:8080/YiYi/#">资质证照</a>
					<span>|</span>
			
					<a href="http://127.0.0.1:8080/YiYi/sellerLogin.jsp">Merchant OS</a>
			
					<span>|</span>
					<a href="http://127.0.0.1:8080/YiYi/OA_adminLogin.jsp">Admin OS</a>
					<span>|</span>
				</div>
				<div class="shop">
					<a href="javascript:void(0);">
						<i class="iconfont" style="font-size: 14px;"></i>
						购物车(<span style="color: white;">0</span>)
					</a>
				</div>

				 游客登陆 
				 <div class="login">
				<a href="${pageContext.request.contextPath }/userLogin.jsp">登录</a>
				<span>|</span>
				<a href="${pageContext.request.contextPath }/userRegist.jsp">注册</a>
				<span>|</span>
				<a href="${pageContext.request.contextPath }/#">消息通知</a>
				</div> 
				

			</div>
		</div>
		<!-- 导航栏 -->
		<div class="header">
			<div class="container">
				<div class="site-logo">
					<a href="index.jsp">
						<img src="./productpage_files/yilogo.jpg">
					</a>
				</div>
				<div class="site-list">
					<ul class="clearfix">
						<li class="site-category">
							<a href="http://127.0.0.1:8080/YiYi/"></a>
							<!-- 侧边栏 -->

						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#cellphone">手机</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">耳机</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">IPad</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">笔记本电脑</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">家电</a>
						</li>

						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">路由器</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">智能硬件</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">服务</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">社区</a>
						</li>
					</ul>
				</div>
				<div class="site-search">
					<form action="http://127.0.0.1:8080/YiYi/">
						<input type="text" name="shop" class="search-text">
						<input type="submit" class="search-btn iconfont" value="" style="font-size: 24px;">
						<div class="search-word">
							<a href="http://127.0.0.1:8080/YiYi/#">小米9</a>
							<a href="http://127.0.0.1:8080/YiYi/#">小米9 SE</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 主页内容 -->
		<div class="head-box">
			<div class="top-box-tit">
				<div class="main">
					<!-- <h2>小米无线充电宝青春版10000mAh</h2>-->
					<a href="http://127.0.0.1:8080/YiYi/#pingjia">用后评价</a>
				</div>
			</div>
			<div class="box-abc">
			
				<div class="main-left">
					<img class="" src="${pageContext.request.contextPath}\image\/${productpage.goodsImg}">
				</div>
				<div class="main-rehit">
				<div class="goods-tit">
						<h2 id="gname">${productpage.goodsName}</h2>
						<h2 hidden="hidden" id="gid">${productpage.goodsId}</h2>
						<p>${g.goodsContent}</p>
						<div class="goods-kc">
							<span><a>商品库存</a><span class="kc">${productpage.goodsNumber}</span>件</span>
						</div>
						<div class="goods-jg">
							<span><a id="gprice">${productpage.goodsPrice}</a>元</span>
						</div>
					</div>
					<hr>
					<div class="xian"></div>
					<div class="diz">
						<div class="dz">
							<i class="iconfont"></i>
							
							<span class="">暂无地址</span>
							
							<a href="http://127.0.0.1:8080/YiYi/">修改</a>
						</div>
						<div class="xh">
						
							<span class="">有现货</span>
							
						</div>
					</div>
					<div class="xzcolor">
						选择商品
					</div>
					<div class="goodsnumber">
						　<ul class="counter">
							<li id="minus"><input type="button" onclick="minuser()" value="-"></li>
							<li id="countnum">1</li>
							<li id="plus"><input type="button" onclick="adder()" value="+"></li>
						</ul>
					</div>
					<script src="js/jjnumber.js" type="text/javascript" charset="utf-8"></script>
					<div class="good-price">
						<span><a>共计：</a><a class="sum">2999.0</a>元</span>
					</div>
					<div class="gandc">
						<input type="button" class="jr" name="" id="" value="加入购物车" onclick="addorderitem()">
						<input type="button" class="gm" name="" id="" value="立即购买" onclick="gm()">
					</div>
				</div>
				
			</div>
		</div>
		<style type="text/css">
					.comment-tit .tit{
						width: 1226px;
					}
		</style>
		<div class="comment-top">
			<div class="bt" id="pingjia">
				<span>商品评论</span>
			<!-- <button onclick="javascript:document.getElementById(&#39;Comment&#39;).scrollIntoView()" style="margin-left: 85em ;width: 7em;height: 3em ;border-radius: 5px;">马上评论</button> -->
		 </div>
		<div class="comment-tit">
			<div class="tit">
			<div class="tit-top" id="comment">
			<div><img src="./productpage_files/touxiang.jpg" style="width: 63px;height: 63px "><p style="margin-left: 67px; margin-top: -50px;">钟南山</p><p style="margin-left: 67px; margin-top: 10px;">2020-07-17 04:22:14.0</p><div class="pl-text"><div class="pl"></div></div></div><div><img src="./productpage_files/touxiang.jpg" style="width: 63px;height: 63px "><p style="margin-left: 67px; margin-top: -50px;">zms</p><p style="margin-left: 67px; margin-top: 10px;">2020-07-16 23:09:58.0</p><div class="pl-text"><div class="pl">手机真的好用</div></div></div></div>
			</div>
		</div>
		<div>
			<textarea name="Comment" id="Comment" placeholder="请在此输入评论内容" style="width: 1250px; 
			height: 300px; margin-left:50px ; padding: 10px; margin-top: 50px;
			font-size: 30px;"></textarea>
		<br>
		<button onclick="send()" style="padding: 15px; 
		background-color:dodgerblue ;
		margin-left: 40em;border-radius: 5px; color: aliceblue;">发表评论
		</button>
		</div>
		</div>
		
		<!-- 脚部 -->
		<div class="footer">
			<div class="container">
				<div class="footer-service">
					<ul class="clearfix">
						<li class="first">
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i>
								购物指南
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i>
								合作招商
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i>
								营销中心
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
								<i class="iconfont"></i>
								商家帮助
							</a>
						</li>
						<li>
							<a href="http://127.0.0.1:8080/YiYi/#">
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
						<a href="http://127.0.0.1:8080/YiYi/#">
							<i class="iconfont"></i>
							联系客服
						</a>
					</div>
				</div>
			</div>
		</div>

</body></html>