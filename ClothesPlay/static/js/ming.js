$(function () {
    $('img').each(function () {
        srcText = $(this).attr('src')
        $(this).attr('src',"{% static '"+srcText+"'%}")
        srcText1 = $(this).attr('src')
    })
    console.log($('body').html())
})