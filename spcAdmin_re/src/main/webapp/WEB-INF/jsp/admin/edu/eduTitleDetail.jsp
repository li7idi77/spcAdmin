
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
	 
	 $('#checkAll').click(function(){
		    var isChecked = this.checked;
			$('input:checkbox[name="checkNo"]').each(function() {
 			this.checked = isChecked;
 	    });
 	 });
	 
 });
 
 
	function fn_detail(idx){
		document.location = "<c:url value='/org/eduTitleDetail.do'/>?sch_no="+idx;
	 }	
	
	function openWindowPop(url, name){
	    var options = 'top=10, left=10, width=810px, height=1200px, status=no, menubar=no, toolbar=no, resizable=no';
	    window.open(url, name, options);
	}	
	function fn_egov_link_page(pageNo){
		 var frm = document.commonForm;
		 $("#pageIndex").val(pageNo); 
	 	 frm.action = "<c:url value='/org/eduTitleList.do'/>";
	   	 frm.submit();
	 }
 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />
			
         	<h1 class="h1-tit">교육명 별 신청자</h1>
            <div class="search-wrap">

                 <div class="search-cont search-sub">
                     <h3 class="h3-tit">신청자명</h3>

                     <div class="radio-cont">
                         <input type="text" class="input-box" id="user_nm" name="user_nm" value="${user_nm}" placeholder="직접입력"/>
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
                     <button class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
                 </div>

             </div>
             </form>
             
             <!-- <div class="btn-cont mb20">
                 <button class="mid-btn white-btn">선택삭제</button>
             </div> -->
             <div class="btn-cont mb20">
                 <select class="select">
                     <option>신청일순</option>
                     <option>이름순(가나다)</option>
                 </select>
             </div>
             
             <div class="table-wrap">
                 <table class="list-tb">
                     <caption>이름, 성별, 직업, 생년월일, 이메일, 연락처, 주소, 신청일, 수료증 발급하기 정보가 있는 테이블</caption>
                         <colgroup>
                             <col width="5%"/>
                             <col width="8%"/>
                             <col width="6%"/>
                             <col width="9%"/>
                             <col width="11%"/>
                             <col width="15%"/>
                             <col width="14%"/>
                             <col width="*"/>
                             <col width="11%"/>
                             <col width="9%"/>
                         </colgroup>
                         <thead>
                             <tr>
                                 <th>No.</th>
                                 <th>이름</th>
                                 <th>성별</th>
                                 <th>직업</th>
                                 <th>생년월일</th>
                                 <th>이메일</th>
                                 <th>연락처</th>
                                 <th>주소</th>
                                 <th>신청일</th>
                                 <th>수료증<br/>발급하기</th>
                             </tr>
                         </thead>
                         <tbody>
                         <c:forEach var="result" items="${resultList}" varStatus="status">
                             <tr>
                                 <td>${status.index + 1}</td>
                                 <td>${result.USER_NM}</td>
                                 <td>${result.USER_SEX}</td>
                                 <td>${result.JOB_CD}</td>
                                 <td>${result.BIRTH_YMD}</td>
                                 <td>${result.EML_ADDR}</td>
                                 <td>${result.MBL_TELNO}</td>
                                 <td class="tl">${result.JUSO} ${result.JUSO_DETAIL}</td>
                                 <td>${result.REG_DT}</td>
                                 <td><button type="button"onClick="javascript:openWindowPop('<c:url value='/my/popMyWarrant.do'/>?cour_no=${result.COUR_NO}&edu_no=${result.EDU_NO}','popup');" class="sm-btn white-btn">발급</button></td>
                             </tr>
                     	 </c:forEach>
                         </tbody>
                     <c:if test="${empty resultList }">
			             <tr>
			                 <td colspan='10'/>Data 없습니다.</td>
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
