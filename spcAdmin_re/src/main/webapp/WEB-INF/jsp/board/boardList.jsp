<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : boardList.jsp
  * @Description :  List 화면
  * @Modification Information
   */
%>


 <script type="text/javaScript" language="javascript" defer="defer">
     <!--
     /* 글 수정 화면 function */
     function fn_view(id) {
     	document.listForm.board_seq.value = id;
        	document.listForm.action = "<c:url value='/board/boardView.do'/>";
        	document.listForm.submit();
     }
     
     /* 글 등록 화면 function */
     function fn_addView() {
        	document.listForm.action = "<c:url value='/board/boardWrite.do'/>";
        	document.listForm.submit();
     }
     
      
     /* 글 목록 화면 function */
     function fn_selectList() {
     	document.listForm.action = "<c:url value='/board/boardList.do'/>";
        	document.listForm.submit();
     }
     
     /* pagination 페이지 링크 function */
     function fn_egov_link_page(pageNo){
     	document.listForm.pageIndex.value = pageNo;
     	document.listForm.action = "<c:url value='/board/boardList.do'/>";
        	document.listForm.submit();
     }
     
     //-->
 </script>


    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="board_seq" />
        	<!-- // 타이틀 -->
        	<div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="board_writer"  label="NAME" />
        					<form:option value="board_subject" label="TITLE" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/resources/img/board/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
        			<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
        			<colgroup>
        				<col />
        				<col />
        				<col />
        				<col />
        				<col />
        				<col />
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center">이름</th>
        				<th align="center">제목</th>
        				<th align="center">등록일</th>
        				<th align="center">조회수</th>
        		
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
            				<td align="left"   class="listtd"><c:out value="${result.board_writer}"/>&nbsp;</td>
            				<td align="left">
            				<ui:appendReplayTag depth = "${result.board_re_lev}"/>	<a href="javascript:fn_view('<c:out value="${result.board_seq}"/>')"><c:out value="${result.board_subject}"/></a>
            				</td>
            				<td align="left"   class="listtd"><c:out value="${result.ins_date}"/>&nbsp;</td>
            				<td align="right"  class="listtd"><c:out value="${result.board_hits}"/>&nbsp;</td>
            			
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span >
        	              <a href="javascript:fn_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/resources/img/board/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                      <span >
        	              <a href="javascript:fn_egov_excel();"><spring:message code="button.create" />Excel</a>
                          
                      </span>
                      
                  </li>
              </ul>
        	</div>
        </div>
    </form:form>

