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
	 $("#start_date, #end_date, .sdate, .edate").datepicker({
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
  
 function auth_edit(idx,edu_cd){
	 if(confirm("수정 하시겠습니까?")){
		 var formData = new FormData($('#commonForm')[0]);
		 formData.append("auth_sdate",$("#auth_sdate"+idx).val());
		 formData.append("auth_edate",$("#auth_edate"+idx).val());
		 formData.append("edu_cd",edu_cd);
		 
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/inst/instructorAdm01AuthSave.do'/>",
			    dataType   : "JSON",
		        processData: false, 
		        contentType: false,
				type	   : "POST",	
		        success    : function(obj) {
		        	if(result == "SUCCESS"){				
						alert("저장 하였습니다.");					 
					}else {				
						alert("저장 실패 했습니다.");	
						return false;
					}				
		        },	       
		        error 	: function(xhr, status, error) {} 		        
		    });
		}
 }
 
 function fn_save(){
	 if(confirm("저장 하시겠습니까?")){
		 var formData = new FormData($('#commonForm')[0]);
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/inst/instructorAdm01Save.do'/>",
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
				alert("저장 하였습니다.");				
				fn_goList();				 
			}else {				
				alert("저장 실패 했습니다.");	
				return false;
			}
		}
	}	

function fn_goList(){
	document.location = "<c:url value='/inst/instructorAdm01List.do'/>";
}	
</script>

<div class="search-wrap">
	<h1 class="h1-tit">강사 자격 정보</h1>
				<form  id="commonForm" name="commonForm"  method="post"  action="">
                <div class="table-wrap">
                   
		    		<input type="hidden" id="user_id" name="user_id" value="${result.USER_ID}">	
		    		<input type="hidden" id="instructor_idx" name="instructor_idx" value="${result.INSTRUCTOR_IDX}">	
                    <h2 class="h2-tit">회원정보</h2>

                    <table class="detail-tb">
                        <caption>아이디, 이름, 비밀번호, 전화번호, 휴대폰, 팩스번호, 이메일, 성별 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>아이디</th>
                                <td>${result.USER_ID}</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${result.USER_NM}</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>${result.TELNO}</td>
                            </tr>
                            <tr>
                                <th>휴대폰</th>
                                <td>${result.MBL_TELNO}</td>
                            </tr>
                            <tr>
                                <th>팩스번호</th>
                                <td>${result.FXNO}</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>${result.EML_ADDR}</td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>${result.USER_SEX_NM}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-wrap">
                    <h2 class="h2-tit">강사정보 1</h2>

                    <table class="detail-tb">
                        <caption>활동상태, 강사분류, 지역, 기관명, 휴직이력, 신청서 보기, 휴직기간 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="30%"/>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>활동상태</th>
                                <td colspan="3">
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="status" name="status" value="1" <c:if test="${result.INS_STATUS == '1'}">checked</c:if>>
                                            <label>활동</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="status" name="status"value="2" <c:if test="${result.INS_STATUS == '2'}">checked</c:if>>
                                            <label>상실(일반)</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="status" name="status" value="3" <c:if test="${result.INS_STATUS == '3'}">checked</c:if>>
                                            <label>휴직</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>활동상태</th>
                                <td colspan="3">
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="class" name="class" value="0" <c:if test="${result.INS_CLASS == '0'}">checked</c:if>>
                                            <label>전체</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="class" name="class" value="1" <c:if test="${result.INS_CLASS == '1'}">checked</c:if>>
                                            <label>일반강사</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="class" name="class" value="2" <c:if test="${result.INS_CLASS == '2'}">checked</c:if>>
                                            <label>실무자</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="class" name="class" value="3" <c:if test="${result.INS_CLASS == '3'}">checked</c:if>>
                                            <label>공공기간(학교, 군, 경찰, 도시철도 등)</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="class" name="class" value="4" <c:if test="${result.INS_CLASS == '4'}">checked</c:if>>
                                            <label>기업(삼성,현대. sk 등)</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>지역</th>
                                <td>${result.AREA_NM}
                                    <%-- <select id="area_cd" name="area_cd" class="select">
                                        <c:forEach var="code" items="${codeList}" varStatus="status">
											<option value='${code.CD}' <c:if test="${result.AREA_CD == code.CD}">selected</c:if>>${code.CD_NM}</option>
										</c:forEach>
                                    </select> --%>
                                </td>
                                <th>기관명</th>
                                <td>${result.INSTRUCTOR_COPER_NM}
                                    <!-- <input type="text" id="coper_nm" name="coper_nm" class="input-box" value=""/> -->
                                </td>
                            </tr>
                            <tr>
                                <th>휴직이력</th><!-- 휴직이력 및 기간 DB구조상 수정불가 -->
                                <td>
                                    <input type="text" class="input-box" value="${result.LEAVE_CNT}" readOnly/>
                                </td>
                                <th>신청서 보기</th>
                                <td> 
                                    <a class="link block">${result.LEAVE_FILE_NAME}</a><!-- LEAVE_FILE_ID -->
                                </td>
                            </tr>
                            <tr>
                                <th>휴직기간</th>
                                <td colspan="3">
                                    <div class="picker-wrap">
                                        <input type="text" id="datepickerFrom02" class="input-box" value="${result.LEAVE_SDATE}" readOnly/>
                                        <span class="next-ico">-</span>
                                        <input type="text" id="datepickerTo02" class="input-box" value="${result.LEAVE_EDATE}" readOnly/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-wrap">
                    <h2 class="h2-tit">강사정보 2</h2>

                    <table class="detail-tb">
                        <caption>수료증번호, 최종수료일, 교육횟수, 교육 누적횟수, 오프라인 2회 교육, 온라인 보수 교육 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="30%"/>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>수료증번호</th>
                                <td>${result.LICENSE_NUMBER}</td>
                                <th>최종 수료일</th>
                                <td>
                                    <div class="picker-wrap">
                                        ${result.LICENSE_DATE}
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>교육횟수 (해당 년도)</th>
                                <td>${result.EDU_NOWCNT}</td>
                                <th>교육 누적횟수</th>
                                <td>${result.EDU_ALLCNT}</td>
                            </tr>
                            <tr>
                                <th>오프라인 2회 교육</th>
                                <td colspan="3">
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="ins_off_stat" name="ins_off_stat" value="1" <c:if test="${result.INS_OFF_STATUS == '1'}">checked</c:if>>
                                            <label>완료</label>
                                        </div>
                                        <c:if test="${result.INS_OFF_STATUS != '1'}">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="ins_off_stat" name="ins_off_stat" value="2" <c:if test="${result.INS_OFF_STATUS == '2' || (empty result.INS_OFF_STATUS)}">checked</c:if>>
                                            <label>미완료</label>
                                        </div>
                                        </c:if>
                                        * 해당년도 수료 시 체크 ( 오프/온라인 교육 모두 완료 시 1년 자격연장 )
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>온라인 보수 교육</th>
                                <td colspan="3">
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="ins_on_stat" name="ins_on_stat" value="1" <c:if test="${result.INS_ON_STATUS == '1'}">checked</c:if>>
                                            <label>완료</label>
                                        </div>
                                        <c:if test="${result.INS_ON_STATUS != '1'}">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="ins_on_stat" name="ins_on_stat" value="2" <c:if test="${result.INS_ON_STATUS == '2' || (empty result.INS_ON_STATUS)}">checked</c:if>>
                                            <label>미완료</label>
                                        </div>
                                        </c:if>
                                        * 해당년도 수료 시 체크 ( 오프/온라인 교육 모두 완료 시 1년 자격연장 )
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-wrap">
                    <h2 class="h2-tit">강사 자격기간 정보</h2>

                    <!------   20211223  수정  ------>
                    <table class="list-tb">
                        <caption>자격기간, 강사자격정보, 수료일, 유지기간, 관리 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="15%"/>
                            <col width="*"/>
                            <col width="15%"/>
                            <col width="30%"/>
                            <col width="10%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>자격기간</th>
                                <th>강사 자격정보</th>
                                <th>수료일</th>   
                                <th>유지기간</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="auth" items="${authList}" varStatus="status">
							<tr>
								<c:if test="${status.first}">
									<td rowspan="${fn:length(authList)}" class="no-border-b">&nbsp;</td>
								</c:if>
                                <td class="tl">${auth.CATEGORY3_NAME}</td>
                                <td><input type="text" class="input-box" value="${auth.EDU_FDATE}" readonly/></td>
                                <td>
                                    <div class="picker-wrap">
                                        <input type="text" id="auth_sdate${status.index}" name="auth_sdate" value="${auth.AUTH_SDATE}" class="input-box sdate"/>
                                        <span class="next-ico">-</span>
                                        <input type="text" id="auth_edate${status.index}" name="auth_edate" value="${auth.AUTH_EDATE}" class="input-box edate"/>
                                    </div>
                                </td>
                                <td><button type="button" class="sm-btn blue-btn" onClick="auth_edit('${status.index}','${auth.EDU_CD}')">수정</button></td>
                            </tr>
							</c:forEach>
                        </tbody>
                    </table><!------   // 20211223  수정  ------>
                </div>
				</form>
                <div class="btn-cont">
                    <button type="button" class="mid-btn blue-btn" onClick="fn_save();">저장하기</button>
                    <button type="button" class="mid-btn white-btn">취소</button>
                </div>
</div>
