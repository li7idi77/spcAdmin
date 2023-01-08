
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
 
	function openWindowPop(url, name){
	    var options = 'top=10, left=10, width=800px, height=1200px, status=no, menubar=no, toolbar=no, resizable=no';
	    window.open(url, name, options);
	}	
	function fn_egov_link_page(pageNo){
		 var frm = document.commonForm;
		 $("#pageIndex").val(pageNo); 
	 	 frm.action = "<c:url value='/my/my04warrantAdd.do'/>";
	   	 frm.submit();
	 }
</script>
     <!-- container  begin -->
            <div id="container">

                    <div class="tit-wrap">
                        <h1 class="h1-tit">수료증(비회원/직접기입) 출력</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>마이페이지</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>수료증(비회원/직접기입) 출력</span>
                        </div>
                    </div>

                    <div class="contents-wrap">

                        <!---- search-wrap begin ---->
                        <form  id="commonForm" name="commonForm"  method="post"  action="">
                        <div class="search-wrap">
                        
                        <!---- search-wrap end ---->
                        
                        <div class="comp mt0">
                            <div class="table-wrap">
                                <table class="list-tb">
                                    <caption>이름, 소속 정보가 있는 테이블</caption>
                                    <colgroup>
                                    	<col width="10%"/>
                                        <col width="45%"/>
                                        <col width="45%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>이름</th>
                                            <th>소속</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td><input type="text" name="warrant_name" class="input-box lg-width" value="${warrant_name}"/></td>
                                            <td><input type="text" name="warrant_entrps" class="input-box lg-width" value="${warrant_entrps}"/></td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty resultList }">
							             <tr>
							                <td>1</td>
                                            <td><input type="text" name="warrant_name" class="input-box" value=""/></td>
                                            <td><input type="text" name="warrant_entrps" class="input-box" value=""/></td>
							             </tr>
							        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        	<div class="btn-cont" style="height:30px;">
                        		<div style="float: left;border:1px solid #999;padding:0 0 0 5px;"> 
                        			<input type="file" id="file1" name="file1"/>
                                	<button type="button" class="lg-btn blue-btn" onClick="fn_clear();">적용</button>	
                        		</div>
                                
                                <div style="float: right;"> 
	                                <button type="button" class="lg-btn white-btn" onClick="fn_clear();">등록양식 다운로드</button>
	                                <button type="button" class="lg-btn orange-btn">출력</button>
                                </div>
                            </div>
                        </div>
						</form>
                    </div>
                </div>
                <!--  container end -->