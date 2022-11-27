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

<h1 class="h1-tit">콘텐츠 등록</h1>

<form id="commonForm" name="commonForm" method="post" enctype="Multipart/form-data">
	<input type="hidden" name="object_id" id="object_id" value="${edu_sub_no}">
	<input type="hidden" name="edu_no" id="edu_no" value="${result.EDU_NO}">
	<input type="hidden" id="file_gubun"  name="file_gubun" value="lmsContents2"/>
	<input type="hidden" id="flag"  name="flag" value="${flag}"/>
	<input type="hidden" id="checkdstr"      name="checkdstr"      class="input-box" value=''/>
	<input type="hidden" id="file_seq"       name="file_seq"       class="input-box" value=0/>
	<div class="table-wrap">
	    <table class="detail-tb">
	        <caption>교육분류, 교육명, 차시, 차시명, 강의시간, 교육 인증시간, 콘텐츠 등록, 교육자료 등록, 교육현황 정보가 있는 테이블</caption>
	        <colgroup>
	            <col width="20%"/>
	            <col width="*"/>
	        </colgroup>
	        <tbody>
	            <tr>
	                <th>분류1,2</th>
	                <td>${result.CATEGORY1_NAME} / ${result.CATEGORY2_NAME}
	                </td>
	            </tr>
	            <tr>
	                <th>교육명(분류3)</th>
	                <td>${result.CATEGORY3_NAME}</td>
	            </tr>
	            <tr>
	                <th>차시</th>
	                <td>${result.EDU_CURR1}</td>
	            </tr>
	            <tr>
	                <th>차시명</th>
	                <td>${result.EDU_CURR2}</td>
	            </tr>
	            <tr>
	                <th>강의시간</th>
	                <td>${result.EDU_CURR3} <span>분</span></td>
	            </tr>
	            <tr>
	                <th>교육 인증시간</th>
	                <td>
	                    ${result.EDU_CURR3}<input type="hidden" class="input-box" id="edu_on_app_time" name="edu_on_app_time" value="${result.EDU_CURR3}"/>
	                    <span>분</span>
	                    <span class="point"> * 교육등록에서 등록한 차시별 학습시간을 100% 이수하여야 다음 차시 시청 가능</span>
	                </td>
	            </tr>
	            <tr>
	                <th>콘텐츠 등록</th>
	                <td>
	                   <input type="text" class="input-box" id="edu_con_url" name="edu_con_url" value="${result.EDU_CON_URL}"/>
	                   <span class="point"> * http://abc.com/osj/a1.mp4</span>
	                </td>
	            </tr>
	            <tr>
	                <th>교육자료 등록</th>
	                <td>
	                    <div class="upload-box">
	                    	<input type="hidden" class="input-box" id="file_id" name="file_id" value="${result.FILE_ID}"/>
	                    	<c:if test="${result.FILE_NAME == null}">
	                    		<input type="file" id="file1" name="file1"/>
	                    	</c:if>
	                        <c:if test="${result.FILE_NAME != null}">
	                    		<button type="button" class="sm-btn black-btn" onClick="fn_delete('${result.FILE_ID}');">삭제</button>
	                        <label>파일명: <span>${result.FILE_NAME}</span></label>
	                        <input type="file" id="file1" name="file1" style="display:none;"/>
	                    	</c:if>
	                        <span class="point">3개</span>
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <th>교육 노출여부</th>
	                <td>
	                   <div class="tb-cont">
                           <div class="radio-cont">
                               <input type="radio" class="radio-box"  id="exp_use_yn"  name="exp_use_yn" value="Y" <c:if test="${result.EXP_USE_YN =='Y'  || (empty result.EXP_USE_YN) }">checked </c:if>>
                               <label for="">YES</label>
                           </div>
                             
                           <div class="radio-cont">
                               <input type="radio" class="radio-box" id="exp_use_yn"  name="exp_use_yn" value="N" <c:if test="${result.EXP_USE_YN =='N'}">checked </c:if>>
                               <label for="">NO</label>
                           </div>
                       </div>
	                   <span class="point"> * 콘텐츠 등록 후 교육 노출을 원한다면 YES를 선택하세요.</span>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	</div>
</form>

<div class="btn-cont">
    <button type="button" class="mid-btn blue-btn"   onClick="javascript:fn_save();">저장</button>
    <button class="mid-btn white-btn" onClick="javascript:history.back();">취소</button>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#category1_key').change(function(){
		var val  = $(this).val();

		if( val ==""){
			return;
		}
		
		$("#category2_key").val("");
				
		 $.ajax({	
		    url     : "<c:url value='/user/category2list.do'/>",
		    data    : $("#commonForm").serialize(),
	        dataType: "JSON",
	        cache   : false,
			async   : true,
			type	: "POST",	
			success: function(data, opt, inx){
			var option = '';
			option += '<option value="">선택 하세요</opton>'; //선택
			$.each(data, function(i, ret){
				option += '<option value="'+ret.CATEGORY2_KEY+'">'+ret.CATEGORY2_NAME+'</option>';		
			});
			$('select[name=category2_key]').html(option);						
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
	 });
 
 $('#category2_key').change(function(){
		var val  = $(this).val();

		if( val ==""){
			return;
		}
		
		$("#category3_key").val("");
				
		 $.ajax({	
		    url     : "<c:url value='/user/category3list.do'/>",
		    data    : $("#commonForm").serialize(),
	        dataType: "JSON",
	        cache   : false,
			async   : true,
			type	: "POST",	
			success: function(data, opt, inx){
			var option = '';
			option += '<option value="">선택 하세요</opton>'; //선택
			$.each(data, function(i, ret){
				option += '<option value="'+ret.CATEGORY3_KEY+'">'+ret.CATEGORY3_NAME+'</option>';		
			});
			$('select[name=category3_key]').html(option);						
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
	 });
});

function fn_delete(file_id){
	var formData = new FormData($('#commonForm')[0]);

	var msg = "파일을 삭제 하시겠습니까?";
		var yn = confirm(msg);	
		if(yn){
			$.ajax({	
				data     : formData,
			    url		 : "<c:url value='/lms/contentsDel.do'/>?file_id="+file_id,
		        dataType : "JSON",
				type	 : "POST",
				processData: false, 
		        contentType: false,
		        success  : function(obj) {
		        	location.reload();			
		        },	       
		        error 	: function(xhr, status, error) {} 		        
		    });
		}
	}
	
function fn_save(){
	var formData = new FormData($('#commonForm')[0]);

	var msg = "콘텐츠 등록 하시겠습니까?";
	formData.append("file1",    $("input[name=file1]")[0]);
		
		var yn = confirm(msg);	
		if(yn){
			$.ajax({	
				data     : formData,
			    url		 : "<c:url value='/lms/contentsSave.do'/>",
		        dataType : "JSON",
				type	 : "POST",
				processData: false, 
		        contentType: false,
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
	frm.action = "<c:url value='/orgMng/orgOnContentsList.do'/>";    
	frm.submit();
 }
 

function fileDownload(key1){
	var frm = document.commonForm;
	$("#file_seq").val(key1)
	frm.action = "<c:url value='/lms/fileDownload.do'/>";
	frm.submit();
}

</script>