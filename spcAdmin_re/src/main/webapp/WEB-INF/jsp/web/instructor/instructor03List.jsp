
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
 
 function fn_clear(){
	 $("[type='text']").val("");
 }
 
 function fn_save(sch_no,edu_no){
	 var formData = new FormData(); 
	 formData.append("app_user",   $("#user_id").val());
	 formData.append("sch_no",   sch_no);
	 formData.append("edu_no",   edu_no);
		if(confirm("교육 활동 신청을 하시겠습니까?")){
				
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/user/instructor03Save.do'/>",
			    dataType   : "JSON",
		        processData: false, 
		        contentType: false,
				type	   : "POST",	
		        success    : function(obj) {
		        	commonCallBack(obj);				
		        },	       
		        error 	: function(xhr, status, error) {} 		        
		    });
		}
}	
 
 function commonCallBack(obj){
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("성공하였습니다.");				
				fn_goList();				 
			}else {				
				alert("등록이 실패 했습니다.");	
				return false;
			}
		}
	}	

	function fn_goList(){
		document.location = "<c:url value='/user/instructor03List.do'/>";
	 }	
	function fn_egov_link_page(pageNo){
		 var frm = document.commonForm;
		 $("#pageIndex").val(pageNo); 
	 	 frm.action = "<c:url value='/user/instructor03List.do'/>";
	   	 frm.submit();
	 }
</script>
     <!-- container  begin -->
                <div id="container">
                    <div class="tit-wrap">
                        <h1 class="h1-tit">강사 활동 신청</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>생명지킴이 강사 공간</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>강사 활동 신청</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
						<form  id="commonForm" name="commonForm"  method="post"  action="">
		    			<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
		    			<input type="hidden" id="user_id"  name="user_id" value="${UserAccount.user_id}" />
		    			
                        <!---- search-wrap begin ---->
                        <div class="search-wrap">
                            <div class="search-cont">
                                <label>기간 :</label>
                                <div class="radio-cont">
						            <input type="radio" class="radio-box" id="dateAll" name="searchDate" value="ALL" <c:if test="${searchDate == 'ALL' || (empty searchDate)}">checked </c:if>>
						            <label for="dateAll">전체</label>
						        </div>
						          
						        <div class="radio-cont">
						            <input type="radio" class="radio-box" id="dateToday" name="searchDate" value="TODAY" <c:if test="${searchDate == 'TODAY'}">checked </c:if>>
						            <label for="dateToday">오늘</label>
						        </div>
						        
						        <div class="radio-cont mr10">
						            <input type="radio" class="radio-box" id="dateTerm" name="searchDate" value="CHECK" <c:if test="${searchDate == 'CHECK'}">checked </c:if>>
						            <label for="dateTerm">기간선택</label>
						        </div>
						        <div class="picker-wrap">
						            <input type="text" id="start_date" name="start_date" class="input-box" readonly value="${start_date}"/>
						            <span class="next-ico">-</span>
						            <input type="text" id="end_date" name="end_date" class="input-box" readonly value="${end_date}"/>
						        </div>
                            </div>

                            <div class="search-cont">
                                <label>교육명 :</label>
                                <input type="text" id="edu_name" name="edu_name" class="input-box lg-width" placeholder="직접입력" value="${edu_name}"/>
                            </div>

                            <div class="search-cont">
                                <label>지역 :</label>
                                <select class="select" id="area_nm" name="area_nm">
                                    <option value="">지역선택</option>
			                        <c:forEach var="code" items="${codeList}" varStatus="status">
										<option value='${code.CD}' <c:if test="${area_nm == code.CD}">selected</c:if>>${code.CD_NM}</option>
									</c:forEach>
                                </select>
                                <label>기관명 :</label>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="orgAll" name="orgSearch" value="ALL" <c:if test="${orgSearch == 'ALL'}">checked </c:if>>
                                    <label for="">전체</label>
                                </div>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="orgText" name="orgSearch" value="TEXT" <c:if test="${orgSearch == 'TEXT'}">checked </c:if>>
                                    <input type="text" class="input-box" id="edu_org_name" name="edu_org_name" value="${edu_org_name}" placeholder="직접입력"/>
                                </div>
                            </div>

                            <div class="btn-cont">
                                <button class="lg-btn orange-btn">검색</button>
                                <button class="lg-btn navy-btn" onClick="fn_clear();">초기화</button>
                            </div>
                        </div>
                        </form>
                        <!---- search-wrap end ---->

                        <div class="comp">
                            <div class="table-wrap">
                                <table class="list-tb">
                                    <caption>교육일시, 지역, 교육장소, 기관명, 교육명, 교육대상, 교육인원, 신청하기 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="7%"/>
                                        <col width="14%"/>
                                        <col width="9%"/>
                                        <col width="12%"/>
                                        <col width="12%"/>
                                        <col width="*"/>
                                        <col width="9%"/>
                                        <col width="9%"/>
                                        <col width="9%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>교육일시</th>
                                            <th>지역</th>
                                            <th>교육장소</th>
                                            <th>기관명</th>
                                            <th>교육명</th>
                                            <th>교육대상</th>
                                            <th>교육인원</th>
                                            <th>신청하기</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>
                                                <span class="block">${result.EDU_DATE}</span>
                                                <span class="block">${result.EDU_DATETIME}</span>
                                            </td>
                                            <td>${result.AREA_NM}</td>
                                            <td>${result.EDU_PLACE}</td>
                                            <td>${result.EDU_ORG_NAME}</td>
                                            <td class="tl">${result.EDU_NAME}</td>
                                            <td>${result.EDU_TARGET}</td>
                                            <td><span>${result.EDU_NUMBER}</span>명</td>
                                            <td><c:if test="${result.INS_APP_CHECK != 'Y'}">
                                            	<button class="sm-btn white-btn" onClick="fn_save('${result.SCHEDULE_NO}','${result.EDU_KEY}');">신청</button>
                                            	</c:if>
                                            </td>
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
                        </div>

                        <div class="page-wrap">
						     <ul class="paging">
						         <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
						     </ul>
						</div>

                    </div>
                </div>
                <!--  container end -->