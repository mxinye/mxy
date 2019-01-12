$(function () {
        // var money = parseInt($('.TTM-all-money>span').html());
        // 获取商品数
        var check = $('.good_s');
        check.change(function () {
            //小计
            money = parseInt($('.TTM-all-money>span').html())
            //单价
            var price_good = $(this).parent().parent().find('td').eq(4).html();
            //判断是否被选中
            if ($(this).prop('checked')==true){
                money = parseInt(price_good)+money;
            }else if($(this).prop('checked')==false){
                money = money-parseInt(price_good);
            }
            $('.TTM-all-money>span').html(money+'.00');
            $('#totalPrice').html(money+'.00');
        });
        //减少商品数量
        $('.prev').click(function () {
            // 获取商品数
            var goodnum = $(this).siblings('.num').val();
            //如果商品数为1时，不改变商品数
            if (goodnum==1){

            }else{
                // 获取商品数-1
                $(this).siblings('#num').val(parseInt(goodnum)-1);
                //单价
                goodprice = $(this).parent().parent().find('td').eq(2).html();
                // 获取商品数
                goodnum = $(this).siblings('.num').val();
                $(this).parent().parent().find('td').eq(4).html(goodnum*goodprice+'.00')
                //获取input标签
                input = $(this).parent().parent().find('td>.good_s')
                //判断是否被选中，选中则进行合计改变
                if (input.prop('checked')==true){
                    priceall1 = $('.TTM-all-money>span').html();
                    priceall2 = $('#totalPrice').html();
                    $('.TTM-all-money>span').html(parseInt(priceall1)-parseInt(goodprice)+'.00')
                    $('#totalPrice').html(parseInt(priceall2)-parseInt(goodprice)+'.00');
                }
            }
            //增加商品数量
            var good_id = $(this).parent().parent().find('td').eq(0).html()
            $.ajax({
                'url':'/cartsave/',
                'type':'get',
                'data':{'goodnum':goodnum,'goodid':good_id},
                'dataType':'json',
                then:function (data) {
                    if (data.res!=0){
                        alert('出错了')
                    }
                }
            })
        });
        $('.add').click(function () {
            var goodnum = $(this).siblings('.num').val();
            $(this).siblings('#num').val(parseInt(goodnum)+1);
            goodprice = $(this).parent().parent().find('td').eq(2).html();
            goodnum = $(this).siblings('.num').val();
            $(this).parent().parent().find('td').eq(4).html(goodnum*goodprice+'.00')
            input = $(this).parent().parent().find('td>.good_s')
            if (input.prop('checked')==true) {
                priceall1 = $('.TTM-all-money>span').html();
                priceall2 = $('#totalPrice').html();
                $('.TTM-all-money>span').html(parseInt(priceall1)+parseInt(goodprice)+'.00');
                $('#totalPrice').html(parseInt(priceall2)+parseInt(goodprice)+'.00');
            }
            var good_id = $(this).parent().parent().find('td').eq(0).html()
            $.ajax({
                'url':'/cartsave/',
                'type':'get',
                'data':{'goodnum':goodnum,'goodid':good_id},
                'dataType':'json',
                then:function (data) {
                    if (data.res!=0){
                        alert('出错了')
                    }
                }
            })
        });
        $('.num').change(function () {
            var goodnum = $(this).val()
            var goodprice = $(this).parent().parent().find('td').eq(2).html();
            $(this).parent().parent().find('td').eq(4).html(goodnum*goodprice+'.00');
            input = $(this).parent().parent().find('td>.good_s')
            // if (input.prop('checked')==true) {
            //     priceall1 = $('.TTM-all-money>span').html();
            //     priceall2 = $('#totalPrice').html();
            //     $('.TTM-all-money>span').html(parseInt(priceall1) + parseInt(goodprice) + '.00');
            //     $('#totalPrice').html(parseInt(priceall2) + parseInt(goodprice) + '.00');
            // }
            var good_id = $(this).parent().parent().find('td').eq(0).html()
            $.ajax({
                'url':'/cartsave/',
                'type':'get',
                'data':{'goodnum':goodnum,'goodid':good_id},
                'dataType':'json',
                then:function (data) {
                    if (data.res!=0){
                        alert('出错了')
                    }
                }
            })
        })



            });