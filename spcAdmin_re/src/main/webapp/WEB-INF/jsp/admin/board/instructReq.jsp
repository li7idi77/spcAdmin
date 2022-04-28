<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<h1 class="h1-tit">강사 공지사항 ${ not empty detailData.board_idx ? "수정" : "등록"}</h1>
<form id="commonForm" name="commonForm" method="post">
<input type="hidden" name="board_idx" id="board_idx" value="${ not empty detailData.board_idx ? detailData.board_idx : '0'}">
<input type="hidden" name="board_type" id="board_type" value="05">
<input type="hidden" id="gubun1"  name="gubun1"  />
<input type="hidden" id="checkdstr"      name="checkdstr"      class="input-box" value=''/>
<input type="hidden" id="file_seq"       name="file_seq"       class="input-box" value=0/>
	<div class="table-wrap">
	    <table class="detail-tb">
	        <caption>제목, 작성자, 패스워드, 내용, 첨부파일 정보가 있는 테이블</caption>
	        <colgroup>
	            <col width="20%"/>
	            <col width="30%"/>
	            <col width="20%"/>
	            <col width="*"/>
	        </colgroup>
	        <tbody>
	            <tr>
	                <th>제목</th>
	                <td colspan="3">
	                    <input type="text" class="input-box w768" id="title" name="title" value="${detailData.title}"/>
	                </td>
	            </tr>
	            <tr>
	                <th>작성자</th>
	                <td><input type="text" class="input-box" id="reg_id" name="reg_id" value="${detailData.reg_id}"/></td>
	                <!-- <th>패스워드</th>
	                <td><input type="text" class="input-box" value=""/></td> -->
	            </tr>
	            <tr>
	                <th>내용</th>
	                <td colspan="3">
	                    <div class="editor-box"><textarea name="contents" id="contents" rows="10" cols="100" style="width: 100%; height: 100%; border: 1px solid #ddd; display: none;">${detailData.contents}</textarea></div>
	                </td>
	            </tr>
	            <tr>
                <th>첨부파일</th>
                 <td>
                  <div class="upload-box">
                    <button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
				  <input id="input_file" multiple="multiple" type="file" style="display:none;">
				  <span style="font-size:10px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span>
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
	<c:if test="${empty detailData.board_idx }">
     		<button type="button" class="mid-btn blue-btn"   onClick="javascript:fn_save('I');">저장</button>
     </c:if>
     <c:if test="${not empty detailData.board_idx }">
     		<button type="button" class="mid-btn blue-btn"   onClick="javascript:fn_save('E');">저장</button>
     </c:if>
    <button class="mid-btn white-btn" onClick="javascript:history.back();">취소</button>
    <button class="mid-btn black-btn" onClick="javascript:history.back();">목록</button>
</div>

<script type="text/javascript">
$(document).ready(function() {
});
var oEditors = [];

var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "contents",
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
		$('iframe').contents().find('.se2_multy').show();
		$('iframe').contents().find('.se2_multy').on("click", function(event) {
			editImgUpLoad();
		});
	},
	fCreator : "createSEditor2"
});

var setEditImg = function(imgPath){
	var imgTag = '<img src="' + imgPath + '">';
	oEditors.getById["contents"].exec("PASTE_HTML", [imgTag]);
};

function fn_save(gubun1){
	
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	var content = document.getElementById("contents").value;;

	$("#gubun1").val(gubun1); 
	
	var title       = $("#title").val();
	var reg_id = $("#reg_id").val();
	   
    if (title == ""){			
		alert("제목을 입력해주세요");
		return;
	}
    if(content == "" || content == null || content == '&nbsp;' || content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){ 
    	return alert("본문을 작성해주세요."); oEditors.getById["contents"].exec("FOCUS"); //포커싱 return; 
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
			
		for (var x = 0; x < content_files.length; x++) {
		// 삭제 안한것만 담아 준다. 
		if(!content_files[x].is_delete){
			 formData.append("article_file", content_files[x]);
		}
	}

	var msg = "공지사항 등록 하시겠습니까?";
	if (gubun1 == "E"){
		msg = "공지사항 수정 하시겠습니까?";
	}
	var formData = new FormData($('#commonForm')[0]);
		var yn = confirm(msg);	
		if(yn){
				
			$.ajax({	
				data     : formData,
			    url		 : "<c:url value='/adBoard/noticeSave.do'/>",
		        dataType : "JSON",
		        processData: false, 
		        contentType: false,
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
			fn_load('R');				 
		} else if(result == "EXIST"){				
			alert("이미 등록 되었습니다.");	
			return false;
		}else {				
			alert("등록이 실패 했습니다.");	
			return false;
		}
	}
}

function fn_load(str) {
	var frm = document.commonForm;
	frm.action = "<c:url value='/adBoard/instructList.do'/>";    
	frm.submit();
 }
 
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});

// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 3;
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

function fileDownload(key1){
	var frm = document.commonForm;
	$("#file_seq").val(key1)
	frm.action = "<c:url value='/adBoard/fileDownload.do'/>";
	frm.submit();
}
</script>
