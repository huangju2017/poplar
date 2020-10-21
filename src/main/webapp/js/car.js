$(function(){
	function change_total(){
		var total_number = 0;
		var total_price = 0;
		$('.j-checkbox:checked').each(function(i,v){
			var number = parseInt($(v).closest('.item-box').find('.goods-num').val());
			total_number += number;
			var row_price = parseFloat($(v).closest('.item-box').find('.car-total').html());
			total_price += row_price;
		});
		$('.amount-sum em').html(total_number);
		total_price = total_price.toFixed(2);
		$('.price-sum em').html("￥" + total_price);
	}
	function accMul(arg1,arg2){
		var m = 0 ,s1 =arg1.toString(),s2=arg2.toString();
		try{ m += s1.split(".")[1].length} catch(e){}
		try{ m += s2.split(".")[1].length} catch(e){}
		return Number(s1.replace(".","")) * Number(s2.replace(".","")) / Math.pow(10,m)
	}
	
	Number.prototype.mul = function(arg){
		return accMul(arg,this);
	}
	$('#checkall').change(function(){
		console.log($(this).prop('checked'));
		$('.j-checkbox').prop('checked',$(this).prop('checked'));
		change_total()
	})
	$('.j-checkbox').change(function(){
		if($('.j-checkbox').length==$('.j-checkbox:checked').length){
			$('#checkall').prop('checked',true);
		}else{
			$('#checkall').prop('checked',false);
		}
		change_total();
	})
	$('.J_plus').click(function(){
		let n = $(this).siblings('input').val();
		n++;
		$(this).siblings('input').val(n);
		let price = $(this).parent().siblings('.car-price').text();
		$(this).parent().siblings('.car-total').text((parseFloat(price)).mul(n)+"元");
		getSum();
		change_total()
	})
	$('.J_minus').click(function(){
		let n = $(this).siblings('input').val();
		n--;
		if (n>=0) {
			$(this).siblings('input').val(n);
		}else{
			n=0;
			alert("商品不能是负数");
		}
		/*if (n==1) {
			return false;
		}
		n--;*/
		$(this).siblings('input').val(n);
		let price = $(this).parent().siblings('.car-price').text();
		$(this).parent().siblings('.car-total').text((parseFloat(price)).mul(n)+"元");
		getSum();
		change_total()
	})
	$('.goods-num').change(function(){
		let n=$(this).val();
		let price = $(this).parent().siblings('.car-price').text();
		$(this).parent().siblings('.car-total').text((parseFloat(price)).mul(n)+"元");
	})
	$('.car-action a').click(function(){
		var truthBeTold = window.confirm("单击“确定”继续。单击“取消”停止。");
		
		if (truthBeTold) {
			var goodsId = $(this).parent().parent().children(".t-check").children(".j-checkbox").val();
			
			var formdata = {
					"goodsId": goodsId
			};
			$.post("shoppingcarServlet?cmd=deleteShoppingcar",formdata,function(data){
				
				var json = JSON.parse(data);
				if(json.success){
					alert("删除成功");
				}
			});
			$(this).parent().parent().remove();
			
		} else{
			window.alert("再见啦！");
		}
		
		
		getSum();
		change_total();
	})
	$('.remove-batch').click(function(){
		$('.j-checkbox:checked').parent().parent().remove();
		getSum();
		change_total()
	})
	$('.clear-all').click(function(){
		$('.item-box').remove();
		getSum();
		change_total();
	})
	$('.goods-num').blur(function(){
		if($(this).val()==0 || $(this).val().length == 0 || $(this).val() < 0){
			alert("商品数量不能为空，也不能为负数哦~");
			$(this).val(1);
			let price = $(this).parent().siblings('.car-price').text();
			$(this).parent().siblings('.car-total').text(parseFloat(price)+"元");
		}
	});
	let getSum =() => {
		let [count,money]=[0,0];
		$('.goods-num').each((i,ele) => {
			count+=parseInt($(ele).val());
		})
		$('.amount-sum em').text(count);
		$('.car-total').each((i,ele) => {
			if (i>0) {
				money += parseFloat($(ele).text());
			}
		})
		$('.price-sum em').text('￥'+money.toFixed(2));
	}
	change_total()
})
