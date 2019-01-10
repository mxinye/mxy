$(function(){
	$(".shop_con .shop_news .shop_style .shop_color span").mouseenter(function(){
		$(".shop_con .shop_news .shop_style .shop_color span").css("border-color","#F10582")		
	})	
	
	$(".shop_con .shop_news .shop_style .shop_color span").mouseleave(function(){
		$(".shop_con .shop_news .shop_style .shop_color span").css("border-color","#c7c7c7")		
	})
	$(".shop_con .shop_news .shop_style .shop_color span").click(function(){
		$(".shop_con .shop_news .shop_style .shop_color span").mouseleave(function(){
			$(".shop_con .shop_news .shop_style .shop_color span").css({"border-color":"#f10582","color":"#eb2323"})
		})
		$(".shop_con .shop_news .shop_style .shop_color span").css({"border-color":"#f10582","color":"#eb2323"})		
	})	
	$(".shop_con .shop_news .shop_style .shop_size span").click(function(){		
		$(this).css({"border-color":"#F10582","color":"#eb2323"}).siblings().css({"border-color":"#c7c7c7","color":"#7a7a7a"})
	})
	           /* --------     放大镜     -------------     */
	
	
	$(".shop_show .small_shop li").mouseenter(function(){
		var index=$(this).index()
		console.log(index)
		$(".shop_show .big_shop ").find("img").eq(index).css("display","block").siblings().css("display","none")
		$(".fdj ").find("img").eq(index).css("display","block").siblings().css("display","none")
	})
	$(".shop_show .big_shop").mouseenter(function(){
		$(".fdj").show();
		$(".shop_con .shop_show .magnifier").show();
	})
	$(".shop_show .big_shop").mouseleave(function(){
		$(".fdj").hide();
		$(".shop_con .shop_show .magnifier").hide()
	})
		
	var _smallImg = $(".big_shop"); //小图
	var _smallArea = $(".magnifier"); //小区域
	var _bigImg = $(".fdj img"); //大图
	var _bigArea = $(".fdj"); //大区域			
				
		var scale = 2						
		//鼠标移动
		_smallImg.mousemove(function(e){					
			_smallArea.show(); //显示小区域
					
					//移动小区域, 跟随鼠标移动
					var x = e.pageX - _smallImg.offset().left - _smallArea.width()/2;
					var y = e.pageY - _smallImg.offset().top - _smallArea.height()/2;
					
					//判断x不超出左边界,也不超出右边界
					if (x < 0) {
						x = 0;
					}
					else if (x > _smallImg.width() - _smallArea.width()) {
						x = _smallImg.width() - _smallArea.width();
					}
					
					//判断y不超出上边界,也不超出下边界
					if (y < 20) {
						y = 20;
					}
					else if (y > _smallImg.height() - _smallArea.height()+20) {
						y = _smallImg.height() - _smallArea.height()+20;
					}
					
					_smallArea.css({left: x, top: y});		
					
					//移动大图
					_bigImg.css({left: -x*scale, top: -y*scale+34});
									
				})
				
				//鼠标移出
				_smallImg.mouseleave(function(){
					_smallArea.hide(); //隐藏小区域
				})
				
					
				
		

})
