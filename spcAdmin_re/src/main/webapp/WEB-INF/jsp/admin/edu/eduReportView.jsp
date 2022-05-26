
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
	 
	 $('#checkAll').click(function(){
		    var isChecked = this.checked;
			$('input:checkbox[name="checkNo"]').each(function() {
 			this.checked = isChecked;
 	    });
 	 });
	 
 });
 
 function fn_delete(idx) {
		var idxArray = new Array();

		idxArray.push(idx);
		if(confirm('삭제 하시겠습니까?')) {
			setDel(idxArray);
		}
	}

	var btnDel = function() {
		var idxArray = new Array();

		$("input[name=checkNo]:checked").each(function() {
			idxArray.push($(this).val());
		});
		if(idxArray.length < 1){
			alert("선택한 내역이 없습니다.");
			return false;
		}
		if(confirm('삭제 하시겠습니까?')) {
			setDel(idxArray);
		}
	};

	var setDel = function(idxArray){
	    $.ajax({
	        url: "<c:url value='/user/courUserDel.do'/>",
	        type: "POST",
	        data: { "userArr" : idxArray },
	        success: function(data) {
	        	if(data == 'SUCCESS'){
	        		alert("처리 완료하였습니다.");
	        		location.reload();
	        	}
	        },
	        error: function(data) {
	        	console.log(JSON.stringify(data));
	        	alert("처리중 오류가 발생했습니다.");
	        }
	    });
	};
 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />
			
         	<h1 class="h1-tit">교육 결과 보고</h1>

            <div class="table-wrap">

                    <table class="detail-tb">
                        <caption>기관명, 기관주소, 신청자명, 휴대폰, 이메일, 강사명, 교육일시, 교육명, 교육대상, 교육인원, 교육장소, 비고 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="9%"/>
                            <col width="15%"/>
                            <col width="9%"/>
                            <col width="15%"/>
                            <col width="9%"/>
                            <col width="15%"/>
                            <col width="9%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>기관명</th>
                                <td>${result.EDU_ORG_NAME}</td>
                                <th>기관주소</th>
                                <td>${result.COPER_ADDR}</td>
                                <th>신청자명</th>
                                <td>${result.USER_NM}</td>
                                <th>휴대폰</th>
                                <td>${result.USER_TELNO}</td>
                            </tr>
                            <tr>
                                
                                <th>이메일</th>
                                <td>${result.USER_EML}</td>
                                <th>강사명</th>
                                <td>${result.EDU_TEAC_NAME}</td>
                                <th>교육일시</th>
                                <td>${result.EDU_START_DATE}</td>
                                <th>교육명</th>
                                <td>${result.EDU_NAME}</td>
                            </tr>
                            <tr>
                                <th>교육대상</th>
                                <td>${result.EDU_TARGET}</td>
                                <th>교육인원</th>
                                <td><span>${result.EDU_NUMBER2}</span>/<span>${result.EDU_NUMBER}</span></td>
                                <th>교육장소</th>
                                <td>${result.EDU_PLACE}</td>
                                <th>비고</th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="sub-cont mt40">
                    <h2 class="h2-tit">생명지킴이 교육생 참석 여부</h2>
                    
                    <div class="btn-cont">
                        <button class="mid-btn white-btn" onClick="btnDel();">선택삭제</button>
                    </div>
                </div>

                <div class="table-wrap">
                    

                    <table class="list-tb">
                        <caption>회원유형, 이름, 아이디, 휴대폰, 이메일 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="4%"/>
                            <col width="6%"/>
                            <col width="8%"/>
                            <col width="7%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="18%"/>
                            <col width="12%"/>
                            <col width="*"/>
                            <col width="7%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" name='checkAll' class="check-box"/></th>
                                <th>No.</th>
                                <th>이름</th>
                                <th>성별</th>
                                <th>직업</th>
                                <th>생년원일</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>주소</th>
                                <th>참석여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="result" items="${resultList}" varStatus="status">
                            <tr>
                                <td><input type="checkbox" class="check-box" id='checkNo' name='checkNo' value="${result.USER_ID}"/></td>
                                <td>${status.index + 1}</td>
                                <td>${result.USER_NM}</td>
                                <td>${result.USER_SEX}</td>
                                <td>${result.JOB_CD}</td>
                                <td>${result.BIRTH_YMD}</td>
                                <td>${result.EML_ADDR}</td>
                                <td>${result.MBL_TELNO}</td>
                                <td class="tl">${result.JUSO}</td>
                                <td><c:if test="${result.COUR_STAT == '참석'}">
                                		<span class="blue-txt">참석</span>
                                	</c:if>
                                	<c:if test="${result.COUR_STAT == '미참석'}">
                                		<span class="red-txt">미참석</span>
                                	</c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
