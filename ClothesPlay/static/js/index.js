$(function(){
	/*导航栏菜单的*/
	$(".m_nav .alltype").mouseenter(function(){
		$(".m-sub-nav").css("display","block")		
	})
	$(".m_nav .alltype").mouseleave(function(){
		$(".m-sub-nav").css("display","none")		
	})
	$(".m-sub-nav dl").eq(0).mouseenter(function(){	
		$(this).css("background","#F5F5F5").siblings().css("background","#fff");
		$(".more-type1").css("display","block");
		$(".more-type2,.more-type3,.more-type4").css("display","none")
	})	
	$(".m-sub-nav dl").eq(1).mouseenter(function(){
		$(this).css("background","#F5F5F5").siblings().css("background","#fff");
		$(".more-type2").css("display","block")
		$(".more-type1,.more-type3,.more-type4").css("display","none")
	})	
	$(".m-sub-nav dl").eq(2).mouseenter(function(){
		$(this).css("background","#F5F5F5").siblings().css("background","#fff");
		$(".more-type3").css("display","block")
		$(".more-type1,.more-type2,.more-type4").css("display","none")
	})	
	$(".m-sub-nav dl").eq(3).mouseenter(function(){
		$(this).css("background","#F5F5F5").siblings().css("background","#fff");
		$(".more-type4").css("display","block")
		$(".more-type1,.more-type2,.more-type3").css("display","none")
	})
	
	
	/*轮播图*/
	var i = 0;
	var timer=0;
	function show_timer() {
		timer = setInterval(function() {
			i++;
			if (i>1) {
				i=0;
			}
			$(".m-con .m-mad div").stop().animate({
				top: -i * 380
			}, 300);
			$(".m-mad-num p a").eq(i).removeClass().addClass("active").siblings().removeClass("active");
		}, 5000)
	}
	//	启动定时器，初始化
	show_timer();
	$(".m-mad-num p a").mouseenter(function(){
		clearInterval(timer);
		$(this).removeClass("active").addClass("active").siblings().removeClass("active")
		var index=$(this).index();
		$(".m-con .m-mad div").stop().animate({top:-index*380},300);
	})
	$(".m-mad-num p a").mouseleave(function(){		
			clearInterval(timer);
			i==0 ?"": i++;
			show_timer();
	})
	  
})
