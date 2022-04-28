
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
  
 function fn_basket(edu_no){
	 var formData = new FormData(); 
		formData.append("gubun",   	   "B");
		formData.append("edu_no",   $("#edu_no").val());
			
		if(confirm("장바구니에 등록 하시겠습니까?")){
				
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/user/sectorSave.do'/>",
			    dataType   : "JSON",
		        processData: false, 
		        contentType: false,
				type	   : "POST",	
		        success    : function(obj) {
		        	var result = obj.result;
					
					if(result == "SUCCESS"){				
						alert("장바구니에 등록 되었습니다.");		 
					}else {				
						alert("장바구니 등록이 실패 했습니다.");	
						return false;
					}
		        },	       
		        error 	: function(xhr, status, error) {} 		        
		    });
		}
 }	
	
 function fn_regist(edu_no){
	document.location = "<c:url value='/user/sectorReq.do'/>"+"?edu_no="+$('#edu_no').val()+"&idx="+$('#idx').val();
 }	
 
 function fn_goList(edu_no){
	document.location = "<c:url value='/user/sectorList.do'/>"+"?edu_no="+$('#edu_no').val()+"&idx="+$('#idx').val();
 }	
</script>

     <!-- container  begin -->
                <div id="container">
					<input type="hidden" id="edu_no" name="edu_no" value="${edu_no}">
					<input type="hidden" id="idx" name="idx" value="${idx}">
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

                        <!---- view-wrap begin ---->
                        <div class="view-wrap">
                            <span class="badge-normal">${result.CATEGORY1}</span>
                            <span class="tag">${result.CATEGORY2}</span>
                            <h3 class="h3-tit">${result.CATEGORY3}</h3>
                            <ul class="summary-cont">
                                <li>
                                    <label>교육내용 :</label>
                                    <span>${result.EDU_CONT}</span>
                                </li>
                                <li>
                                    <label>교육기간 :</label>
                                    <span>${result.TRAIN_S_DATE}</span>~<span>${result.TRAIN_E_DATE}</span>
                                </li>
                                <li>
                                    <label>교육방식 :</label>
                                    <span>${result.EDU_METHOD}</span>
                                </li>
                                <li>
                                    <label>학습시간 :</label>
                                    <span>${result.EDU_TIME}</span>분
                                </li>
                                <li>
                                    <label>강사명 :</label>
                                    <span>${result.INST_NM}</span>
                                </li>
                                <li>
                                    <label>안내문 :</label>
                                    <a class="link">다운로드(${result.EDU_NOTICE})</a>
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
                                            <td>${result.EDU_INTRO}</td>
                                        </tr>
                                        <tr>
                                            <th>교육목표</th>
                                            <td>${result.EDU_GOALS}</td>
                                        </tr>
                                        <tr>
                                            <th>차시</th>
                                            <td>
                                                <ul class="dot-list">
                                                	<c:if test="${result.EDU_CURR1 != ''}">
                                                		<li>${result.EDU_CURR1}</li>
                                                	</c:if>
                                                    <c:if test="${result.EDU_CURR2 != ''}">
                                                		<li>${result.EDU_CURR2}</li>
                                                	</c:if>
                                                	<c:if test="${result.EDU_CURR3 != ''}">
                                                		<li>${result.EDU_CURR3}</li>
                                                	</c:if>
                                                </ul>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                        <!---- button begin ---->
                        <div class="btn-cont">
                            <button class="lg-btn orange-btn" onClick="fn_regist();">수강신청</button>
                            <button class="lg-btn navy-btn" onClick="fn_basket();">장바구니</button>
                            <button class="lg-btn white-btn" onClick="fn_goList();">목록</button>
                        </div>
                        <!---- button end ---->

                    </div>
                </div>
                <!--  container end -->