<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

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
 
	function fn_egov_link_page(pageNo){
		 var frm = document.commonForm;
		 $("#pageIndex").val(pageNo); 
	 	 frm.action = "<c:url value='/inst/instructorAdm02List.do'/>";
	   	 frm.submit();
	 }
</script>
<h1 class="h1-tit">강사 자격 정보</h1>

<div class="search-wrap">
    <div class="search-cont  search-sub full-width">
        <h1 class="h1-tit">강사 활동 현황</h1>

                <div class="search-wrap">
                <form id="commonForm" name="commonForm" target="_self" action="" method="post" onsubmit="">
        		<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
                    <div class="search-cont  search-sub full-width">
                        <h3 class="h3-tit">교육구분</h3>
						
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="category_type" name="category_type" value="ALL" <c:if test="${category_type == 'ALL' || (empty category_type)}">checked </c:if>>
                            <label for="">전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="category_type" name="category_type" value="CHECK" <c:if test="${category_type == 'CHECK'}">checked </c:if>>
                            <select class="select" id="category1_key" name="category1_key">
                                <option value='7' >기관</option>
                            </select>
                            <select class="select" id="category2_key" name="category2_key">
                                <option value="">선택 하세요</option>
                                <c:forEach var="result" items="${category2list}" varStatus="status">
									<option value='${result.CATEGORY2_KEY}' >${result.CATEGORY2_NAME}</option>
								</c:forEach>
                            </select>
                            <select class="select" id="category3_key" name="category3_key">
                                <option value='' >선택 하세요</option>
								<c:forEach var="result" items="${category3list}" varStatus="status">
									<option value='${result.CATEGORY3_KEY}' >${result.CATEGORY3_NAME}</option>
								</c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="search-cont search-sub">
                        <h3 class="h3-tit">기관명</h3>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="org_type" name="org_type" value="ALL" <c:if test="${org_type == 'ALL' || (empty org_type)}">checked </c:if>>
                            <label for="">전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="org_type" name="org_type" value="CHECK" <c:if test="${org_type == 'CHECK'}">checked </c:if>>
                            <input type="text" id="org_nm" name="org_nm" class="input-box" placeholder="직접입력" value="${org_nm}"/>
                        </div>
                    </div>

                    <div class="search-cont search-sub">
                        <h3 class="h3-tit">지역</h3>

                        <div class="radio-cont">
                            <input type="text" id="area_nm" name="area_nm" class="input-box" placeholder="직접입력" value="${area_nm}"/>
                        </div>
                    </div>

                    <div class="search-cont search-sub">
                        <h3 class="h3-tit">강사명</h3>
                        
                        <div class="radio-cont">
                            <input type="text" id="ins_nm" name="ins_nm" class="input-box" placeholder="직접입력" value="${ins_nm}"/>
                        </div>
                    </div>

                    <div class="search-cont search-sub">
                        <h3 class="h3-tit">강사상태</h3>
                        
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="stat_type" name="stat_type" value="ALL" <c:if test="${stat_type == 'ALL' || (empty stat_type)}">checked </c:if>>
                            <label for="">전체</label>
                        </div>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="stat_type" name="stat_type" value="1" <c:if test="${stat_type == '1'}">checked </c:if>>
                            <label for="">활동</label>
                        </div>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="stat_type" name="stat_type" value="2" <c:if test="${stat_type == '2'}">checked </c:if>>
                            <label for="">상실(일반)</label>
                        </div>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="stat_type" name="stat_type" value="3" <c:if test="${stat_type == '3'}">checked </c:if>>
                            <label for="">휴직</label>
                        </div>
                    </div>

                    <div class="search-cont search-sub full-width">
                        <h3 class="h3-tit">강사분류</h3>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="ALL" <c:if test="${ins_type == 'ALL' || (empty ins_type)}">checked </c:if>>
                            <label for="">전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="1" <c:if test="${ins_type == '1'}">checked </c:if>>
                            <label for="">일반강사</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="2" <c:if test="${ins_type == '2'}">checked </c:if>>
                            <label for="">실무자</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="3" <c:if test="${ins_type == '3'}">checked </c:if>>
                            <label for="">공공기간(학교, 군, 경찰, 도시철도 등)</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="4" <c:if test="${ins_type == '4'}">checked </c:if>>
                            <label for="">기업(삼성,현대. sk 등)</label>
                        </div>
                    </div>

                    <div class="search-cont">
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="ALL" <c:if test="${searchDate == 'ALL' || (empty searchDate)}">checked </c:if>>
                            <label for="dateAll">전체</label>
                        </div>
                          
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="TODAY" <c:if test="${searchDate == 'TODAY'}">checked </c:if>>
                            <label for="dateToday">오늘</label>
                        </div>
                        
                        <div class="radio-cont mr10">
                            <input type="radio" class="radio-box" id="searchDate" name="searchDate" value="CHECK" <c:if test="${searchDate == 'CHECK'}">checked </c:if>>
                            <label for="dateTerm">기간선택</label>
                        </div>
                        <div class="picker-wrap">
                            <input type="text" id="start_date" name="start_date" class="input-box" readonly value="${start_date}"/>
                            <span class="next-ico">-</span>
                            <input type="text" id="end_date" name="end_date" class="input-box" readonly value="${end_date}"/>
                        </div>
                        
                        <button class="search-btn">검색</button>
                        <button class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
                    </div>
					</form>
                </div>
                
                <div class="btn-cont mb20">
                    <!-- <dl class="count-txt">
                        <dt>전체 <span>180</span></dt>
                        <dt class="green-txt">활동<span>115</span></dt>
                        <dt class="gray-txt">상실(일반) <span>10</span></dt>
                        <dt class="purple-txt">휴직 <span>15</span></dt>
                    </dl> -->

                    <button class="mid-btn black-btn">엑셀다운</button>
                    <!-- <button class="mid-btn white-btn">선택삭제</button> -->
                </div>
                
                <div class="table-wrap scroll-wrap">
                    <table class="list-tb">
                        <caption>선택, 상태, 강사명, 강사분류, 성별, 이메일, 연락처, 기관명, 분류1, 분류2, 분류3, 교육대상, 교육인원, 교육일시, 지역, 교육장소, 수정 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="3%"/>
                            <col width="5%"/>
                            <col width="7%"/>
                            <col width="5%"/>
                            <col width="4%"/>
                            <col width="*"/>
                            <col width="7%"/>
                            <col width="7%"/>
                            <col width="7%"/>
                            <col width="7%"/>
                            <col width="7%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="6%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <%-- <col width="5%"/> --%>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>상태</th>   
                                <th>강사(ID)</th>
                                <th>강사분류</th>
                                <th>성별</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>기관명</th>
                                <th>분류1</th>
                                <th>분류2</th>
                                <th>분류3</th>
                                <th>교육대상</th>
                                <th>교육인원</th>
                                <th>교육일시</th>
                                <th>지역</th>
                                <th>교육장소</th>
                                <!-- <th>수정</th> -->
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="result" items="${resultList}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${result.STATUS}</td>
                                <td><span class="block">${result.USER_NM}</span><span  class="block">${result.USER_ID}</span></td>
                                <td>${result.CLASS}</td>
                                <td>${result.USER_SEX}</td>
                                <td>${result.EML_ADDR}</td>
                                <td>${result.MBL_TELNO}</td>
                                <td>${result.EDU_ORG_NAME}</td>
                                <td class="tl">${result.CATEGORY1_NAME}</td>
                                <td class="tl">${result.CATEGORY2_NAME}</td>
                                <td class="tl">${result.CATEGORY3_NAME}</td>
                                <td>${result.EDU_TARGET}</td>
                                <td>${result.EDU_NUMBER}</td>
                                <td>${result.EDU_START_DATE}</td>
                                <td>${result.AREA_NM}</td>
                                <td>${result.EDU_PLACE}</td>
                                <!-- <td><button class="sm-btn blue-btn">수정</button></td> -->
                            </tr>
                            </c:forEach>
                            <c:if test="${empty resultList }">
					             <tr>
					                 <td colspan='16'/>Data 없습니다.</td>
					             </tr>
					        </c:if>
                        </tbody>
                    </table>
                </div>
                      <div class="page-wrap">
						     <ul class="paging">
						         <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
						     </ul>
						</div>
