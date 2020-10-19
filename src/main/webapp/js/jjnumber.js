$(function() {
	totalPrice();
});
function adder() {
	var count = document.getElementById("countnum").innerHTML;
	count = parseInt(count) + 1;
	document.getElementById("countnum").innerHTML = count;
	totalPrice();

}

function minuser() {
	var count = document.getElementById("countnum").innerHTML;
	if (count <= 0) {
		count = 0;
	} else {
		count = parseInt(count) - 1;
	}
	document.getElementById("countnum").innerHTML = count;
	totalPrice();
}
function totalPrice() {
	var count = document.getElementById("countnum").innerHTML;

	var price = $(".goods-jg span a").text();
	var pr = parseFloat(price);
	pr = pr.toFixed(1);

	var sum = parseFloat(parseInt(count) * pr);

	sum = sum.toFixed(1);

	$(".sum").text(sum);

}

function addorderitem() {
	/*alert("addorderitem");*/
	var kc = parseInt($(".kc").text());
	/*alert("kc"+kc);*/
	var count = parseInt($("#countnum").text());
	/*alert("coutnum"+count);*/
	var sum = parseInt($(".sum").text());
	/*alert("sum"+sum);*/
	var goodsid = parseInt($("#gid").text());
	/*alert("goodsid"+goodsid);*/
	if (count <= kc && kc != 0 && sum != 0) {

		var senData = {
			"count" : count,
			"sum" : sum,
			"goodsid" : goodsid
		};

		$.post("shoppingcarServlet?cmd=addShoppingCar", senData,
				function(data) {
					var json = JSON.parse(data);
					if (json.success) {
						alert("该商品成功加入购物车");
					} else {
						alert("请先登录");
					}
				})
	} else {
		alert("注意！商品数量不能超过库存数量 或 商品数量不能为0 ！！！");
	}
}
