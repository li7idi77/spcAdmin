<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	
	$(document).ready(function(){		
		getMemberDetail();	
		
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
	function goMemberList(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/member/memberList.do'/>";
		frm.submit();
	}
	
	/** 게시판 - 상세 조회  */
	function getMemberDetail(){
		
		var id = $("#id").val();

		if(id != ""){
			
			$.ajax({	
				
			    url     : "<c:url value='/member/getMemberDetail.do'/>",
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
			alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
		}			
	}

	
	/**  상세 조회  콜백 함수 */
	function getDetailCallback(obj){
		
		var str = "";
		
		if(obj != null){								
							
			var id		  = obj.id; 
			var password  = obj.password; 
			var del_yn 	  = obj.del_yn; 
			var ins_date  = obj.ins_date; 
			var upd_date  = obj.upd_date;
			
			var sms_price   = obj.sms_price; 
			var lms_price   = obj.lms_price;
			var mms_price   = obj.mms_price; 
					
			$("#id").val(id);			
			//$("#password").val(password);
			$("#del_yn").val(del_yn);			
			$("#ins_date").val(ins_date);
			$("#upd_date").val(upd_date);
			$("#sms_price").val(sms_price);			
			$("#lms_price").val(lms_price);
			
			
			$("#mms_price").val(mms_price);			
			
			if ( del_yn =='Y'){
				$("#del_yn").val("Y").attr("selected", "selected");
			}else if( del_yn =='N'){
				$("#del_yn").val("N").attr("selected", "selected");
			}			

		} else {			
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}		
	}
	
	/** 게시판 - 수정  */
	function updateMember(){

		var password  = $("#password").val();
		var del_yn    = $("#del_yn").val();
		var sms_price = $("#sms_price").val();
		var lms_price = $("#lms_price").val();
		var mms_price = $("#mms_price").val();
		/*
		if (password == ""){			
			alert("암호를 입력해주세요.");
			$("#password").focus();
			return;
		}
		*/
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
		if (del_yn != "Y" && del_yn != "N" ){			
			alert("삭제여부를  입력해주세요.");
			$("#del_yn").focus();
			return;
		}
		var yn = confirm("수정하시겠습니까?");		
		if(yn){
				
			$.ajax({	
			    url     : "<c:url value='/member/updateMember.do'/>",
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
			
			if(result == "SUCCESS"){				
				alert("회원 정보를 수정 하였습니다.");				
				goMemberList();				 
			} else {				
				alert("수정을 실패하였습니다.");	
				return;
			}
		}
	}
		
</script>
			
	<form  id="commonForm" name="commonForm">	
	<div class="addr">
		 <div class="addr_wrap">
 			 <div class="addr_list">

				<table width="100%" >
				       <tr>
							<th>ID*</span></th>
							<td><input type='text' class="input_large" id="id" name="id" value="${id}" readonly    /></td>
						</tr>
						 <tr>
							<th>암호</th>
							<td><input type='text' class="input_large" id="password" name="password"    /></td>
						</tr>
						<<tr>
							<th>등록일</th>
							<td><input type='text' class="input_large" id="ins_date" name="ins_date"  readonly /></td>
						</tr>
						<tr>
						 <th>SMS_PRICE *</span></th>
							<td><input type='text' class="input_large" id="sms_price" name="sms_price"  numberOnly maxlength="10"/></td>
						</tr>
						 <tr>
							<th>LMS_PRICE *</th>
							<td><input type='text' class="input_large" id="lms_price" name="lms_price"  numberOnly maxlength="10"/></td>
						</tr>
						<tr>
							<th>MMS_PRICE *</th>
							<td><input type='text' class="input_large" id="mms_price" name="mms_price"   numberOnly maxlength="10"/></td>
						</tr>		
						<tr>
							<th>수정일</th>
							<td><input type='text' class="input_large" id="upd_date" name="upd_date"  readonly /></td>
						</tr>
						<<tr>
							<th>삭제여부</th>
							<td>
								<select class="input_large"  name="del_yn" id="del_yn">
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
<li><button class="btn_login"   onclick="javascript:goMemberList();" >목록으로</button></li>
<li><button class="btn_login"   onclick="javascript:updateMember();" >수정하기</button></li>
			
		
