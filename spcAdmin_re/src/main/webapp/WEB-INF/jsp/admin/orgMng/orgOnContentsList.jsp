<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<h1 class="h1-tit">온라인 콘텐츠 등록</h1>

<div class="search-wrap">
	<form id="commonForm" name="commonForm" target="_self" method="post" onsubmit="" style="width:90%;">
    <input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
    <input type="hidden" id="edu_sub_no"   name="edu_sub_no"  value="${edu_sub_no}"/>
    <input type="hidden" id="gubun1"      name="gubun1"     value='I'   />
	    <div class="search-cont search-sub">
	        <h3 class="h3-tit">기간</h3>
	
			<div class="radio-cont">
	            <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="ALL" <c:if test="${searchDate == 'ALL' || (empty searchDate)}">checked </c:if>>
	            <label for="dateAll">전체</label>
	        </div>
	          
	        <div class="radio-cont mr10">
	            <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="CHECK" <c:if test="${searchDate == 'CHECK'}">checked </c:if>>
	            <label for="dateTerm">기간선택</label>
	        </div>
	        <div class="picker-wrap">
	            <input type="text" id="start_date" name="start_date" class="input-box" readonly value="${start_date}"/>
	             <span class="next-ico">-</span>
	             <input type="text" id="end_date" name="end_date" class="input-box" readonly value="${end_date}"/>
	        </div>
	    </div>
	    
	    <div class="search-cont search-sub">
	        <h3 class="h3-tit">교육상태</h3>
	
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="edu_status2" name="edu_status2" value="0" <c:if test="${edu_status2 == '0' || (empty edu_status2)}">checked </c:if>>
	            <label for="">전체</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="edu_status2" name="edu_status2" value="2" <c:if test="${edu_status2 == 'w'}">checked </c:if>>
	            <label for="">교육중</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="edu_status2" name="edu_status2" value="1" <c:if test="${edu_status2 == '1'}">checked </c:if>>
	            <label for="">교육종료</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="edu_status2" name="edu_status2" value="3" <c:if test="${edu_status2 == '3'}">checked </c:if>>
	            <label for="">사용중지</label>
	        </div>
	    </div>
	    
	    <div class="search-cont search-sub">    
	        <h3 class="h3-tit">분류</h3>
	        
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="searchCondition" name="searchCondition" value="CATEGORY" <c:if test="${searchCondition == 'CATEGORY' || (empty searchCondition)}">checked </c:if>>
	            <select class="select"  id="category1_key" name="category1_key">
	            	<option value='9'>기관</option>
	            </select>
	             <select class="select"  id="category2_key" name="category2_key">
                    	<option value='16'>교육기관별(ON-LINE)</option>
	            </select>
	            <select class="select lg-width"  id="category3_key" name="category3_key">
	            	<option value=''>선택 하세요</option>
                    	<c:forEach var="result" items="${category3list}" varStatus="status">
                        	<option value='${result.CATEGORY3_KEY}' <c:if test="${category3_key == result.CATEGORY3_KEY}">selected</c:if>>${result.CATEGORY3_NAME}</option>
                        </c:forEach>
	            </select>
	        </div>
	    </div>
	
	    <div class="search-cont search-sub">
	        <h3 class="h3-tit">콘텐츠</h3>
	
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="con_chk" name="con_chk" value="0" <c:if test="${con_chk == '0' || (empty con_chk)}">checked </c:if>>
	            <label for="">전체</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="con_chk" name="con_chk" value="1" <c:if test="${con_chk == '1'}">checked </c:if>>
	            <label for="">등록</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="con_chk" name="con_chk" value="2" <c:if test="${con_chk == '2'}">checked </c:if>>
	            <label for="">미등록</label>
	        </div>
	    </div>
	    
	    <div class="search-cont search-sub">
	        <h3 class="h3-tit">교육자료</h3>
	
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="file_chk" name="file_chk" value="0" <c:if test="${file_chk == '0' || (empty file_chk)}">checked </c:if>>
	            <label for="">전체</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="file_chk" name="file_chk" value="1" <c:if test="${file_chk == '1'}">checked </c:if>>
	            <label for="">등록</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="file_chk" name="file_chk" value="2" <c:if test="${file_chk == '2'}">checked </c:if>>
	            <label for="">미등록</label>
	        </div>
	    </div>
	    
	    <div class="search-cont search-sub">
	        <h3 class="h3-tit">노출</h3>
	
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="use_yn" name="use_yn" value="0" <c:if test="${use_yn == '0' || (empty use_yn)}">checked </c:if>>
	            <label for="">전체</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="use_yn" name="use_yn" value="1" <c:if test="${use_yn == '1'}">checked </c:if>>
	            <label for="">YES</label>
	        </div>
	        <div class="radio-cont">
	            <input type="radio" class="radio-box" id="use_yn" name="use_yn" value="2" <c:if test="${use_yn == '2'}">checked </c:if>>
	            <label for="">NO</label>
	        </div>
	        
	        <button type="submit" class="search-btn">검색</button>
	        <button type="button" class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
	    </div>
    </form>

</div>

<div class="btn-cont mb20">
    <dl class="count-txt">
        <dt>전체 <span>${count.ALLCNT}</span></dt>
        <dt class="blue-txt">교육중<span>${count.STATUS2}</span></dt>
        
        <dt class="red-txt">교육종료<span>${count.STATUS3}</span></dt>
        <dt class="gray-txt">사용중지<span>${count.STATUS1}</span></dt>
    </dl>

    <%-- <button class="mid-btn blue-btn" onclick="location.href = '<c:url value='/lms/contentsReq.do' />'; ">등록</button> --%>
</div>

<div class="table-wrap scroll-wrap">
    <table class="list-tb">
        <caption>선택, 분류1, 분류2, 분류3, 교육현황, 노출, 차시, 학습시간, 개설일, 콘텐츠, 교육자료, 관리 정보가 있는 테이블</caption>
        <colgroup>
            <col width="4%"/>
            <col width="6%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="*"/>
            <col width="7%"/>
            <col width="7%"/>
            <col width="7%"/>
            <col width="7%"/>
            <col width="10%"/>
            <col width="7%"/>
            <col width="7%"/>
            <col width="5%"/>
            <col width="5%"/>
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" class="check-box"/></th>
                <th>No.</th>
                <th>분류1</th>
                <th>분류2</th>
                <th>분류3</th>
                <th>교육현황</th>
                <th>노출</th>
                <th>차시</th>
                <th>강의시간(분)</th>
                <th>개설일</th>
                <th>콘텐츠</th>
                <th>교육자료</th>
                <th colspan="2">관리</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="result" items="${resultList}" varStatus="status">
	            <tr>
	                <td><input type="checkbox" id='checkNo' name='checkNo' value="${result.EDU_SUB_NO}" class="check-box"/></td>
	                <td>${status.index + 1}</td>
	                <td class="tl">${result.CATEGORY1_NAME}</td>
	                <td class="tl">${result.CATEGORY2_NAME}</td>
	                <td class="tl">${result.CATEGORY3_NAME}</td>
	                <td>${result.EDU_STATUS2}</td>
	                <td>${result.EXP_USE_YN}</td>
	                <td>${result.EDU_CURR1}</td>
	                <td>${result.EDU_CURR3} 분</td>
	                <td>${result.REG_DT}</td>
	                <td>${result.URL_CHK}</td>
	                <td>${result.FILE_CHK}</td>
	                <td><button class="sm-btn black-btn" onClick="javascript:fn_edit('${result.EDU_SUB_NO}');">수정</button></td>
	                <td><button class="sm-btn white-btn" onClick="javascript:fn_delete('${result.EDU_SUB_NO}');">삭제</button></td>
	            </tr>
            </c:forEach>
            <c:if test="${empty resultList }">
             <tr>
                 <td colspan='13'/>Data 없습니다.</td>
             </tr>
         	</c:if>
        </tbody>
    </table>
</div>

<div class="page-wrap">
    <ul class="paging">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){		
	 $("#start_date, #end_date").datepicker({
		  	dateFormat: 'yy-mm-dd' //달력 날짜 형태
	       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		  ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		  ,changeYear: true //option값 년 선택 가능
		  ,changeMonth: true //option값  월 선택 가능                
		  ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		  ,buttonImage: "<c:url value='/images/common/ico_calendar.png'/>" //버튼 이미지 경로
		  ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
		  ,buttonText: "선택" //버튼 호버 텍스트              
		  ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		  ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		  ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		  ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		  ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		  ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		  ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	});
	 
	 $('#category1_key').change(function(){
			var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category2_key").val("");
					
			 $.ajax({	
			    url     : "<c:url value='/user/category2list.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY2_KEY+'">'+ret.CATEGORY2_NAME+'</option>';		
				});
				$('select[name=category2_key]').html(option);						
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		 });
	 
	 $('#category2_key').change(function(){
			var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category3_key").val("");
					
			 $.ajax({	
			    url     : "<c:url value='/user/category3list.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY3_KEY+'">'+ret.CATEGORY3_NAME+'</option>';		
				});
				$('select[name=category3_key]').html(option);						
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		 });
});

function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
	 frm.action = "<c:url value='/orgMng/orgOnContentsList.do'/>";
  	 frm.submit();
}
 
function fn_edit(key1) {
 	var frm = document.commonForm;
 	$("#edu_sub_no").val(key1);
  	frm.action = "<c:url value='/orgMng/orgOnContentsReq.do'/>?flag=I";
 	frm.submit();
}

function fn_delete(idx) {
	var idxArray = new Array();

	idxArray.push(idx);
	if(confirm('삭제 처리하시겠습니까?')) {
		setDel(idxArray);
	}

}

var btnDel = function() {

	var idxArray = new Array();

	$("input[name=checkNo]:checked").each(function() {
		idxArray.push($(this).val());
	});

	if(idxArray.length < 1){
		alert("선택한 내역이 없습니다.");
		return false;
	}
	
	if(confirm('삭제 처리하시겠습니까?')) {
		setDel(idxArray);
	}
	
};

var setDel = function(idxArray){
    $.ajax({
        url: "/lms/contentsDel.do",
        type: "POST",
        data: { "eduArray" : idxArray },
        success: function(data) {
        	if(data == 'SUCCESS'){
        		alert("처리 완료하였습니다.");
        		location.reload();
        	}
        },
        error: function(data) {
        	console.log(JSON.stringify(data));
        	alert("처리중 오류가 발생했습니다.");
        }
    });
};

</script>