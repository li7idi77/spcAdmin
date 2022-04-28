
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
     <!--
    
     function fn_load(str) {
    	var frm = document.commonForm;
    	$("#site").val(str);
     	frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";
    	frm.submit();
     }
     
     function fn_move(str) {
     	var frm = document.commonForm;
     	$("#gubun1").val("R"); 
     	$("#gubun2").val("categoryClass");
     	$("#site").val(str);  
      	frm.action = "<c:url value='/edu/eduInfoClassList.do'/>";
     	frm.submit();
      }
     
     /* pagination 페이지 링크 function */
     function fn_egov_link_page(pageNo){
    	var frm = document.commonForm;
    	$("#pageIndex").val(pageNo); 
     	$("#gubun2").val("categoryClass");
    	$("#gubun1").val("R"); 
     	$("#gubun2").val("categoryClass");
     	frm.action = "<c:url value='/edu/eduInfoClassList.do'/>";
        frm.submit();
     }
     //-->
 </script>
			   <form  id="commonForm" name="commonForm"  method="post"  action="">
			        <input type="hidden" id="pageIndex"      name="pageIndex"   value='1'                    class="input-box" />
					<input type="hidden" id="gubun1"         name="gubun1"      value='I'                    class="input-box" />
 				    <input type="hidden" id="gubun2"         name="gubun2"      value='category4'            class="input-box" />		
 				    <input type="hidden" id="site"           name="site"        value='${categoryVo.site}'   class="input-box"/>
 				    <input type="hidden" id="pageIndex"      name="pageIndex"   value=1                      class="input-box"  />	
 				  
	           </form>
 
                 <h1 class="h1-tit">교육분류 등록</h1>

                <div class="tab-cont">
                    <ul>
                    	<c:if test="${categoryVo.site eq 'on'}">
                        <li class="on">온라인 교육</li>
                        <li><a onClick="fn_move('off')">오프라인 교육</a></li>
                        </c:if>
                        <c:if test="${categoryVo.site eq 'off'}">
                        <li><a onClick="fn_move('on')">온라인 교육</a></li>
                        <li class="on">오프라인 교육</li>
                        </c:if>
                    </ul>
                </div>

                <div class="sub-cont">
                    <button   type="button" class="mid-btn black-btn">전체분류 보기</button>
                    <button   type="button" class="mid-btn blue-btn" onClick="fn_load('${categoryVo.site}')">등록</button>
                </div>
                
                
                <div class="table-wrap">
                    <table class="list-tb">
                        <caption>분류1, 분류2, 분류3, 관리 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="30%"/>
                            <col width="30%"/>
                            <col width="30%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>분류1</th>
                                <th>분류2</th>
                                <th>분류3</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="result" items="${resultList}" varStatus="status">
                            <tr>
                                <td>${result.category1_name}</td>
                                <td class="tl">${result.category2_name}</td>
                                <td class="tl"> ${result.category3_name}</td>
                            </tr>
 						</c:forEach>
                     
                     	<c:if test="${empty resultList }">
			             <tr>
			                 <td colspan='3'/>Data 없습니다.</td>
			             </tr>
			          	</c:if>
                        </tbody>
                    </table>
                </div>
                <div class="page-wrap">
             	 <ul class="paging">
	    			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
	  	  		 </ul>
	            </div>
           