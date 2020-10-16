$(function(){
				<!--分页 -->
				$.get("servlet/goods/query",function(data){
					var json = JSON.parse(data);
					if(json.success){
						var goodslist = json.goodslist;
						for(i in goodslist){
							var goods = goodslist[i];
							var coun = parseInt(i)+1;
							
							$("#pageMain").append(
									"<tr>"
									+"<td class='yincang'><input type='checkbox' id='gid' name='com' value='"+goods.goodsID+"'/></td>"
									+"<td class='yincang'>"+coun+"</td>"
									+"<td class='yincang'>"+goods.goodsName+"</td>"
									+"<td class='yincang'><img src='../"+goods.goodsPicUrl+"'></td>"
									+"<td class='yincang'><a id='upprice' data-toggle='modal' data-target='#myModal1'>"+goods.goodsPrice +"</a></td>" 
									+"<td class='yincang'>"+goods.goodsAmount +"</td>"
									+"<td class='yincang'>"+goods.outLibraryNumber +"</td>"
									+"<td class='yincang'>"+goods.goodsClass +"</td>"
									+"<td class='yincang'>"+goods.goodsDescribe +"</td>"
									+"<td class='yincang'>"
										+goods.goodsState
										+"</br><select id='sel'>"
											+"<option >已入库</option>"
											+"<option >上架</option>"
											+"<option>下架</option>"
										+"</select>"
									+"</td>"
									+"<td class='yincang'>"+goods.goodsUptime+"</td>"
								+"</tr>"
							);
						}
						fenye(); 	
					}else{
						$("#pageMain").append(
								"<tr colspan='10'>暂时没有获取数据！</tr>"
						);
					}
					 
				});
			});
<!--首页分页 -->
function fenye() {
	var tabPage;
    tabPage({
        pageMain: '#pageMain',
        pageNav: '#pageNav',
        pagePrev: '#prev',
        pageNext: '#next',
        curNum: 5,
        /*每页显示的条数*/
        activeClass: 'active',
        /*高亮显示的class*/
        ini: 0 /*初始化显示的页面*/
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
        pageNav.find("a").each(function() {
            $(this).click(function() {
                pageNav.find("a").removeClass(tabPage.activeClass);
                $(this).addClass(tabPage.activeClass);
                iNum = $(this).index();
                $(pageMain).find("tr").hide();
                for (var i = ($(this).html() - 1) * curNum; i < ($(this).html()) * curNum; i++) {
                    $(pageMain).find("tr").eq(i).show()
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

