
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

 <script type="text/javaScript" language="javascript" defer="defer">

 	$(document).ready(function()
	// input file 파일 첨부시 fileCheck 함수 실행
	{
		$("#input_file").on("change", fileCheck);
		
	});

	/**
	 * 첨부파일로직
	 */
	$(function () {
	    $('#btn-upload').click(function (e) {
	        e.preventDefault();
	        $('#input_file').click();
	    });
	});

	// 파일 현재 필드 숫자 totalCount랑 비교값
	var fileCount = 0;
	// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	var totalCount = 5;
	// 파일 고유넘버
	var fileNum = 0;
	// 첨부파일 배열
	var content_files = new Array();

	function fileCheck(e) {
	    var files = e.target.files;
	    
	    // 파일 배열 담기
	    var filesArr = Array.prototype.slice.call(files);
	    
	    // 파일 개수 확인 및 제한
	    if (fileCount + filesArr.length > totalCount) {
	      $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
	      return;
	    } else {
	    	 fileCount = fileCount + filesArr.length;
	    }
	    
	    // 각각의 파일 배열담기 및 기타
	    filesArr.forEach(function (f) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        content_files.push(f);
	        $('#articlefileChange').append(
	       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
	       		+ '<font style="font-size:12px">' + f.name + '</font>'  
	       		+ '   <img src="${pageContext.request.contextPath}/images/common/close.png" style="width:10px; height:10px; vertical-align: middle; cursor: pointer;"/>' 
	       		+ '<div/>'
			);
	        fileNum ++;
	      };
	      reader.readAsDataURL(f);
	    });
	    console.log(content_files);
	    //초기화 한다.
	    $("#input_file").val("");
	  }

	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
	    var no = fileNum.replace(/[^0-9]/g, "");
	    content_files[no].is_delete = true;
		$('#' + fileNum).remove();
		fileCount --;
	    console.log(content_files);
	}

	
   function fn_load(str) {
    	var frm = document.commonForm;
 		$("#gubun1").val('R'); 
		$("#gubun2").val('category2'); 
		$("#file_seq").val(0); 
    	frm.action = "<c:url value='/edu/eduInfoRegCate.do'/>";    
    	frm.submit();
     }
     
 	function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		$("#gubun2").val('category2'); 
		$("#file_seq").val(0);
		frm.action = "<c:url value='/edu/eduInfoRegCate.do'/>";
		frm.submit();
	}
	
     
     function fn_save(gubun1){
    	
    	var category3_name = $("#category3_name").val();
 		var category3_cont = $("#category3_cont").val();
 	    var category1_key  = $("#category1_key").val();
 	    var category2_key  = $("#category2_key").val();
 	    var category3_key  = $("#category3_key").val();
 	    
 	    oEditors.getById["category3_cont"].exec("UPDATE_CONTENTS_FIELD", []);
 		var category3_cont = document.getElementById("category3_cont").value;;
 		
 		var fileCnt=0;
 		
 		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 //formData.append("article_file", content_files[x]);
				 fileCnt++;
			}
		}

 		$("#gubun1").val(gubun1); 
 		 		
 		var title       = $("#title").val();
 		var reg_id = $("#reg_id").val();
 		   
 	    if (title == ""){			
 			alert("제목을 입력해주세요");
 			return;
 		} 	   
 	    
 		if (category3_name == ""){			
 			alert("카테고리3명을 입력해주세요.");
 			$("#category3_name").focus();
 			return;
 		}
 		
 		 if(category3_cont == "" || category3_cont == null || category3_cont == '&nbsp;' || category3_cont == '<br>' || category3_cont == '<br/>' || category3_cont == '<p>&nbsp;</p>'){ 
  	    	return alert("상세내용."); oEditors.getById["category3_cont"].exec("FOCUS"); //포커싱 return; 
  	   	}
  	     		
 		if (gubun1 == "I"){	
	 		
 			if( fileCnt == 0){
	 			alert("선택된 파일이 없습니다.");	
	 			return;
	 		}
 		}
 		
 		var checkNo ="";
 		if (gubun1 == "E"){	
 			$('input:checkbox[name="checkNo"]').each(function() {
	 			if(this.checked){
		 			ischeckeds = true;
		 			var strCheckdValue = this.value;
		 			checkNo = checkNo + ',' + strCheckdValue; 
	 			}
			});
 		}
			
		checkNo = checkNo.substring( 1, checkNo.length );
		$("#checkdstr").val(checkNo);
				
 		var formData = new FormData(); 
 		
 		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 formData.append("article_file", content_files[x]);
			}
		}
 		
 		formData.append("category1_key",  category1_key);
 		formData.append("category2_key",  category2_key);
 		formData.append("category3_key",  category3_key);
 		formData.append("category3_name", category3_name);
 		formData.append("gubun1",         gubun1);
 		formData.append("category3_cont", category3_cont);
 		formData.append("checkdstr",      checkNo);
 		
 		var msg = "카테고리를 등록 하시겠습니까?";
 		if (gubun1 == "E"){
 			msg = "카테고리를 수정 하시겠습니까?"
 		}else if (gubun1 == "D"){
 			msg = "카테고리를 삭제 하시겠습니까?"
 		}
 		
 		var yn = confirm(msg);		
 		if(yn){
 				
 			$.ajax({	
 				//data     : $("#commonForm").serialize(),
 				data       : formData,
 			    url		   : "<c:url value='/edu/eduInfoRegCate3Save.do'/>",
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
 	
  	function fileDownload(key1){	
		var frm = document.commonForm;
		$("#gubun1").val('F'); 
		$("#gubun2").val('category3')
		$("#file_seq").val(key1)
		frm.action = "<c:url value='/edu/fileDownload.do'/>";
		frm.submit();
	}
 </script>
 
          <h1 class="h1-tit">교육안내 등록</h1>
          <form  id="commonForm" name="commonForm"  method="post"   enctype="multipart/form-data" >
			<input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />
			<input type="hidden" id="category1_name" name="category1_name" class="input-box" value="${categoryVo.category1_name}" />
			<input type="hidden" id="category1_key"  name="category1_key"  class="input-box" value="${categoryVo.category1_key}"  />
			<input type="hidden" id="category2_name" name="category2_name" class="input-box" value="${categoryVo.category2_name}" />
			<input type="hidden" id="category2_key"  name="category2_key"  class="input-box" value="${categoryVo.category2_key}" />
			<input type="hidden" id="category3_key"  name="category3_key"  class="input-box" value="${categoryForm.category3_key}" />
			<input type="hidden" id="gubun1"         name="gubun1"         class="input-box" value=''/>
			<input type="hidden" id="gubun2"         name="gubun2"         class="input-box" value=''/>
			<input type="hidden" id="checkdstr"      name="checkdstr"      class="input-box" value=''/>
			<input type="hidden" id="file_seq"       name="file_seq"       class="input-box" value=0/>
			
			
           <div class="sub-cont">
               <button  type="button" class="mid-btn black-btn" onClick="fn_load('${categoryVo.gubun2}');">전체분류 보기</button>
              <div class="req-box">
                  <label for="categoryFname">
				        ${categoryVo.category1_name} >  ${categoryVo.category2_name} >  카테고리03 등록
                  </label>
              </div>              
          </div>          
         
         
           <div class="table-wrap">
                    <table class="detail-tb">
                        <caption>카테고리3명, 상세내용, 자료업로드 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span class="red-txt">*</span>카테고리3명</th>
                                <td>
                                    <input type="text" class="input-box" id='category3_name' name='category3_name' value="${categoryForm.category3_name}" />
                                </td>
                            </tr>
                            <tr>
                                <th><span class="red-txt">*</span>상세내용</th>
                                <td>
                                    <div class="editor-box">
                                   
                                    <textarea name="category3_cont" id="category3_cont" rows="10" cols="100" style="width: 100%; height: 100%; border: 1px solid #ddd; display: none;">${categoryForm.category3_cont}</textarea>
                                    
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="red-txt">*</span>자료 업로드</th>
                                <td>
                                    <div class="upload-box">
                                      <button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
									  <input id="input_file" multiple="multiple" type="file" style="display:none;">
									  <span style="font-size:10px; color: gray;">※첨부파일은 최대 5개까지 등록이 가능합니다.</span>
									  <div class="data_file_txt" id="data_file_txt" style="margin:10px;">
										<span>첨부 파일</span><br />
										<div id="articlefileChange"></div>
									  </div>
									  
									  <c:forEach var="result" items="${resultFileList}" varStatus="status">
									  	<c:if test="${status.index ==0 }">
									  	Upload 파일명 </br>
									  	</c:if>
									  	 <a onclick="javascript:fileDownload('${result.file_seq}');"> ${result.file_name}</a>
									  	 <input type="checkbox" id='checkNo' name='checkNo' value="${result.file_seq}" class="check-box"/>삭제 여부</br>
									  </c:forEach>
									  
                                    </div>
								</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				</form>
	            <div class="btn-cont">
		            <c:if test="${empty categoryForm.category3_name }">
		            	<button type="button" class="mid-btn blue-btn"  onClick="javascript:fn_save('I');">저장</button>
		            </c:if>                    
                    <c:if test="${not empty categoryForm.category3_name }">
	                    <button type="button" class="mid-btn blue-btn"  onClick="javascript:fn_save('E');">수정</button>
	               	    <button type="button" class="mid-btn black-btn" onClick="javascript:fn_save('D');">삭제</button>
               	   </c:if>
                </div>

   
<script type="text/javascript">

var oEditors = [];

var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "category3_cont",
	sSkinURI : "${pageContext.request.contextPath}/js/SE2/SmartEditor2Skin.html",
	htParams : {
		bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function() {
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function() {
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		$('iframe').category3_cont().find('.se2_multy').show();
		$('iframe').category3_cont().find('.se2_multy').on("click", function(event) {
			editImgUpLoad();
		});
	},
	fCreator : "createSEditor2"
});

</script>
