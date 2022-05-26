
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
	 	$('#category1_key').change(function(){
	 		var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category2_key").val("");
			$("#category3_key").val("");
			
			 $.ajax({	
			    url     : "<c:url value='/user/category2list.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY2_KEY+'">'+ret.CATEGORY2_NAME+'</option>';		
				});
				$('select[name=category2_key]').html(option);						
	     },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		 });
				 
		$('#category2_key').change(function(){
			var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category3_key").val("");
					
			 $.ajax({	
			    url     : "<c:url value='/user/category3list.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY3_KEY+'">'+ret.CATEGORY3_NAME+'</option>';		
				});
				$('select[name=category3_key]').html(option);						
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		 }); 
 });
  
 function fn_detail(edu_no){
	document.location = "<c:url value='/user/sectorView.do'/>"+"?edu_no="+edu_no+"&idx="+$('#idx').val();
 }	
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
 	 frm.action = "<c:url value='/user/sectorList.do'/>";
   	 frm.submit();
 }
</script>
     <!-- container  begin -->
                <div id="container">
                	<input type="hidden" id="category1" name="category1" value="${category1_key}">
                	<input type="hidden" id="category2" name="category2" value="${category2_key}">
                	<input type="hidden" id="category3" name="category3" value="${category3_key}">
                	<input type="hidden" id="idx" name="idx" value="${idx}">
		    		<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
                	
                    <div class="tit-wrap">
                        <h1 class="h1-tit">교육신청</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>분야별 교육신청</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>광역주도형 심리부검면담원 양성교육</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>교육신청</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
						<form  id="commonForm" name="commonForm"  method="post"  action="">
                        <!---- search-wrap begin ---->
                        <div class="search-wrap">
                            <div class="search-cont">
                                <label>분류 :</label>
                                <select class="select mr30 xsm-width"  id="category1_key" name="category1_key">
			                    	<c:forEach var="result" items="${category1list}" varStatus="status">
			                    		<c:if test="${category1_key == result.CATEGORY1_KEY}">
			                    			<option value='${result.CATEGORY1_KEY}' selected>${result.CATEGORY1_NAME}</option>
			                    		</c:if>
			                        </c:forEach>
			                    </select>
                                <select class="select mid-width"  id="category2_key" name="category2_key">
			                    	<c:forEach var="result" items="${category2list}" varStatus="status">
			                    		<c:if test="${category2_key == result.CATEGORY2_KEY}">
			                    			<option value='${result.CATEGORY2_KEY}' selected>${result.CATEGORY2_NAME}</option>
			                    		</c:if>
			                        </c:forEach>
                                </select>
                                <select class="select lg-width"  id="category3_key" name="category3_key">
                                	<option value=''>선택 하세요</option>
			                    	<c:forEach var="result" items="${category3list}" varStatus="status">
			                    		<option value='${result.CATEGORY3_KEY}' >${result.CATEGORY3_NAME}</option>
			                        </c:forEach>
                                </select>
                                <select class="select xsm-width" id="site" name="site">
                                    <option value="on" <c:if test="${site == 'on'}">selected</c:if>>온라인</option>
                                    <option value="off" <c:if test="${site == 'off'}">selected</c:if>>오프라인</option>
                                </select>
                            </div>
                            
                            <div class="btn-cont">
                                <button class="lg-btn orange-btn" id="searchBtn" name="searchBtn" onclick="">검색</button>
                                <button type="button" class="lg-btn navy-btn" id="clearBtn" name="clearBtn" onClick="fn_clear();">초기화</button>
                            </div>
                        </div>
                        
                        <!---- search-wrap end ---->

                        <!---- sub-cont begin ---->
                        <div class="tit-cont">
                            <p class="total">전체 : <span>${totCnt}</span>건</p>
                            <select class="select" id="listOder" name="listOder" onChange="document.commonForm.submit();">
                                <option value="train_date" <c:if test="${listOder == 'train_date'}">selected</c:if>>교육기간순</option>
                                <option value="edu_no" <c:if test="${listOder == 'edu_no'}">selected</c:if>>교육등록순</option>
                            </select>
                        </div>
                        </form>
                        <!---- sub-cont end ---->

                        <div class="list-wrap">
                            <ul>
                            	<c:forEach var="list" items="${resultList}" varStatus="status">
                            		<li onClick="fn_detail('${list.EDU_NO}')"><span class="badge-normal">${list.CATEGORY1}</span>
                                    	<span class="tag">${list.CATEGORY2}</span>
                                    	<h3 class="h3-tit">${list.CATEGORY3}</h3>
                                    	<input type="hidden" id="edu_no" name="edu_no" value="${list.EDU_NO}">
                                    	<ul class="summary-cont">
	                                        <li>
	                                            <label>교육내용 :</label>
	                                            <span>${list.EDU_CONT}</span>
	                                        </li>
	                                        <li>
	                                            <label>교육기간 :</label>
	                                            <span>${list.TRAIN_S_DATE}</span>~<span>${list.TRAIN_E_DATE}</span>
	                                        </li>
	                                        <li>
	                                            <label>교육방식 :</label>
	                                            <span>${list.EDU_METHOD}</span>
	                                        </li>
	                                        <li>
	                                            <label>학습시간 :</label>
	                                            <span>${list.EDU_TIME}</span>분
	                                        </li>
	                                        <li>
	                                            <label>강사명 :</label>
	                                            <span>${list.INST_NM}</span>
	                                        </li>
	                                        <li>
	                                            <label>안내문 :</label>
	                                            <a class="link">다운로드(${list.EDU_NOTICE})</a>
	                                        </li>
	                                        
	                                    </ul>
	                                </li>
                            	</c:forEach>
                            </ul>
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