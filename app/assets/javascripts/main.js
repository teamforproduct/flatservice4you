$(function () {
	'use strict';

	// iPad and iPod detection	
	var isiPad = function(){
		return (navigator.platform.indexOf("iPad") != -1);
	};

	var isiPhone = function(){
	    return (
			(navigator.platform.indexOf("iPhone") != -1) || 
			(navigator.platform.indexOf("iPod") != -1)
	    );
	};

	// OffCanvass
	var offCanvass = function() {
		$('body').on('click', '.js-template-nt-nav-toggle', function(event){

			var $this = $(this);

			$('#template-nt-offcanvass').toggleClass('template-nt-awake');
			$('#template-nt-page, #template-nt-menu').toggleClass('template-nt-sleep');




			if ( $('#template-nt-offcanvass').hasClass('template-nt-awake') ) {
				$this.addClass('active');
			} else {
				$this.removeClass('active');
			}
			event.preventDefault();
			
		});
	};

  var userForm = function() {
    $(document).on('click', '#user-form-btm', function(event){
      $("#user-home-form").toggleClass("toggled");
    });
  };

  // Single Page Nav
	var clickMenu = function() {
		$('a:not([class="external"])').click(function(){
			var section = $(this).data('nav-section')
			if (section) {
		    $('html, body').animate({
		        scrollTop: $('[data-section="' + section + '"]').offset().top
		    }, 500);
		    return false;
		  }
		});
	};

	// Owl Carousel For Testimony
	var carouselTestimony = function() {

		var owl = $(".block-carousel");
		
		owl.owlCarousel({
			items: 1,
      margin: 0,
      responsiveClass: true,
      loop: true,
      nav: true,
      dots: true,
      autoplay: true,
      smartSpeed: 500,
      navText: [
        "<i class='fa fa-angle-left owl-direction'></i>",
        "<i class='fa fa-angle-right owl-direction'></i>"
      ]
		});
	};

  var video_carousel = function(){
    var video_blocks = $('#videosCarousel');

    video_blocks.owlCarousel({
      items: 1,
      autoplay: false,
      smartSpeed: 1200,
      autoplayHoverPause:true,
      center: true,
      loop: true,
      nav: true,
      responsive:{
        600:{
          items: 3
        }
      },
      navText: [
        "<i class='fa fa-angle-left owl-direction'></i>",
        "<i class='fa fa-angle-right owl-direction'></i>"
      ]
    });
  };

	// Fixed footer 
	var footerFixed = function() {
		var fh = $('#template-nt-footer').innerHeight();
		$('#template-nt-wrap').css({
			marginBottom : fh + 'px'
		});

		if ( $(window).width() < 991 ) {
			$('#template-nt-wrap').css({
				marginBottom: ''
			})
		}

		$(window).resize(function(){

			var fh = $('#template-nt-footer').innerHeight();
			$('#template-nt-wrap').css({
				marginBottom : fh + 'px'
			});

			if ( $(window).width() < 991 ) {
				$('#template-nt-wrap').css({
					marginBottom: ''
				})
			}
		});
	};

	// Counter 
	var counter = function() {
		$('.js-counter').each(function(index, item) {
			var left = Math.max(new Date("2017-08-01") - new Date(), 0);

			switch($(item).data('type')) {
		    case "weeks":
		    		$(item).countTo({
		    			from: left/1000/60/60/24/7,
							to: 0,
							speed: left,
							refreshInterval: 1000
						});
		        break;
		    case "days":
		    		$(item).countTo({
		    			from: left/1000/60/60/24,
							to: 0,
							speed: left,
							refreshInterval: 1000
						});
		        break;
		    case "minutes":
		    		$(item).countTo({
		    			from: left/1000/60,
							to: 0,
							speed: left,
							refreshInterval: 1000
						});
		        break;
			}
		});
	};

	//  Faqs Accordion
	var faqsAccordion = function() {

		var faqAcc = $('.faq-accordion h3');

		// Click
		faqAcc.on('click', function(event){
			var $this = $(this);
			
			$('.faq-accordion').removeClass('active');
			$('.faq-accordion').find('.faq-body').slideUp(400, 'easeInOutExpo');

			if ( !$this.closest('.faq-accordion').find('.faq-body').is(':visible')) {
				$this.closest('.faq-accordion').addClass('active');
				$this.closest('.faq-accordion').find('.faq-body').slideDown(400, 'easeInOutExpo');
			} else {
				$this.closest('.faq-accordion').removeClass('active');
				$this.closest('.faq-accordion').find('.faq-body').slideUp(400, 'easeInOutExpo');
			}


			setTimeout(function(){
				// alert($this.closest('.faq-accordion.active').innerHeight());
				$('html, body').animate({
			        scrollTop: $this.closest('.faq-accordion.active').offset().top - 90
			    }, 500);
			}, 700);
			
			
			event.preventDefault();
			return false;

		});

	};

	// Click outside of offcanvass
	var mobileMenuOutsideClick = function() {
		$(document).click(function (e) {
	    var container = $("#template-nt-offcanvass, .js-template-nt-nav-toggle");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {
	    	if ( $('#template-nt-offcanvass').hasClass('template-nt-awake') ) {
	    		$('#template-nt-offcanvass').removeClass('template-nt-awake');
	    		$('#template-nt-page, #template-nt-menu').removeClass('template-nt-sleep');

	    		$('.js-template-nt-nav-toggle').removeClass('active');
	    	}
	    }
		});

		$(window).scroll(function(){
			if ( $(window).scrollTop() > 500 ) {
				if ( $('#template-nt-offcanvass').hasClass('template-nt-awake') ) {
		    		$('#template-nt-offcanvass').removeClass('template-nt-awake');
		    		$('#template-nt-page, #template-nt-menu').removeClass('template-nt-sleep');

		    		$('.js-template-nt-nav-toggle').removeClass('active');
		    	}
	    	}
		});
	};

	// Magnific Popup
	
	var magnifPopup = function() {
		$('.image-popup').magnificPopup({
			type: 'image',
			removalDelay: 300,
			mainClass: 'mfp-with-zoom',
			titleSrc: 'title',
			gallery:{
				enabled:true
			},
			zoom: {
				enabled: true, // By default it's false, so don't forget to enable it

				duration: 300, // duration of the effect, in milliseconds
				easing: 'ease-in-out', // CSS transition easing function

				// The "opener" function should return the element from which popup will be zoomed in
				// and to which popup will be scaled down
				// By defailt it looks for an image tag:
				opener: function(openerElement) {
				// openerElement is the element on which popup was initialized, in this case its <a> tag
				// you don't need to add "opener" option if this code matches your needs, it's defailt one.
				return openerElement.is('img') ? openerElement : openerElement.find('img');
				}
			}
		});
	};


	// Scroll Animations

	// Intro Animate
	var introWayPoint = function() {
		if ( $('#template-nt-hero').length > 0 ) {
			$('#template-nt-hero').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
					setTimeout(function(){
						$('.intro-animate-1').addClass('fadeInUp animated');
					}, 100);
					setTimeout(function(){
						$('.intro-animate-2').addClass('fadeInUp animated');
					}, 400);
					setTimeout(function(){
						$('.intro-animate-3').addClass('fadeInUp animated');
						$('.intro-animate-4').addClass('fadeInUp animated');
					}, 700);
					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};

	var HeaderToggle = function() {

		var $this = $( '#template-nt-main' );
			

		$this.waypoint(function(direction) {
			
			if( direction === 'down' ) {
				$('body').addClass('scrolled');
			}
			else if( direction === 'up' ){
				$('body').removeClass('scrolled');
			}			
		
		}, { offset: '-1px' } );
		
	};


	// Client Animate
	var clientAnimate = function() {
		if ( $('#template-nt-clients').length > 0 ) {	
			$('#template-nt-clients .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeIn animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	
	var clientWayPoint = function() {
		if ( $('#template-nt-clients').length > 0 ) {
			$('#template-nt-clients').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				
					setTimeout(clientAnimate, 100);
					
					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};

	// Features Animate
	var featuresAnimate = function() {
		if ( $('#template-nt-problems').length > 0 ) {
			$('#template-nt-problems .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	var featuresWayPoint = function() {
		if ( $('#template-nt-problems').length > 0 ) {
			$('#template-nt-problems').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				
					setTimeout(featuresAnimate, 100);
					
					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};


	// Features 2 Animate
	var features2AnimateTitle = function() {
		if ( $('#template-nt-solution').length > 0 ) {
			$('#template-nt-solution .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeIn animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	var features2WayPoint = function() {
		if ( $('#template-nt-solution').length > 0 ) {
			$('#template-nt-solution').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				
					setTimeout(features2AnimateTitle, 100);

					setTimeout(function(){
						$('.solution-animate-2').addClass('fadeInUp animated');
					}, 800);

					setTimeout(function(){
						$('.solution-animate-3').addClass('fadeInRight animated');
						$('.solution-animate-5').addClass('fadeInLeft animated');
					}, 1200);
					setTimeout(function(){
						$('.solution-animate-4').addClass('fadeInRight animated');
						$('.solution-animate-6').addClass('fadeInLeft animated');
					}, 1400);
					
					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};

	// Counter Animate
	var counterWayPoint = function() {
		if ( $('#template-nt-counter').length > 0 ) {
			$('#template-nt-counter').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
					setTimeout(function(){
						$('.counter-animate').addClass('fadeInUp animated');
						counter(); 
					}, 100);
					
					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};


	// Products Animate
	var productsAnimate = function() {
		if ( $('#template-nt-products').length > 0 ) {	
			$('#template-nt-products .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	var productsWayPoint = function() {
		if ( $('#template-nt-products').length > 0 ) {
			$('#template-nt-products').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				
					

					setTimeout(function(){
						$('.product-animate-1').addClass('fadeIn animated');
					}, 200);

					setTimeout(function(){
						$('.product-animate-2').addClass('fadeIn animated');
					}, 400);

					setTimeout(productsAnimate, 800);

					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};

	// Call To Actions Animate
	var ctaAnimate = function() {
		if ( $('#template-nt-cta').length > 0 ) {	
			$('#template-nt-cta .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	var ctaWayPoint = function() {
		if ( $('#template-nt-cta').length > 0 ) {
			$('#template-nt-cta').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				

					setTimeout(ctaAnimate, 100);

					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};


	// Pricing Animate
	var pricingAnimate = function() {
		if ( $('#template-nt-pricing').length > 0 ) {	
			$('#template-nt-pricing .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	var pricingWayPoint = function() {
		if ( $('#template-nt-pricing').length > 0 ) {
			$('#template-nt-pricing').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				
					setTimeout(function(){
						$('.pricing-animate-1').addClass('fadeInUp animated');
					}, 100);
					setTimeout(function(){
						$('.pricing-animate-2').addClass('fadeInUp animated');
					}, 400);

					setTimeout(pricingAnimate, 800);

					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};

	

	// Features 3 Animate
	var features3Animate = function() {
		if ( $('#template-nt-team').length > 0 ) {
			$('#template-nt-team .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	var features3WayPoint = function() {
		if ( $('#template-nt-team').length > 0 ) {
			$('#template-nt-team').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				
					

					setTimeout(function(){
						$('.team-animate-1').addClass('fadeIn animated');
					}, 200);

					setTimeout(function(){
						$('.team-animate-2').addClass('fadeIn animated');
					}, 400);

					setTimeout(features3Animate, 800);

					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};

	// Features 3 Animate
	var faqsAnimate = function() {
		if ( $('#template-nt-faqs').length > 0 ) {	
			$('#template-nt-faqs .to-animate').each(function( k ) {
				
				var el = $(this);
				
				setTimeout ( function () {
					el.addClass('fadeInUp animated');
				},  k * 200, 'easeInOutExpo' );
				
			});
		}
	};
	var faqsWayPoint = function() {
		if ( $('#template-nt-faqs').length > 0 ) {
			$('#template-nt-faqs').waypoint( function( direction ) {
										
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					
				
					

					setTimeout(function(){
						$('.faqs-animate-1').addClass('fadeIn animated');
					}, 200);

					setTimeout(function(){
						$('.faqs-animate-2').addClass('fadeIn animated');
					}, 400);

					setTimeout(faqsAnimate, 800);

					
					$(this.element).addClass('animated');
						
				}
			} , { offset: '75%' } );
		}
	};

	// animate-box
	var contentWayPoint = function() {
		$('.animate-box').waypoint( function( direction ) {

			if( direction === 'down' && !$(this).hasClass('animated') ) {
			
				$(this.element).addClass('fadeInUp animated');
			
			}

		} , { offset: '75%' } );
	};

	// Reflect scrolling in navigation
	var navActive = function(section) {
		var el = $('#template-nt-offcanvass > ul');
		el.find('li').removeClass('active');
		el.each(function(){
			$(this).find('a[data-nav-section="'+section+'"]').closest('li').addClass('active');
		});
	};
	var navigationSection = function() {

		var $section = $('div[data-section]');
		
		$section.waypoint(function(direction) {
		  	if (direction === 'down') {
		    	navActive($(this.element).data('section'));
		    
		  	}
		}, {
		  	offset: '150px'
		});

		$section.waypoint(function(direction) {
		  	if (direction === 'up') {
		    	navActive($(this.element).data('section'));
		  	}
		}, {
		  	offset: function() { return -$(this.element).height() + 155; }
		});

	};

	// Document on load.
	$(function(){

		magnifPopup();
		offCanvass();
    userForm();
		mobileMenuOutsideClick();
		footerFixed();
		faqsAccordion();
		carouselTestimony();
    video_carousel();
		clickMenu();
		HeaderToggle();

		// Animations
		introWayPoint();
		clientWayPoint();
		featuresWayPoint();
		features2WayPoint();
		counterWayPoint();
		productsWayPoint();
		features3WayPoint();
		ctaWayPoint();
		pricingWayPoint();
		faqsWayPoint();
		contentWayPoint();

		navigationSection();

	});
}());
