$(function () {
                var index1 = 0;
                var changewheel = function () {
                    if (index1 > 3) {
                        index1 = 0;
                    } else if (index1 < 0) {
                        index1 = 3;
                    }
                    $('.ul1>li').attr('class', '');
                    $('.ul1>li').eq(index1).attr('class', 'z-crt');
                    $('.m-content-women>.DIVS>div').attr('id', '');
                    $('.m-content-women>.DIVS>div').eq(index1).attr('id', 'DIVchange');
                };
                var timeall = function () {
                    changewheel();
                    index1++;
                }
                var time1 = setInterval(timeall,2000);
                $('.m-content-women').hover(function () {
                    clearInterval(time1);
                    $('.prev1').show();
                    $('.next1').show();
                },function () {
                    time1 = setInterval(timeall,2000);
                    $('.prev1').hide();
                    $('.next1').hide();
                });

                $('.ul1>li').hover(function () {
                    $('.ul1>li').attr('class','');
                    $(this).attr('class','z-crt');
                    index1 = $(this).index();
                    $('.m-content-women>.DIVS>div').attr('id','');
                    $('.m-content-women>.DIVS>div').eq(index1).attr('id','DIVchange');
                    clearInterval(time1)
                    // $('.prev1').hide();
                    // $('.next1').hide();
                },function () {
                    time1 = setInterval(timeall,2000);
                    // $('.prev1').hide();
                    // $('.next1').hide();
                });

                $('.prev1').mouseover(function () {
                    clearInterval(time1)
                    $(this).click(function () {
                        index1 = index1-1;
                        changewheel()
                    })

                });
                $('.next1').mouseover(function () {
                    clearInterval(time1)
                    $(this).click(function () {
                        index1 = index1+1;
                        changewheel();
                    })

                });



            })