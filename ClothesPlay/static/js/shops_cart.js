$(function(){
				
				var goodsList = $.cookie("cart");
				var AllSprice=0;
				if (goodsList) {
					
					goodsList = JSON.parse(goodsList);
					
					//console.log(goodsList);					
					for (var i=0; i<goodsList.length; i++) {						
						var goods = goodsList[i]; //每个商品
						//console.log(goods.price)
						var price=goods.price.slice(1,4);
						
						var Sprice=parseInt(price*goods.num);
						
						//创建节点
						var tr=$("<tr class='trnum'></tr>");
						var td1= $("<td>" + goods.id +"</td>")
						var td2= $("<td>" + goods.name +"</td>");
						var td3= $("<td style='color:deeppink'>" + goods.price +"</td>");
						var td4= $("<td>" + goods.num +"</td>");
						var td5=$("<td>"+Sprice+"</td>");
						var btn=$("<button class='del'>删除</button>");
						var td6=$("<td></td>");
						td6.append(btn);
						var btn1=$("<button class='plus'>+</button>");
						var btn2=$("<button class='minus'>-</button>")
						var td7=$("<td></td>");
						td7.append(btn1,btn2);
						tr.append(td1,td2,td3,td4,td5,td6,td7);
						$("#shopCar table tbody").append(tr);
						AllSprice=parseInt(AllSprice+Sprice);
						//console.log(AllSprice);
					}
					
				}
				//console.log(AllSprice)
				$("#shopCar table tfoot tr th span").html(AllSprice);
				$("#shopCar table tfoot tr th span").css({"color":"red","font-weight":700,"font-size":"20px"})
				$(".totle-money-text span").html(AllSprice+".00")
											
				//清除
				$("#shopCar table tbody .del").click(function(){
					//删除cookie
					var i=$(this).parent().parent().index();
					var a=i-1
					goodsList.splice(a,1);
					$.cookie("cart", "", {expires:0, path:"/"}); 
					$.cookie("cart", JSON.stringify(goodsList), {expires:22, path:"/"});
					var money=$(this).parent().parent().find("td").eq(4).html();
					
					/*价格跟着变*/
					AllSprice=parseInt(AllSprice-money);
					console.log(AllSprice);
					$("#shopCar table tfoot tr th span").html(AllSprice);
					$(".totle-money-text span").html(AllSprice+".00")
					$(this).parent().parent().remove();
				})
				
				/*商品数量加减*/
				var ALL=0;
				$("#shopCar table tbody .minus").click(function(){					
					var number_=parseInt($(this).parent().parent().find("td").eq(3).html());
					var unitPrice_=parseInt($(this).parent().parent().find("td").eq(2).html().slice(1,4));
					var total =unitPrice_*number_;
					number_--;
					if(number_<=1){
						number_=1;
					}
					$(this).parent().parent().find("td").eq(3).html(number_);
					total=total-unitPrice_;
					if(total<=0){
						total=0;
					}
					$(this).parent().parent().find("td").eq(4).html(total);					
					//console.log(SS);
					//ALL=total;
					//console.log(ALL);
					//$("#shopCar table tfoot tr th span").html(ALL);
					setTotal();
					var i=$(this).index();
					var a=i;
					console.log(a);
					goods.num=number_;		
					$.cookie("cart","",{expires:0,path:"/"});
					$.cookie("cart",JSON.stringify(goodsList),{expires:20,path:"/"});
					console.log($.cookie("cart"));
					
				})
				
				$("#shopCar table tbody .plus").click(function(){					
					var number_=parseInt($(this).parent().parent().find("td").eq(3).html());
					var unitPrice_=parseInt($(this).parent().parent().find("td").eq(2).html().slice(1,4));
					var total =unitPrice_*number_;
					number_++;					
					$(this).parent().parent().find("td").eq(3).html(number_);
					total=total+unitPrice_;					
					$(this).parent().parent().find("td").eq(4).html(total);
					//ALL=total;
					//console.log(ALL);
					//$("#shopCar table tfoot tr th span").html(ALL);
					setTotal();
					var i=$(this).index();
					var a=i;
					console.log(a);
					goods.num=number_;		
					$.cookie("cart","",{expires:0,path:"/"});
					$.cookie("cart",JSON.stringify(goodsList),{expires:20,path:"/"});
					console.log($.cookie("cart"));
					
				})
				//遍历每件商品
				function setTotal(){
					var s=0;
					$(".trnum").each(function(){
						var count=$(this).find("td").eq(2).html().slice(1,4);
						s+=parseInt($(this).find("td").eq(3).html()*count)
					})
					$("#shopCar table tfoot tr th span").html(s);
					$("#totalPrice").html(s+".00");
					console.log(s)
				}
				//setTotal();
})
