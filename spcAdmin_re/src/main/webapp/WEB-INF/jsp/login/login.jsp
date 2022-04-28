<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">	
	$(document).ready(function(){	
		$("#password").keyup(function(e){
			if(e.keyCode == 13)  loginProcess();
		});
		
		//loginProcess();

	});
	
	/**  페이지 이동 */
	function goOkPage(){	
		var frm = document.commonForm;
		//frm.action = "<c:url value='/adBoard/noticeList.do'/>";
		frm.action = "<c:url value='/main/logoList.do'/>";
		frm.submit();
	}
		
	/** 로그인 - 로그인 확인  */
	function loginProcess(){
	
		var userId   = $("#userId").val();
		var sesionId = $("#sesionId").val();
		
		/*	
		if (userId == ""){			
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return;
		}
		*/
		/*
		if (sesionId == ""){			
			alert("sesionId 입력해주세요.");
			$("#sesionId").focus();
			return;
		}
		
		
		$.ajax({	
			data     : $("#commonForm").serialize(),
		    url		 : "<c:url value='/login/loginUser.do'/>",
	        dataType : "JSON",
	        cache    : false,
	        async    : false,
			type	 : "POST",	
	        success  : function(obj) {
	        	commonCallBack(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	    });
		*/
		var frm = document.commonForm;
		frm.action = "<c:url value='/login/loginUser.do'/>";
		frm.submit();		
	}	
	
	/** 콜백 함수 */
	function commonCallBack(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				//alert("로그인에 성공하였습니다.");				
				goOkPage();				 
			}else {				
				alert("로그인에 실패 했습니다.");	
				return false;
			}
		}
	}	
</script>
<!-- 로그인 -->
	<section id="loginArea">
		<form class="form_login" id="commonForm" name="commonForm"  method="post"  action=""> lms_admin  kjs2300
			<h1 class="logo_login"> Admin Login Page</h1>
			<li><input  class="input_large" type="text"    id="userId"       name ="userId"       value='lms_admin'     placeholder="userId"   ></li>
			<li><input  class="input_large" type="text"    id="sesionId"     name ="sesionId"     value=''              placeholder="sesionId" ></li>
		</form>
			<li><button class="btn_login"   onclick="javascript:loginProcess();" >로그인</button></li>
	</section>
<!-- #loginArea -->