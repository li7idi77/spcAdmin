
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

 <script type="text/javaScript" language="javascript" defer="defer">

     
 	function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		$("#gubun2").val('logo'); 
		frm.action = "<c:url value='/main/logoList.do'/>";
		frm.submit();
	}
	    
     function fn_save(gubun1){
    	
    	var file= $("input[name=files]")[0];

 		if( file ==null || file =='null' || file =='undefined' || file ==undefined){
 			alert("선택된 파일이 없습니다.");	
 			return;
 		}
 		
 		var formData = new FormData($('#commonForm')[0]); 
 		
 		var msg = "로고를 등록 하시겠습니까?";
 		if (gubun1 == "E"){
 			msg = "로고를  수정 하시겠습니까?"
 		}
 		
 		var yn = confirm(msg);		
 		if(yn){
 				
 			$.ajax({	
 				data       : formData,
 				enctype	   : 'multipart/form-data',
 			    url		   : "<c:url value='/orgMng/imgSave.do'/>",
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
		$("#gubun2").val('warrantLogo'); 
		frm.action = "<c:url value='/main/fileDownload.do'/>";
		frm.submit();
	}
 </script>
 

          <form  id="commonForm" name="commonForm"  method="post"   enctype="multipart/form-data" >
			<input type="hidden" id="file_gubun"  name="file_gubun"  value="warrantLogo" />
			
           <h1 class="h1-tit">배너 등록</h1>
<!-- EDU_FILE 수료증 banner1,2,3으로 등록 해야함 -->
             <div class="table-wrap">
                 <table class="detail-tb">
                     <caption>이미지 업로드 정보가 있는 테이블</caption>
                     <colgroup>
                         <col width="20%"/>
                         <col width="*"/>
                     </colgroup>
                     <tbody>
                         <tr>
                             <th>하단 좌측 로고</th>
                             <td>
                                  <div class="upload-box">
                                      <input id="files1" name="files" type="file" accept=".jpg, .jpeg, .png"/>
                                  </div>
						 			<c:if test="${not empty resultList[0] }">
							 			 <c:if test="${not empty resultList[0].FILE_ID }">
								           	<c:set var="ppx" value="${fn:split(resultList[0].FILE_NAME,'.')}" />
									          	<img heigth="200px" width="120px" src="/${webPath}/warrantLogo/${resultList[0].FILE_ID}.${ppx[1]}"  alt="${resultList[0].FILE_NAME}"/>
									        </c:if>
						                     
						            </c:if>
                                 <!-- <p class="point">업로드 이미지 사이즈 : 1200px * 500px</p> -->
                             </td>
                         </tr>
                         <tr>
                             <th>하단 중앙 로고</th>
                             <td>
                                  <div class="upload-box">
                                      <input id="files2" name="files" type="file" accept=".jpg, .jpeg, .png"/>
                                  </div>
                                  <c:if test="${not empty resultList[1] }">
							 			 <c:if test="${not empty resultList[1].FILE_ID }">
								           	<c:set var="ppx" value="${fn:split(resultList[1].FILE_NAME,'.')}" />
									          	<img heigth="200px" width="120px" src="/${webPath}/warrantLogo/${resultList[1].FILE_ID}.${ppx[1]}"  alt="${resultList[1].FILE_NAME}"/>
									        </c:if>
						                     
						            </c:if>
                             </td>
                         </tr>
                         <tr>
                             <th>하단 우측 로고</th>
                             <td>
                                  <div class="upload-box">
                                      <input id="files3" name="files" type="file" accept=".jpg, .jpeg, .png"/>
                                  </div>
                                  <c:if test="${not empty resultList[2] }">
							 			 <c:if test="${not empty resultList[2].FILE_ID }">
								           	<c:set var="ppx" value="${fn:split(resultList[2].FILE_NAME,'.')}" />
									          	<img heigth="200px" width="120px" src="/${webPath}/warrantLogo/${resultList[2].FILE_ID}.${ppx[1]}"  alt="${resultList[2].FILE_NAME}"/>
									        </c:if>
						                     
						            </c:if>
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>

             <div class="btn-cont">
		           	<button type="button" class="mid-btn blue-btn"  onClick="javascript:fn_save('I');">저장</button>
               </div>
			</form>
	            
   
