/*
 * 요소기술 스크립트  
 */

// 숫자체크
function isNumber(control, msg) {
	
	var val = control;
	var Num = "1234567890";
	for (i=0; i<val.length; i++) {
		if(Num.indexOf(val.substring(i,i+1))<0) {
			alert(msg+' 형식이 잘못되었습니다.');
			return false;
		}
	}
	return true;
}

// 날짜체크
function isDate(control, msg) {
	
	// '/'나 '-' 구분자 제거
	var val = getRemoveFormat(control);
	
	// 숫자, length 확인
	if (isNumber(val, msg) && val.length == 8) {
		var year = val.substring(0,4);
		var month = val.substring(4,6);
		var day = val.substring(6,8);
		
		// 유효날짜 확인
		if(checkDate(year,month,day,msg)){
			return true;
		} else {
			return false;
		}
	} else {
		alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
		return false;
	}
}

// 구분자 제거
function getRemoveFormat(val) {
	if(val.length == 10) {
		var arrDate = new Array(3);
		arrDate = val.split("/");
		if(arrDate.length != 3) {
			arrDate = val.split("-");
		}
		return arrDate[0] + arrDate[1] + arrDate[2];
	} else {
		return val;
	}	
}

// 유효날짜 확인
function checkDate(varCk1, varCk2, varCk3, msg) {
	if (varCk1>="0001" && varCk1<="9999" && varCk2>="01" && varCk2<="12") {
		febDays = "29";
		if ((parseInt(varCk1,10) % 4) == 0) {
			if ((parseInt(varCk1,10) % 100) == 0 && (parseInt(varCk1,10) % 400) != 0){
				febDays = "28";
			}
		}else{
			febDays = "28";
		}
		if (varCk2=="01" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="02" && varCk3>="01" && varCk3<=febDays) return true;
		if (varCk2=="03" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="04" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="05" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="06" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="07" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="08" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="09" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="10" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="11" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="12" && varCk3>="01" && varCk3<="31") return true;
	}
	alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
	return false;
}

function fn_clear(){
	var radio_name = [];
	var radio = $("input[type='radio']");
	$.each(radio, function(key, value){
		radio_name.push($(value).attr("name"));
	})
	radio_name = $.unique(radio_name.sort()).sort();
	for(var i=0;i<radio_name.length;i++){
		$('input[name="' + radio_name[i] + '"]').removeAttr('checked');
		//체크되어있는 항목 모두 해제
		$('input[name="' + radio_name[i] + '"]')[0].checked = true;
		//name에서 첫번쨰 요소만 선택
	}
	 $("[type='text']").val("");
	 $("select").val("");
 }
/* GNB */
$(document).ready(function() {
	var navItem1 = $(".nav.type_01 .nav_item");
	var btnSearch = $(".btn_search");
	var btnClose = $(".btn_close");
	var btnMenu = $(".btn_menu");
	var searchArea = $("#searchArea");
	var allMenuArea = $("#allMenuArea");

	navItem1.hover(function() {
		if (!searchArea.hasClass("show") && !allMenuArea.hasClass("show")) {
			$(this).children(".nav_dropdown").fadeIn(200);
		}
	}, function() {
		if (!searchArea.hasClass("show") && !allMenuArea.hasClass("show")) {
			$(this).children(".nav_dropdown").fadeOut(200);
		}
	});
	
	btnSearch.click(function() {
		allMenuArea.fadeOut(200).removeClass("show");
		searchArea.fadeToggle(200).toggleClass("show");
	});
	btnClose.click(function() {
		searchArea.fadeOut(200).removeClass("show");
	});

	btnMenu.click(function() {
		searchArea.fadeOut(200).removeClass("show");
		allMenuArea.fadeToggle(200).toggleClass("show");
	});

	$("#contents").click(function(e) { 
		if( !$(e.target).hasClass("show") ) { 
			allMenuArea.fadeOut(200).removeClass("show");
			searchArea.fadeOut(200).removeClass("show");
		} 
	}); 
});

/* 셀렉트 박스 */
$(document).ready(function() {
	var x, i, j, selElmnt, a, b, c;
	x = document.getElementsByClassName("select");
	for (i = 0; i < x.length; i++) {
		selElmnt = x[i].getElementsByTagName("select")[0];
		a = document.createElement("DIV");
		a.setAttribute("class", "selected");
		a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
		x[i].appendChild(a);
		b = document.createElement("DIV");
		b.setAttribute("class", "select_item select_hide");
		for (j = 1; j < selElmnt.length; j++) {
			c = document.createElement("DIV");
			c.innerHTML = selElmnt.options[j].innerHTML;
			c.addEventListener("click", function(e) {
		        var y, i, k, s, h;
		        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
		        h = this.parentNode.previousSibling;

				for (i = 0; i < s.length; i++) {
					if (s.options[i].innerHTML == this.innerHTML) {
						s.selectedIndex = i;
						h.innerHTML = this.innerHTML;
						y = this.parentNode.getElementsByClassName("same_selected");
						for (k = 0; k < y.length; k++) {
							y[k].removeAttribute("class");
						}
						this.setAttribute("class", "same_selected");
						break;
					}
				}
				h.click();
			});
	    	b.appendChild(c);
		}
		x[i].appendChild(b);
		a.addEventListener("click", function(e) {
			e.stopPropagation();
			closeAllSelect(this);
			this.nextSibling.classList.toggle("select_hide");
			this.classList.toggle("arrow_active");
		});
	}

	function closeAllSelect(elmnt) {
		var x, y, i, arrNo = [];
		x = document.getElementsByClassName("select_item");
		y = document.getElementsByClassName("selected");
		for (i = 0; i < y.length; i++) {
			if (elmnt == y[i]) {
				arrNo.push(i)
			} else {
				y[i].classList.remove("select-arrow-active");
			}
		}
		for (i = 0; i < x.length; i++) {
			if (arrNo.indexOf(i)) {
				x[i].classList.add("select-hide");
			}
		}
	}
	document.addEventListener("click", closeAllSelect);
});




/* checkbox */
$(document).ready( function() {
	$('.chk_all').click( function() {
	  $('.chk_item').prop('checked', this.checked);
	});
	$('.chk_all2').click( function() {
	  $('.chk_item2').prop('checked', this.checked);
	});
});