
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
 	 frm.action = "<c:url value='/user/org02List.do'/>";
   	 frm.submit();
 }
 
 function fn_detail(sch_no){
		document.location = "<c:url value='/user/org02Report.do'/>"+"?sch_no="+sch_no;
	 }	
 
 function openWindowPop(url, name){
	    var options = 'top=10, left=10, width=700px, height=600px, status=no, menubar=no, toolbar=no, resizable=no';
	    window.open(url, name, options);
	}	
</script>
     <!-- container  begin -->
                <div id="container">
		    		<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
                	
                    <div class="tit-wrap">
                        <h1 class="h1-tit">기관회원 교육신청 현황</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관 회원 서비스</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관회원 교육신청 현황</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
						<form  id="commonForm" name="commonForm"  method="post"  action="">
                        <!---- search-wrap begin ---->
                        <div class="search-wrap">

                            <div class="search-cont">
                                <select class="select" id="searchType" name="searchType">
                                    <option value="coper" <c:if test="${searchType == 'coper'}">selected</c:if>>기관명</option>
                                    <option value="edu" <c:if test="${searchType == 'edu'}">selected</c:if>>교육명</option>
                                </select>
                                <input type="text" id="searchText" name="searchText" value="${searchText}" class="input-box lg-width" placeholder="직접입력"/>
                            </div>

                            <div class="btn-cont">
                                <button class="lg-btn orange-btn">검색</button>
                                <button class="lg-btn navy-btn" onClick="fn_clear();">초기화</button>
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
                                    <caption>교육명, 교육일시, 교육시간, 기관명, 교육대상, 강사, 강사섭외 유무, 상태 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="6%"/>
                                        <col width="*"/>
                                        <col width="15%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="9%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
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
                                            <th>강사섭외<br/>유무</th>
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
                                            <td><span <c:if test="${result.INS_STATUS == '섭외중'}">style="cursor:pointer;" onClick="javascript:openWindowPop('<c:url value='/user/popInsSelect.do'/>?sch_no=${result.SCHEDULE_NO}','popup');"</c:if>>${result.INS_STATUS}</span></td>
                                            <td>
                                                <span class="block" >${result.SCH_STATUS}</span>
                                                <c:if test="${result.SCH_STATUS == '교육완료'}">
                                                	<button class="sm-btn navy-btn" onClick="fn_detail('${result.SCHEDULE_NO}');">결과보고</button>
                                                </c:if>
                                                <c:if test="${result.SCH_STATUS != '보고완료' && result.SCH_STATUS != '교육완료' && result.SCH_STATUS != '신청취소'}">
                                                	<button class="sm-btn navy-btn" onClick="javascript:openWindowPop('<c:url value='/user/popAppCancel.do'/>?sch_no=${result.SCHEDULE_NO}','popup');">신청취소</button>
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