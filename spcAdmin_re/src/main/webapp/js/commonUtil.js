/**
 * 공통
 */

$(document).ready(function(){
	
	var lnbH;
	var containerW;
	var containerH;
	var contentsH;
	var footerW;

	lnbHeight()
	containerSize()
	//contentsHeight()
	footerWidth()

	/*  메뉴 height  */
	function lnbHeight(){
		//lnbH = window.innerHeight - $('#header').height() + 30;
		lnbH = $('#container').height() - 60
		
		if($('#container').height()< window.innerHeight){
			lnbH = window.innerHeight - $('#header').height() + 30;
		}

		$('#nav').height(lnbH);
	}

	/*  container size  */
	function containerSize(){
		containerW = window.innerWidth - $('#nav').width();
		$('#container').width(containerW);

		containerH = $('#nav').height(lnbHeight);
		$('#container').width(containerH);
	}

	/*  contents height 
	function contentsHeight(){
		contentsH = window.innerHeight - $('#header').height() - $('.footer').height() - 30;
		$('.contents-wrap').height(contentsH);
	} */

	/*  footer width  */
	function footerWidth(){
		footerW = $('#container').width() - 60;
		$('.footer').width(footerW);
	}
	
	
	
	$(window).resize(function () {
		lnbHeight()
		containerSize()
		//contentsHeight()
		footerWidth()
	});

	

	/*   2depth   */
	$('.depth01-menu li a').click(function(){
		
		if ($(this).parent().hasClass('on')) { 
			$(this).next('.depth02-menu').slideUp(400); 
			$(this).parent().removeClass('on'); 
		} else { 
			$('#nav').find('.on').removeClass('on'); 
			
			$(this).parent().addClass('on');
			$(this).next('.depth02-menu').slideDown(400); 
		}
	});
	
	
	
	/*   datepicker  */
	$( function() {
		/*
		$( "#datepickerFrom" ).datepicker({
		  showOn: "button",
		  buttonImage: "../images/common/ico_calendar.png",
		  buttonImageOnly: true,
		  buttonText: "Select date"
		});
		$( "#datepickerTo" ).datepicker({
			showOn: "button",
			buttonImage: "../images/common/ico_calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		  });

		$( "#datepickerDefault" ).datepicker({
			showOn: "button",
			buttonImage: "../images/common/ico_calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		  });
*/
	  });
	
	
	/*   팝업 begin  */
	$('.pop-wrapBAK').css({
		"top": (($(window).height()-$('.pop-wrap').outerHeight())/2+$(window).scrollTop())+'px',
		"left": (($(window).width()-$('.pop-wrap').outerWidth())/2+$(window).scrollLeft())+'px'
	});
	/*  팝업 end */
});

var editImgUpLoad = function(){
	$.confirm({
		boxWidth: '400px',
		useBootstrap: false,
		title: '이미지 업로드',
		content: '' +
		'<div class="table-type2">' +
			'<form id="editImgForm" method="post" enctype="Multipart/form-data">' +
				'<table>' +
					'<colgroup>' +
						'<col style="width:80px;">' +
						'<col style="width:auto">' +
					'</colgroup>' +
					'<tbody>' +
						'<tr>' +
							'<th scope="row">파일첨부</th>' +
							'<td><input type="file" id="imgFile" name="imgFile" value=""></td>' +
						'</tr>' +
					'</tbody>' +
				'</table>' +
			'</form>' +
		'</div>',
		buttons: {
				취소: function () {
						//close
				},
				formSubmit: {
					text: '업로드',
					btnClass: 'btn-blue',
					action: function () {

						var form = $("#editImgForm")[0];
						var formData = new FormData(form);
						formData.append("imgFile", $("#imgFile")[0].files[0]);
						var aurl = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
						aurl = aurl + "/adBoard/setEditImgUpLoad.do";
					    $.ajax({
					        url: aurl,
							dataType : "JSON",
							type	 : "POST",
							data: formData,
							processData: false, 
					        contentType: false,
					        success: function(result) {
					        	console.log(JSON.stringify(result));
					        	var imgPath = result.path;
					        	
							    $.confirm({
							        title: '등록',
							        content: '등록 완료하였습니다.<br/><img style="100%" src="' + imgPath+ '">',
							        useBootstrap: false,
								    boxWidth:'210px',
							        buttons: {
							            "예": function (data) {
							            	setEditImg(imgPath);
							            }
							        }
							    });
//					        	setTimeout(lazyStart, 3000);
					        },
					        error: function(data) {
					        	console.log(JSON.stringify(data));
								$.dialog({
								    title: "오류",
								    content: "등록 처리중 오류가 발생했습니다.",
								    type: "red",
							        useBootstrap: false,
								    boxWidth:'230px'
								});
					        }
					    });
					}
				},
		},
		onContentReady: function () {
				// bind to events
				var jc = this;
				this.$content.find('form').on('submit', function (e) {
						// if the user submits the form by pressing enter in the field.
						e.preventDefault();
						jc.$$formSubmit.trigger('click'); // reference the button and click it
				});
		}
	});
};
		
		










		
			