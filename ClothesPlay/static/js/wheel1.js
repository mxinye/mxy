$(function () {
                var indexd=0;
                $('.wrapy-photo>div').click(function () {
                    $('.wrapy-photo>div').attr('class','');
                    $(this).attr('class','wp');
                    indexd = $(this).index();
                    $('.LBY>div').attr('class','wu');
                    $('.LBY>div').eq(indexd).attr('class','logolb')
                });
                $('#redindex').click(function () {
                    if (indexd!=0){
                        indexd = indexd-1;
                        $('.wrapy-photo>div').attr('class','');
                        $('.wrapy-photo>div').eq(indexd).attr('class','wp');
                        $('.LBY>div').attr('class','wu');
                        $('.LBY>div').eq(indexd).attr('class','logolb')
                    }
                });
                $('#addindex').click(function () {
                    if (indexd!=5){
                        indexd = indexd+1;
                        $('.wrapy-photo>div').attr('class','');
                        $('.wrapy-photo>div').eq(indexd).attr('class','wp');
                        $('.LBY>div').attr('class','wu');
                        $('.LBY>div').eq(indexd).attr('class','logolb');
                    }
                });




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
                $('.m-content-women>.DIVS').hover(function () {
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
                    $('.prev1').hide();
                    $('.next1').hide();
                },function () {
                    time1 = setInterval(timeall,2000);
                    $('.prev1').hide();
                    $('.next1').hide();
                });
                 // $('.ul1>li').mouseover(function () {$('.ul1>li').attr('class','');
                 //    $(this).attr('class','z-crt');
                 //    index1 = $(this).index();
                 //    $('.m-content-women>.DIVS>div').attr('id','');
                 //    $('.m-content-women>.DIVS>div').eq(index1).attr('id','DIVchange');
                 //    clearInterval(time1)
                 //    $('.prev1').hide();
                 //    $('.next1').hide()
                 // });
                 // $('.ul1>li').mouseout(function () {
                 //     time1 = setInterval(timeall,2000);
                 //    $('.prev1').hide();
                 //    $('.next1').hide();
                 // })

                $('.prev1').click(function () {
                    index1 = index1-1;
                    changewheel()
                });
                $('.next1').click(function () {
                    index1 = index1+1;
                    changewheel()
                });
                $('.m-content-women>span').hover(function () {
                    clearInterval(time1)
                    $('.m-content-women>span').show()
                })



            })