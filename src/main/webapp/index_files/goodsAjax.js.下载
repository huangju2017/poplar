$(document).ready(function () {
	
        $(".row-r").on("click",".figure a",function(){                
            var asrc = $(this).children("img").eq(0).attr("src");          
            var sendData = {
    				"asrc": asrc
    			};           
            $.post("servlet/productpage/productpage", sendData, function(data) {
            	//转换成JSON对象
            	var json = JSON.parse(data);
            	//alert(json.success);
            	if(json.success){
            		window.location.href="servlet/productpage/getdata"
            	}
            });
        });
});