
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
	 $("#s_date, #e_date").datepicker({
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
 
 function fn_save(){
	 var formData = new FormData($('#commonForm')[0]);
		if(confirm("휴직 신청을 하시겠습니까?")){
				
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/user/instructor04Save.do'/>",
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
 
 function commonCallBack(obj){
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("성공하였습니다.");				
				fn_load('R');				 
			} else if(result == "EXIST"){				
				alert("이미 등록 되었습니다.");	
				return false;
			}else {				
				alert("등록이 실패 했습니다.");	
				return false;
			}
		}
	}

	function fn_load(str) {
		var frm = document.commonForm;
		frm.action = "<c:url value='/user/instructor04absence.do'/>";    
		frm.submit();
	 }
</script>
     <!-- container  begin -->
                <div id="container">
                    <div class="tit-wrap">
                        <h1 class="h1-tit">강사휴직 신청</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>생명지킴이 강사 공간</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>자격관리</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>강사휴직 신청</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
                        <form  id="commonForm" name="commonForm"  method="post"  action="">
		    			<input type="hidden" id="pageIndex"  name="pageIndex" value=1 />
		    			<input type="hidden" id="user_id"  name="user_id" value="${UserAccount.user_id}" />
                        <div class="comp">
                            <div class="table-wrap">
                                <table class="detail-tb">
                                    <caption>강사명, 소속기관, 주소, 연락처, 수료증번호, 휴직사유, 휴직기간, 신청서 양식, 신청서 첨부 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="20%"/>
                                        <col width="*"/>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>강사명</th>
                                            <td>${UserAccount.user_nm}</td>
                                        </tr>
                                        <tr>
                                            <th>소속기관</th>
                                            <td>${UserAccount.coper_nm}</td>
                                        </tr>
                                        <tr>
                                            <th>주소</th>
                                            <td>${UserAccount.juso} ${UserAccount.juso_detail}</td>
                                        </tr>
                                        <tr>
                                            <th>연락처</th>
                                            <td>${UserAccount.mbl_telno}</td>
                                        </tr>
                                        <tr>
                                            <th>수료증번호</th>
                                            <td>${UserAccount.instructor_license}</td>
                                        </tr>
                                        <tr>
                                            <th>휴직사유</th>
                                            <td>
                                                <div class="radio-cont">
                                                    <input type="radio" class="radio-box" id="reason" name="reason" value="1">
                                                    <label for="">출산 및 육아</label>
                                                </div>
                                                <div class="radio-cont">
                                                    <input type="radio" class="radio-box" id="reason" name="reason" value="2">
                                                    <label for="">병가</label>
                                                </div>
                                                <div class="radio-cont">
                                                    <input type="radio" class="radio-box" id="reason" name="reason" value="3">
                                                    <label for="">해외연수</label>
                                                </div>
                                                <div class="radio-cont">
                                                    <input type="radio" class="radio-box" id="reason" name="reason" value="0">
                                                    <label for="">기타</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>휴직기간</th>
                                            <td>
                                                <div class="picker-wrap">
                                                    <input type="text" id="s_date" name="s_date" class="input-box"/>
                                                    <span class="next-ico">-</span>
                                                    <input type="text" id="e_date" name="e_date" class="input-box"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>신청서 양식</th>
                                            <td><button class="sm-btn white-btn">신청하기</button></td>
                                        </tr>
                                        <tr>
                                            <th>신청서 첨부</th>
                                            <td>
                                                <div class="upload-box">
                                                    <input type="file" />
                                                    <button class="sm-btn black-btn">삭제</button>
                                                    <label>
                                                        파일명: <span>2021년 강사 교육 안내</span>
                                                    </label>
                                                    <p class="point">파일크기 200MB 이하</p>
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
                            <button class="lg-btn orange-btn" onClick="fn_save();">신청하기</button>
                        </div>
                        <!---- button end ---->
                       

                    </div>
                </div>
                <!--  container end -->