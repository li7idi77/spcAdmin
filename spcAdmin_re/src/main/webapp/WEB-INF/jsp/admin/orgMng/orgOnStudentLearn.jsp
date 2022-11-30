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
<script>
function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
	 frm.action = "<c:url value='/lms/studentLearn.do'/>";
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

	var courNoArray = new Array();

	$("input[name=checkNo]:checked").each(function() {
		courNoArray.push($(this).val());
	});

	if(courNoArray.length < 1){
		alert("선택한 내역이 없습니다.");
		return false;
	}
	
	if(confirm('삭제 처리하시겠습니까?')) {
		setDel(courNoArray);
	}
	
};

var setDel = function(courNoArray){
    $.ajax({
        url: "<c:url value='/lms/studentDel.do'/>",
        type: "POST",
        data: { "courNoArray" : courNoArray },
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
<h1 class="h1-tit">수강생/수료생 현황</h1>

<div class="search-wrap">
    <div class="search-cont search-sub">
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="search_type" name="search_type" value="ALL" checked>
            <label for="">전체</label>
        </div>
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="search_type" name="search_type" value="NAME">
            <input type="text" id="user_nm" name="user_nm" class="input-box" placeholder="회원명 직저입력"/>
        </div>

        <button class="search-btn">검색</button>
        <button type="button" class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
    </div>
</div>

<div class="btn-cont mb20">
    <dl class="count-txt">
        <dt>수강생 <span>${totCnt}</span></dt>
    </dl>

    <button class="mid-btn black-btn">엑셀다운</button>
</div>

<div class="table-wrap">
    <table class="list-tb">
        <caption>선택, 분류3, 회원명(ID), 수강 시작일, 총 학습인증시간, 총 누적학습시간 정보가 있는 테이블</caption>
        <colgroup>
            <col width="8%"/>
            <col width="8%"/>
            <col width="*"/>
            <col width="14%"/>
            <col width="14%"/>
            <col width="14%"/>
            <col width="14%"/>
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" class="check-box"/></th>
                <th>No.</th>
                <th>분류3</th>
                <th>회원명(ID)</th>
                <th>수강 시작일</th>
                <th>총 학습 인증시간</th>
                <th>총 누적 학습시간</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="result" items="${resultList}" varStatus="status">
            <tr>
                <td><input type="checkbox" id='checkNo' name='checkNo' value="${result.COUR_NO}" class="check-box"/></td>
                <td>${status.index + 1}</td>
                <td class="tl">${result.CATEGORY3_NAME}</td>
                <td>
                    <a class="link">
                        <span class="block">${result.USER_NM}</span><span class="block">(${result.USER_ID})</span>
                    </a>
                </td>
                <td>${result.REG_DT}</td>
                <td><span>${result.EDU_TIME}</span>분</td>
                <td><span>${result.COUR_TIME}</span></td>
            </tr>
            </c:forEach>
            <c:if test="${empty resultList }">
             <tr>
                 <td colspan='7'/>Data 없습니다.</td>
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