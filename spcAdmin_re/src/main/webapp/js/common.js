
/**
 * 팝업 오픈
 * @param url URL 
 * @param w 폭 
 * @param h 너비
 * @param s 스크롤바 여부 1, 'Y'이면 보여줌, 0, '', 'N'이면 숨김 
 */
function gfnPopup(url, w, h, s, target) {

	var l, t, objPopup
	if (target == 'undefined' || target == '' || target == null) {
		var target = 'win1';
	}
	l = (screen.width - w) / 2;
	t = (screen.height - h) / 2;
	if (s == 1 || s == "Y")
		objPopup = window.open(url, target, 'width=' + w + ',height=' + h
				+ ',left=' + l + ',top=' + t + ',resizable=0,scrollbars=1');
	else if (s == 2)
		objPopup = window.open(url, target, 'width=' + w + ',height=' + h
				+ ',left=' + l + ',top=' + t + ',resizable=1,scrollbars=1');
	else if (s == "" || s == 0 || s == "N" || !s || s == "0")
		objPopup = window.open(url, target, 'width=' + w + ',height=' + h
				+ ',left=' + l + ',top=' + t
				+ ',resizable=0,scrollbars=0,status=0');
	else
		objPopup = window.open(url, target, 'width=' + w + ',height=' + h
				+ ',left=' + l + ',top=' + t
				+ ',resizable=1,menubar=1,toolbar=1,scrollbars=1,status=1');
	if (objPopup == null) {
		alert("차단된 팝업창을 허용해 주십시오.");
	}
	return objPopup;
}

/**
 * 쿠키값 세팅
 * @param cookieName 쿠키이릅 
 * @param value 쿠키값
 * @param exdays 만료일
 */
function gfnSetCookie(cookieName, value, exdays) {
	if (value == undefined)
		value = "on";
	if (exdays == undefined)
		exdays = 1;
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : "; path=/; expires="
					+ exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

/**
 * 쿠키값 삭제
 * @param cookieName 쿠키이릅 
 */
function gfnDeleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; path=/; expires="
			+ expireDate.toGMTString();
}

/**
 * 쿠키값 가져오기
 * @param cookieName 쿠키이릅 
 */
function gfnGetCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1)
			end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

/* 쿠키 사용 팝업 닫기 */
function gfnCloseWin(cookieName) {
	gfnSetCookie(cookieName);
	self.close();
}

/* 쿠키 사용 레이어 팝업 닫기 */
function gfnCloseLayer(cookieName) {
	gfnSetCookie(cookieName);
	$("#" + cookieName).hide();
	return false;
}

//현재 메시지 바이트 수 계산
function gfnLengthMsg(objMsg) {
	var nbytes = 0;
	for (i = 0; i < objMsg.length; i++) {
		var ch = objMsg.charAt(i);
		if (escape(ch).length > 4) {
			nbytes += 2;
		} else if (ch == '\n') {
			if (objMsg.charAt(i - 1) != '\r') {
				nbytes += 1;
			}
		} else if (ch == '<' || ch == '>') {
			nbytes += 4;
		} else {
			nbytes += 1;
		}
	}
	return nbytes;
}
/*
 * 검색기간 체크
 * */
function gfnDayDifCheck(obj, obj2) {
	var d1 = Number(obj.val().replace(/-/g, ''));
	var d2 = Number(obj2.val().replace(/-/g, ''));
	if (d2 - d1 < 0) {
		alert("기간설정이 잘못되었습니다.");
		obj.focus();
		return false;
	}
	return true
}

function gfnLeadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';

	}
	return zero + n;
}

function gfnCurYYYY() {
	var d = new Date();

	return gfnLeadingZeros(d.getFullYear(), 4);
}

function gfnCurMM() {
	var d = new Date();

	return gfnLeadingZeros(d.getMonth() + 1, 2);
}

function gfnCurDD() {
	var d = new Date();

	return gfnLeadingZeros(d.getDate(), 2);
}

function gfnCurYYYYMMDD() {
	return gfnCurYYYY()+gfnCurMM()+gfnCurDD();
}

function gfnCurDate() {
	var d = new Date();

	var date = '';

	date += gfnLeadingZeros(d.getFullYear(), 4) + '-';
	date += gfnLeadingZeros(d.getMonth() + 1, 2) + '-';
	date += gfnLeadingZeros(d.getDate(), 2) + ' ';
	date += gfnLeadingZeros(d.getHours(), 2) + ':';
	date += gfnLeadingZeros(d.getMinutes(), 2) + ':';
	date += gfnLeadingZeros(d.getSeconds(), 2);

	return date;
}

function gfnIsDateCheck(str) {
	if (!/([0-9]{4})([0-9]{2})([0-9]{2})/.test(str)) {
		//alert("날짜의 형식이 잘못 입력되었습니다.\n예) 1996-04-05");
		return false;
	}
	// 현재 날짜
	var toDay = new Date();

	var arrDate0 = str.substr(0, 4);
	var arrDate1 = str.substr(4, 2);
	var arrDate2 = str.substr(6, 2);

	var maxDay = new Date(new Date(arrDate0, arrDate1, 1) - 86400000).getDate();

	if (arrDate0 == 0000 || arrDate0 > toDay.getFullYear()) {
		//alert("잘못된 년도를 입력하였습니다.");
		return false;
	}
	if (arrDate1 == 00 || arrDate1 > 12) {
		//alert("잘못된 월을 입력하였습니다.");
		return false;
	}
	if (arrDate2 == 00 || arrDate2 > maxDay) {
		//alert("잘못된 일을 입력하였습니다.");
		return false;
	}
	return true;
}

/************************************************* 편리하기 사용하기 위해 만든 공통 유틸 javascript End *************************************************/


//날짜형식 체크
function gfnDayFormatCheck(format, val){
	format = format.toUpperCase();
	var pattern;
	if (format == 'YYYYMMDDHH24MI') {
		pattern = /^\d{4}\d{2}\d{2}\d{2}\d{2}$/;
	} else if (format == 'YYYYMMDD HH24MI') {
		pattern = /^\d{4}\d{2}\d{2} \d{2}\d{2}$/;
	} else if (format == 'YYYY.MM.DD HH24:MI') {
		pattern = /^\d{4}\.\d{2}\.\d{2} \d{2}\:\d{2}$/;
	} else if (format == 'YYYYMMDD') {
		pattern = /^\d{4}\d{2}\d{2}$/;
	} else if (format == 'YYYY.MM.DD') {
		pattern = /^\d{4}\.\d{2}\.\d{2}$/;
	} else if (format == 'YYYY-MM-DD') {
		pattern = /^\d{4}\-\d{2}\-\d{2}$/;
	} else if (format == 'YYYY') {
		pattern = /^\d{4}$/;
	} else if (format == 'MMDD') {
		pattern = /^\d{2}\d{2}$/;
	} else if (format == 'MM.DD') {
		pattern = /^\d{2}\.\d{2}$/;
	} else if (format == 'MM-DD') {
		pattern = /^\d{2}\-\d{2}$/;
	} else if (format == 'HH24MI') {
		pattern = /^\d{2}\d{2}$/;
	} else if (format == 'HH24:MI') {
		pattern = /^\d{2}\:\d{2}$/;
	} else if (format == 'MM') {
		pattern = /^\d{2}$/;
	} else if (format == 'DD') {
		pattern = /^\d{2}$/;
	}
	return pattern.test(val);
}


/**
 * 함수 설명 : 좌측문자열채우기
 * @param str  :  원 문자열
 * @param padLen  :  최대 채우고자 하는 길이
 * @param padStr  :  채우고자하는 문자(char)
 */
function setStrLpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}

/**
 * 공통 첨부파일 다운로드
 * @param fileId
 * @param fileSeq
 */
function gfnFileDown(fileId, fileSeq){
	gfnInsertMenuLog($($("input[name='pMENU_NO']")[0]).val(), 'D');//다운 이력 저장
	location.href = "/jfile/readDownloadFile.do?fileId="+fileId+"&fileSeq="+fileSeq;
}
/**
 * 공통 첨부파일 전체 다운로드
 * @param fileId
 * @param fileSeq
 */
function gfnFileAllDown(fileId){
	gfnInsertMenuLog($($("input[name='pMENU_NO']")[0]).val(), 'D');//다운 이력 저장
	location.href = "/jfile/downloadAll.do?fileId="+fileId;
}


/**
 * 함수 설명 : 각 메뉴별 접근 로그 저장
 * @param menuNo :  메뉴번호
 * @param accesSe :   구분값 A:메뉴접근, I:검색조회 ,D:엑셀다운로드
 */
function gfnInsertMenuLog(menuNo, access) {
	if (menuNo == undefined || menuNo == '')
		return;
	var url = window.location.pathname;
	$.ajax({
		type : "POST",
		url : "/web/insertMenuLogAjax",
		data : {
			menuNo : menuNo,
			access : access, 
			url : url
		},
		async : true,
		dataType : 'json',
		contentType : "application/x-www-form-urlencoded; charset=UTF-8", // AJAX contentType
		success : function(data) {
		},
		error : function(xhr, status, error) {
			console.log("시스템 오류가 발생하였습니다." + error);
			return;
		}
	});
}

function numberFormatComma(num) {
	num = num.toString();
	var pattern = /(-?[0-9]+)([0-9]{3})/;

	while (pattern.test(num)) {
		num = num.replace(pattern, "$1,$2");
	}
	return num;
}

//레이어 블럭UI 팝업 열기
function gfnBlockUIOpen(layerObj){
	$(layerObj).show();
	$("#divBlock").show();
}
//레이어 블럭UI 팝업 닫기
function gfnBlockUIColse(layerObj){
	$(layerObj).hide();
	$("#divBlock").hide();
}


//ajax 페이징 처리시 사용
function setPagingAjaxTable (data, pagingId){
	 var obj = $("#"+pagingId);
	 var pager = data.pager;
	 $(obj).html('');
	 if (pager.prevPage > 0) {
		 $('<a href="" class="arrowbtn" title="첫페이지" onClick="goSearch(1);return false;">&lt;&lt</a>').appendTo(obj);
		 $('<a href="" class="arrowbtn" title="이전 10페이지" onClick="goSearch(' + pager.prevPage + ');return false;" >&lt;</a>').appendTo(obj);
	 }
	 for (var i = 0; temp = pager.pageList, i < temp.length; i++) {
		 if (temp[i] == pager.currentPage) {
			 $('<a class="select">' + temp[i] + '</a>').appendTo(obj);
		 } else {
			 $('<a href="" onClick="goSearch(' + temp[i]	+ ');return false;">' + temp[i] + '</a>').appendTo(obj);
		 }
	 }
	 if (pager.nextPage > 0) {
		 $('<a href="" class="arrowbtn" title="다음 10페이지" onClick="goSearch(' + pager.nextPage + ');return false;" >&gt</a>').appendTo(obj);
		 $('<a href="" class="arrowbtn" title="마지막페이지" onClick="goSearch(' + pager.totalPage + ');return false;" >&gt;&gt;</a>').appendTo(obj);
	 }
};














//날짜가 포맷에 맞는지 검사
function isDateFormat(d) {
var df = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
return d.match(df);
 }

 // 윤연에 해당하는지 검사
function isLeaf(year) {
var leaf = false;

if(year % 4 == 0) {
leaf = true;
if(year % 100 == 0) leaf = false;
if(year % 400 == 0) leaf = true;
}
return leaf;
 }

 // 날짜가 포맷에 맞고 윤연에 해당하는지 실제 날짜 유효성 검사
function isValidDate(d) {
if(!isDateFormat(d)) return false;

var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

var dateArray = d.split('-');
var year = Number(dateArray[0]);
var month = Number(dateArray[1]);
var day = Number(dateArray[2]);

if(day == 0) return false;

var isValid = false;

// 윤년
if(isLeaf(year)) {
if(month == 2) {
if(day <= month_day[month-1] + 1) isValid = true;
} else {
if(day <= month_day[month-1]) isValid = true;
}
} else {
if(day <= month_day[month-1]) isValid = true;
}
return isValid;
 }


//TOP 버튼
function btn_top() {
	$('html, body').animate({scrollTop : 0},300);
	return false;
};


//페이징 세팅
function setWebPaging(data) {
	var pager = data.pager;
	$(".page_num").html('');
	if (pager.prevPage > 0) {
		$('<span><a href="" title="첫페이지" onClick="goSearch(1);return false;">&lt;&lt</a></span>').appendTo(".page_num");
		$('<span><a href="" title="이전 10페이지" onClick="goSearch(' + pager.prevPage + ');return false;" >&lt;</a></span>').appendTo(".page_num");
	}
	for (var i = 0; temp = pager.pageList, i < temp.length; i++) {
		if (temp[i] == pager.currentPage) {
			$('<span><strong><a >' + temp[i] + '</a></strong></span>').appendTo(".page_num");
		} else {
			$('<span><a href="" onClick="goSearch(' + temp[i]	+ ');return false;">' + temp[i] + '</a></span>').appendTo(".page_num");
		}
	}
	if (pager.nextPage > 0) {
		$('<span><a href="" title="다음 10페이지" onClick="goSearch(' + pager.nextPage + ');return false;" >&gt</a></span>').appendTo(".page_num");
		$('<span><a href="" title="마지막페이지" onClick="goSearch(' + pager.totalPage + ');return false;" >&gt;&gt;</a></span>').appendTo(".page_num");
	}
};

function goMenuMove(pno){
	location.href = "/web/link/?pMENU_NO="+pno;	
}
function homeLogOut(){
	location.href = "/web/loginOut";	
}