$(function(){
	$.get("aaa1.json",function(data){
		var dataone=data[0];
		for(var i=0;i<dataone.length;i++){
			var obj =dataone[i];
			var div=$("<div></div>");
			var a = $("<a href='#'></a>");
			var img=$("<img />");
			$(img).attr("src",obj.img);
			a.append(img);
			var h6=$("<h6>"+obj.shop+"</h6>");
			var h4=$("<h4>"+obj.price+"</h4>");	
			div.append(a,h6,h4);
			$(".m-content-man .DIV").eq(0).append(div);			
			if (i == 0) {
				img.css({"width":"407px","height":"613px"})
				div.css("position","relative")
				h6.css({
					"position":"absolute","left":"0px","bottom":"30px"
				})
				h4.css({
					"position":"absolute","left":"0px","bottom":"10px"
				})
			}
			if(i!=0){
				div.addClass("lbt_div_style1");
				
			}
		}
		var datatwo=data[1];
		for(var i=0;i<datatwo.length;i++){
			var obj =datatwo[i];
			var div=$("<div></div>");
			var a = $("<a href='#'></a>");
			var img=$("<img />");
			$(img).attr("src",obj.img);
			a.append(img);
			var h6=$("<h6>"+obj.shop+"</h6>");
			var h4=$("<h4>"+obj.price+"</h4>");	
			div.append(a,h6,h4);
			$(".m-content-man .DIV").eq(1).append(div);			
			if (i == 0) {
				img.css({"width":"407px","height":"614px"})
				div.css("position","relative")
				h6.css({
					"position":"absolute","left":"0px","bottom":"30px"
				})
				h4.css({
					"position":"absolute","left":"0px","bottom":"10px"
				})
			}
			if(i!=0){
				
				div.addClass("lbt_div_style1");
				
			}
		}
		var datathree=data[2];
		for(var i=0;i<datathree.length;i++){
			var obj =datathree[i];
			var div=$("<div></div>");
			var a = $("<a href='#'></a>");
			var img=$("<img />");
			$(img).attr("src",obj.img);
			a.append(img);
			var h6=$("<h6>"+obj.shop+"</h6>");
			var h4=$("<h4>"+obj.price+"</h4>");	
			div.append(a,h6,h4);
			$(".m-content-man .DIV").eq(2).append(div);			
			if (i == 0) {
				img.css({"width":"407px","height":"614px"})
				div.css("position","relative")
				h6.css({
					"position":"absolute","left":"0px","bottom":"30px"
				})
				h4.css({
					"position":"absolute","left":"0px","bottom":"10px"
				})
			}
			if(i!=0){
				
				div.addClass("lbt_div_style1");
				
			}
		}
		var datafour=data[3];
		for(var i=0;i<datafour.length;i++){
			var obj =datafour[i];
			var div=$("<div></div>");
			var a = $("<a href='#'></a>");
			var img=$("<img />");
			$(img).attr("src",obj.img);
			a.append(img);
			var h6=$("<h6>"+obj.shop+"</h6>");
			var h4=$("<h4>"+obj.price+"</h4>");	
			div.append(a,h6,h4);
			$(".m-content-man .DIV").eq(3).append(div);			
			if (i == 0) {
				img.css({"width":"407px","height":"614px"})
				div.css("position","relative")
				h6.css({
					"position":"absolute","left":"0px","bottom":"30px"
				})
				h4.css({
					"position":"absolute","left":"0px","bottom":"10px"
				})
			}
			if(i!=0){
				
				div.addClass("lbt_div_style1");
				
			}
		}
	})
	
	
	
	
	var i=0;

	$(".m-content-con1 .m-content-wrapx1 .m-content-tab1 .ul2 li").mouseenter(function(){
		$(this).removeClass("z-crt1").addClass("z-crt1").siblings().removeClass("z-crt1");
		var index=$(this).index()
		if(index==0){
			$(".m-content-man .DIVS").stop().animate({left:'0px'},"slow")
		} 
		else if(index==1){
			$(".m-content-man .DIVS").stop().animate({left:'-1190px'},"slow")
		}
		else if(index==2){
			$(".m-content-man .DIVS").stop().animate({left:'-2380px'},"slow")
		}
		else if(index==3){
			$(".m-content-man .DIVS").stop().animate({left:'-3570px'},"slow")
		}
		i = index;
	})
	$(".m-content-man").mouseenter(function(){
		$(".m-content-man .prev2").css("display","block");
		$(".m-content-man .next2").css("display","block");		
	})
	$(".m-content-man").mouseleave(function(){
		$(".m-content-man .prev2").css("display","none");
		$(".m-content-man .next2").css("display","none");		
	})
 	function move(){
 		if(i<0){
 			$(".m-content-man .DIVS").css("left",0);
 			i=0;
 		}
 		if(i>=4){
 			$(".m-content-man .DIVS").animate({left:0},"fast");
 			i=0;
 		}
 		$(".m-content-man .DIVS").stop().animate({left:-i*1190},500);
 		$(".m-content-con1 .m-content-wrapx1 .m-content-tab1 .ul2 li").eq(i).removeClass("z-crt1").addClass("z-crt1").siblings().removeClass("z-crt1");
 	}
 	$(".prev2").click(function(){
 		i--;
 		move();
 		console.log(i);
 	})
 	$(".next2").click(function(){
 		i++;
 		move();
 		console.log(i);
 	})
})