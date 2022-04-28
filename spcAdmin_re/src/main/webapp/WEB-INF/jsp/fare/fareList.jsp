<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : vendorList.jsp
  * @Description :  List 화면
  * @Modification Information
   */
%>

 <script type="text/javaScript" language="javascript" defer="defer">
     <!--
     /* 수정  */
     function fn_view(id) {
     	document.commonForm.fare_seq.value = id;
        document.commonForm.action = "<c:url value='/fare/fareEdit.do'/>";
        document.commonForm.submit();
     }
           
     /* 검색 */
     function fn_search(){
     	document.commonForm.action = "<c:url value='/fare/fareList.do'/>";
        document.commonForm.submit();
     }
     
     /* pagination 페이지 링크 function */
     function fn_page_view(pageNo){
     	document.commonForm.pageIndex.value = pageNo;
     	document.commonForm.action = "<c:url value='/vendor/vendorList.do'/>";
        document.commonForm.submit();
     }
     
     //-->
 </script>
 
 <form id="commonForm" name="commonForm" method="post">
	 <input type="hidden" name="fare_seq"   value='0' />
	 <input type="hidden" name="pageIndex"  value='1' />
	 <div class="addr">
	            <div class="addr_wrap">
	                <h2>Vendor</h2>
	                <div class="search">
	                       <a onclick="javascript:fn_view(0);"  class="btn_search">등록</a>	                   
	                </div>
	                <div class="addr_list">
	                    <table>
	                        <thead>
	                        	<tr>
	                        		<th><input type="checkbox"></th>
	                        		<th align="center">No</th>
			        				<th align="center">SMS 단가</th>
			        				<th align="center">LMS 단가</th>
			        				<th align="center">MMS 단가</th>
			        				<th align="center">사용여부</th>
			        				<th align="center">등록일</th>
			        				<th align="center">수정일</th>
			        				
	                        	</tr>
	                        </thead>
	                        <tbody>
	                        <c:forEach var="result" items="${resultList}" varStatus="status">
		            			<tr>
		            				<td><input type="checkbox"></td>
		            				<td align="left">
		            					<a href="javascript:fn_view('<c:out value="${result.fare_seq}"/>')"><c:out value="${result.fare_seq}"/></a>
		            				</td>
		            				<td align="left"   class="listtd"><c:out value="${result.sms_price}"/>&nbsp;</td>
		            				<td align="left"   class="listtd"><c:out value="${result.lms_price}"/>&nbsp;</td>
		            				<td align="left"   class="listtd"><c:out value="${result.mms_price}"/>&nbsp;</td>
		            				<td align="left"   class="listtd"><c:out value="${result.use_yn}"/>&nbsp;</td>
		            				<td align="left"   class="listtd"><c:out value="${result.ins_date}"/>&nbsp;</td>
		            				<td align="left"   class="listtd"><c:out value="${result.upd_date}"/>&nbsp;</td>
		            				
		            			</tr>
	        				</c:forEach>
	                       </tbody>
	                    </table>
	                </div>
	                </br>
	                <div id="paging" align=center>
	        			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_page_view" />	        	
	        		</div>
	            </div>
	        </div>
	    </div>
	</div>
</form>

