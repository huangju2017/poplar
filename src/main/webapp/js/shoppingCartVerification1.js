$(document).ready(function () {
	
        $(".shop a").on("click",function(){                
        	
            $.post("shoppingcarServlet?cmd=showShoppingCarValidate", function(data) {
            	//转换成JSON对象
//            	alert("jjj");
            	var json = JSON.parse(data);
/*            	alert("shopc:"+${showShoppingCars});
*/            	//alert(json.success);
            	if(json.success){
            		window.location.href="shoppingcarServlet?cmd=showShoppingCar";
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