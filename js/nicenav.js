(function ($) {
    $.extend({
        'nicenav': function (con,dis) {
	    dis = dis+'px';
            con = typeof con === 'number' ? con : 400;
            var $lis = $('.nav>li'), $h = $('.buoy')
            $lis.hover(function () {
                $h.stop().animate({
                    'left': $(this).offsetParent().context.offsetLeft
                }, con);
            }, function () {
                $h.stop().animate({
                    'left': dis
                }, con);
            })
        }
    });
}(jQuery));