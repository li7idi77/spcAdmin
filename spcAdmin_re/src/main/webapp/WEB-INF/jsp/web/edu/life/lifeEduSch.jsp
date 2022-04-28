
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
 <!--
 	$(document).ready(function(){
 		 $("#train_e_date, #train_s_date").datepicker({
			  	dateFormat: 'yy-mm-dd' //달력 날짜 형태
		       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	           ,changeYear: true //option값 년 선택 가능
	           ,changeMonth: true //option값  월 선택 가능                
	           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	           ,buttonImage: "<c:url value='/images/common/ico_calendar.png'/>" //버튼 이미지 경로
	           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
	           ,buttonText: "선택" //버튼 호버 텍스트              
	           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
        });
 		 
 		$("#category3_name").keypress(function(e) {
 	        if ('13' == e.keyCode) {
 	        	fn_search();
 	            return false;
 	        }
 	    });
 		 
 		$('.cdate').bind('click', function(){
 			var checkdate = $("input[name='checkdate']:checked").val();
 			if(checkdate !="TERM"){
 				$("#train_s_date").val(''); 
 				$("#train_e_date").val('');
 			}
 			if(checkdate =="ALL"){
 				$("#category3_name").val(''); 
 			}
     	});
 		
 		
 	 });
 
	 function fn_search(){
		 var frm = document.commonForm;

		    
		 frm.action = "<c:url value='/user/lifeEduSch.do'/>";
		 frm.submit();
	}
     
     /* pagination 페이지 링크 function */
     function fn_egov_link_page(pageNo){
    	 var frm = document.commonForm;
    	 $("#pageIndex").val(pageNo); 
    	 $("#pageIndex").val(pageNo); 
     	 frm.action = "<c:url value='/edu/eduInfoNoOrglineList.do'/>";
       	 frm.submit();
      }
     

     //-->
 </script>

        <form  id="commonForm" name="commonForm"  method="post"  action="">
		    <input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />	

		    
		  <!-- container  begin -->
                <div id="container">

                    <div class="tit-wrap">
                        <h1 class="h1-tit">교육일정</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>생명지킴이교육</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>교육일정</span>
                        </div>
                    </div>

                    <div class="contents-wrap">

                        <!---- search-wrap begin ---->
                        <div class="search-wrap">
                            <div class="search-cont">
                                <label>교육일 :</label>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="ALL"   <c:if test="${categoryVo.checkdate =='ALL'  }">checked </c:if>  >
                                    <label for="dateAll">전체</label>
                                </div>
                                  
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TODAY"  <c:if test="${categoryVo.checkdate =='TODAY'}">checked </c:if>  >
                                    <label for="dateToday">오늘</label>
                                </div>
                                
                                <div class="radio-cont mr10">
                                    <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TERM" <c:if test="${categoryVo.checkdate =='TERM'}">checked </c:if>  >
                                    <label for="dateTerm">기간선택</label>
                                </div>
                                <div class="picker-wrap">
                                    <input type="text"  id="train_s_date" name="train_s_date" readonly value="${categoryVo.train_s_date}" class="input-box"/>
                                    <span class="next-ico">-</span>
                                    <input type="text"  id="train_e_date" name="train_e_date" readonly value="${categoryVo.train_e_date}" class="input-box"/>
                                </div>
                            </div>
                            <div class="search-cont">
                                <label>교육명 :</label>
                                <input type="text"  id="category3_name" name="category3_name"  value="${categoryVo.category3_name}" class="input-box lg-width" placeholder="직접입력"/>
                            </div>

                            <div class="btn-cont">
                                <button type="button" onClick="fn_search()" class="lg-btn orange-btn">검색</button>
                                <button type="reset" class="lg-btn navy-btn">초기화</button>
                            </div>
                        </div>
                        </form>
                        <!---- search-wrap end ---->


                        <div class="comp">
                            <div class="table-wrap">
                                <table class="list-tb">
                                    <caption>교육일시, 분류1, 분류2, 분류3, 기관명, 교육대상, 교육인원, 교육인원, 강사명 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="5%"/>
                                        <col width="12%"/>
                                        <col width="8%"/>
                                        <col width="10%"/>
                                        <col width="*"/>
                                        <col width="13%"/>
                                        <col width="9%"/>
                                        <col width="9%"/>
                                        <col width="10%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>교육일시</th>
                                            <th>분류1</th>
                                            <th>분류2</th>
                                            <th>분류3</th>
                                            <th>기관명</th>
                                            <th>교육대상</th>
                                            <th>교육인원</th>
                                            <th>강사명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   	 <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td><c:out value="${(adBoardVo.pageIndex-1) * adBoardVo.pageSize + (status.count)}"/></td>
                                            <td>${result.train_s_date}</td>
                                            <td>${result.category1_name}</td>
                                            <td class="tl">${result.category2_name}</td>
                                            <td class="tl">${result.category3_name}</td>
                                            <td>${result.coper_nm}</td>
                                            <td>${result.edu_target}</td>
                                            <td>${result.edu_garden}명</td>
                                            <td>${result.inst_nm}</td>
                                        </tr>
                                      </c:forEach>
			                          <c:if test="${empty resultList }">
							             <tr>
							                 <td colspan='8'/>Data 없습니다.</td>
							             </tr>
							          </c:if>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                        <!---- page begin ---->
                       <div class="page-wrap">
				        	 <ul class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				 			 </ul>
				       </div>
	                    <!---- page end ---->

                    </div>
                </div>
                <!--  container end -->

           