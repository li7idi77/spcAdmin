
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <script type="text/javaScript" language="javascript" defer="defer">
 <!--
 	
	 function fn_delete(gubun1, key1, fileid){
			
			$("#img_no").val(key1); 
			$("#gubun1").val(gubun1); 
			$("#file_id").val(fileid); 
			
			
			var msg = "정말로 삭제 하시겠습니까?";
			var yn = confirm(msg);		
			if(yn){
					
				$.ajax({	
					data     : $("#commonForm").serialize(),
				    url		 : "<c:url value='/main/imgSave.do'/>",
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
	
	function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		frm.action = "<c:url value='/main/imgList.do'/>";
		frm.submit();
	}
	function fn_load(){	
		var frm = document.commonForm;
		$("#gubun1").val('I'); 
		frm.action = "<c:url value='/main/imgReg.do'/>";
		frm.submit();
	}
	function fn_search(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		frm.action = "<c:url value='/main/imgList.do'/>";
		frm.submit();
	}
    
	  /* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo){
    	var frm = document.commonForm;
    	$("#pageIndex").val(pageNo); 
    	frm.action = "<c:url value='/main/imgList.do'/>";
       	frm.submit();
    }	  
	
	  function fn_edit(str,key1) {
    	var frm = document.commonForm;
    	$("#gubun1").val(str);
    	$("#img_no").val(key1); 
     	frm.action = "<c:url value='/main/imgReg.do'/>";
    	frm.submit();
     }
	
     //-->
 </script>

           
		<form  id="commonForm" name="commonForm"  method="post"  action="">
			<input type="hidden" id="gubun1"      name="gubun1"     value='I'   />
		    <input type="hidden" id="gubun2"      name="gubun2"     value='${mainVo.gubun2}' />	
		    <input type="hidden" id="pageIndex"   name="pageIndex"  value="${mainVo.pageIndex}"     />
		    <input type="hidden" id="img_no"      name="img_no"     value="${mainVo.img_no}"     />
		    <input type="hidden" id="file_id"     name="file_id"  /> 
	
		   
		   <h1 class="h1-tit">메인 이미지 관리</h1>
           <div class="search-wrap mb18">
               
               <div class="search-cont">
                   <select id='searchCondition' name='searchCondition' class="select">
                       <option value='IMG_NM'>제목</option>
                   </select>
                   <input type="text" id='searchKeyword' name='searchKeyword' value="${mainVo.searchKeyword}" class="input-box" placeholder="직접입력"/>
                   
                   <button type="button" onClick="javascript:fn_search();" class="search-btn">검색</button><button type="button" onClick="javascript:fn_load();" class="search-btn">등록</button>
               </div>
           </div>
          </form>      

           <div class="table-wrap">
               <table class="list-tb">
                   <caption>제목, 이미지, 위치, 링크, 등록일자, 관리 정보가 있는 테이블</caption>
                   <colgroup>
                       <col width="12%"/>
                       <col width="15%"/>
                       <col width="15%"/>
                       <col width="*"/>
                       <col width="16%"/>
                       <col width="12%"/>
                   </colgroup>
                   <thead>
                    	
                       <tr>
                           <th>제목</th>
                           <th>이미지</th>
                           <th>위치</th>
                           <th>링크</th>
                           <th>등록일자</th>
                           <th>관리</th>
                       </tr>
                   </thead>
                   <tbody>
                   	<c:forEach var="result" items="${resultList}" varStatus="status">
                   	   
                       <tr>
                           <td>${result.img_nm}</td>
                           <c:if test="${empty result.file_name }">
                           	<td>no Image</td>
				           </c:if>    
			               <c:if test="${not empty result.file_name }">
				           	<c:set var="ppx" value="${fn:split(result.file_name,'.')}" />
				            <td><img class="img-box" src="/${mainVo.webPath}/${mainVo.gubun2}/${result.file_id}.${ppx[1]}" /></td>
				           </c:if>				            
                           <td>${result.img_pos}</td>
                           <td>${result.link_url}</td>
                           <td>${result.reg_dt}</td>
                           <td>
                               <button type='button'   onClick="javascript:fn_edit('E',  '${result.img_no}');" class="sm-btn blue-btn"> 수정</button>
                               <button type='button'   onClick="javascript:fn_delete('D','${result.img_no}','${result.file_id}');" class="sm-btn white-btn">삭제</button>
                           </td>
                       </tr>
                    </c:forEach>
                    <c:if test="${empty resultList }">
		             <tr>
		                 <td colspan='6'/>Data 없습니다.</td>
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
           