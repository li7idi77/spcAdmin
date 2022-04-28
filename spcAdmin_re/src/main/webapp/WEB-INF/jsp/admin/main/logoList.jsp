
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
     <!--
     
 	function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		$("#gubun2").val('logo'); 
		frm.action = "<c:url value='/main/logoList.do'/>";
		frm.submit();
	}
	    
     function fn_save(gubun1){
    	
    	var file= $("input[name=files]")[0].files[0];

 		if( file ==null || file =='null' || file =='undefined' || file ==undefined){
 			alert("선택된 파일이 없습니다.");	
 			return;
 		}
 		
 		var formData = new FormData(); 
 		formData.append("gubun1", gubun1);
 		formData.append("gubun2", "logo");
 		formData.append("logo_no", $("#logo_no").val());
 		formData.append("files",  $("input[name=files]")[0].files[0]);
 		
 		var msg = "로고를 등록 하시겠습니까?";
 		if (gubun1 == "E"){
 			msg = "로고를  수정 하시겠습니까?"
 		}
 		
 		var yn = confirm(msg);		
 		if(yn){
 				
 			$.ajax({	
 				data       : formData,
 			    url		   : "<c:url value='/main/logoSave.do'/>",
 			    dataType   : "JSON",
 		        processData: false, 
 		        contentType: false,
 				type	   : "POST",	
 		        success    : function(obj) {
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
 	
 	function fileDownload(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		$("#gubun2").val('logo'); 
		frm.action = "<c:url value='/main/fileDownload.do'/>";
		frm.submit();
	}
 	 //-->
 </script>
 

          <form  id="commonForm" name="commonForm"  method="post"   enctype="multipart/form-data" >
			<input type="hidden" id="gubun1"  name="gubun1"  value=''/>
			<input type="hidden" id="gubun2"  name="gubun2"  value="logo" />
			
			<c:if test="${empty mainForm.logo_no }">
	           	<input type="hidden" id="logo_no"  name="logo_no"  value="1" />
	        </c:if>    
            <c:if test="${not empty mainForm.logo_no }">
               <input type="hidden" id="logo_no"  name="logo_no"  value="${mainForm.logo_no}" />
            </c:if>
           <h1 class="h1-tit">로고 등록</h1>

             <div class="table-wrap">
                 <table class="detail-tb">
                     <caption>이미지 업로드 정보가 있는 테이블</caption>
                     <colgroup>
                         <col width="20%"/>
                         <col width="*"/>
                     </colgroup>
                     <tbody>
                         <tr>
                             <th>이미지 업로드</th>
                             <td>
                                  <div class="upload-box">
                                      <input id="files" name="files" type="file"  id="fileNm"  accept=".jpg, .jpeg, .png"/>
                                  </div>
						 			<c:if test="${not empty mainForm.logo_no }">
							 			 <c:if test="${not empty mainForm.file_name }">
								           	<c:set var="ppx" value="${fn:split(mainForm.file_name,'.')}" />
									          <a onclick='javascript:fileDownload();'>  
									          	<img heigth="200px" width="120px" src="/${mainVo.webPath}/${mainVo.gubun2}/${mainForm.file_id}.${ppx[1]}"  alt="${mainForm.file_name}"/>
									         </a>
									        </c:if>
						                     
						            </c:if>
                                 <p class="point">업로드 이미지 사이즈 : 1920px * 520px</p>
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>

             <div class="btn-cont">
             	<c:if test="${empty mainForm.logo_no }">
		           	<button type="button" class="mid-btn blue-btn"  onClick="javascript:fn_save('I');">저장</button>
		        </c:if>    
                <c:if test="${not empty mainForm.logo_no }">
	                <button type="button" class="mid-btn blue-btn"  onClick="javascript:fn_save('E');">수정</button>
	            </c:if>
               </div>
			</form>
	            
   
