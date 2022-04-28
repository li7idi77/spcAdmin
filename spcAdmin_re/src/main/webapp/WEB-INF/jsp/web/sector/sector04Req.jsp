
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <script type="text/javaScript" language="javascript" defer="defer">
 $(document).ready(function(){		
	 	
 });
 function fn_save(){
	   if ($("#mbl_telno").val() == ""){			
			alert("휴대폰을 입력하세요.");
			$("#mbl_telno").focus();
			return;
		}
	   if ($("#eml_addr1").val() == ""){			
			alert("이메일을 입력하세요.");
			$("#eml_addr1").focus();
			return;
		}	
	   if ($("#eml_addr2").val() == ""){			
			alert("이메일을 입력하세요.");
			$("#eml_addr2").focus();
			return;
		}	

		var formData = new FormData(); 
		formData.append("mbl_telno",   $("#mbl_telno").val());
		formData.append("eml_addr1",   $("#eml_addr1").val());
		formData.append("eml_addr2",   $("#eml_addr2").val());
		formData.append("gubun",   	   "R");
		formData.append("edu_no",   $("#edu_no").val());
		
			
		if(confirm("교육 신청을 하시겠습니까?")){
				
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/user/sectorSave.do'/>",
			    dataType   : "JSON",
		        processData: false, 
		        contentType: false,
				type	   : "POST",	
		        success    : function(obj) {
		        	commonCallBack(obj);				
		        },	       
		        error 	: function(xhr, status, error) {} 		        
		    });
		}
 }	
 
 function email_chg(){
	 $("#eml_addr2").val("");
	 if($("#eml_sel").val() != ""){
		 $("#eml_addr2").val($("#eml_sel").val());
	 }
 }
 
 function commonCallBack(obj){
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("성공하였습니다.");				
				fn_goList();				 
			}else {				
				alert("등록이 실패 했습니다.");	
				return false;
			}
		}
	}	
 
 	function fn_goList(){
		document.location = "<c:url value='/user/sectorList.do'/>"+"?edu_no="+$('#edu_no').val()+"&idx="+$('#idx').val();
	 }	
</script>

<!-- container  begin -->
                <div id="container">

                    <div class="tit-wrap">
                        <h1 class="h1-tit">교육신청</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>분야별 교육신청</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>광역주도형 심리부검면담원 양성교육</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>교육신청</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
                        <input type="hidden" id="edu_no" name="edu_no" value="${edu_no}">
                        <input type="hidden" id="idx" name="idx" value="${idx}">
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
                                                <span>${result.CATEGORY1}</span>
                                                <span>${result.CATEGORY2}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>교육명</th>
                                            <td>${result.CATEGORY3}</td>
                                        </tr>
                                        <tr>
                                            <th>강사명</th>
                                            <td>${result.INST_NM}</td>
                                        </tr>
                                        <tr>
                                            <th>교육기간</th>
                                            <td>${result.TRAIN_S_DATE} ~ ${result.TRAIN_E_DATE}</td>
                                        </tr>
                                        <tr>
                                            <th>교육방식</th>
                                            <td>${result.EDU_METHOD}</td>
                                        </tr>
                                        <tr>
                                            <th>교육대상</th>
                                            <td>${result.EDU_TARGET}</td>
                                        </tr>
                                        <tr>
                                            <th>교육상태</th>
                                            <td>${result.EDU_STATUS}</td>
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
                                            <td>
	                                            <c:if test="${UserAccount.user_gu == '1'}">개인</c:if>
	                                            <c:if test="${UserAccount.user_gu == '2'}">기업</c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>이름</th>
                                            <td>${UserAccount.user_nm}</td>
                                        </tr>
                                        <tr>
                                            <th>아이디</th>
                                            <td>${UserAccount.user_id}</td>
                                        </tr>
                                        <tr>
                                            <th>휴대폰</th>
                                            <td><input type="text" id="mbl_telno" name="mbl_telno" class="input-box lg-width" placeholder="- 없이 입력해주세요" value=""/></td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td>
                                                <div class="tb-cont">
                                                    <input type="text" id="eml_addr1" name="eml_addr1" class="input-box" value=""/>
                                                    <span>@</span>
                                                    <input type="text" id="eml_addr2" name="eml_addr2" class="input-box" value=""/>
                                                    <select class="select" id="eml_sel" name="eml_sel" onchange="email_chg();">
                                                        <option value="">직접입력</option>
                                                        <option value="naver.com">naver.com</option>
                                                        <option value="gmail.com">gmail.com</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <!---- button begin ---->
                        <div class="btn-cont">
                            <button class="lg-btn orange-btn" onClick="fn_save();">신청하기</button>
                            <button class="lg-btn white-btn">목록</button>
                        </div>
                        <!---- button end ---->
                        

                    </div>
                </div>
                <!--  container end -->