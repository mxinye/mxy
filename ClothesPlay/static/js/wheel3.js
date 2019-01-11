$(function () {

                var index3 = 0;
                var change3 = function () {
                    if (index3 == 4) {
                        index3 = 0;
                    } else if (index3 == -1) {
                        index3 == 3;
                    }
                    $('.ul3>li').attr('class', '');
                    $('.ul3>li').eq(index3).attr('class', 'z-crt2');
                    // console.log(123)
                    $('.m-content-child>.DIVS>div').attr('id', '');
                    // console.log(456)
                    $('.m-content-child>.DIVS>div').eq(index3).attr('id', 'DIVchange');
                    // console.log(678)
                };
                var timeall3 = function () {
                    change3();
                    index3++;
                }
                var time3 = setInterval(timeall3,2000);
                $('.m-content-child>.DIVS').hover(function () {
                    clearInterval(time3);
                    $('.prev3').show();
                    $('.next3').show();
                },function () {
                    time3 = setInterval(timeall3,2000);
                    $('.prev3').hide();
                    $('.next3').hide();
                });

                $('.ul3>li').hover(function () {
                    $('.ul3>li').attr('class','');
                    $(this).attr('class','z-crt2');
                    index3 = $(this).index();
                    $('.m-content-child>.DIVS>div').attr('id','');
                    $('.m-content-child>.DIVS>div').eq(index3).attr('id','DIVchange');
                    clearInterval(time3)
                    $('.prev3').hide();
                    $('.next3').hide();
                },function () {
                    time3 = setInterval(timeall3,2000);
                    $('.prev3').hide();
                    $('.next3').hide();
                });
                $('.prev3').click(function () {
                    index3 = index3-1;
                    change3()
                });
                $('.next3').click(function () {
                    index3 = index3+1;
                    change3()
                })



            })