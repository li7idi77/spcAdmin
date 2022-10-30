
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
	 	
 });
 
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
 	 frm.action = "<c:url value='/user/org03List.do'/>";
   	 frm.submit();
 }
 
 function fn_detail(sch_no){
		document.location = "<c:url value='/user/org02Report.do'/>"+"?sch_no="+sch_no;
	 }	

</script>
     <!-- container  begin -->
                <div id="container">
                	
                    <div class="tit-wrap">
                        <h1 class="h1-tit">기관회원 교육결과 보고</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관 회원 서비스</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관회원 교육결과 보고</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
						<form  id="commonForm" name="commonForm"  method="post"  action="">
		    		<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
                        <!---- search-wrap begin ---->
                        <div class="search-wrap">

                            <div class="search-cont">
                                <label>구분 :</label>
                                <select class="select" id="searchType" name="searchType">
                                	<option value="">전체</option>
                                    <option value="1" <c:if test="${searchType == '1'}">selected</c:if>>보고완료</option>
                                    <option value="2" <c:if test="${searchType == '2'}">selected</c:if>>교육완료/결과보고</option>
                                </select>
                            </div>

                            <div class="btn-cont">
                                <button class="lg-btn orange-btn">검색</button>
                                <button type="button" class="lg-btn navy-btn" onClick="fn_clear();">초기화</button>
                            </div>
                        </div>
                        </form>
                        <!---- search-wrap end ---->

                        <!---- tit-cont begin ---->
                        <div class="tit-cont">
                            <p class="total">전체 : <span>${totCnt}</span>건</p>
                        </div>
                        <!---- tit-cont end ---->


                        <div class="comp mt20">
                            <div class="table-wrap">
                                <table class="list-tb">
                                    <caption>교육명, 교육일시, 교육시간, 기관명, 교육대상, 강사, 상태 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="8%"/>
                                        <col width="*"/>
                                        <col width="15%"/>
                                        <col width="10%"/>
                                        <col width="12%"/>
                                        <col width="9%"/>
                                        <col width="9%"/>
                                        <col width="12%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>교육명</th>
                                            <th>교육일시</th>
                                            <th>교육시간</th>
                                            <th>기관명</th>
                                            <th>교육대상</th>
                                            <th>강사</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${resultList}" varStatus="status">
                                    	<tr>
                                            <td>${status.index + 1}</td>
                                            <td class="tl">${result.EDU_NAME}</td>
                                            <td>
                                                <span class="block">${result.EDU_DATE}</span>
                                                <span class="block">${result.EDU_DATETIME}</span>
                                            </td>
                                            <td><span>${result.EDU_TIME}</span>분</td>
                                            <td>${result.EDU_ORG_NAME}</td>
                                            <td>${result.EDU_TARGET}</td>
                                            <td>${result.EDU_TEAC_NAME}</td>
                                            <td>
                                                <span class="block" >${result.SCH_STATUS}</span>
                                                <c:if test="${result.SCH_STATUS == '교육완료'}">
                                                	<button class="sm-btn navy-btn" onClick="fn_detail('${result.SCHEDULE_NO}');">결과보고</button>
                                                </c:if>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        <c:if test="${empty resultList }">
								             <tr>
								                 <td colspan='8'/>Data 없습니다.</td>
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