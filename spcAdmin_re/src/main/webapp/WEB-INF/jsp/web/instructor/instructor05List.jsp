
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
 
 function fn_save(idx){
	 if(confirm("교육을 신청 하시겠습니까?")){
		 $.ajax({
		        url: "<c:url value='/user/instructor05Save.do'/>?edu_no="+idx,
		        type: "POST",
		        data: {},
		        success: function(data) {
		        	if(data.result == 'SUCCESS'){
		        		alert("신청 하였습니다.");
		        		location.reload();
		        	}
		        },
		        error: function(data) {
		        	console.log(JSON.stringify(data));
		        	alert("처리중 오류가 발생했습니다.");
		        }
		    });
	 }
 } 
 
 function fn_move(str) {
	  	var frm = document.commonForm;
		$("#tapNo").val(str);  
	   	frm.action = "<c:url value='/user/instructor05List.do'/>";
	  	frm.submit();
 }
 
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
 	 frm.action = "<c:url value='/user/instructor05List.do'/>";
   	 frm.submit();
 }
</script>
     <!-- container  begin -->
                <div id="container">
                    <div class="tit-wrap">
                        <h1 class="h1-tit">강사 보수 교육</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>생명지킴이 강사 공간</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>강사 보수 교육</span>
                        </div>
                    </div>

                    <div class="contents-wrap">

                        <!---- tab-cont begin ---->
                        <div class="tab-cont">
                            <ul>
                            	<c:if test="${tapNo eq '1'}">
                                <li class="on">신청하기</li>
                                <li><a onClick="fn_move('2')">학습하기</a></li>
                                </c:if>
                                <c:if test="${tapNo eq '2'}">
                                <li><a onClick="fn_move('1')">신청하기</a></li>
                                <li class="on">학습하기</li>
                                </c:if>
                            </ul>
                        </div>
                        <!---- tab-cont end ---->

                        <!---- search-wrap begin ---->
                        <form  id="commonForm" name="commonForm"  method="post"  action="">
		    			<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
		    			<input type="hidden" id="tapNo" name="tapNo" class="input-box" value="${tapNo}"  />
                        <div class="search-wrap">
                            <div class="search-cont">
                                <label>기간 :</label>
                                <div class="picker-wrap">
                                    <input type="text" id="start_date" name="start_date" class="input-box" readonly value="${start_date}"/>
                                    <span class="next-ico">-</span>
                                    <input type="text" id="end_date" name="end_date" class="input-box" readonly value="${end_date}"/>
                                </div>
                            </div>

                            <div class="search-cont">
                                <label>교육명 :</label>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="eduSearch" name="eduSearch" value="ALL" checked>
                                    <label for="">전체</label>
                                </div>
                                  
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="eduSearch" name="eduSearch" value="TEXT">
                                    <input type="text" class="input-box" id="edu_nm" name="edu_nm" placeholder="직접입력" />
                                </div>
                            </div>

                            <div class="btn-cont">
                                <button class="lg-btn orange-btn">검색</button>
                                <button type="button" type="button" class="lg-btn navy-btn" onClick="fn_clear();">초기화</button>
                            </div>
                        </div>
                        </form>
                        <!---- search-wrap end ---->

                        
                        <div class="comp">
                            <div class="table-wrap">
                            	<c:if test="${tapNo eq '1'}">
                                <table class="list-tb">
                                    <caption>교육명, 교육기간, 교육방식, 교육상태, 신청하기 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="*"/>
                                        <col width="16%"/>
                                        <col width="16%"/>
                                        <col width="12%"/>
                                        <col width="12%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>교육명</th>
                                            <th>교육기간</th>
                                            <th>교육방식</th>
                                            <th>교육상태</th>
                                            <th>신청하기</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td class="tl">${result.EDU_NAME}</td>
                                            <td><span>${result.TRAIN_S_DATE}</span>~<span>${result.TRAIN_E_DATE}</span></td>
                                            <td>
                                                <span class="block">${result.EDU_METHOD}</span>
                                            </td>
                                            <td>${result.EDU_STATUS}</td>
                                            <td>
                                            <c:if test="${result.APP_CHK == 'Y'}">신청완료</c:if>
                                            <c:if test="${result.APP_CHK != 'Y' && result.EDU_STATUS == '교육중'}">
                                            	<button class="sm-btn navy-btn" onClick="fn_save('${result.EDU_NO}')">신청하기</button>
                                            </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty resultList }">
							             <tr>
							                 <td colspan='6'/>Data 없습니다.</td>
							             </tr>
							        </c:if>
                                    </tbody>
                                </table>
                                </c:if>
                                <c:if test="${tapNo eq '2'}">
                                <table class="list-tb">
                                    <caption>교육명, 교육기간, 교육방식, 교육상태, 신청하기 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="*"/>
                                        <col width="16%"/>
                                        <col width="16%"/>
                                        <col width="12%"/>
                                        <col width="12%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>교육명</th>
                                            <th>교육기간</th>
                                            <th>교육방식</th>
                                            <th>학습여부</th>
                                            <th>나의 강의실</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td class="tl">${result.EDU_NAME}</td>
                                            <td><span>${result.TRAIN_S_DATE}</span>~<span>${result.TRAIN_E_DATE}</span></td>
                                            <td>
                                                <span class="block">${result.EDU_METHOD}</span>
                                            </td>
                                            <td>${result.COUR_STAT}</td>
                                            <td><button class="sm-btn white-btn" onClick="javascript:openWindowPop('<c:url value='/my/popMyClass.do'/>','popup');">바로가기</button></td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty resultList }">
							             <tr>
							                 <td colspan='6'/>Data 없습니다.</td>
							             </tr>
							        </c:if>
                                    </tbody>
                                </table>
                                </c:if>
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