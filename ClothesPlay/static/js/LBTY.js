$(function(){
	$.get("LBTY.json",function(data){
		for(var i=0;i<data.length;i++){
			var obj=data[i];
			var A=$("<a href=''></a>");
			var img=$("<img />");
			A.css("display","block");
			$(img).attr("src",obj.img);
			A.append(img);
			$(".m-content-con .m-content-wrapy .wrapy .LBY").append(A);
		}
		
	})
	
	
	
})
