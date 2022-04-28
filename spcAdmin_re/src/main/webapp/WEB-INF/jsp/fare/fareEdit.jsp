<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery/jquery-ui.css' />"  >	
<script src="<c:url value='/resources/js/jquery/jquery.min.js' />"></script>	
<script src="<c:url value='/resources/js/code/jquery-ui.min.js' />"></script>

<script type="text/javascript">
	
	$(document).ready(function(){		
		
		getFareDetail();		
		
	             
		$("input:text[numberOnly]").on("keyup", function() {
	
			var _value = $(this).val();
			var _pattern = /^(\d{1,3}([.]\d{0,2})?)?$/;
			if (!_pattern.test(_value)) {
				alert("1000 이하의 숫자만 입력가능하며,\n소수점 둘째자리까지만 허용됩니다.");
				$(this).val('');
				$(this).focus();
			}
		});	

	});
	
	
	/** 게시판 - 목록 페이지 이동 */
	function goFareList(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/fare/fareList.do'/>";
		frm.submit();
	}
	
	/** 게시판 - 상세 조회  */
	function getFareDetail(){
		
		var fare_seq = $("#fare_seq").val();
	
		if(fare_seq != "" && fare_seq != "0" ){
			$("#mode").val("E");
			$.ajax({	
				 url     : "<c:url value='/fare/getFareDetail.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	getDetailCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		} else {
			$("#use_yn").val("N").attr("selected", "selected");
			$("#mode").val("W");
		}			
	}

	
	/**  상세 조회  콜백 함수 */
	function getDetailCallback(obj){
		
		var str = "";
		
		if(obj != null){								
							
			var fare_seq  = obj.fare_seq; 		
			var sms_price = obj.sms_price; 
			var lms_price = obj.lms_price;					
			var mms_price = obj.mms_price; 
			var use_yn    = obj.use_yn; 
			var ins_date  = obj.ins_date; 
			var upd_date  = obj.upd_date;
						
			if ( use_yn =='Y'){
				$("#use_yn").val("Y").attr("selected", "selected");
			}else if( use_yn =='N'){
				$("#use_yn").val("N").attr("selected", "selected");
			}			
			
			$("#fare_seq").val(fare_seq);			
			$("#sms_price").val(sms_price);			
			$("#lms_price").val(lms_price);
			$("#mms_price").val(mms_price);			
			$("#use_yn").val(use_yn);								
			$("#ins_date").val(ins_date);			
			$("#upd_date").val(upd_date);	
			
		} else {			
			alert("등록된  항목이 존재하지 않습니다.");
			return;
		}		
	}
	
	/** 수정  */
	function updateFare(){

		var name        = $("#name").val();
		var manager     = $("#manager").val();
		var manager_tel = $("#manager_tel").val();
		var sms_price   = $("#sms_price").val();
		var lms_price   = $("#lms_price").val();
		var mms_price   = $("#mms_price").val();
		
		if (sms_price == ""){			
			alert("SMS Price을입력해주세요.");
			$("#sms_price").focus();
			return;
		}
		if (lms_price == ""){					
			alert("LMS Price을 입력해주세요.");
			$("#lms_price").focus();
			return;
		}
		if (mms_price == ""){					
			alert("MMS Price을  입력해주세요.");
			$("#mms_price").focus();
			return;
		}
		
		var yn = confirm("등록/수정 하시겠습니까?");		
		if(yn){
				
			$.ajax({	
			    url     : "<c:url value='/fare/updateFare.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	Callback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		}
	}
	
	/** 삭제 * */
	function deleteFare(){

		$("#mode").val("D");
		var yn = confirm("삭제 하시겠습니까?");		
		if(yn){
				
			$.ajax({	
			    url     : "<c:url value='/fare/updateFare.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	Callback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		}
	}
	
	/**  콜백 함수 */
	function Callback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			var mode = $("#mode").val();
			var msg_s = "수정 하였습니다.";
			var msg_e = "수정 시 에러 발생 하였습니다.";
			
			if(mode =='W'){
				msg_s = "등록 하였습니다.";
				msg_e = "등록 시 에러 발생 하였습니다.";
			}
			if(mode =='D'){
				msg_s = "삭제 되었습니다.";
				msg_e = "삭제 시 에러 발생 하였습니다.";
			}
			if(result == "SUCCESS"){				
				alert(msg_s);				
				goFareList();				 
			} else {				
				alert(msg_e);	
				return;
			}
		}
	}
	
	
		
</script>
			
<form  id="commonForm" name="commonForm">	
	<input type='hdden' id='fare_seq' name='fare_seq' value='${fareSeq}'   />
	<input type='hdden' id='mode'     name='mode'    />

<div class="addr">
 <div class="addr_wrap">
  <div class="addr_list">
	
	<table width="100%" >
       	<tr>
		 <th>SMS_PRICE *</span></th>
			<th><input type='text' id="sms_price" class="input_large" name="sms_price"  numberOnly maxlength="10"/></td>
		</tr>
		 <tr>
			<th>LMS_PRICE *</th>
			<th><input type='text' id="lms_price" class="input_large" name="lms_price"  numberOnly maxlength="10"/></td>
		</tr>
		<tr>
			<th>MMS_PRICE *</th>
			<th><input type='text' id="mms_price" class="input_large" name="mms_price"   numberOnly maxlength="10"/></td>
		</tr>						
		<tr>
			<th>사용여부</th>
			<th>
				<select class="input_large" name="use_yn" id="use_yn">
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<th><input type='text' id="ins_date" class="input_large" name="ins_date"   readonly /></td>
		</tr>
		<tr>
			<th>수정일</th>
			<th><input type='text' id="upd_date" class="input_large" name="upd_date"   readonly /></td>
		</tr>
	</table>	
  </div>
  </div>
 </div>			
</form>
	
<br/><br/>
<li><a class="btn_login"   onclick="javascript:goFareList();" >목록으로</a>
<a class="btn_login"   onclick="javascript:updateFare();" >등록/수정하기</a>
<a class="btn_login"   onclick="javascript:deleteFare();" >삭제하기</a>
</li>
			
	
