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



	//品牌轮播
	var indexd=0;

	function add() {
		if (indexd<5){
			indexd = indexd+1;
			$('.wrapy-photo>div').attr('class','');
			$('.wrapy-photo>div').eq(indexd).attr('class','wp');
			$('.LBY>div').attr('class','wu');
			$('.LBY>div').eq(indexd).attr('class','logolb');
			$('.LBY>div').attr('class','wu');
			$('.LBY>div').eq(indexd).attr('class','logolb')
		}else if (indexd>=5 && indexd<8) {
            indexd = indexd + 1;
            $('.wrapy-photo>div').attr('class', '');
            $('.wrapy-photo>div').eq(indexd).attr('class', 'wp').show();
            $('.wrapy-photo>div').eq(indexd - 6).hide()
			$('.LBY>div').attr('class','wu');
			$('.LBY>div').eq(indexd).attr('class','logolb')
        }
    }
    function red() {
		if (indexd>3 && indexd<=8){
			indexd = indexd-1;
			$('.wrapy-photo>div').attr('class','');
			$('.wrapy-photo>div').eq(indexd).attr('class','wp');
			$('.LBY>div').attr('class','wu');
			$('.LBY>div').eq(indexd).attr('class','logolb')
		}else if(indexd>0 && indexd<=3){
			indexd = indexd-1;
			$('.wrapy-photo>div').attr('class','');
			$('.wrapy-photo>div').eq(indexd).attr('class','wp').show();
			$('.wrapy-photo>div').eq(indexd+6).hide()
			$('.LBY>div').attr('class','wu');
			$('.LBY>div').eq(indexd).attr('class','logolb')
		}
    }
	function timeInter () {
		if(indexd==8){
			indexd=0
			$('.wrapy-photo>div').eq(indexd).attr('class','wp').show();
			$('.wrapy-photo>div').slice(1,3).each(function () {
				$(this).show()
			})
			$('.wrapy-photo>div').slice(6,9).each(function () {
				$(this).hide()
			})
			$('.LBY>div').attr('class','wu');
			$('.LBY>div').eq(indexd).attr('class','logolb')
		}else {
			add()
		}
    }
    var timeP = setInterval(timeInter,1500)
	$('.wrapy-photo>div').click(function () {
		$('.wrapy-photo>div').attr('class','');
		$(this).attr('class','wp');
		indexd = $(this).index();
		$('.LBY>div').attr('class','wu');
		$('.LBY>div').eq(indexd).attr('class','logolb')
	});
	$('#redindex').click(function () {
		red()
	});
	$('#addindex').click(function () {
		add()
	});
	$('.LBY').hover(function () {
		clearInterval(timeP)
    },function () {
		timeP = setInterval(timeInter,1500)
    })
	$('.wrapy-nav').hover(function () {
		clearInterval(timeP)
    },function () {
		timeP = setInterval(timeInter,1500)
    })
})

