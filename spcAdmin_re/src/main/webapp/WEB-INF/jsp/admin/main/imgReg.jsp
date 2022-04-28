
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
		frm.action = "<c:url value='/main/imgList.do'/>";
		frm.submit();
	}
	    
	function fn_save(gubun1){
 	
	   var gubun2    = $("#gubun2").val();
	   var img_no    = $("#img_no").val();
	   var img_nm    = $("#img_nm").val();
	   var link_url  = $("#link_url").val();
	   var gubun3   = "I";
	   var img_pos = $("select[name=img_pos] option:selected").val();
	     
	   if (img_nm == ""){			
			alert("제목을 입력하세요.");
			$("#img_nm").focus();
			return;
		}		
  
 	    var file= $("input[name=files]")[0].files[0];
 	    if(gubun1 =='I'){
 	       	if( file ==null || file =='null' || file =='undefined' || file ==undefined){
 				alert("선택된 파일이 없습니다.");	
 				return;
 			}
 	    }
 	    
 	    if(gubun1 =='E'){
	       	if( file ==null || file =='null' || file =='undefined' || file ==undefined){
	       		gubun3   = "N";
			}
	    }
		if (img_pos == ""){			
			alert("배너 위치를  선택 하세요.");
			return;
		}
		if (link_url == ""){			
			alert("링크주소를 입력 하세요.");
			 $("#link_url").focus();
			return;
		}
		
		var formData = new FormData(); 
		formData.append("gubun1",   gubun1);
		formData.append("gubun2",   gubun2);
		formData.append("gubun3",   gubun3);
		formData.append("img_no",   img_no);
	    formData.append("img_nm",   img_nm);
		formData.append("link_url", link_url);
		formData.append("img_pos",  img_pos);
		formData.append("files",    $("input[name=files]")[0].files[0]);
				
		var msg = "이미지를 등록 하시겠습니까?";
		if (gubun1 == "E"){
			msg = "이미지를  수정 하시겠습니까?"
		}
		
		var yn = confirm(msg);		
		if(yn){
				
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/main/imgSave.do'/>",
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
     //-->
 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="gubun1"         name="gubun1"         class="input-box" value=''/>
			<input type="hidden" id="gubun2"         name="gubun2"         class="input-box" value='img'/>
			<input type="hidden" id="gubun3"         name="gubun3"         class="input-box" value='I'/>
			<input type="hidden" id="img_no"         name="img_no"         class="input-box" value='${mainVo.img_no}'/>

			
            <h1 class="h1-tit">메인이미지 등록</h1>


                <div class="table-wrap">
                    <table class="detail-tb">
                        <caption>제목, 이미지 업로드, 배너위치, 링크주소 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td>
                                    <input type="text"  id='img_nm' name='img_nm' value="${mainForm.img_nm}" class="input-box w768" value=""/>
                                </td>
                            </tr>
                            <tr>
                                <th>이미지 업로드</th>
                                <td>
                                    <div class="upload-box">
                                        <input id="files" name="files" type="file"   id="fileNm" accept=".jpg, .jpeg, .png"/>
                                    </div>
                                    <c:if test="${not empty mainForm.file_name }">
							           	<c:set var="ppx" value="${fn:split(mainForm.file_name,'.')}" />
							           <img heigth="200px" width="120px" src="/${mainVo.webPath}/${mainVo.gubun2}/${mainForm.file_id}.${ppx[1]}" />
							        </c:if>
                                    <p class="point">업로드 이미지 사이즈 : 1920px * 520px</p>
                                </td>
                            </tr>
                            <tr>
                                <th>배너위치</th>
                                <td>
                                    <select id='img_pos' name='img_pos' class="select">
                                    	<c:if test="${not empty mainForm.img_pos }">
                                    		<option value='${mainForm.img_pos}'>${mainForm.img_pos}</option>
                                    	</c:if>
                                        <option value='메인슬라이드'>메인슬라이드</option>
                                        <option value='컨텐츠 배너(좌측)'>컨텐츠 배너(좌측)</option>
                                        <option value='컨텐츠 배너(우측-상)'>컨텐츠 배너(우측-상)</option>
                                        <option value='컨텐츠 배너(우측-하)'>컨텐츠 배너(우측-하)</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>링크주소</th>
                                <td>
                                    http:// <input type="text" id='link_url' name='link_url' value="${mainForm.link_url}" class="input-box w768" value=""/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				</form>
                <div class="btn-cont">
                <c:if test="${empty mainForm.img_no }">
		           	<button type="button"  onClick="javascript:fn_save('I');" class="mid-btn blue-btn">저장</button>
		        </c:if>    
                <c:if test="${not empty mainForm.img_no }">
                	<button type="button"  onClick="javascript:fn_save('E');" class="mid-btn blue-btn">수정</button>
	            </c:if>
                    <!--  <button type="button" class="mid-btn white-btn">취소</button> -->
                    <button type="button" onClick="javascript:history.back();" class="mid-btn black-btn">목록</button>
                </div>
