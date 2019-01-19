$(function () {
        // var money = parseInt($('.TTM-all-money>span').html());

        // $('input:checkbox').prop('checked', false)
        //默认全选勾选了
        $('.allchange').prop('checked',true)
        var check = $('.good_s');
        var priceall1 = parseInt($('.TTM-all-money>span').html());
        var priceall2 = parseInt($('#totalPrice').html());
        var status_check = 0
        check.each(function () {
            if ($(this).prop('checked')==true){
                var sumone_money = $(this).parent().parent().find('td').eq(5).html()
                priceall1 = priceall1+parseInt(sumone_money)
                console.log(sumone_money)
                console.log(priceall1)
                status_check++
            }
        })
        $('.TTM-all-money>span').html(priceall1+'.00');
        $('#totalPrice').html(priceall1+'.00');
        priceall2=priceall1
        // 当没有一件商品勾选时，全选不勾选
        if (status_check ==0){
            $('.allchange').prop('checked',false)
        }

        // 同步合计
        priceall1 = parseInt($('.TTM-all-money>span').html());
        var priceall2 = parseInt($('#totalPrice').html());

        // 选择框
        check.change(function () {
            // //合计
            // priceall1 = parseInt($('.TTM-all-money>span').html())
            //单价
            var price_good = parseInt($(this).parent().parent().find('td').eq(5).html());
            //判断是否被选中
            if ($(this).prop('checked')==true){
                priceall1 = price_good +priceall1;
            }else if($(this).prop('checked')==false){
                priceall1 = priceall1-price_good;
            }
            $('.TTM-all-money>span').html(priceall1+'.00');
            $('#totalPrice').html(priceall1+'.00');
            // 同步
            priceall2=priceall1

            cartid = $(this).parent().parent().attr('cartid')
            isselect = $(this).prop('checked')
            console.log(cartid)
            $.get('/cartchangestatus/',{'cartid':cartid,'isselect':isselect},function (data) {
                console.log(data)
                if (data.status!=1){
                    alert('出现异常！！！')
                }
            })


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
                goodprice = $(this).parent().parent().find('td').eq(3).html();
                // 获取商品数
                goodnum = $(this).siblings('.num').val();
                $(this).parent().parent().find('td').eq(5).html(goodnum*goodprice+'.00')
                //获取input标签
                input = $(this).parent().parent().find('td>.good_s')
                //判断是否被选中，选中则进行合计改变
                if (input.prop('checked')==true){
                    $('.TTM-all-money>span').html(priceall1-parseInt(goodprice)+'.00')
                    $('#totalPrice').html(priceall2-parseInt(goodprice)+'.00');
                    priceall1 = parseInt($('.TTM-all-money>span').html());
                    priceall2 = parseInt($('#totalPrice').html());
                }
            }

            var cartid = $(this).parent().parent().attr('cartid')
            console.log(cartid)
            $.get('/cartsave/',{'goodnum':goodnum,'cartid':cartid}, function (data) {
                    if (data.res!=0){
                        alert('出现异常！！！')
                    }
            })
        });

        //增加商品数量
        $('.add').click(function () {
            var goodnum = $(this).siblings('.num').val();
            $(this).siblings('#num').val(parseInt(goodnum)+1);
            goodprice = $(this).parent().parent().find('td').eq(3).html();
            goodnum = $(this).siblings('.num').val();
            $(this).parent().parent().find('td').eq(5).html(goodnum*goodprice+'.00')
            input = $(this).parent().parent().find('td>.good_s')
            if (input.prop('checked')==true) {
                $('.TTM-all-money>span').html(priceall1+parseInt(goodprice)+'.00');
                $('#totalPrice').html(priceall2+parseInt(goodprice)+'.00');

                priceall1 = parseInt($('.TTM-all-money>span').html());
                priceall2 = parseInt($('#totalPrice').html());
            }
            var cartid = $(this).parent().parent().attr('cartid')
            $.get('/cartsave/',{'goodnum':goodnum,'cartid':cartid},function (data) {
                    if (data.res!=0){
                        alert('出现异常！！！')
                    }
            })
        });
        var goodnum_start = 0
        // 获得焦点
        $('.num').focus(function () {
            goodnum_start = $(this).val()
            console.log(goodnum_start)
        });
        //失去焦点
        $('.num').blur(function () {
            var goodprice = $(this).parent().parent().find('td').eq(3).html();
            var goodnum_end = $(this).val()
            input = $(this).parent().parent().find('td>.good_s')
            if (input.prop('checked')==true) {
                if (goodnum_end !=goodnum_start){
                    goodprice_diff = (goodnum_end-goodnum_start)*goodprice
                    console.log(goodprice_diff)
                    console.log(typeof (goodprice_diff))

                    $('.TTM-all-money>span').html(priceall1 + goodprice_diff + '.00');
                    $('#totalPrice').html(priceall2 + goodprice_diff + '.00');

                    priceall1 = parseInt($('.TTM-all-money>span').html());
                    priceall2 = parseInt($('#totalPrice').html());

                    cartid = $(this).parent().parent().attr('cartid')
                    $.get('/cartsave/',{'cartid':cartid,'goodnum':goodnum_end},function (data) {
                        console.log(data)
                        if (data.res!=0){
                            alert('出现异常！！！')
                        }
                    });
                };
            };


        });

        // 修改商品数量
        // $('.num').change(function () {
        //     var goodnum = $(this).val()
        //     var goodprice = $(this).parent().parent().find('td').eq(3).html();
        //     $(this).parent().parent().find('td').eq(5).html(goodnum*goodprice+'.00');
        //
        //     var good_id = $(this).parent().parent().find('td').eq(1).html();
        //     $.ajax({
        //         'url':'/cartsave/',
        //         'type':'get',
        //         'data':{'goodnum':goodnum,'goodid':good_id},
        //         'dataType':'json',
        //         then:function (data) {
        //             if (data.res!=0){
        //                 alert('出错了')
        //             };
        //         }
        //     });
        // });
        //删除，单个商品
        $('.del').click(function () {
            var cartid = $(this).parent().parent().attr('cartid')
            var goodprice = $(this).parent().parent().find('td').eq(5).html();
            input = $(this).parent().parent().find('td>.good_s')
            if (input.prop('checked')==true) {
                $('.TTM-all-money>span').html(priceall1-parseInt(goodprice)+'.00');
                $('#totalPrice').html(priceall2-parseInt(goodprice)+'.00');

                priceall1 = parseInt($('.TTM-all-money>span').html());
                priceall2 = parseInt($('#totalPrice').html());
            };
            $.get('/cartdelsave/',{'cartid':cartid},function (data) {
                    if (data.res!=0){
                        alert('出现异常！！！')
                    }else {
                        var good_li = $(this).parent().parent();
                        good_li.hide()
                        location.href = '/cart/'
                    };
            });
        });
        // 全选操作
        var statusAll = false
        $('.allchange').click(function () {
            statusAll = !statusAll
            if (statusAll==false){
                $('input:checkbox').prop('checked', false)
                $('.TTM-all-money>span').html('0');
                $('#totalPrice').html('0.00');

            }else {
                sum = 0
                $('.goodprice').each(function () {
                    one = parseInt($(this).html())
                    sum = sum+one
                })
                $('.TTM-all-money>span').html(sum+'.00');
                $('#totalPrice').html(sum+'.00');
                $('input:checkbox').prop('checked', true)
            }
            priceall1 = parseInt($('.TTM-all-money>span').html());
            priceall2 = parseInt($('#totalPrice').html())

            check.each(function () {
                var isselect = $(this).prop('checked')
                var cartid = $(this).parent().parent().attr('cartid')
                $.get('/cartchangestatus/',{'cartid':cartid,'isselect':isselect},function (data) {
                    if (data.status!=1){
                    alert('出现异常！！！')
                }
                })
            })




        })
        // 删除所选商品
        $('.delchoose').click(function () {
            $('.good_s').each(function () {
                delstatus = $(this).prop('checked')
                if (delstatus){
                    $(this).parent().del
                    var cartid = $(this).parent().parent().attr('cartid')
                    var goodallmoney = parseInt($(this).parent().parent().find('td').eq(5).text())
                    $.get('/cartdelsave/',{'cartid':cartid},function (data) {
                         if (data.res!=0){
                            alert('出现异常！！！')
                    }else {
                             location.href = '/cart/'
                         };
                    });
                    console.log(goodallmoney)
                    priceall1 = $('.TTM-all-money>span').html();
                    priceall2 = $('#totalPrice').html();
                    $('.TTM-all-money>span').html(priceall1-goodallmoney+'.00');
                    $('#totalPrice').html(priceall2-goodallmoney+'.00');

                    priceall1 = parseInt($('.TTM-all-money>span').html());
                    priceall2 = parseInt($('#totalPrice').html());
                }
            })
        })
        // 清空购物车
        $('.delall').click(function () {
            $('.shoppping-cart-content-head').hide()
            $.get('/cartdelall/',function (data) {
                if (data.status==1){
                    location.href = '/cart/'
                }else {
                    alert('出现异常！！！')
                }

            })

        })
        // 生成订单
        $('#order').click(function () {
            $.get('/generateorder/',function (data) {
                if (data.status==1){
                    location.href = '/order/'+data.identifier+'/'
                }else if (data.status==0){
                    alert('没有选择商品！！！')
                    location.href = '/cart/'
                }
            })
        })


});