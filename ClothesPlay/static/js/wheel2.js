$(function () {

                var index2 = 0;
                var change2 = function () {
                    if (index2 == 4) {
                        index2 = 0;
                    } else if (index2 == -1) {
                        index2 == 3;
                    }
                    $('.ul2>li').attr('class', '');
                    $('.ul2>li').eq(index2).attr('class', 'z-crt1');
                    $('.m-content-man>.DIVS>div').attr('id', '');
                    $('.m-content-man>.DIVS>div').eq(index2).attr('id', 'DIVchange');
                };
                var timeall2 = function () {
                    change2();
                    index2++;
                }
                var time2 = setInterval(timeall2,2000);
                $('.m-content-man>.DIVS').hover(function () {
                    clearInterval(time2);
                    $('.prev2').show();
                    $('.next2').show();
                },function () {
                    time2 = setInterval(timeall2,2000);
                    $('.prev2').hide();
                    $('.next2').hide();
                });

                $('.ul2>li').hover(function () {
                    $('.ul2>li').attr('class','');
                    $(this).attr('class','z-crt1');
                    index2 = $(this).index();
                    $('.m-content-man>.DIVS>div').attr('id','');
                    $('.m-content-man>.DIVS>div').eq(index2).attr('id','DIVchange');
                    clearInterval(time2)
                    $('.prev2').hide();
                    $('.next2').hide();
                },function () {
                    time2 = setInterval(timeall2,2000);
                    $('.prev2').hide();
                    $('.next2').hide();
                });
                $('.prev2').click(function () {
                    index2 = index2-1;
                    change2()
                });
                $('.next2').click(function () {
                    index2 = index2+1;
                    change2()
                })



            })