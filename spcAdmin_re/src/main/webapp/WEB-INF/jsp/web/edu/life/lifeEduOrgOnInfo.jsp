
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <script type="text/javaScript" language="javascript" defer="defer">

 
	function fn_course(){
		var frm = document.commonForm;
		<c:if test="${empty sessionId }">
		 alert('해당 교육은 회원 가입 후 사용이 가능합니다.\n회원 가입 후 이용해 주시기 바랍니다.');
		 return;
		</c:if>
		frm.action = "<c:url value='/user/lifeEduOrgOnReg.do'/>";
		frm.submit();
	}
 
 	function fn_basket(){	
		$("#gubun2").val('basket'); 
		<c:if test="${empty sessionId }">
		 alert('해당 교육은 회원 가입 후 사용이 가능합니다.\n회원 가입 후 이용해 주시기 바랍니다.');
		 return;
		</c:if>
		var msg = "장바구니에 담겠습니까?";
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
				alert("장바구니에 담았습니다.");				
				history.back();			 
			} else if(result == "EXIST"){				
				alert("이미 담겼습니다.");	
				return false;
			}else {				
				alert("등록이 실패 했습니다.");	
				return false;
			}
		}
	}

	function goOkPage(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/user/lifeEduOrgOnInfo.do'/>";
		frm.submit();
	}
   
 </script>
	
		   
		    <!-- container  begin -->
    <div id="container">

        <div class="tit-wrap">
            <h1 class="h1-tit">교육 기관별 (ON-LINE)</h1>
            <div class="side-cont">
                <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>생명지킴이교육</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>교육신청</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>교육 기관별 (ON-LINE)</span>
            </div>
        </div>

     
           <!---- search-wrap begin ---->
         <form  id="commonForm" name="commonForm"  method="post"  action="">
		<input type="hidden" id="gubun1"     name="gubun1"    value='I'/>
	    <input type="hidden" id="gubun2"     name="gubun2"    value='${categoryVo.gubun2}'  />	
	    <input type="hidden" id="edu_no"     name="edu_no"    value='${categoryVo.edu_no}'/>
	    <input type="hidden" id="edu_site"   name="edu_site"  value='${categoryVo.edu_site}'/>
		</form>
	    
           <div class="contents-wrap">                        
               <!---- view-wrap begin ---->
                        <div class="view-wrap">
                            <c:if test="${categoryForm.category1_name =='일반'}">
		                   	<span class="badge-normal">일반</span>
		                   </c:if>
		                   <c:if test="${categoryForm.category1_name =='기관'}">
		                   	<span class="badge-org">기관</span>
		                   </c:if>
		                   <c:if test="${categoryForm.category1_name =='강사'}">
		                   	<span class="badge-instruct">강사</span>
		                   </c:if>
		                   <c:if test="${categoryForm.category1_name =='실무자'}">
		                   	<span class="badge-worker">실무자</span>
		                   </c:if>     
                   
                            <span class="tag">${categoryForm.category2_name}</span>
                            <h3 class="h3-tit">${categoryForm.category3_name}</h3>
                            <ul class="summary-cont">
                                <li>
                                    <label>교육대상 :</label>
                                    <span>${categoryForm.edu_target}</span>
                                </li>
                                <li>
                                    <label>교육인원 :</label>
                                    <span>${categoryForm.edu_garden}</span>명
                                </li>
                                <li>
                                    <label>교육기간 :</label>
                                    <span>${categoryForm.train_s_date} </span>~<span>${categoryForm.train_e_date}</span>
                                </li>
                                <li>
                                    <label>학습시간 :</label>
                                    <span>${categoryForm.edu_time}</span>분
                                </li>
                                <li>
                                    <label>강사명 :</label>
                                    <span>${categoryForm.inst_nm}</span>
                                </li>
                            </ul>
                        </div>
                        <!---- view-wrap end ---->

                        <div class="comp">
                            <h4 class="h4-tit">상세내용</h4>
                            
                            <div class="table-wrap">
                                <table class="detail-tb">
                                    <caption>교육소개, 교육목표, 차시 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="20%"/>
                                        <col width="*"/>
                                    </colgroup>
                                    <tbody>                                    	
                                        <tr>
                                            <th>교육소개</th>
                                            <td>${categoryForm.edu_intro}</td>
                                        </tr>
                                        <tr>
                                            <th>교육목표</th>
                                            <td>${categoryForm.edu_goals}</td>
                                        </tr>
                                        <tr>
                                            <th>차시</th>
                                            <td>
                                                <ul class="dot-list">
                                                   <c:forEach var="result" items="${categoryFormSubList}" varStatus="status">
                                                    <li>${result.edu_curr1} - ${result.edu_curr2} – ${result.edu_curr3}분</li>
                                                   </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>

                        </div>

                        <!---- button begin ---->
                        <div class="btn-cont">
                            <button type="button" onClick="fn_course();"    class="lg-btn orange-btn">수강신청</button>
                            <button type="button" onClick="fn_basket();"    class="lg-btn navy-btn">장바구니</button>
                            <button type="button" onClick="history.back();" class="lg-btn white-btn">목록</button>
                        </div>
                        <!---- button end ---->

                    </div>
                </div>
                <!--  container end -->											
           