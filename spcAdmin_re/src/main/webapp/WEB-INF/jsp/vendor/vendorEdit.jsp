<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery/jquery-ui.css' />"  >	
<script src="<c:url value='/resources/js/jquery/jquery.min.js' />"></script>	
<script src="<c:url value='/resources/js/code/jquery-ui.min.js' />"></script>

<script type="text/javascript">
	
	$(document).ready(function(){		
		
		getVendorDetail();		
		
		//모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            /*
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "<c:url value='/resources/images/calendar.gif' />" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            */
        });
		$("#reg_date").datepicker();                    
        $("#end_date").datepicker();
                
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
	function goVendorList(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/vendor/vendorList.do'/>";
		frm.submit();
	}
	
	/** 게시판 - 상세 조회  */
	function getVendorDetail(){
		
		var vendor_seq = $("#vendor_seq").val();
	
		if(vendor_seq != "" && vendor_seq != "0" ){
			$("#mode").val("E");
			$.ajax({	
				 url     : "<c:url value='/vendor/getVendorDetail.do'/>",
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
			$("#del_yn").val("N").attr("selected", "selected");
			$("#mode").val("W");
		}			
	}

	
	/**  상세 조회  콜백 함수 */
	function getDetailCallback(obj){
		
		var str = "";
		
		if(obj != null){								
							
			var vendor_seq  = obj.vendor_seq; 
			var name        = obj.name; 
			var manager 	= obj.manager; 
			var manager_tel = obj.manager_tel; 
			var company     = obj.company;
			
			var company_tel = obj.company_tel; 
			var reg_date    = obj.reg_date; 
			var end_date 	= obj.end_date; 
			var sms_price   = obj.sms_price; 
			var lms_price   = obj.lms_price;
					
			var mms_price   = obj.mms_price; 
			var comment     = obj.comment; 
			var del_yn   	= obj.del_yn; 
			var ins_date    = obj.ins_date; 
			var upd_date    = obj.upd_date;
						
			if ( del_yn =='Y'){
				$("#del_yn").val("Y").attr("selected", "selected");
			}else if( del_yn =='N'){
				$("#del_yn").val("N").attr("selected", "selected");
			}			
			
			$("#vendor_seq").val(vendor_seq);			
			$("#name").val(name);
			$("#manager").val(manager);			
			$("#manager_tel").val(manager_tel);
			$("#company").val(company);
			
			$("#company_tel").val(company_tel);			
			$("#reg_date").val(reg_date);
			$("#end_date").val(end_date);
			$("#sms_price").val(sms_price);			
			$("#lms_price").val(lms_price);
			
			
			$("#mms_price").val(mms_price);			
			$("#comment").val(comment);
			$("#del_yn").val(del_yn);			
						

		} else {			
			alert("등록된  항목이 존재하지 않습니다.");
			return;
		}		
	}
	
	/** 수정  */
	function updateVendor(){

		var name        = $("#name").val();
		var manager     = $("#manager").val();
		var manager_tel = $("#manager_tel").val();
		var sms_price   = $("#sms_price").val();
		var lms_price   = $("#lms_price").val();
		var mms_price   = $("#mms_price").val();
		
		if (name == ""){			
			alert("name을입력해주세요.");
			$("#name").focus();
			return;
		}
		if (manager == ""){					
			alert("manager을 입력해주세요.");
			$("#manager").focus();
			return;
		}
		if (manager_tel == ""){					
			alert("manager Tel을  입력해주세요.");
			$("#manager_tel").focus();
			return;
		}
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
			    url     : "<c:url value='/vendor/updateVendor.do'/>",
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
	function deleteVendor(){

		$("#mode").val("D");
		var yn = confirm("삭제 하시겠습니까?");		
		if(yn){
				
			$.ajax({	
			    url     : "<c:url value='/vendor/updateVendor.do'/>",
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
				goVendorList();				 
			} else {				
				alert(msg_e);	
				return;
			}
		}
	}
	
	
		
</script>
			
<form  id="commonForm" name="commonForm">	
	<input type='hdden' id='vendor_seq' name='vendor_seq' value='${vendorSeq}'   />
	<input type='hdden' id='mode'       name='mode'    />

<div class="addr">
 <div class="addr_wrap">
  <div class="addr_list">
	
	<table width="100%" >
        <tr>
		 <th>NAME *</th>
			<td align=left><input type='text' class="input_large" id="name" name="name"  maxlength="30" /></td>
		</tr>
		 <tr>
			<th>MANAGER *</th>
			<th><input type='text' id="manager" class="input_large" name="manager"  maxlength="30" /></th>
		</tr>
		<tr>
			<th>MANAGER_TEL *</th>
			<th><input type='text' id="manager_tel" class="input_large" name="manager_tel"   maxlength="30" /></td>
		</tr>
		<tr>
			<th>company</th>
			<th><input type='text' id="company" class="input_large" name="company"   maxlength="30" /></td>
		</tr>
		<tr>
			<th>company_TEL</th>
			<th><input type='text' id="company_tel" class="input_large" name="company_tel"  maxlength="30"  /></td>
		</tr>
		
		<tr>
			<th>REG_DATE</th>
			<th><input type='text' id="reg_date" class="input_large" name="reg_date"   maxlength="30" readonly/></td>
		</tr>
		<tr>
			<th>end_date</th>
			<th><input type='text' id="end_date" class="input_large" name="end_date"   maxlength="30" readonly/></td>
		</tr>
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
			<th>comment</th>
			<th><textarea id="comment" class="input_large" name="comment" cols="80" rows="5" maxlength="30" ></textarea></th>
		</tr>
		<tr>
			<th>삭제여부</th>
			<th>
				<select class="input_large" name="del_yn" id="del_yn">
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
			</td>
		</tr>
	</table>	
  </div>
  </div>
 </div>			
</form>
	
<br/><br/>
<li><a class="btn_login"   onclick="javascript:goVendorList();" >목록으로</a>
<a class="btn_login"   onclick="javascript:updateVendor();" >수정하기</a>
<a class="btn_login"   onclick="javascript:deleteVendor();" >삭제하기</a>
</li>
			
	
