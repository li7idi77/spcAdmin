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

<h1 class="h1-tit">FAQ</h1>

<div class="search-wrap">
	<form id="listForm" name="listForm" target="_self" action="/adBoard/faqList.do" method="post" onsubmit="">
     <input type="hidden" id="board_idx"   name="board_idx"  value="${adBoardVo.board_idx}"/>
     <input type="hidden" id="gubun1"      name="gubun1"     value='I'   />
    
    <div class="search-cont">

        <div class="radio-cont">
            <input type="radio" class="radio-box" id="searchCondition" name="searchCondition" value="ALL" <c:if test="${adBoardVo.searchCondition =='ALL'  || (empty adBoardVo.searchCondition) }">checked </c:if>>
            <label for="">전체</label>
        </div>
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="searchCondition" name="searchCondition" value="TITLE" <c:if test="${adBoardVo.searchCondition =='TITLE'}">checked </c:if>>
            <label for="">제목</label>
        </div>
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="searchCondition" name="searchCondition" value="REG_NM" <c:if test="${adBoardVo.searchCondition =='REG_NM'}">checked </c:if>>
            <label for="">작성자명</label>
        </div>
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="searchCondition" name="searchCondition" value="CONTENTS" <c:if test="${adBoardVo.searchCondition =='CONTENTS'}">checked </c:if>>
            <label for="">내용</label>
        </div>
        <input type="text" id='searchKeyword' name='searchKeyword' value="${adBoardVo.searchKeyword}" class="input-box" placeholder="직접입력"/>
    </div>

    <div class="search-cont">

        <div class="radio-cont">
            <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="ALL" <c:if test="${adBoardVo.searchDate == 'ALL' || (empty adBoardVo.searchDate)}">checked </c:if>>
            <label for="dateAll">전체</label>
        </div>
          
        <div class="radio-cont mr10">
            <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="CHECK" <c:if test="${adBoardVo.searchDate == 'CHECK'}">checked </c:if>>
            <label for="dateTerm">기간선택</label>
        </div>
        <div class="picker-wrap">
            <input type="text" id="board_start_date" name="board_start_date" class="input-box" readonly value="${adBoardVo.board_start_date}"/>
            <span class="next-ico">-</span>
            <input type="text" id="board_end_date" name="board_end_date" class="input-box" readonly value="${adBoardVo.board_end_date}"/>
        </div>
        
        <button type="submit" class="search-btn">검색</button>
        <button class="search-btn white-btn ml20">초기화</button>
    </div>
	</form>
</div>

<div class="btn-cont mb20">
    <button class="mid-btn blue-btn" onclick="location.href = '<c:url value='/adBoard/faqReq.do' />'; ">등록</button>
    <button class="mid-btn white-btn" onClick="javascript:btnDel();">선택삭제</button>
</div>

<div class="table-wrap">
    <table class="list-tb">
        <caption>선택, 카테고리, 제목, 첨부파일, 작성일, 작성자, 조회수, 관리 정보가 있는 테이블</caption>
        <colgroup>
            <col width="5%"/>
            <col width="7%"/>
            <col width="9%"/>
            <col width="*"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="7%"/>
            <col width="7%"/>
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" class="check-box"/></th>
                <th>No.</th>
                <th>카테고리</th>
                <th>제목</th>
                <th>첨부파일</th>
                <th>작성일</th>
                <th>작성자</th>
                <th>조회수</th>
                <th colspan="2">관리</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="result" items="${resultList}" varStatus="status">
            <tr>
                <td><input type="checkbox" class="check-box" id='checkNo' name='checkNo' value="${result.board_idx}"/></td>
                <td><c:out value="${(adBoardVo.pageIndex-1) * adBoardVo.pageSize + (status.count)}"/></td>
                <td>${result.board_type}</td>
                <td>${result.title}</td>
                <td><button class="sm-btn white-btn">다운로드</button></td>
                <td>${result.reg_dt}</td>
                <td>${result.reg_id}</td>
                <td>${result.view_cnt}</td>
                <td><button type="button" class="sm-btn blue-btn"  onClick="javascript:fn_edit('${result.board_idx}',  'E', 'faqist');" >수정</button></td>
                <td><button type="button" class="sm-btn white-btn" onClick="javascript:fn_delete('${result.board_idx}');">삭제</button></td>
            </tr>
            </c:forEach>
            <c:if test="${empty resultList }">
	             <tr>
	                 <td colspan='9'/>Data 없습니다.</td>
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
		 $("#board_start_date, #board_end_date").datepicker({
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
 });
 
function fn_edit(key1, str) {
 	var frm = document.listForm;
 	$("#board_idx").val(key1);
  	frm.action = "<c:url value='/adBoard/faqReq.do'/>";
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
        url: "/adBoard/noticeDel.do",
        type: "POST",
        data: { "boardIdxArray" : idxArray },
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
