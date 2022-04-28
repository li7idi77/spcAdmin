<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">	
	
	// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
	var regexPasswords = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
	var regexPassword = /^[A-Za-z0-9]{6,12}$/;
	
	//이메일 정규식
	var regexEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	//핸드폰번호 정규식
	var regexHp = /^\d{3}\d{3,4}\d{4}$/;
	
	//일반 전화번호 정규식
	var regexHomePhome = /^\d{2,3}-\d{3,4}-\d{4}$/;
	

	var pattern1 = /[0-9]/;
	var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[~!@#$%<>^&*]/;     // 원하는 특수문자 추가 제거

	$( document ).ready( function() {
	  //전체선택 시
	  $( '.check_all' ).click( function() {
          $( '.agree_ok' ).prop( 'checked', this.checked );
       });
        
        
	   // ID  숫자만 입력 가능
	   $('#id').numeric({});		
	   $('#id').css("ime-mode", "disabled");
		
     } );

		
	/** 게시판 - 목록 페이지 이동 */
	function goOkPage(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/board/boardList.do'/>";
		frm.submit();
	}
	
	/** 회원가입   */
	function signUpOk(){
	
		var id = $("#id").val();
		var password   = $("#password").val();
		var rePassword = $("#rePassword").val();
		var agree1 = $('input:checkbox[id="agree1"]').is(":checked")
		var agree2 = $('input:checkbox[id="agree2"]').is(":checked")
		var agree3 = $('input:checkbox[id="agree3"]').is(":checked")
		var agree4 = $('input:checkbox[id="agree4"]').is(":checked")

		if (id == ""){			
			alert("핸드폰 번호(아이디)를 입력해주세요.");
			$("#id").focus();
			return;
		}		
		if(!regexHp.test(id)) {            
			alert("핸드폰 번호(아이디) 형식이 맞지 않습니다. 다시 입력해주세요.");
			$("#id").val("");
			return;		
		}
		if (password == ""){			
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return;
		}	
		
		if(!pattern1.test(password)	|| !pattern2.test(password)	|| 
		   password.length<6 || password.length>50){
			 alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
			 return false;
		}
		/*
		if(!regexPassword.test(password)) {            
			alert("비밀번호는 '숫자,대문자,소문자를 포함한 6자 이상' 입력해 주세요.");
			$("#password").val("");
			return;		
		}
		*/
		if (rePassword == ""){			
			alert("비밀번호 재입력을 입력해주세요.");
			$("#rePassword").focus();
			return;
		}
		
		if (password != rePassword ){			
			alert("비밀번호가 같지 않습니다.");
			$("#rePassword").focus();
			return;
		}
				
		if (!agree1){			
			alert("서비스 이용약관에 동의를 확인 해 주세요.");
			return;
		}
		if (!agree2){				
			alert("개인정보취급방침에 동의 확인 해 주세요.");
			return;
		}
		
		var sms_yn     = (agree3 ? 'Y' : 'N');
		var account_yn = (agree4 ? 'Y' : 'N');
		
		$("#sms_yn").val(sms_yn)
		$("#account_yn").val(account_yn)
		
		var yn = confirm("회원 가입 하시겠습니까?");		
		if(yn){
				
			$.ajax({	
				data     : $("#commonForm").serialize(),
			    url		 : "<c:url value='/signupProcess.do'/>",
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
	/** 게시판 - 작성 콜백 함수 */
	function commonCallBack(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("회원가입에 성공하였습니다.");				
				goOkPage();				 
			} else if(result == "EXIST"){				
				alert("이미 가입 하셨습니다.");	
				return false;
			}else {				
				alert("회원가입에 실패 했습니다.");	
				return false;
			}
		}
	}	
</script>
<!-- 회원가입 -->
<section id="signupArea">
	<h1 class="logo_login">싼- 톡 : 사실은 별로 안 싼-</h1>
	<!-- SNS 로그인 추후 개발
	<div class="sns_signup">
		<h4>SNS 계정으로 간편하게 회원가입 하세요.</h4>
		<ul>
			<li><a href="" class="btn_join_n">네이버</a></li>
			<li><a href="" class="btn_join_k">카카오</a></li>
			<li><a href="" class="btn_join_f">페이스북</a></li>
			<li><a href="" class="btn_join_g">구글</a></li>
		</ul>
	</div>
	SNS 로그인 추후 개발 -->

	<div class="form_signup">
		<form  id="commonForm" name="commonForm"  method="post"  action="">
			<h2>회원가입</h2>
			<li>
				<label>핸드폰 번호(아이디)</label>
				<input class="input_large left" type="number" id="id" name="id" maxlength="11" placeholder="숫자만입력" required>
				<button  class="inline">인증받기</button>
				<p class="error_txt">핸드폰 본인인증을 해주세요.</p>
			</li>
			<li id="number">
				<label>인증번호 입력</label>
				<input class="input_large left" type="number" maxlength="11" placeholder="5자리 입력" required>
				<button class="inline">확인</button>
				<p class="count_time">2:00</p>
				<p class="error_txt">입력시간이 초과 되었습니다.</p>
			</li>
			<li>
				<label>비밀번호</label>
				<input class="input_large" type="password"  id="password" name="password" placeholder="숫자,대문자,소문자를 포함한 6자 이상" required>
				<p class="error_txt">비밀번호는  숫자, 대, 소문자를 포함한 6자리 이상만 가능합니다.</p>
			</li>
			<li>
				<label>비밀번호 재입력</label>
				<input class="input_large" type="password"  id="rePassword" name="rePassword" placeholder="비밀번호를 한번 더 입력하세요." required>
				<p class="error_txt">비밀번호가 같지 않습니다.</p>
			</li>
			<div class="agree">
				<h3>약관동의</h3>
				<ul>
					<li><input type="checkbox" id="checkbox" class="check_all"><label for="checkbox"></label> 모두 동의합니다.</li>
					<li><input type="checkbox" id="agree1" name="agree1" class="agree_ok"><label for="agree1"></label> <a>서비스 이용약관</a>에 동의합니다.<span class="point">(필수)</span></li>
					<li><input type="checkbox" id="agree2" name="agree2" class="agree_ok"><label for="agree2"></label> <a>개인정보취급방침</a>에 동의합니다.<span class="point">(필수)</span></li>
					<li><input type="checkbox" id="agree3" name="agree3" class="agree_ok"><label for="agree3"></label> 이벤트, 프로모션 알림 SMS수신    <span class="point">(선택)</span></li>
					<li><input type="checkbox" id="agree4" name="agree4" class="agree_ok"><label for="agree4"></label> 장기 미접속 시 계정 활성 상태 유지  <span class="point">(선택)</span></li>
				</ul>
			</div>
			<input type="hidden" id="sms_yn"     name="sms_yn" >
			<input type="hidden" id="account_yn" name="account_yn">
		</form>
		<li><button class="btn btn_red btn_login" onclick="javascript:signUpOk();">가입완료</button></li>
	</div>
</section>