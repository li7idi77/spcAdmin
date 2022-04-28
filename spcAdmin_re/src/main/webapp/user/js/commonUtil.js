/**
 * 공통
 */

$(document).ready(function(){

	/*  gnb  */
	$('#navigation ul li a').click(function(){
		
		if ($(this).parent().hasClass('on')) {
			$(this).parent().removeClass('on'); 
		} else { 
			$('#navigation').find('.on').removeClass('on'); 
			
			$(this).parent().addClass('on');
			$(this).parents().find('#header').next('.menu-wrap').css('margin-top', 0);
		}
	});

	$('#navigation ul li').mouseover(function(){
		$(this).parents().find('#header').next('.menu-wrap').addClass('block');
		$(this).slideDown(400);
	});

	$('.menu-wrap').mouseleave(function(){
		$(this).removeClass("block");
		$(this).slideUp(400);
	});


	/*  lnb  */
	$('.lnb-menu ul li a').click(function(){
		
		if ($(this).parent().hasClass('on')) {
			$(this).next('.sub-lnb').slideUp(400);
			$(this).parent().removeClass('on'); 
		} else { 
			$('.lnb-menu').find('.on').removeClass('on'); 
			
			$(this).parent().addClass('on');
			$(this).next('.sub-lnb').slideDown(400); 
		}
	});

	$('.sub-lnb li a').click(function(){
		
		if ($(this).parent().hasClass('active')) {
			$(this).parent().removeClass('active'); 
		} else { 
			$('.lnb-menu').find('.active').removeClass('active'); 
			
			$(this).parent().addClass('active');
		}
	});



	/***  메인상단 우측 슬라이드  ***/
	
	$('.lazy').slick({
		slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, 	//무한 반복 옵션	 
		slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll :1,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 400,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows :true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay :true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 6000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-pre'></button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-nex'></button>",		// 다음 화살표 모양 설정
		draggable : true, 	//드래그 가능 여부 
	});
	/*
	$('.play').click(function(){
		$('.lazy').slick('slickPlay');
	});

	$('.stop').click(function(){
		$('.lazy').slick('slickPause');
	});
	*/



	/*   하단 로고 슬라이드 */

	$('.regular').slick({
		slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
		infinite :true, 	//무한 반복 옵션	 
		slidesToShow : 5,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll :1,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 500,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 6000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-pre'></button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-nex'></button>",		// 다음 화살표 모양 설정
		draggable : true, 	//드래그 가능 여부 
	});

	
	

	
	/*   팝업 begin  */
	$('.pop-wrap').css({
		"top": (($(window).height()-$('.pop-wrap').outerHeight())/2+$(window).scrollTop())+'px',
		"left": (($(window).width()-$('.pop-wrap').outerWidth())/2+$(window).scrollLeft())+'px'
	});
	/*  팝업 end */



	

	
	
	
	
});
		










		
			