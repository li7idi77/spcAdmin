
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
   $("#edu_date").datepicker({
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
 
 function email_chg(){
	 $("#app_email2").val("");
	 if($("#eml_sel").val() != ""){
		 $("#app_email2").val($("#eml_sel").val());
	 }
 }
 
 function insSelect(str){
	var param = str.split(",");
	$("#user_id").val(param[3]);
	$("#user_nm").val(param[2]);
	$("#area_nm").val(param[1]);
	$("#instructor_idx").val(param[0]);
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
	   if ($("#app_email1").val() == ""){			
			alert("이메일을 입력하세요.");
			$("#app_email1").focus();
			return;
		}	
	   if ($("#app_email2").val() == ""){			
			alert("이메일을 입력하세요.");
			$("#app_email2").focus();
			return;
		}	
	   if ($("#edu_date").val() == ""){			
			alert("교육일정을 입력하세요.");
			$("#edu_date").focus();
			return;
		}
	   if ($("#edu_garden").val() == ""){			
			alert("교육인원을 입력하세요.");
			$("#edu_garden").focus();
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
			    url		   : "<c:url value='/user/orgSave.do'/>",
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
		document.location = "<c:url value='/user/org01List.do'/>";
	 }	
</script>

<!-- container  begin -->
                <div id="container">
				
                    <div class="tit-wrap">
                        <h1 class="h1-tit">교육신청</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관 회원 서비스</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관회원 교육신청</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>교육신청</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
                    <form  id="commonForm" name="commonForm"  method="post"  action="">
                        <input type="hidden" id="edu_no" name="edu_no" value="${edu_no}">
                        <input type="hidden" id="idx" name="idx" value="${idx}">
                        <input type="hidden" id="category1_key" name="category1_key" value="7">
                        <input type="hidden" id="category2_key" name="category2_key" value="14">
                        <input type="hidden" id="category3_key" name="category3_key" value="${result.CATEGORY3_KEY}">
                        <div class="comp">
                            <h4 class="h4-tit">정보입력</h4>
                            <div class="table-wrap">
                                <table class="detail-tb">
                                    <caption>기관명, 기관주소, 신청자명, 신청인 휴대폰, 신청인 이메일, 강사선택, 교육명(분류3), 교육대상, 교육일시, 교육시간, 교육인원, 교육장소 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="20%"/>
                                        <col width="*"/>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>기관명</th>
                                            <td>
                                                <div class="tb-cont">
                                                    <select id="area_cd" name="area_cd" class="select" readonly>
                                                        <c:forEach var="code" items="${codeList}" varStatus="status" >
                                                        	<c:if test="${result.AREA_CD == code.CD}">
															<option value='${code.CD}' selected>${code.CD_NM}</option>
															</c:if>
														</c:forEach>
                                                    </select>
                                                    <input type="text" id="coper_nm" name="coper_nm" class="input-box" value="${result.COPER_NM}" readonly/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>기관주소</th>
                                            <td>
                                                <input type="text" id="coper_addr" name="coper_addr" class="input-box lg-width" readonly value="${result.ADDR}"/>
                                                <!-- <button class="sm-btn navy-btn">주소검색</button> -->
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>신청자명</th>
                                            <td>
                                                <input type="text" id="app_user_nm" name="app_user_nm" class="input-box"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>신청인 휴대폰</th>
                                            <td>
                                                <input type="text" id="app_tel" name="app_tel" class="input-box lg-width" placeholder="- 없이 입력해주세요"/>
                                                <p class="point">* 연락 가능한 신청인의 휴대번호를 정확히 입력하시기 바랍니다.</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>신청인 이메일</th>
                                            <td>
                                                <div class="tb-cont">
                                                    <input type="text" id="app_email1" name="app_email1" class="input-box" value=""/>
                                                    <span>@</span>
                                                    <input type="text" id="app_email2" name="app_email2" class="input-box" value=""/>
                                                    <select class="select" id="eml_sel" name="eml_sel" onchange="email_chg();">
                                                        <option>직접입력</option>
                                                        <option value="naver.com">naver.com</option>
                                            			<option value="gmail.com">gmail.com</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>강사선택</th>
                                            <td>
                                                <div class="tb-cont">
                                                    <div class="radio-cont">
                                                        <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="select" checked>
                                                        <input type="text" id="area_nm" name="area_nm" class="input-box" readonly/>
                                                        <input type="text" id="user_nm" name="user_nm" class="input-box" readonly/>
                                                        <input type="hidden" id="instructor_idx" name="instructor_idx"/>
                                                        <input type="hidden" id="user_id" name="user_id"/>
                                                        <button type="button" class="sm-btn navy-btn" onClick="javascript:openWindowPop('<c:url value='/user/popInsSearch.do'/>?edu_no=${edu_no}','popup');" class="sm-btn white-btn">검색</button>
                                                    </div>
                                                    
                                                    <div class="radio-cont">
                                                        <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="input">
                                                        <label for="">직접입력</label>
                                                        <input type="text" class="input-box" id="ins_input" name="ins_input"/>
                                                    </div>
            
                                                    <div class="radio-cont">
                                                        <input type="radio" class="radio-box" id="ins_type" name="ins_type" value="recruit">
                                                        <label for="">강사섭외 필요</label>
                                                    </div>
                                                    <p class="point ml20">* 이어줌인 교육의 경우, 강사들이 충분하지 않아 섭외가 어려울 수 있습니다.</p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>교육명</th>
                                            <td>
                                                <input type="text" id="edu_nm" name="edu_nm" class="input-box" readonly value="${result.CATEGORY3}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>교육대상</th>
                                            <td>
                                                <input type="text" id="edu_target" name="edu_target" class="input-box" readonly value="${result.EDU_TARGET}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>교육일시</th>
                                            <td>
                                                <div class="tb-cont">
                                                    <div class="picker-wrap">
                                                        <input type="text" id="edu_date" name="edu_date" class="input-box"/>
                                                    </div>
                                                    <div class="time-cont">
                                                        <select class="select" id="start_hour" name="start_hour">
                                                            <c:forEach var="i"  begin="0" end="23">
														        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
														    </c:forEach>
                                                        </select>
                                                        <span>시</span>
                                                        <select class="select" id="start_min" name="start_min">
                                                            <c:forEach var="i"  begin="0" end="60">
														        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
														    </c:forEach>
                                                        </select>
                                                        <span>분</span>
                                                    </div>
                                                    <span class="next-ico">~</span>
                                                    <div class="time-cont">
                                                       <select class="select" id="end_hour" name="end_hour">
                                                            <c:forEach var="i"  begin="0" end="23">
														        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
														    </c:forEach>
                                                        </select>
                                                        <span>시</span>
                                                        <select class="select" id="end_min" name="end_min">
                                                            <c:forEach var="i"  begin="0" end="60">
														        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
														    </c:forEach>
                                                        </select>
                                                        <span>분</span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>교육시간</th>
                                            <td>
                                                <input type="text" id="edu_time" name="edu_time" class="input-box" value="${result.EDU_TIME}"/>
                                                <span>분</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>교육인원</th>
                                            <td>
                                                <input type="text" id="edu_garden" name="edu_garden" class="input-box" value="${result.EDU_GARDEN}"/>
                                                <span>명</span>
                                                <p class="point ml20">* 청소년 50명, 그 외 200명 신청 시 초과신청 불가 (비대면교육은 해당없음)</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>교육장소</th>
                                            <td>
                                                <input type="text" id="edu_place" name="edu_place" class="input-box" value=""/>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!---- button begin ---->
                        <div class="btn-cont">
                            <button type="button" class="lg-btn orange-btn" onClick="fn_save();">신청하기</button>
                            <button type="button" class="lg-btn white-btn" onClick="javascript:history.back();">목록</button>
                        </div>
                        <!---- button end ---->
                        

                	</form>
                    </div>
                </div>
                <!--  container end -->