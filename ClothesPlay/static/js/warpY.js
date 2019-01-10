$(function(){		
	$.get("warpY.json",function(data){
		for(var i=0;i<data.length;i++){
			var obj =data[i];
			var a1=$("<a href=''></a>");
			a1.css("display","block");
			var img=$("<img />");
			$(img).attr("src",obj.img);		
			a1.append(img);
			$(".m-content-con .m-content-wrapy .wrapy-nav .wrapy-photo").append(a1);
			if(i==0){
				a1.addClass("wrapy-nav_border")
			}
		}
		var i=0;
		var index;
		$(".m-content-con .m-content-wrapy .wrapy-nav .wrapy-photo a").mouseenter(function(){
			$(this).addClass("wrapy-nav_border").siblings().removeClass("wrapy-nav_border")	
			 index=$(this).index();
			 clearInterval(timer);
			$(".wrapy .LBY").stop().animate({"top":-index*538},"slow")
		})
		var timer =setInterval(function(){
			i++;
			if(i>5){
				i=0;
			}
			var TOP=$(".wrapy .LBY").position().top
			if(TOP<-2152){	
				$(".wrapy .LBY").stop().animate({"top":0},"fast");
				$(".m-content-con .m-content-wrapy .wrapy-nav .wrapy-photo a").eq(0).addClass("wrapy-nav_border").siblings().removeClass("wrapy-nav_border")
				TOP=0;
			}
			else{
				$(".wrapy .LBY").stop().animate({"top":"-=538"},"slow")
				$(".m-content-con .m-content-wrapy .wrapy-nav .wrapy-photo a").eq(i).addClass("wrapy-nav_border").siblings().removeClass("wrapy-nav_border")
			}
			
		},3000)
		$(".m-content-con .m-content-wrapy .wrapy-nav .wrapy-photo a").mouseleave(function(){
			clearInterval(timer);
			timer =setInterval(function(){
				index++;
				console.log(index)
				if(index>5){
					index=0;
				}
				var TOP=$(".wrapy .LBY").position().top
				if(TOP<-2152){
					$(".wrapy .LBY").stop().animate({"top":0},"fast");
					$(".m-content-con .m-content-wrapy .wrapy-nav .wrapy-photo a").eq(0).addClass("wrapy-nav_border").siblings().removeClass("wrapy-nav_border")
					TOP=0;
				}
				else{
					$(".wrapy .LBY").stop().animate({"top":"-=538"},"slow")
					$(".m-content-con .m-content-wrapy .wrapy-nav .wrapy-photo a").eq(index).addClass("wrapy-nav_border").siblings().removeClass("wrapy-nav_border")
				}				
			},3000)
			
		})
	})
	
	
})
