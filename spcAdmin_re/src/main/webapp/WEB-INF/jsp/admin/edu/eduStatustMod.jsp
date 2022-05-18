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

 <script type="text/javaScript">
 $(document).ready(function(){		
	 $("#start_date,#cancel_date").datepicker({
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
 
 function insSelect(str){
	var param = str.split(",");
	$("#user_id").val(param[3]);
	$("#user_nm").val(param[2]);
 }
 
 function fn_save(){
	 	if ($("#app_user_nm").val() == ""){			
			alert("신청자를 입력하세요.");
			$("#app_user_nm").focus();
			return;
		}
	 	if ($("#app_tel").val() == ""){			
			alert("연락처를 입력하세요.");
			$("#app_tel").focus();
			return;
		}
	   if ($("#app_email").val() == ""){			
			alert("이메일을 입력하세요.");
			$("#app_email").focus();
			return;
		}	
	   if ($("#start_date").val() == ""){			
			alert("교육일정을 입력하세요.");
			$("#start_date").focus();
			return;
		}
	   if ($("#edu_number").val() == ""){			
			alert("교육인원을 입력하세요.");
			$("#edu_number").focus();
			return;
		}
	   if ($("#edu_time").val() == ""){			
			alert("교육시간을 입력하세요.");
			$("#edu_time").focus();
			return;
		}
		if(confirm("교육 신청을 하시겠습니까?")){
			$.ajax({	
				data       : $("#commonForm").serialize(),
			    url		   : "<c:url value='/org/orgSave.do'/>",
			    dataType   : "JSON",
		        processData: false, 
		        cache    : false,
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
				fn_goList();				 
			}else {				
				alert("등록이 실패 했습니다.");	
				return false;
			}
		}
	}	

function openWindowPop(url, name){
	    var options = 'top=10, left=10, width=700px, height=600px, status=no, menubar=no, toolbar=no, resizable=no';
	    window.open(url, name, options);
	}	

	function fn_goList(){
		document.location = "<c:url value='/org/eduStatustList.do'/>";
	 }	

 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
               <input type="text" id="schedule_no" name="schedule_no" value="${sch_no}">
         	<h1 class="h1-tit">교육 신청 현황 수정</h1>


         		<div class="table-wrap">

                    <table class="detail-tb">
                        <caption>기관명, 기관주소, 신청자명, 신청인 휴대폰, 신청인 이메일, 강사선택, 교육명(분류3), 교육대상, 교육일시, 교육시간, 교육인원, 교육신청인원, 교육장소 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>기관명</th>
                                <td>
                                    <div class="tb-cont">
                                        <select id="area_cd" name="area_cd" class="select">
                                            <c:forEach var="code" items="${codeList}" varStatus="status" >
												<option value="${code.CD}" <c:if test="${result.COPER_AREA_CD == code.CD}">selected</c:if>>${code.CD_NM}</option>
											</c:forEach>
                                        </select>
                                        <input type="text" id="coper_nm" name="coper_nm" class="input-box" value="${result.EDU_ORG_NAME}"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>기관주소</th>
                                <td>
                                    <input type="text" id="coper_addr" name="coper_addr" class="input-box lg-width" value="${result.COPER_ADDR}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>신청자명</th>
                                <td>
                                    <input type="text" id="app_user_nm" name="app_user_nm" class="input-box" value="${result.USER_NM}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>신청인 휴대폰</th>
                                <td>
                                    <input type="text" id="app_tel" name="app_tel" class="input-box lg-width" placeholder="- 없이 입력해주세요" value="${result.USER_TELNO}"/>
                                    <p class="point">* 연락 가능한 신청인의 휴대번호를 정확히 입력하시기 바랍니다.</p>
                                </td>
                            </tr>
                            <tr>
                                <th>신청인 이메일</th>
                                <td>
                                    <div class="tb-cont">
                                        <input type="text" id="app_email" name="app_email" class="input-box" value="${result.USER_EML}"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>강사선택</th>
                                <td>
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="select" <c:if test="${result.INS_TYPE =='select'}">checked </c:if>>
                                            <input type="text" id="user_nm" name="user_nm" class="input-box" readonly  <c:if test="${result.INS_TYPE =='select'}">value="${result.EDU_TEAC_NAME}"</c:if>/>
                                            <input type="hidden" id="user_id" name="user_id" <c:if test="${result.INS_TYPE =='select'}">value="${result.EDU_TEAC_ID}"</c:if>/>
                                            <button type="button" onClick="javascript:openWindowPop('<c:url value='/user/popInsSearch.do'/>?edu_no=${result.EDU_KEY}','popup');" class="sm-btn blue-btn">검색</button>
                                        </div>
                                          
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="input" <c:if test="${result.INS_TYPE =='input'}">checked </c:if>>
                                            <label for="">직접입력</label>
                                            <input type="text" id="ins_input" name="ins_input" class="input-box" <c:if test="${result.INS_TYPE =='input'}">value="${result.EDU_TEAC_NAME}"</c:if>/>
                                        </div>

                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="recruit" <c:if test="${result.INS_TYPE =='recruit'}">checked </c:if>>
                                            <label for="">강사섭외 필요</label>
                                            <span class="point ml20">* 이어줌인 교육의 경우, 강사들이 충분하지 않아 섭외가 어려울 수 있습니다.</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>교육명</th>
                                <td>
                                    <input type="text" class="input-box" id="edu_nm" name="edu_nm" value="${result.EDU_NAME}" readOnly/>
                                </td>
                            </tr>
                            <tr>
                                <th>교육대상</th>
                                <td>
                                    <input type="text" class="input-box" id="edu_target" name="edu_target" value="${result.EDU_TARGET}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>교육일시</th>
                                <td>
                                    <div class="tb-cont">
                                        <div class="picker-wrap">
                                            <input type="text" id="start_date" name="start_date" class="input-box" value="${result.EDU_START_DATE}"/>
                                        </div>
                                        <div class="time-cont">
                                        	<c:set var="start_time" value="${fn:split(result.START_TIME,':')}" />
                                            <select class="select" id="start_hour" name="start_hour">
                                            <c:forEach var="i"  begin="0" end="23">
										        <option value="${i}" <c:if test="${start_time[0] == i}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}</option>
										    </c:forEach>
                                            </select>
                                            <span>시</span>
                                            <select class="select" id="start_min" name="start_min">
                                            <c:forEach var="i"  begin="0" end="60">
										        <option value="${i}" <c:if test="${start_time[1] == i}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}</option>
										    </c:forEach>
                                            </select>
                                            <span>분</span>
                                        </div>
                                        <span class="next-ico">~</span>
                                        <div class="time-cont">
                                        	<c:set var="end_time" value="${fn:split(result.END_TIME,':')}" />
                                            <select class="select" id="end_hour" name="end_hour">
                                            <c:forEach var="i"  begin="0" end="23">
										        <option value="${i}" <c:if test="${end_time[0] == i}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}</option>
										    </c:forEach>
                                            </select>
                                            <span>시</span>
                                            <select class="select" id="end_min" name="end_min">
                                            <c:forEach var="i"  begin="0" end="60">
										        <option value="${i}" <c:if test="${end_time[1] == i}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}</option>
										    </c:forEach>
                                            </select>
                                            <span>분</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- <tr>
                                <th>교육시간</th>
                                <td>
                                    <input type="text" class="input-box" readonly value=""/>
                                    <span>분</span>
                                </td>
                            </tr> -->
                            <tr>
                                <th>교육인원</th>
                                <td>
                                    <input type="text" id="edu_number" name="edu_number" class="input-box" value="${result.EDU_NUMBER}"/>
                                    <span>명</span>
                                </td>
                            </tr>
                            <tr>
                                <th>교육 신청인원</th>
                                <td>
                                    <input type="text" class="input-box" value="${result.APP_COUNT}" readOnly/>
                                    <span>명</span>
                                    <span class="point">* 실제 교육인원입니다.</span>
                                </td>
                            </tr>
                            <tr>
                                <th>교육장소</th>
                                <td>
                                    <input type="text" id="edu_place" name="edu_place" class="input-box" value="${result.EDU_PLACE}"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-wrap">
                    <h2 class="h2-tit">취소사유</h2>

                    <table class="detail-tb">
                        <caption>취소사유, 취소날짜, 취소요청자, 취소요청자 연락처, 비고 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tbody>
                                <tr>
                                    <th>취소사유</th>
                                    <td>
                                        <textarea id="cancel_reason" name="cancel_reason" class="editor">${result.CANCEL_REASON}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>취소날짜</th>
                                    <td>
                                        <div class="picker-wrap">
                                            <input type="text" id="cancel_date" name="cancel_date" class="input-box" value="${result.CANCEL_DATE}"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>취소요청자</th>
                                    <td><input type="text" id="cancel_user" name="cancel_user" class="input-box" value="${result.CANCEL_USER}"/></td>
                                </tr>
                                <tr>
                                    <th>취소요청자 연락처</th>
                                    <td><input type="text" id="cancel_tel" name="cancel_tel" class="input-box" value="${result.CANCEL_TEL}"/></td>
                                </tr>
                                <tr>
                                    <th>비고</th>
                                    <td>
                                        <textarea id="cancel_remark" name="cancel_remark" class="editor">${result.CANCEL_REMARK}</textarea>
                                    </td>
                                </tr>
                        </tbody>
                    </table>
                </div>

                <div class="btn-cont">
                    <button type="button" class="mid-btn blue-btn" onClick="fn_save();">저장하기</button>
                    <button type="button" class="mid-btn white-btn" onClick="javascript:history.back();">취소</button>
                </div>
         </form>
