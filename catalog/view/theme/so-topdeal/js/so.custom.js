/* Add Custom Code Jquery
 ========================================================*/
$(document).ready(function(){

	$( ".header-form .button-header" ).click(function() {
		$('.toogle_content').slideToggle(200);
		$(this).toggleClass('active');
	});


	jQuery(function(){
		function scroll_to(div){
			$('html, body').animate({
				scrollTop: $(div).offset().top-80
			},800);
		}
		$(".list_diemneo ul li").each(function(){
			$(this).click(function(){
				$('.list_diemneo ul li').removeClass("active");
				$(this).addClass("active");
				var neoindext=$(this).index()+1;
				scroll_to(".title_neo"+neoindext);
				var neodiv = (".title_neo"+neoindext);
				console.log(neodiv);
				var x = $(neodiv).position();
				$(".custom-scoll").css("top",x.top);
				return true;
			});
		});
	});
	jQuery(function(){
		var windowswidth = $(window).width();
		var containerwidth = $('.container').width();
		var widthcss = (windowswidth-containerwidth)/2-70;
		
		var rtl = jQuery( 'body' ).hasClass( 'rtl' );
		if( !rtl ) {
			jQuery(".custom-scoll").css("left",widthcss);
		}else{
			jQuery(".custom-scoll").css("right",widthcss);
		}
		var x = $(".title_neo3").position();
	});

	// Messenger Top Link
	$('.home1-sevices ul').owlCarousel2({
		pagination: false,
		center: false,
		nav: false,
		dots: false,
		loop: true,
		slideBy: 1,
		autoplay: true,
		margin: 0,
		autoplayTimeout: 8500,
		autoplayHoverPause: true,
		autoplaySpeed: 1200,
		startPosition: 0, 
		responsive:{
			0:{
				items:1
			},
			480:{
				items:2
			},
			768:{
				items:3
			},
			1200:{
				items:4
			}
		}
	});

	 
    $(document).ready(function(){
        $(".topbar-close").click(function(){
            $(".coupon-code").slideToggle();
        });
        $(".button").on('click',function(){
                if($('.button').hasClass('active')){
                    $('.button').removeClass('active');
                }else{
                    $('.button').removeClass('active');
                    $('.button').addClass('active');
                }
         });
    });
    
    
   
    $(document).ready(function($) {
        if($(window).width() < 1199){
            $(function(){
                $('.bonus-menu ul').addClass('test');
                $('.test').owlCarousel2({
                    pagination: false,
                    center: false,
                    nav: false,
                    dots: false,
                    loop: true,
                    margin: 0,
                    navText: [ '<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>' ],
                    slideBy: 1,
                    autoplay: true,
                    autoplayTimeout: 2500,
                    autoplayHoverPause: true,
                    autoplaySpeed: 800,
                    startPosition: 0, 
                    responsive:{
                        0:{
                            items:1
                        },
                        481:{
                            items:2
                        },
                        992:{
                            items:3
                        }
                    }
                });

            });
        }
    });
    

});
