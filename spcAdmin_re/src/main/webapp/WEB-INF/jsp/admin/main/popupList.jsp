
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
 	 $(document).ready(function(){
		 
		$('#checkAll').click(function(){
		    var isChecked = this.checked;
			$('input:checkbox[name="checkNo"]').each(function() {
			this.checked = isChecked;
	     });
	   });
		
		$('.btnOneApr').bind('click', function(){
			var ischeckeds = false;
			$('input:checkbox[name="checkNo"]').each(function() {
				if(this.checked){
	 			ischeckeds = true;
				}
			});
	
			if(!ischeckeds){
				alert('선택 된 건이 없습니다.');
				return false;
			}
			var checkNo ="";
			$('input:checkbox[name="checkNo"]').each(function() {
				if(this.checked){
	 			ischeckeds = true;
	 			var strCheckdValue = this.value;
	 			checkNo = checkNo + ',' + strCheckdValue; 
				}
		});
			
		checkNo = checkNo.substring( 1, checkNo.length );
	
		$("#gubun1").val("A"); 
		$("#checkdstr").val(checkNo);
					
		var msg = "정말로 삭제 하시겠습니까?";
		var yn = confirm(msg);		
		if(yn){
				
			$.ajax({	
				data     : $("#commonForm").serialize(),
			    url		 : "<c:url value='/main/popupSave.do'/>",
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
	  });
		
	}); 
 
 	function fn_delete(gubun1, key1){
			
		$("#popup_no").val(key1); 
		$("#gubun1").val(gubun1); 
			
		var msg = "정말로 삭제 하시겠습니까?";
		var yn = confirm(msg);		
		if(yn){
				
			$.ajax({	
				data     : $("#commonForm").serialize(),
			    url		 : "<c:url value='/main/popupSave.do'/>",
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
		frm.action = "<c:url value='/main/popupList.do'/>";
		frm.submit();
	}
	
	function fn_search(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		frm.action = "<c:url value='/main/popupList.do'/>";
		frm.submit();
	}
    
    function fn_egov_link_page(pageNo){
    	var frm = document.commonForm;
    	$("#pageIndex").val(pageNo); 
    	frm.action = "<c:url value='/main/popupList.do'/>";
    	frm.submit();
    }	  
	
	function fn_edit(str,key1) {
    	var frm = document.commonForm;
    	$("#gubun1").val(str);
    	$("#popup_no").val(key1); 
     	frm.action = "<c:url value='/main/popupReg.do'/>";
    	frm.submit();
    }
	
	function fn_load(){	
		var frm = document.commonForm;
		$("#gubun1").val('I');
		frm.action = "<c:url value='/main/popupReg.do'/>";
		frm.submit();
	}
     //-->
 </script>

           
		<form  id="commonForm" name="commonForm"  method="post">
			<input type="hidden" id="gubun1"      name="gubun1"     value='I' />
		    <input type="hidden" id="gubun2"      name="gubun2"     value='${mainVo.gubun2}' />	
		    <input type="hidden" id="pageIndex"   name="pageIndex"  value="${mainVo.pageIndex}"/>
		    <input type="hidden" id="popup_no"    name="popup_no"   value="0"/>
		    <input type="hidden" id="checkdstr"   name="checkdstr"  value="0"/>
		    
		    
          </form>
          		   
		   <h1 class="h1-tit">팝업창 관리  </h1>
		   <div class="btn-cont mb20">
                <button type="button" class="mid-btn black-btn" onClick="javascript:fn_load();">등록</button>
                <button type="button" class="mid-btn white-btn btnOneApr">선택삭제</button>
            </div>
      

           <div class="table-wrap">
               <table class="list-tb">
                   <caption>제목, 이미지, 위치, 링크, 등록일자, 관리 정보가 있는 테이블</caption>
                   <colgroup>
                         <col width="12%"/>
                         <col width="*"/>
                         <col width="25%"/>
                         <col width="25%"/>
                          <col width="25%"/>
                     </colgroup>
                   <thead>                    	
                       <tr>
                           <th><input type="checkbox"  id="checkAll" name='checkAll' class="check-box"/></th>
                           <th>제목</th>
                           <th>팝업사이즈</th>
                           <th>사용여부</th>
                           <th>관리</th>
                       </tr>
                   </thead>
                   <tbody>
                   	<c:forEach var="result" items="${resultList}" varStatus="status">
                   	   
                       <tr>
                           <td><input type="checkbox" id='checkNo' name='checkNo' value="${result.popup_no}" class="check-box"/></td>
                           <td class="tl">${result.popup_nm}</td>
                           <td>가로: <span class="mr10">${result.popup_ar}</span>세로: <span>${result.popup_hg}</span></td>
                           <td>${result.use_yn}</td>
                           <td>
	                           <button type="button" class="sm-btn blue-btn"  onClick="javascript:fn_edit  ('E','${result.popup_no}');">수정</button>
	                           <button type="button" class="sm-btn white-btn" onClick="javascript:fn_delete('D','${result.popup_no}');">삭제</button>
                           </td>
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
           