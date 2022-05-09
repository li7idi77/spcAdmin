
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
	 $("#start_date, #end_date").datepicker({
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
	 
	 $('#category1_key').change(function(){
			var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category2_key").val("");
					
			 $.ajax({	
			    url     : "<c:url value='/user/category2list.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY2_KEY+'">'+ret.CATEGORY2_NAME+'</option>';		
				});
				$('select[name=category2_key]').html(option);						
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		 });
	 
	 $('#category2_key').change(function(){
			var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category3_key").val("");
					
			 $.ajax({	
			    url     : "<c:url value='/user/category3list.do'/>",
			    data    : $("#commonForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY3_KEY+'">'+ret.CATEGORY3_NAME+'</option>';		
				});
				$('select[name=category3_key]').html(option);						
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		 });
 });
 
 function fn_clear(){
	 $("[type='text']").val("");
 }
 
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
 	 frm.action = "<c:url value='/user/instructor04lecture.do'/>";
   	 frm.submit();
 }
 
</script>
     <!-- container  begin -->
                <div id="container">
                    <div class="tit-wrap">
                        <h1 class="h1-tit">강의내역</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>생명지킴이 강사 공간</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>자격관리</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>강의내역</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
						<form  id="commonForm" name="commonForm"  method="post"  action="">
		    			<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
		    			<input type="hidden" id="user_id"  name="user_id" value="${UserAccount.user_id}" />
                        <!---- search-wrap begin ---->
                        <div class="search-wrap">
                            <div class="search-cont">
                                <label>기간 :</label>
                                <div class="picker-wrap">
                                    <input type="text" id="start_date" name="start_date" class="input-box" readonly value="${start_date}"/>
						            <span class="next-ico">-</span>
						            <input type="text" id="end_date" name="end_date" class="input-box" readonly value="${end_date}"/>
                                </div>
                            </div>
                            <div class="search-cont">
                                <label>분류 :</label>
                                <select class="select"  id="category1_key" name="category1_key">
					            	<option value='' >선택 하세요</option>
									<c:forEach var="result" items="${category1list}" varStatus="status">
										<option value='${result.CATEGORY1_KEY}' >${result.CATEGORY1_NAME}</option>
									</c:forEach>
					            </select>
                                <select class="select"  id="category2_key" name="category2_key">
					            	<option value='' >선택 하세요</option>
									<c:forEach var="result" items="${category2list}" varStatus="status">
										<option value='${result.CATEGORY2_KEY}' >${result.CATEGORY2_NAME}</option>
									</c:forEach>
					            </select>
					            <select class="select lg-width"  id="category3_key" name="category3_key">
					            	<option value='' >선택 하세요</option>
									<c:forEach var="result" items="${category3list}" varStatus="status">
										<option value='${result.CATEGORY3_KEY}' >${result.CATEGORY3_NAME}</option>
									</c:forEach>
					            </select>
                            </div>

                            <div class="search-cont">
                                <label>지역 :</label>
                                <div class="radio-cont">
                                    <select class="select" id="area_nm" name="area_nm">
	                                    <option value="">지역선택</option>
				                        <c:forEach var="code" items="${codeList}" varStatus="status">
											<option value='${code.CD}' <c:if test="${area_nm == code.CD}">selected</c:if>>${code.CD_NM}</option>
										</c:forEach>
	                                </select>
                                </div>

                                <label>기관명 :</label>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="orgAll" name="orgSearch" value="ALL" <c:if test="${orgSearch == 'ALL'}">checked </c:if>>
                                    <label for="">전체</label>
                                </div>
                                <div class="radio-cont">
                                    <input type="radio" class="radio-box" id="orgText" name="orgSearch" value="TEXT" <c:if test="${orgSearch == 'TEXT'}">checked </c:if>>
                                    <input type="text" class="input-box" id="edu_org_name" name="edu_org_name" value="${edu_org_name}" placeholder="직접입력"/>
                                </div>
                            </div>

                            <div class="btn-cont mb20">
                                <button class="lg-btn orange-btn">검색</button>
                                <button class="lg-btn navy-btn">초기화</button>
                            </div>
                        </div>
                        </form>
                        <!---- search-wrap end ---->

                        <!---- summary-wrap begin ---->
                        <div class="summary-wrap">
                            <ul class="summary-cont">
                                <li>
                                    <label>당해년도 강의횟수 :</label>
                                    <span>${allCount.CNT}</span>
                                </li>
                                <li>
                                    <label>총 누적 강의 횟수 :</label>
                                    <span>${allCount.CNT}</span>
                                </li>
                            </ul>
                        </div>
                        <!---- summary-wrap end ---->

                        <div class="comp mt20">
                            <div class="table-wrap">
                                <table class="list-tb">
                                    <caption>교육일시, 지역, 교육장소, 기관명, 교육명, 교육대상, 교육인원, 신청하기 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="8%"/>
                                        <col width="15%"/>
                                        <col width="10%"/>
                                        <col width="13%"/>
                                        <col width="13%"/>
                                        <col width="*"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>교육일시</th>
                                            <th>지역</th>
                                            <th>교육장소</th>
                                            <th>기관명</th>
                                            <th>교육명</th>
                                            <th>교육대상</th>
                                            <th>교육인원</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>
                                                <span class="block">${result.EDU_DATE}</span>
                                                <span class="block">${result.EDU_DATETIME}</span>
                                            </td>
                                            <td>${result.AREA_NM}</td>
                                            <td>${result.EDU_PLACE}</td>
                                            <td>${result.EDU_ORG_NAME}</td>
                                            <td class="tl">${result.EDU_NAME}</td>
                                            <td>${result.EDU_TARGET}</td>
                                            <td><span>${result.EDU_NUMBER}</span>명</td>
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