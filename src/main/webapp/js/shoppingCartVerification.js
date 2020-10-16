$(document).ready(function () {
		
        $(".shop a").on("click",function(){ 
        	var sum = $(".shop a span").text();
            $.post("servlet/productpage/shoppingCartVerification", function(data) {
            	//转换成JSON对象
            	var json = JSON.parse(data);
            	//alert(json.success);
            	if(json.success){
            		if(parseInt(sum) <= 0){
            			alert("您的购物车没有东西哦！");
            			return;
            		}
            		window.location.href="servlet/productpage/orderitem"
            	}else{
            		alert("请先登录");
            	}
            });
        });
       
});
$(function(){
	
	$.post("servlet/goods/load",function(data){
		var json = JSON.parse(data);
		var SJlists = json.SJlists;
		var FZlists = json.FZlists;
		var DNlists = json.DNlists;
		var HZPlists = json.HZPlists;
		for(i in SJlists){
			var SJ = SJlists[i];
			$(".u1").append("<li>"
					+"<div class='figure'><a href='javascript:void(0);'>"
					+"<img src='../"+ SJ.goodsPicUrl + "'></a>"
					+"</div>"
					+"<h3 class='title'>"
							+ SJ.goodsName
					+"</h3>"
					+"<p class='desc'>"+ SJ.goodsDescribe+"</p>"
					+"<p class='price'>"
						+"<span class='num'>"+ SJ.goodsPrice+"</span>元"
					+"</p>"
					+"<div class='flag flag-new'>新品</div></li>");
		}
		for(i in FZlists){
			var FZ = FZlists[i];
			$(".u4").append("<li>"
					+"<div class='figure'><a href='javascript:void(0);'>"
					+"<img src='../"+ FZ.goodsPicUrl + "'></a>"
					+"</div>"
					+"<h3 class='title'>"
							+ FZ.goodsName
					+"</h3>"
					+"<p class='desc'>"+ FZ.goodsDescribe+"</p>"
					+"<p class='price'>"
						+"<span class='num'>"+ FZ.goodsPrice+"</span>元"
					+"</p>"
					+"<div class='flag flag-new'>新品</div></li>");
		}
		for(i in DNlists){
			var DN = DNlists[i];
			$(".u2").append("<li>"
					+"<div class='figure'><a href='javascript:void(0);'>"
					+"<img src='../"+ DN.goodsPicUrl + "'></a>"
					+"</div>"
					+"<h3 class='title'>"
							+ DN.goodsName
					+"</h3>"
					+"<p class='desc'>"+ DN.goodsDescribe+"</p>"
					+"<p class='price'>"
						+"<span class='num'>"+ DN.goodsPrice+"</span>元"
					+"</p>"
					+"<div class='flag flag-new'>新品</div></li>");
		}
		for(i in HZPlists){
			var HZP = HZPlists[i];
			$(".u3").append("<li>"
					+"<div class='figure'><a href='javascript:void(0);'>"
					+"<img src='../"+ HZP.goodsPicUrl + "'></a>"
					+"</div>"
					+"<h3 class='title'>"
							+ HZP.goodsName
					+"</h3>"
					+"<p class='desc'>"+ HZP.goodsDescribe+"</p>"
					+"<p class='price'>"
						+"<span class='num'>"+ HZP.goodsPrice+"</span>元"
					+"</p>"
					+"<div class='flag flag-new'>新品</div></li>");
		}
		
	});
	numberShopping();
});
//购物车数量
var isEs = false;
function numberShopping(){
	$.get("servlet/productpage/loadIndex",function(data){
		if(data != null){
			var json = JSON.parse(data);
			isEs = json.success
			if(json.success){
				$(".shop a span").text(json.sum);
			}
		}
	});
}