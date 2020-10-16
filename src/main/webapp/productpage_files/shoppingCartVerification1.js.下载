$(document).ready(function () {
	
        $(".shop a").on("click",function(){                
            
            $.post("servlet/productpage/shoppingCartVerification", function(data) {
            	//转换成JSON对象
            	var json = JSON.parse(data);
            	//alert(json.success);
            	if(json.success){
            		window.location.href="servlet/productpage/orderitem"
            	}else{
            		alert("请先登录");
            	}
            });
        });
       
});
$(function(){
	$.get("servlet/productpage/loadIndex",function(data){
		
		var json = JSON.parse(data);
		if(json.success){
			$(".shop a span").text(json.sum);
		}
	});
	
})