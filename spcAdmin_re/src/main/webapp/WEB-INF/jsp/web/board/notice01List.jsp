
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
	 
	 $('.link').bind('click', function(){
		 	var frm = document.commonForm;
		 
		   	var board_idx  = $(this).data('idx');
		   	$("#board_idx").val(board_idx);
		   	
		   	var type = $("#board_type").val();
		   	if (type=="01"){
				frm.action = "<c:url value='/user/notice01View.do'/>";	
			}else if (type=="02"){
				frm.action = "<c:url value='/user/notice02View.do'/>";		
			}else if (type=="03"){
				frm.action = "<c:url value='/user/notice03View.do'/>";	
			}
			
			frm.submit();
			
	 });
 }); 

 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
	 frm.action = "<c:url value='/user/notice01List.do'/>";
   	 frm.submit();
 }
</script>
     <!-- container  begin -->
                <div id="container">
                	
                    <div class="tit-wrap">
                        <h1 class="h1-tit">
                          <c:if test="${adBoardVo.board_type =='01'}">공지사항</c:if>
						  <c:if test="${adBoardVo.board_type =='02'}">자료실</c:if>
						  <c:if test="${adBoardVo.board_type =='03'}">FAQ</c:if>
                        </h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>공지사항</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>
							  <c:if test="${adBoardVo.board_type =='01'}">공지사항</c:if>
							  <c:if test="${adBoardVo.board_type =='02'}">자료실</c:if>
							  <c:if test="${adBoardVo.board_type =='03'}">FAQ</c:if>
							</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
						<form  id="commonForm" name="commonForm"  method="post"  action="">
						<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
						<input type="hidden" id="board_idx"   name="board_idx"  value="0"/>
     					<input type="hidden" id="board_type"  name="board_type" value="${adBoardVo.board_type}">
                        <!---- search-wrap begin ---->
                        <div class="search-wrap">
                            <div class="search-cont">
                                <label>작성일 :</label>
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
                            </div>
                            <div class="search-cont">
                                <label>검색어 :</label>
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
						             <input type="text" id='searchKeyword' name='searchKeyword' value="${adBoardVo.searchKeyword}" class="input-box" placeholder="직접입력"/>
						         </div>
                            </div>

                            <div class="btn-cont">
                                <button class="lg-btn orange-btn">검색</button>
                                <button type="button" class="lg-btn navy-btn" onClick="fn_clear();">초기화</button>
                            </div>
                        </div>
                        </form>
                        <!---- search-wrap end ---->

                        <div class="comp">
                        <div class="table-wrap">
                            <table class="list-tb">
                                <caption>제목, 작성자, 첨부파일, 작성일, 조회수 정보가 있는 테이블</caption>
                                <colgroup>
                                    <col width="8%"/>
                                    <col width="*"/>
                                    <col width="12%"/>
                                    <col width="16%"/>
                                    <col width="12%"/>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="result" items="${resultList}" varStatus="status">
                                    <tr>
                                        <td><c:out value="${(adBoardVo.pageIndex-1) * adBoardVo.pageSize + (status.count)}"/></td>
                                        <td class="tl"><a class="link" data-idx='${result.board_idx}' >${result.title}</a></td>
                                        <td>${result.reg_nm}</td>
                                        <td>${fn:substring(result.reg_dt,0,10) }</td>
                                        <td>${result.view_cnt}</td>
                                    </tr>
                                    </c:forEach>
						             <c:if test="${empty resultList }">
							             <tr>
							             	<td colspan='5'/>Data 없습니다.</td>
							             </tr>
						          	 </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                        <!---- page begin ---->
                        <div class="page-wrap">
				        	 <ul class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
					 		 </ul>
				        </div>
                        <!---- page end ---->

                    </div>
                </div>
                <!--  container end -->