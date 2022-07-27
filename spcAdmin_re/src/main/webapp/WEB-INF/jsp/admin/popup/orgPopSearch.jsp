
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
 <!--

 $(document).ready(function(){
 
    $('.ccheck').bind('click', function(){
    	
    	var userid = $(this).data('id');
		var usernm = $(this).data('nm');
		$("#userid").val(userid); 
		$("#usernm").val(usernm); 
		
	});

 });


  function search(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/edu/orgPopSearch.do'/>";
		frm.submit();
 }
	    
 /* pagination 페이지 링크 function */
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
	 var cd_nm = $("select[name=cd_nm] option:selected").val();  
	 $("#cd_nm").val(cd_nm); 
 	 frm.action = "<c:url value='/edu/orgPopSearch.do'/>";
   	 frm.submit();
 }
	function fn_submit(){
		window.opener.document.getElementById("coper_id").value      =  $("#userid").val();
		window.opener.document.getElementById("coper_nm_auto").value =  $("#usernm").val();
	    self.close();
	}
     //-->
 </script>
 	<form  id="commonForm" name="commonForm"  method="post"  >
           
	<div class="dim-layer"> </div>
	    <div class="pop-wrap" style="height:750px;">
	        <div class="pop-header">
	            <h1 class="h1-tit">기관명 검색</h1>
	            <button type="button"  onClick="javascript:self.close();"  class="close-btn"><img src="${pageContext.request.contextPath}/images/common/close.png" alt="닫기"/></button>
	        </div>
	        <div class="pop-cont" style="height:620px;">
				<form  id="commonForm" name="commonForm"  method="post"  action="">
					<input type="hidden" id="gubun1"         name="gubun1"      value='${categoryVo.gubun1}'  class="input-box" />
					<input type="hidden" id="gubun1"         name="gubun2"      value='${categoryVo.gubun2}'  class="input-box" />
				    <input type="hidden" id="pageIndex"      name="pageIndex"   class="input-box" value=1 />	
				    <input type="hidden" id="userid"         name="userid"      class="input-box" />	
				    <input type="hidden" id="usernm"         name="usernm"      class="input-box" />	
				    
				    

	            <div class="search-wrap">
	                <div class="search-cont">
	                    <select id="cd_nm" name="cd_nm" class="select">
	                        <option value=''>지역 선택하세요</option>
	                          <c:forEach var="result" items="${arealist}" varStatus="status">
	                           	<option value='${result.cd_nm}' <c:if test="${categoryVo.cd_nm == result.cd_nm }"> selected</c:if> > ${result.cd_nm}</option>
	                        </c:forEach>
	                    </select>
	                    <input type="text" id="coper_nm" name="coper_nm" value='${categoryVo.coper_nm}' class="input-box"/>
	                    <button class="search-btn">검색</button>
	                </div>
	            </div>
	            </form>
	
	            <div class="table-wrap" style="height:500px;">
	                <table class="list-tb">
	                    <caption>선택, 지역, 소속기관 정보가 있는 테이블</caption>
	                    <colgroup>
	                        <col width="10%"/>
	                        <col width="10%"/>
	                        <col width="*"/>
	                        <col width="30%"/>
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th>선택</th>
	                            <th>No.</th>
	                            <th>지역</th>
	                            <th>소속기관</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        
	                          <c:forEach var="result" items="${resultList}" varStatus="status">
	                          <tr>
	                          <td><input type="radio" id='checkNo' name='checkNo' data-id='${result.user_id}' data-nm="${result.coper_nm}" class="radio-box ccheck"/></td>
	                            <td><c:out value="${(categoryVo.pageIndex-1) * categoryVo.pageSize + (status.count)}"/></td>
	                            <td>${result.cd_nm}</td>
	                            <td>${result.coper_nm}</td>
	                          </tr>
	                        </c:forEach>
	                       
	      	                <c:if test="${empty resultList }">
				             <tr> <td colspan='4'/>Data 없습니다.</td>           </tr>
				          	</c:if>   
	                      
	                    </tbody>
	                </table>
	            </div>
	            <div class="page-wrap">
		         <ul class="paging">
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
		 		 </ul>
		        </div>
	
	        </div>
	        <div class="pop-footer">
	            <button type="button"  onClick="javascript:fn_submit();" class="mid-btn blue-btn">확인</button>
	            <button type="button"  onClick="javascript:self.close();" class="mid-btn white-btn">취소</button>
	        </div>
	    </div>
	 
	
	</form>
						            

