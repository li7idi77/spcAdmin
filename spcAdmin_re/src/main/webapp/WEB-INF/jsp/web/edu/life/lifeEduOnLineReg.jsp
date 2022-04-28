
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <script type="text/javaScript" language="javascript" defer="defer">
 <!--
  	$(document).ready(function(){
  		
  	 <c:if test="${empty sessionId }">
	  	var frm = document.commonForm;
		frm.action = "<c:url value='/user/lifeEduOnLineList.do'/>";
		frm.submit();
	 </c:if>	
	
 		$('#email_select').change(function(){
 			var val  = $(this).val();
 			if(val =="AUTO"){
 				$('#eml_addr2').prop('readonly', false);
 				$('#eml_addr2').val('');
 			}else{ 				
 				$('#eml_addr2').prop('readonly', true);
 				$('#eml_addr2').val('');s
 			}
		});
 	});
 
    /**  페이지 이동 */
	function goOkPage(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/user/lifeEduOnLineList.do'/>";
		frm.submit();
	}
 
	function fn_course(){	
	 
		$("#gubun2").val('course'); 
		
		// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
		var regexPasswords = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
		var regexPassword = /^[A-Za-z0-9]{6,12}$/;
		//이메일 정규식
		var regexEmail = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
		//핸드폰번호 정규식
		var regexHp = /^\d{3}\d{3,4}\d{4}$/;
		//일반 전화번호 정규식
		var regexHomePhome = /^\d{2,3}-\d{3,4}-\d{4}$/;
				
		var mbl_telno = $("#mbl_telno").val(); 
		var eml_addr1 = $("#eml_addr1").val();
		var eml_addr2 = $("#eml_addr2").val();
		var eml_addr  = eml_addr1 + "@" + eml_addr2;
		var email_select = $("select[name=email_select] option:selected").val();  
		if(email_select !="AUTO"){
			eml_addr  = eml_addr1 + "@" + email_select;	
		}
		
		if(mbl_telno ==""){
			alert('휴대폰 번호를 입력 해주세요!');
			$("#mbl_telno").focus();
			return;	
		}
		if(!regexHp.test(mbl_telno)) {            
			alert("휴대폰 번호 형식이 맞지 않습니다. 다시 입력해주세요.");
			$("#mbl_telno").val("");
			return;		
		}
		
		if(eml_addr1 ==""){
			alert('이메일을 입력 해주세요!');
			$("#eml_addr1").focus();
			return;	
		}
		
		if(!regexEmail.test(eml_addr)) {            
			alert("이메일 형식이 맞지 않습니다. 다시 입력해주세요.");
			$("#eml_addr1").val("");
			$("#eml_addr2").val("");
			return;		
		}		
		
		$("#eml_addr").val(eml_addr);
		 
		var msg = "수강신청 하시겠습니까?";
		var yn = confirm(msg);	
		if(yn){
			
			$.ajax({	
				data     : $("#commonForm").serialize(),
			    url		 : "<c:url value='/user/lifeEduOnLineSave.do'/>",
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
				alert("산청하기가 정상 처리 되었습니다.[마이페이지]에서 확인 및 취소가 가능합니다.");				
				goOkPage();		 
			} else if(result == "EXIST"){				
				alert("이미 수강 신청하셨습니다.");	
				return false;
			} else if(result == "FINISH"){				
				alert("수강 신청이 마감 되었습니다.");	
				return false;					
			}else {				
				alert("등록이 실패 했습니다.");	
				return false;
			}
		}
	}

	function goOkPage(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/user/lifeEduOnLineList.do'/>";
		frm.submit();
	}
     //-->
 </script>
	
		   
		    <!-- container  begin -->
    <div id="container">

        <div class="tit-wrap">
            <h1 class="h1-tit">온라인 생명 지킴이 교육</h1>
            <div class="side-cont">
                <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>생명지킴이교육</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>교육신청</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>온라인 생명 지킴이 교육</span>
            </div>
        </div>

     
           <!---- search-wrap begin ---->
       <form  id="commonForm" name="commonForm"  method="post"  action="">
		<input type="hidden" id="gubun1"     name="gubun1"    value='I'/>
	    <input type="hidden" id="gubun2"     name="gubun2"    value='${categoryVo.gubun2}'  />	
	    <input type="hidden" id="edu_no"     name="edu_no"    value='${categoryVo.edu_no}'/>
	    <input type="hidden" id="edu_site"   name="edu_site"  value='${categoryVo.edu_site}'/>
	    <input type="hidden" id="eml_addr"   name="eml_addr"  />
	    

	    
           <div class="contents-wrap">                        
               <div class="comp">
                   <h4 class="h4-tit">교육정보</h4>
                   <div class="table-wrap">
                       <table class="detail-tb">
                           <caption>교육분류, 교육명, 강사명, 교육기간, 교육방식, 교육대상, 교육상태 정보가 있는 테이블</caption>
                          <colgroup>
                              <col width="20%"/>
                              <col width="*"/>
                          </colgroup>
                          <tbody>
                              <tr>
                                  <th>교육분류</th>
                                  <td>
                                      <span> ${categoryForm.category1_name} > ${categoryForm.category2_name}</span>
                                 </td>
                              </tr>
                              <tr>
                                  <th>교육명</th>
                                  <td>${categoryForm.category3_name}</td>
                              </tr>
                              <tr>
                                  <th>강사명</th>
                                  <td>${categoryForm.inst_nm}</td>
                              </tr>
                              <tr>
                                  <th>교육기간</th>
                                  <td>${categoryForm.train_s_date} ~ ${categoryForm.train_e_date}</td>
                              </tr>
                              <tr>
                                  <th>교육방식</th>
                                  <td>${categoryForm.edu_method}</td>
                              </tr>
                              <tr>
                                  <th>교육대상</th>
                                  <td>${categoryForm.edu_target}</td>
                              </tr>
                              <tr>
                                  <th>교육상태</th>
                                  <td>${categoryForm.edu_status}</td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>

              <div class="comp">
                  <h4 class="h4-tit">신청자 정보</h4>
                  <div class="table-wrap">
                      <table class="detail-tb">
                          <caption>회원유형, 이름, 아이디, 휴대폰, 이메일 정보가 있는 테이블</caption>
                          <colgroup>
                              <col width="20%"/>
                              <col width="*"/>
                          </colgroup>
                          <tbody>
                              <tr>
                                  <th>회원유형</th>
                                  <td>${sessionId.edu_auth_cd_nm}</td>
                              </tr>
                              <tr>
                                  <th>이름</th>
                                  <td>${sessionId.user_nm}</td>
                              </tr>
                              <tr>
                                  <th>아이디</th>
                                  <td>${sessionId.user_id}</td>
                              </tr>
                              <tr>
                                  <th>휴대폰</th>
                                  <td><input type="text" id="mbl_telno" name="mbl_telno" class="input-box lg-width"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="11" value="${fn:replace(sessionId.mbl_telno, '-', '')}" placeholder="- 없이 입력해주세요" value=""/></td>
                              </tr>
                              <tr>
                                  <th>이메일</th>
                                  <td>
                                      <div class="tb-cont">
                                          <input type="text" class="input-box" id="eml_addr1" name="eml_addr1" maxlength="100" <c:if test="${!empty sessionId.eml_addr }"> value="${fn:split(sessionId.eml_addr, '@')[0]}" </c:if> />
                                          <span>@</span>
                                          <input type="text" class="input-box" id="eml_addr2" name="eml_addr2" maxlength="100" value="${fn:split(sessionId.eml_addr, '@')[1]}"/>
                                          <select class="select" id="email_select" name="email_select">
                                              <option value='AUTO'>직접입력</option>
                                              <option value='naver.com'>naver.com</option>
                                              <option value='nate.com'>nate.com</option>
                                              <option value='gmail.com'>gmail.com</option>
                                              <option value='hotmail.com'>hotmail.com</option>
                                              <option value='hanmail.net'>hanmail.net</option>
                                              <option value='paran.com'>paran.com</option>
                                              <option value='dreamwiz.com'>dreamwiz.com</option>
                                              <option value='korea.com'>korea.com</option>
                                          </select>
                                      </div>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
              </form>
              <!---- button begin ---->
              <div class="btn-cont">
                  <button type="button" onClick="fn_course();"; class="lg-btn orange-btn">신청하기</button>
                  <button type="button" onClick="history.back();" class="lg-btn white-btn">목록</button>
              </div>
              <!---- button end ---->
              

          </div>
      </div>
         
  <!--  container end -->												
           