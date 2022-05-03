/* tradeinsert */

	$(function () {

		
	$('.slick-track').slick({
		  slidesToShow: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  prevArrow: $('.prev'),
		  nextArrow: $('.next')
		});
		$('.slick-background').slick({
		  slidesToShow: 1,
		  autoplay: true,
		  fade: true,
		  cssEase: 'linear',
		  autoplaySpeed: 2000
		});
		
	$('.next').click(function(){
		$('.slick-next').click();
	});
	$('.prev').click(function(){
		$('.slick-prev').click();
	});
		
		
	    });
		