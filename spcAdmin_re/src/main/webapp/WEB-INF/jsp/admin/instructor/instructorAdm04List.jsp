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

                <div class="search-wrap">
                	<h1 class="h1-tit">강사 휴직 신청</h1>
                	<form id="commonForm" name="commonForm" target="_self" action="" method="post" onsubmit="">
                    <input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
                    <div class="search-cont search-sub">
                        <h3 class="h3-tit">연장사유</h3>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="reason" name="reason" value="ALL" <c:if test="${reason == 'ALL' || (empty reason)}">checked </c:if>>
                            <label for="">전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="reason" name="reason" value="1" <c:if test="${reason == '1'}">checked </c:if>>
                            <label for="">출산 및 육아</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="reason" name="reason" value="2" <c:if test="${reason == '2'}">checked </c:if>>
                            <label for="">병가</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="reason" name="reason" value="3" <c:if test="${reason == '3'}">checked </c:if>>
                            <label for="">해외연수</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="reason" name="reason" value="4" <c:if test="${reason == '4'}">checked </c:if>>
                            <label for="">기타</label>
                        </div>
                    </div>

                    <div class="search-cont search-sub">
                        <h3 class="h3-tit">강사명</h3>

                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="ALL" <c:if test="${ins_type == 'ALL' || (empty ins_type)}">checked </c:if>>
                            <label for="">전체</label>
                        </div>
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="SEL" <c:if test="${ins_type == 'SEL'}">checked </c:if>>
                            <input type="text" class="input-box" id="ins_nm" name="ins_nm" placeholder="직접입력" value="${ins_nm}"/>
                        </div>
                    </div>

                    <div class="search-cont search-sub mr0">
                        <h3 class="h3-tit">지역</h3>

                        <div class="radio-cont">
                            <input type="text" id="area_nm" name="area_nm" class="input-box" placeholder="직접입력" value="${area_nm}"/>
                        </div>
                    </div>

                    <div class="search-cont">
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="dateAll" name="searchDate" value="ALL" <c:if test="${searchDate == 'ALL' || (empty searchDate)}">checked </c:if>>
                            <label for="dateAll">전체</label>
                        </div>
                          
                        <div class="radio-cont">
                            <input type="radio" class="radio-box" id="dateToday" name="searchDate" value="TODAY" <c:if test="${searchDate == 'TODAY'}">checked </c:if>>
                            <label for="dateToday">오늘</label>
                        </div>
                        
                        <div class="radio-cont mr10">
                            <input type="radio" class="radio-box" id="dateTerm" name="searchDate" value="CHECK" <c:if test="${searchDate == 'CHECK'}">checked </c:if>>
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
                    <button class="mid-btn black-btn">엑셀다운</button>
                    <button class="mid-btn white-btn">선택삭제</button>강사 삭제가 맞지 않음
                </div>
                
                <div class="table-wrap scroll-wrap">
                    <table class="list-tb">
                        <caption>선택, 강사명, 지역, 수료증번호, 소속기관, 연장사유, 주소, 연락처, 이메일, 신청서 다운로드, 상태, 수정 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="3%"/>
                            <col width="4%"/>
                            <col width="6%"/>
                            <col width="6%"/>
                            <col width="8%"/>
                            <col width="8%"/>
                            <col width="10%"/>
                            <col width="*"/>
                            <col width="8%"/>
                            <col width="12%"/>
                            <col width="8%"/>
                            <col width="6%"/> 
                            <col width="6%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="check-box"/></th>
                                <th>No.</th>
                                <th>강사명(ID)</th>
                                <th>지역</th>
                                <th>수료증번호</th>
                                <th>소속기관</th>
                                <th>연장사유</th>
                                <th>주소</th>
                                <th>연락처</th>
                                <th>이메일</th>
                                <th>신청서<br/>다운로드</th>
                                <th>상태</th>
                                <th>수정</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="result" items="${resultList}" varStatus="status">
                            <tr>
                                <td><input type="checkbox" class="check-box"/></td>
                                <td>${status.index + 1}</td>
                                <td><span class="block">${result.USER_NM}</span><span  class="block">${result.USER_ID}</span></td>
                                <td>${result.AREA_NM}</td>
                                <td>${result.LICENSE_NUMBER}</td>
                                <td>${result.INSTRUCTOR_COPER_NM}</td>
                                <td>${result.REASON}</td>
                                <td class="tl">${result.JUSO}</td>
                                <td>${result.MBL_TELNO}</td>
                                <td>${result.EML_ADDR}</td>
                                <td><a class="link">${result.FILE_NAME}</a></td>
                                <td>${result.INS_STATUS}</td>
                                <td><c:if test="${result.INS_STATUS == '미승인'}">
                                		<button type="button" class="sm-btn blue-btn" onClick="javascript:fn_edit('${result.INSTRUCTOR_LEAVE_IDX}');">승인</button>
                                	</c:if> 
                                </td>
                            </tr>
                           	</c:forEach>
                           	<c:if test="${empty resultList }">
				             <tr>
				                 <td colspan='13'/>Data 없습니다.</td>
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
<script type="text/javascript">
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
});

function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
	 frm.action = "<c:url value='/inst/instructorAdm04List.do'/>";
  	 frm.submit();
} 
 
function fn_edit(idx) {
	var formData = new FormData($('#commonForm')[0]);

	var msg = "휴직 신청을 승인 하시겠습니까?";
		
		var yn = confirm(msg);	
		if(yn){
			$.ajax({	
				data     : formData,
			    url		 : "<c:url value='/inst/instructorAdm04App.do'/>?idx="+idx,
		        dataType : "JSON",
				type	 : "POST",
				processData: false, 
		        contentType: false,
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
			alert("성공하였습니다.");				
			fn_goList();				 
		}else {				
			alert("등록이 실패 했습니다.");	
			return false;
		}
	}
}	

function fn_goList(){
	document.location = "<c:url value='/inst/instructorAdm04List.do'/>";
 }	

</script>