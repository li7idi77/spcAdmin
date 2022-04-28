
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
 <!--
 
	$(document).ready(function(){
		$("#popup_cn").val($("#popup_cn").val().trim());
	}); 
    
 	function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		frm.action = "<c:url value='/main/popupList.do'/>";
		frm.submit();
	}
	    
	function fn_save(gubun1){
 	
	   var popup_nm     = $("#popup_nm").val();
	   var popup_ar     = $("#popup_ar").val();
	   var popup_hg     = $("#popup_hg").val();
	   var otpt_xaxs_lc = $("#otpt_xaxs_lc").val();
	   var otpt_yaxs_lc = $("#otpt_yaxs_lc").val();
	   var popup_no     = $("#popup_no").val();
	   var gubun2       = $("#gubun2").val();
	   
	   oEditors.getById["popup_cn"].exec("UPDATE_CONTENTS_FIELD", []);
	   var popup_cn = document.getElementById("popup_cn").value;;
	   $("#popup_cn").val(popup_cn);
	   
	   $("#gubun1").val(gubun1);
	     
	   if (popup_nm == ""){			
			alert("제목을 입력하세요.");
			$("#popup_nm").focus();
			return;
		}		
  
		if (popup_ar == ""){			
			alert("창의 가로를 입력 하세요.");
			 $("#popup_ar").focus();
			return;
		}
		
		if (popup_hg == ""){			
			alert("창의 세로를 입력 하세요.");
			 $("#popup_hg").focus();
			return;
		}
		
		if (otpt_xaxs_lc == ""){			
			alert("창위치 left 를 입력 하세요.");
			$("#otpt_xaxs_lc").focus();
			return;
		}
		
		if (otpt_yaxs_lc == ""){			
			alert("창위치 top을 입력 하세요.");
			$("#otpt_yaxs_lc").focus();
			return;
		}
		
		if (popup_cn == ""){			
			alert("내용을 입력 하세요.");
			$("#popup_cn").focus();
			return;
		}
		
		var msg = "팝업을  등록 하시겠습니까?";
		if (gubun1 == "E"){
			msg = "팝얼을  수정 하시겠습니까?"
		}
		
		var formData = new FormData(); 
		formData.append("gubun1",       gubun1);
		formData.append("gubun2",       gubun2);
		
		formData.append("popup_nm",     popup_nm);
		formData.append("popup_ar",     popup_ar);
	    formData.append("popup_hg",     popup_hg);
		formData.append("otpt_xaxs_lc", otpt_xaxs_lc);
		
		formData.append("otpt_yaxs_lc", otpt_yaxs_lc);
		formData.append("popup_cn",     popup_cn);
		formData.append("popup_no",     popup_no);
		
		
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
	
	function fn_load(){	
		var frm = document.commonForm;
		$("#gubun1").val('I'); 
		frm.action = "<c:url value='/main/popupReg.do'/>";
		frm.submit();
	}
     //-->
 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="gubun1"   name="gubun1"   class="input-box" />
			<input type="hidden" id="gubun2"   name="gubun2"   class="input-box" value='popup'/>
			<input type="hidden" id="popup_no" name="popup_no" class="input-box" value='${mainVo.popup_no}'/>

			
            <h1 class="h1-tit">팝업 등록</h1>
            <div class="table-wrap">
                <table class="detail-tb">
                    <caption>제목, 창크기, 창위치, 사용여부, 내용 정보가 있는 테이블</caption>
                    <colgroup>
                        <col width="15%"/>
                        <col width="35%"/>
                        <col width="15%"/>
                        <col width="*"/>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td colspan="3">
                                <input type="text" id="popup_nm" name="popup_nm" class="input-box w768"  maxlength="150"  value="${mainForm.popup_nm}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>창크기</th>
                            <td>
                                <div class="box">
                                    <span>가로</span>
                                    <input type="text" id="popup_ar" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="5" name="popup_ar" class="input-box" value="${mainForm.popup_ar}"/>
                                    <span>px</span>
                                </div>
                                <div class="box">
                                    <span>세로</span>
                                    <input type="text" id="popup_hg" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="5" name="popup_hg" class="input-box" value="${mainForm.popup_hg}"/>
                                    <span>px</span>
                                </div>
                            </td>
                            <th>창위치</th>
                            <td>
                                <div class="box">
                                    <span>left</span>
                                    <input type="text" id="otpt_xaxs_lc" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="5" name="otpt_xaxs_lc" class="input-box" value="${mainForm.otpt_xaxs_lc}"/>
                                    <span>px</span>
                                </div>
                                <div class="box">
                                    <span>top</span>
                                    <input type="text" id="otpt_yaxs_lc" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="5" name="otpt_yaxs_lc" class="input-box" value="${mainForm.otpt_yaxs_lc}"/>
                                    <span>px</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>사용여부</th>
                            <td colspan="3">
                                
                                <c:if test="${empty mainForm.popup_no }">
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="use_yn" name="use_yn" value="Y" checked>
                                    <label for="">사용</label>
                                </div>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="use_yn" name="use_yn" value="N">
                                    <label for="">사용안함</label>
                                </div>
                                </c:if>
                                <c:if test="${not empty mainForm.popup_no }">
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="use_yn" name="use_yn" value="Y" <c:if test="${mainForm.use_yn =='Y' }"> checked</c:if>>
                                    <label for="">사용</label>
                                </div>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="use_yn" name="use_yn" value="N" <c:if test="${mainForm.use_yn =='N' }"> checked</c:if>>
                                    <label for="">사용안함</label>
                                </div>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <div class="editor-box">
                                    <textarea id="popup_cn" name="popup_cn" cols="120" rows="10" >${mainForm.popup_cn}</textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
			</form>
            
            <div class="btn-cont">
	            <c:if test="${empty mainForm.popup_no }">
		         	<button type="button"  onClick="javascript:fn_save('I');" class="mid-btn blue-btn">저장</button>
		        </c:if>    
		        <c:if test="${not empty mainForm.popup_no }">
		        	<button type="button"  onClick="javascript:fn_save('E');" class="mid-btn blue-btn">수정</button>
		        </c:if>
	             <button type="button" onClick="javascript:history.back();" class="mid-btn black-btn">목록</button>
            </div>
<script type="text/javascript">

var oEditors = [];

var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "popup_cn",
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
	oEditors.getById["popup_cn"].exec("PASTE_HTML", [imgTag]);
};
</script>