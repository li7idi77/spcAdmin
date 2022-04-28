
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
 <!--
 	$(document).ready(function(){
 		 $("#train_e_date, #train_s_date").datepicker({
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
 		
 		$("#user_nm").keypress(function(e) {
 	        if ('13' == e.keyCode) {
 	        	fn_search();
 	            return false;
 	        }
 	    });
 		
 	 });
 
	function fn_search(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 

		if(checkdate =="ALL"){
			$("#train_s_date").val(''); 
			$("#train_e_date").val('');
		}
		
		frm.action = "<c:url value='/edu/eduInfoMangNoOrglineMangView.do'/>";
		frm.submit();
	}
     
    function fn_excel(){
    	 var frm = document.commonForm;
    	 frm.action = "<c:url value='/edu/excelDownloadOnLine.do'/>";
    	 $("#excelFileName").val('교육 신청자 리스트'); 
      	 frm.submit();
    }
     
     /* pagination 페이지 링크 function */
     function fn_egov_link_page(pageNo){
    	 var frm = document.commonForm;
		 $("#pageIndex").val(pageNo); 
     	 frm.action = "<c:url value='/edu/eduInfoMangNoOrglineMangView.do'/>";
       	 frm.submit();
     }
     //-->
 </script>

        <div class="tab-cont">
               <ul>
                   <li>온라인교육</li>
                   <li  class="on">오프라인 교육</li>
               </ul>
         </div>
		<form  id="commonForm" name="commonForm"  method="post"  action="">
			<input type="hidden" id="gubun1"         name="gubun1"         value='I'  />
		    <input type="hidden" id="gubun2"         name="gubun2"         value='${categoryVo.gubun2}' />	
		    <input type="hidden" id="gubun3"         name="gubun3"         value=''  />
		    <input type="hidden" id="excelFileName"  name="excelFileName"  value=''  />
		    <input type="hidden" id="edu_no"         name="edu_no"         value='${categoryVo.edu_no}' />		
		    <input type="hidden" id="edu_site"       name="edu_site"       value='${categoryVo.edu_site}'/>
		    <input type="hidden" id="site"           name="site"           value='${categoryVo.site}'/>
		    <input type="hidden" id="pageIndex"      name="pageIndex"        value=1  />	

           <div class="search-wrap">

               <div class="search-cont">
                   <div class="radio-cont">
                       <input type="radio" class="radio-box cdate" id="checkdate"  name="checkdate" value="ALL"  <c:if test="${categoryVo.checkdate =='ALL'  || (empty categoryForm.category1_name) }">checked </c:if>  >
                       <label for="dateAll">전체</label>
                   </div>                          
                   <div class="radio-cont">
                       <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TODAY" <c:if test="${categoryVo.checkdate =='TODAY'}">checked </c:if>  >
                       <label for="dateToday">오늘</label>
                   </div>
                   
                   <div class="radio-cont mr10">
                       <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TERM" <c:if test="${categoryVo.checkdate =='TERM'}">checked </c:if>  >
                       <label for="dateTerm">기간선택</label>
                   </div>
                   <div class="picker-wrap">
                       <input type="text" id="train_s_date" name="train_s_date" readonly class="input-box" value="${categoryVo.train_s_date}"/>
                       <span class="next-ico">-</span>
                       <input type="text" id="train_e_date"   name="train_e_date"   readonly class="input-box" value="${categoryVo.train_e_date}"/>
                   </div>
                   <input type="text" class="input-box" id="user_nm" name="user_nm" value="${categoryVo.user_nm}" size="12" placeholder="신청자명"/>                   
               </div>
           </div>
           

           <div class="btn-cont mb20">
           	<button  type="button" class="search-btn" onClick="fn_search();">검색</button>
            <button type="reset" class="search-btn white-btn">초기화</button>
            <button type="button" class="mid-btn black-btn "  onClick="fn_excel();">엑셀다운</button>
            <button type="button"  onClick="javascript:history.back();" class="mid-btn white-btn btncan">목록</button>
           </div>
           </form>
            <div class="table-wrap scroll-wrap">
                    <table class="list-tb">
                         <caption>선택, 이름, 성별, 직업, 생년원일, 이메일, 연락처, 주소, 신청일 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="5%"/>
                            <col width="8%"/>
                            <col width="6%"/>
                            <col width="8%"/>
                            <col width="9%"/>
                            <col width="20%"/>
                            <col width="12%"/>
                            <col width="*"/>
                            <col width="8%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>이름</th>
                                <th>성별</th>
                                <th>직업</th>
                                <th>생년원일</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>주소</th>
                                <th>신청일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="result" items="${resultList}" varStatus="status">
	                        <tr class="goView" style="cursor:pointer" data-no="${result.edu_no}" data-site="${categoryVo.edu_site}">
	                            <td><c:out value="${(categoryVo.pageIndex-1) * categoryVo.pageSize + (status.count)}"/></td>
                                <td>${result.user_nm}</td>
                                <td>${result.user_sex}</td>
                                <td>${result.job_cd}</td>
                                <td>${result.birth_ymd}</td>
                                <td>${result.eml_addr}</td>
                                <td>${result.mbl_telno}</td>
                                <td class="tl">${result.juso}</td>
                                <td>${result.reg_dt}</td>
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
           