
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
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
 });
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
 	 frm.action = "<c:url value='/org/eduStatustList.do'/>";
   	 frm.submit();
 }
function openWindowPop(url, name){
    var options = 'top=10, left=10, width=700px, height=600px, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}	

 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />
         	<h1 class="h1-tit">교육 신청 현황</h1>


         <div class="search-wrap">
             
             <div class="search-cont">
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="status_type" name="status_type" value="ALL" <c:if test="${status_type == 'ALL' || (empty status_type)}">checked </c:if>>
                     <label for="">전체</label>
                 </div>
                 
                 <div class="radio-cont mr10">
                     <input type="radio" class="radio-box" id="status_type" name="status_type" value="1" <c:if test="${status_type == '1'}">checked </c:if>>
                     <label for="">신청완료</label>
                 </div>

                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="status_type" name="status_type" value="2" <c:if test="${status_type == '2'}">checked </c:if>>
                     <label for="">신청취소</label>
                 </div>
                 
                 
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="status_type" name="status_type" value="3" <c:if test="${status_type == '3'}">checked </c:if>>
                     <label for="">교육완료/결과보고</label>
                 </div>
                 
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="status_type" name="status_type" value="4" <c:if test="${status_type == '4'}">checked </c:if>>
                     <label for="">보고완료</label>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">기관명</h3>

                 <div class="radio-cont">
                     <input type="text" id="org_nm" name="org_nm" class="input-box" value="${org_nm}" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">강사명</h3>

                 <div class="radio-cont">
                     <input type="text" id="ins_nm" name="ins_nm" class="input-box" value="${ins_nm}" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">교육명</h3>
                 
                 <div class="radio-cont">
                     <input type="text" id="edu_nm" name="edu_nm" class="input-box" value="${edu_nm}" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">지역</h3>

                 <div class="radio-cont">
                     <input type="text" id="area_nm" name="area_nm" class="input-box" value="${area_nm}" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont">
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="ALL" <c:if test="${searchDate == 'ALL' || (empty searchDate)}">checked </c:if>>
                     <label for="dateAll">전체</label>
                 </div>
                   
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="TODAY" <c:if test="${searchDate == 'TODAY'}">checked </c:if>>
                     <label for="dateToday">오늘</label>
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
                 
                 <button class="search-btn">검색</button>
                 <button type="button" class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
             </div>
             
         </div>
         </form>
         
         <div class="btn-cont mb20">
             <dl class="count-txt">
                 <dt>전체 <span>${allCount.ALL_CNT}</span></dt>
                 <dt>신청중 <span>${allCount.CNT0}</span></dt>
                 <dt class="blue-txt">신청완료 <span>${allCount.CNT1}</span></dt>
                 <dt class="red-txt">신청취소 <span>${allCount.CNT2}</span></dt>
                 <dt class="green-txt">교육완료(결과보고) <span>${allCount.CNT3}</span></dt>
                 <dt class="gray-txt">보고완료 <span>${allCount.CNT4}</span></dt>
             </dl>

             <button class="mid-btn black-btn">엑셀다운</button>
             <!-- <button class="mid-btn white-btn">선택삭제</button> -->
         </div>
         
         <div class="table-wrap scroll-wrap">
             <table class="list-tb">
                 <caption>선택, 교육명, 교육일, 교육시간, 지역, 기관명, 교육개설 신청자, 교육대상, 교육장소, 교육인원, 강사(ID), 강사섭외 유무, 진행현황, 취소사유, 수정 정보가 있는 테이블</caption>
                 <colgroup>
                     <%-- <col width="3%"/> --%>
                     <col width="4%"/>
                     <col width="8%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="8%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="*"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                 </colgroup>
                 <thead>
                     <tr>
                         <!-- <th><input type="checkbox" class="check-box"/></th> -->
                         <th>No.</th>
                         <th>교육명</th>
                         <th>교육일</th>
                         <th>교육시간(분)</th>
                         <th>지역</th>
                         <th>기관명</th>
                         <th>교육개설<br/>신청자</th>
                         <th>교육대상</th>
                         <th>교육장소</th>
                         <th>교육인원</th>
                         <th>강사(ID)</th>
                         <th>강사 섭외<br/>유무</th>
                         <th>진행현황</th>
                         <th>취소사유</th>
                         <th>수정</th>
                     </tr>
                 </thead>
                 <tbody>
                 <c:forEach var="result" items="${resultList}" varStatus="status">
                     <tr>
                         <!-- <td><input type="checkbox" class="check-box"/></td> -->
                         <td>${status.index + 1}</td>
                         <td class="tl">${result.EDU_NAME}</td>
                         <td>${result.EDU_DATE}</td>
                         <td>${result.EDU_TIME}</td>
                         <td>${result.AREA_NM}</td>
                         <td>${result.EDU_ORG_NAME}</td>
                         <td>${result.USER_NM}</td>
                         <td>${result.EDU_TARGET}</td>
                         <td>${result.EDU_PLACE}</td>
                         <td><span>${result.EDU_NUMBER}</span></td>
                         <td><span class="block">${result.EDU_TEAC_NAME}</span><span  class="block">${result.EDU_TEAC_ID}</span></td>
                         <td><c:if test="${result.INS_STATUS == '완료'}"><span>완료</span></c:if>
                         	 <c:if test="${result.INS_STATUS != '완료'}"><span class="link" <c:if test="${result.INS_STATUS == '섭외중'}">style="cursor:pointer;" onClick="javascript:openWindowPop('<c:url value='/user/popInsSelect.do'/>?sch_no=${result.SCHEDULE_NO}','popup');"</c:if>>섭외중</span></c:if>
                         </td>
                         <td><c:if test="${result.SCH_STATUS == '신청완료'}"><span class="blue-txt">신청완료</span></c:if>
	                         <c:if test="${result.SCH_STATUS == '신청취소'}"><span class="red-txt">신청취소</span></c:if>
	                         <c:if test="${result.SCH_STATUS == '교육완료'}"><span class="green-txt">교육완료(결과보고)</span></c:if>
	                         <c:if test="${result.SCH_STATUS == '보고완료'}"><span class="gray-txt">보고완료</span></c:if>
                         </td>
                         <td><c:if test="${result.CANCEL_REASON != null && result.CANCEL_REASON != ''}"><button type="button" class="sm-btn white-btn"  onClick="javascript:openWindowPop('<c:url value='/user/popAppCancel.do'/>?chk=view&sch_no=${result.SCHEDULE_NO}','popup');">보기</button></c:if></td>
                         <td><c:if test="${result.SCH_STATUS == '신청완료' || result.SCH_STATUS == '신청취소' || result.SCH_STATUS == ''}"><button type="button" class="sm-btn blue-btn" onClick="javascript:location.href='<c:url value='/org/eduStatustMod.do'/>?sch_no=${result.SCHEDULE_NO}'">수정</button></c:if></td>
                     </tr>
                 </c:forEach>
                 <c:if test="${empty resultList }">
		             <tr>
		                 <td colspan='15'/>Data 없습니다.</td>
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
