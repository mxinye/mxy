$(function(){
	$.get("shop.json",function(data){
		for(var i=0;i<data.length;i++){
			var obj=data[i];
			var li=$("<li></li>");			
			var a1=$("<a href='#'></a>");
			var img=$("<img />");			
			$(img).attr("src",obj.img);
			a1.append(img);
			var p=$("<p style='display:none'>"+obj.id+"</p>")
			var h6=$("<h6>"+obj.shop+"</h6>");
			var span=$("<span>"+obj.price+"</span>");
			var del=$("<del>"+obj.old_price+"</del>");
			var I=$("<i>"+obj.discount+"</i>");
			//var car=$("<a href='#'></a>");
			var CAR=$("<label>"+obj.cart+"</label>");
			//CAR.append(car);
			li.append(a1,h6,span,del,I,CAR,p);
			$(".m-content-top .m-mn ul").append(li);			
		} 						
		$(".m-content-top .m-mn li").mouseenter(function(){
			$(this).css("border-color","#CCCCCC").siblings().css("border-color","white")
		})
		$(".m-content-top .m-mn li").mouseleave(function(){
			$(".m-content-top .m-mn li").css("border-color","white")
		})
		
		
		/*-----------加入到购物车-------------*/
		$(".m-content-top .m-mn li label").click(function(){
			var goodsId = $(this).parent().find("p").html(); //商品ID
			var goodsName = $(this).parent().find("h6").html(); //商品名称
			var goodsPrice = $(this).parent().find("span").html(); //商品价格
			
			var goodsList = $.cookie("cart") ? JSON.parse( $.cookie("cart") ) : [];
			var isExists = false; //表示是否存在相同商品
				for (var i=0; i<goodsList.length; i++) {
					//如果存在相同的商品, 则把数量++, 不需要重新添加新的商品
					if (goodsId == goodsList[i].id) {
						goodsList[i].num++;
						isExists = true; //表示存在相同商品
					}
				}
				if (!isExists) {
						//添加一个新商品到购物车
						var goods = {
							id: goodsId,
							name: goodsName,
							price: goodsPrice,
							num: 1
						}
						goodsList.push(goods);
					}
			$.cookie("cart", JSON.stringify(goodsList), {expires:22, path:"/"});
			console.log( $.cookie("cart") );
		})
		
		
	})
	
	
})



