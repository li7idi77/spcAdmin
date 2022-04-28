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


<form id="commonForm" name="commonForm" method="post">
<input type="hidden" name="cour_no" id="cour_no" value="${cour_no}">
<div class="pop-wrap sm-pop">
        <!-- <div class="pop-header">
            <h1 class="h1-tit"></h1>
            <button class="close-btn"><img src="./images/common/close.png" alt="닫기"/></button>
        </div> -->
        <div class="pop-cont">
            <div class="table-wrap">
                <table class="detail-tb">
                    <caption>교육번호, 분야 정보가 있는 테이블</caption>
                    <colgroup>
                        <col width="25%"/>
                        <col width="*"/>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>교육번호</th>
                            <td>
                                <input type="text" id="license_number" name="license_number" class="input-box" placeholder="">
                                <p class="point">* 네자리 번호를 입력하세요. (ex. 0854)</p>
                            </td>
                        </tr>
                        <tr>
                            <th>분야</th>
                            <td>
                                <input type="text" id="license_field" name="license_field" class="input-box lg-width" placeholder="직접입력">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <p class="point">* 등록을 누르시면 해당 회원 마이페이지에서 수료증 발급이 활성화 됩니다.</p>
        </div>
        <div class="pop-footer">
            <button type="button" class="mid-btn blue-btn" onClick="javascript:fn_save();">등록</button>
            <button class="mid-btn white-btn" onClick="javascript:history.back();">취소</button>
        </div>
    </div>
</form>

<script type="text/javascript">

$(document).ready(function() {
});


function fn_save(){
	if($("#edu_number").val() == ""){
		alert("수료증 번호를 입력 해 주세요.");
		return;
	}
	
	if($("#license_field").val() == ""){
		alert("분야를 입력 해 주세요.");
		return;
	}

	var formData = new FormData($('#commonForm')[0]);
		if(confirm("번호수료증을 저장 하시겠습니까?")){
				
			$.ajax({	
				data     : formData,
			    url		 : "<c:url value='/warrant/warrantNumberSave.do'/>",
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
			self.close();
		} else if(result == "EXIST"){				
			alert("이미 등록 되었습니다.");	
			return false;
		}else {				
			alert("등록이 실패 했습니다.");	
			return false;
		}
	}
}
 
</script>