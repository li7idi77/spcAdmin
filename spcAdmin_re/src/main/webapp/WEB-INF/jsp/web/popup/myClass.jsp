
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
 function fn_detail(edu_no,cour_no){
		document.location = "<c:url value='/my/popMyClassDetail.do'/>"+"?edu_no="+edu_no+"&cour_no="+cour_no;
	 }	
</script>
    <!--  class-wrap begin -->
            <div class="class-wrap">
		
                <div class="tit-wrap flex-colum">
                    <!---- info-group begin ---->
                    <div class="info-group left-cont">
                        <h1 class="h1-tit">나의 강의실</h1>
                        <p><span class="name">${UserAccount.user_nm}</span>회원</p>
                        <p>|</p>
                        <p>${today}</p>
                    </div>
                    <!---- info-group end ---->

                    <div class="right-cont">
                        <button class="sm-btn white-btn" onClick="location.href='${pageContext.request.contextPath}/my/popMyClass.do'">강의실 홈</button>
                    </div>
                </div>
                

                <!---- search-wrap begin ---->
                <form  id="commonForm" name="commonForm"  method="post"  action="">
                <input type="hidden" id="pageAdd1"  name="pageAdd1" value="" />
                <input type="hidden" id="pageAdd2"  name="pageAdd2" value="" />
                <div class="search-wrap">
                    <div class="search-cont">
                        <label>기간 :</label>
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
                        <label>교육명 :</label>
                        <input type="text" id="edu_name" name="edu_name" class="input-box" placeholder="직접입력"/>
                    </div>

                    <div class="btn-cont">
                        <button class="lg-btn orange-btn">검색</button>
                        <button class="lg-btn navy-btn">초기화</button>
                    </div>
                </div>
                <!---- search-wrap end ---->


                <div class="comp"> <!---- 학습중인 교육  ---->
                    <div class="tit-cont">
                        <h4 class="h4-tit">학습중인 교육</h4>
                        <!-- <button class="sm-btn white-btn">+ 더보기</button> -->
                    </div>
                    
                    <div class="table-wrap class-table">
                        <table class="list-tb">
                            <caption>분류1, 분류2, 분류3(교육명), 강사명, 신청일, 총 학습인증시간, 총 누적학습시간, 학습하기 정보가 있는 테이블</caption>
                            <colgroup>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="12%"/>
                                <col width="*"/>
                                <col width="8%"/>
                                <col width="10%"/>
                                <col width="12%"/>
                                <col width="12%"/>
                                <col width="10%"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>분류1</th>
                                    <th>분류2</th>
                                    <th>분류3(교육명)</th>
                                    <th>강사명</th>
                                    <th>신청일</th>
                                    <th>총 학습인증시간</th>
                                    <th>총 누적학습시간</th>
                                    <th>학습하기</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${ingList}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${list.CATEGORY1_NAME}</td>
                                    <td>${list.CATEGORY2_NAME}</td>
                                    <td class="tl">${list.CATEGORY3_NAME}</td>
                                    <td>${list.INST_NM}</td>
                                    <td>${list.REG_DT}</td>
                                    <td>${list.EDU_TIME}분</td>
                                    <td>${list.COUR_TIME}</td>
                                    <td><button type="button" onClick="fn_detail('${list.EDU_NO}','${list.COUR_NO}');" class="sm-btn white-btn">바로가기</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div> <!---- //  학습중인 교육  ---->


                <div class="comp"> <!---- 학습완료 교육  ---->
                    <div class="tit-cont">
                        <h4 class="h4-tit">학습완료 교육 <span class="point">(수료증 발급은 마이페이지에서 가능합니다.)</span></h4>
                        <!-- <button class="sm-btn white-btn">+ 더보기</button> -->
                    </div>
                    
                    <div class="table-wrap class-table">
                        <table class="list-tb">
                            <caption>분류1, 분류2, 분류3(교육명), 강사명, 신청일, 총 학습인증시간, 총 누적학습시간, 학습하기 정보가 있는 테이블</caption>
                            <colgroup>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="12%"/>
                                <col width="*"/>
                                <col width="8%"/>
                                <col width="10%"/>
                                <col width="12%"/>
                                <col width="12%"/>
                                <col width="10%"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>분류1</th>
                                    <th>분류2</th>
                                    <th>분류3(교육명)</th>
                                    <th>강사명</th>
                                    <th>신청일</th>
                                    <th>총 학습인증시간</th>
                                    <th>총 누적학습시간</th>
                                    <th>학습하기</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${endList}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${list.CATEGORY1_NAME}</td>
                                    <td>${list.CATEGORY2_NAME}</td>
                                    <td class="tl">${list.CATEGORY3_NAME}</td>
                                    <td>${list.INST_NM}</td>
                                    <td>${list.REG_DT}</td>
                                    <td>${list.EDU_TIME}분</td>
                                    <td>${list.COUR_TIME}</td>
                                    <td><button type="button" onClick="fn_detail('${list.EDU_NO}','${list.COUR_NO}');" class="sm-btn white-btn">바로가기</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!---- // 학습완료 교육  ---->
            </div>
            <!--  class-wrap end -->