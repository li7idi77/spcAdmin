
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
 <!--
    
     function fn_load(gubun2) {
    	var frm = document.commonForm;
    	
    	if(gubun2=='category4'){
    		frm.action = "<c:url value='/edu/eduInfoClassList.do'/>"; 
    	}    	
    	if(gubun2 !='category4'){
    		frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>"; 
    	}
    	if(gubun2=='category4'){
    		$("#gubun2").val("categoryClass");
    	} 
    	if(gubun2=='category5'){
    		$("#gubun2").val('category4');  
    	} 
    	if(gubun2=='category6'){
    		$("#gubun2").val('category5');  
    	} 

    	frm.submit();
     }
 
 	function fn_move(str) {
	  	var frm = document.commonForm;
	  	$("#gubun1").val("R"); 
		$("#site").val(str);  
	   	frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";
	  	frm.submit();
    }
     
 	function goOkPage(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";  
		frm.submit();
	}
	
     
    function fn_save(key1,key2, gubun2){
    		
 		var categoryName = $("#categoryName").val(); 		

 		if (categoryName == ""){			
 			alert("Category 이름을 입력해주세요.");
 			$("#categoryName").focus();
 			return;
 		}		
 		
 		$("#gubun1").val("I"); 
 		$("#gubun2").val(gubun2); 
 		$("#category1_key").val(key1); 
 		$("#category2_key").val(key2);
 	 	
 		var yn = confirm("카테고리를 등록 하시겠습니까?");		
 		if(yn){
 				
 			$.ajax({	
 				data     : $("#commonForm").serialize(),
 			    url		 : "<c:url value='/edu/eduInfoClassCateSave.do'/>", 
 		        dataType : "JSON",
 		        cache    : false,
 		        async    : false,
 				type	 : "POST",	
 		        success  : function(obj) {
 		        	commonCallBack(obj);				
 		        },	       
 		        error 	: function(xhr, status, error) {} 		        
 		    });
 		}
 	}	
 	/* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo){
    	var frm = document.commonForm;
    	$("#pageIndex").val(pageNo); 
    	frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";
       	frm.submit();
    }
 	
    function fn_edit(key1,key2,key3, name1,name2,idx,gubun1,gubun2, cd_no){
 		
 		var categoryName = $("input[name=categoryname]:eq(" + idx + ")").val() ;
 		
 		var msg1 = (gubun1=='E' ? "필수 항목으로 수정 할수 없습니다.\n관리자에게 문의 하세요" : "필수 항목으로 삭제 할수 없습니다.\n관리자에게 문의 하세요");
 		
 		if (!(cd_no == 'undefined' || cd_no == '' || cd_no == null)) {
 			alert(msg1);
 			return ;
 		}
 		
 		if (categoryName == ""){			
 			alert("Category 이름을 입력해주세요.");
 			return;
 		}		
 		
 		$("#category1_key").val(key1); 
 		$("#category2_key").val(key2); 
 		$("#category3_key").val(key3); 
 
 		
 		if(gubun2=='category4'){
 			$("#category1_name").val(categoryName); 
 		}else if(gubun2=='category5'){
 			$("#category1_name").val(name1);
 			$("#category2_name").val(categoryName); 
 		}else if(gubun2=='category6'){
 			$("#category1_name").val(name1);
 			$("#category2_name").val(name2); 
 			$("#category3_name").val(categoryName); 
 		}
 
 		$("#gubun1").val(gubun1); 
 		$("#gubun2").val(gubun2); 
 		
 		var msg = (gubun1=='E' ? "카테고리를 수정 하시겠습니까?" : "정말로 삭제 하시겠습니까?");
 		var yn = confirm(msg);		
 		if(yn){
 				
 			$.ajax({	
 				data     : $("#commonForm").serialize(),
 			    url		 : "<c:url value='/edu/eduInfoClassCateSave.do'/>",
 		        dataType : "JSON",
 		        cache    : false,
 		        async    : false,
 				type	 : "POST",	
 		        success  : function(obj) {
 		        	commonCallBack(obj);				
 		        },	       
 		        error 	: function(xhr, status, error) {} 		        
 		    });
 		}
  	}	
    
    function fn_regt(key1,key2,key3,name1,name2, idx,gubun1,gubun2, cd_no){	
		var frm = document.commonForm;
		
		var categoryName = $("input[name=categoryname]:eq(" + idx + ")").val() ;
		
		$("#category1_key").val(key1); 
		$("#category2_key").val(key2);
		$("#category3_key").val(key3);
		
		$("#category1_name").val(name1);
		$("#category2_name").val(name2);
 		$("#category3_name").val(categoryName);
 		$("#gubun1").val(gubun1); 
 		$("#gubun2").val(gubun2);  
 		
 		frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";
 		
		frm.submit();
	}
    
 	function commonCallBack(obj){
 	
 		if(obj != null){		
 			
 			var result = obj.result;
 			
 			if(result == "SUCCESS"){				
 				alert("성공하였습니다.");				
 				goOkPage();				 
 			} else if(result == "EXIST"){				
 				alert("이미 등록 되었습니다.");	
 				return false;
 			}else {				
 				alert("등록이 실패 했습니다.");	
 				return false;
 			}
 		}
 	}	
     //-->
 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />
			<input type="hidden" id="category1_name" name="category1_name" class="input-box" value="${categoryVo.category1_name}" />
			<input type="hidden" id="category1_key"  name="category1_key"  class="input-box" value="${categoryVo.category1_key}"  />
			<input type="hidden" id="category2_name" name="category2_name" class="input-box" value="${categoryVo.category2_name}" />
			<input type="hidden" id="category2_key"  name="category2_key"  class="input-box" value="${categoryVo.category2_key}"  />
			<input type="hidden" id="category3_name" name="category3_name" class="input-box" value="${categoryVo.category3_key}"  />
			<input type="hidden" id="category3_key"  name="category3_key"  class="input-box" value="${categoryVo.category3_key}"  />
			<input type="hidden" id="gubun1"         name="gubun1"         class="input-box" value='${categoryVo.gubun1}'/>
			<input type="hidden" id="gubun2"         name="gubun2"         class="input-box" value='${categoryVo.gubun2}'/>
			<input type="hidden" id="cd_no"          name="cd_no"          class="input-box" value='${categoryVo.category3_key}'/>
			<input type="hidden" id="site"           name="site"           class="input-box" value="${categoryVo.site}"  />
			
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
               <button  type="button" class="mid-btn black-btn" onClick="fn_load('${categoryVo.gubun2}');">전체분류 보기</button>
              <div class="req-box">
                  <label for="categoryFname">
                   <c:if test="${categoryVo.gubun2 eq 'category4'}">
						카테고리01 등록
					</c:if>
					<c:if test="${categoryVo.gubun2 eq 'category5'}">
				        ${categoryVo.category1_name} > 카테고리02 등록
					</c:if>
					<c:if test="${categoryVo.gubun2 eq 'category6'}">
				        ${categoryVo.category1_name} > ${categoryVo.category2_name} > 카테고리03 등록
					</c:if>
                  	
                  </label>
                  <input type="text" id="categoryName" name="categoryName" class="input-box" maxlength=100/>
                               
                  <c:if test="${categoryVo.gubun2 eq 'category4'}">
						<button type="button" class="mid-btn blue-btn" onClick="fn_save(${categoryVo.category1_key},${categoryVo.category2_key},'category4');">등록</button>
				  </c:if>
				  <c:if test="${categoryVo.gubun2 eq 'category5'}">
				        <button type="button" class="mid-btn blue-btn" onClick="fn_save(${categoryVo.category1_key},${categoryVo.category2_key},'category5');">등록</button>
				  </c:if>
				  <c:if test="${categoryVo.gubun2 eq 'category6'}">
				        <button type="button" class="mid-btn blue-btn" onClick="fn_save(${categoryVo.category1_key},${categoryVo.category2_key},'category6');">등록</button>
				  </c:if>
					
              </div>              
          </div>          
           </form>    
         
          <div class="table-wrap">
              <table class="list-tb">
                  <caption>카테고리1, 수정, 삭제, 카테고리2 정보가 있는 테이블</caption>
                  <colgroup>
                      <col width="30%"/>
                      <col width="15%"/>
                      <col width="15%"/>
                      <col width="*"/>
                  </colgroup>
                  <thead>
                      <tr>
                        <c:if test="${categoryVo.gubun2 eq 'category4'}">
						  <th>카테고리01</th>
					      <th>수정</th>
                          <th>삭제</th>
                          <th>카테고리02 (서브분류)</th>
						</c:if>
						<c:if test="${categoryVo.gubun2 eq 'category5'}">
					     <th>카테고리02</th>
					     <th>수정</th>
					     <th>삭제</th>
					     <th>카테고리03 (서브분류)</th>
						</c:if>      
						<c:if test="${categoryVo.gubun2 eq 'category6'}">
					     <th>카테고리03</th>
					     <th>수정</th>
					     <th>삭제</th>
					     <th></th>
						</c:if>                           
                      </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="result" items="${resultList}" varStatus="status">
                      <tr>
                      	  <c:if test="${categoryVo.gubun2 eq 'category4'}">
	                          <td>
	                          	<input type="text" id='categoryname' name='categoryname' class="input-box" value="${result.category1_name}"/>
	                          </td>
	                          <td><button  type="button" class="sm-btn blue-btn"   onClick="javascript:fn_edit('${result.category1_key}',0,0,'${result.category1_name}','${result.category2_name}','${status.index}','E','category4','${result.cd_no}');">저장</button></td>
	                          <td><button  type="button" class="sm-btn white-btn"  onClick="javascript:fn_edit('${result.category1_key}',0,0,'${result.category1_name}','${result.category2_name}','${status.index}','D','category4','${result.cd_no}');">삭제</button></td>
	                          <td><a class="link" onClick="javascript:fn_regt('${result.category1_key}',0,0,'${result.category1_name}','${result.category2_name}','${status.index}','R','category5','${result.cd_no}');" >카테고리02 등록/관리 </a></td>
	                	  </c:if>
				 		 <c:if test="${categoryVo.gubun2 eq 'category5'}">
	                          <td>
	                          	<input type="text" id='categoryname' name='categoryname' class="input-box" value="${result.category2_name}"/>
	                          </td>
	                          <td><button  type="button" class="sm-btn blue-btn"   onClick="javascript:fn_edit('${result.category1_key}','${result.category2_key}',0,'${result.category1_name}','${result.category2_name}','${status.index}','E','category5','${result.cd_no}');">저장</button></td>
	                          <td><button  type="button" class="sm-btn white-btn"  onClick="javascript:fn_edit('${result.category1_key}','${result.category2_key}',0,'${result.category1_name}','${result.category2_name}','${status.index}','D','category5','${result.cd_no}');">삭제</button></td>
	                          <td><a class="link" onClick="javascript:fn_regt('${result.category1_key}','${result.category2_key}',0,'${result.category1_name}','${result.category2_name}','${status.index}','R','category6','${result.cd_no}');" > 카테고리03 등록/관리 </a></td>
				 		</c:if>      
				 		 <c:if test="${categoryVo.gubun2 eq 'category6'}">
	                          <td>
	                          	<input type="text" id='categoryname' name='categoryname' class="input-box" value="${result.category3_name}"/>
	                          </td>
	                          <td><button class="sm-btn blue-btn"   onClick="javascript:fn_edit('${result.category1_key}','${result.category2_key}','${result.category3_key}','${result.category1_name}','${result.category2_name}','${status.index}','E','category6','${result.cd_no}');">저장</button></td>
	                          <td><button class="sm-btn white-btn"  onClick="javascript:fn_edit('${result.category1_key}','${result.category2_key}','${result.category3_key}','${result.category1_name}','${result.category2_name}','${status.index}','D','category6','${result.cd_no}');">삭제</button></td>
	                          <td>&nbsp;</td>
				 		</c:if>       
	              
                      </tr>                          
                     </c:forEach>
                     
                     <c:if test="${empty resultList }">
			             <tr>
			                 <td colspan='4'/>Data 없습니다.</td>
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
