
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
	 $('#checkAll').click(function(){
		    var isChecked = this.checked;
			$('input:checkbox[name="checkNo"]').each(function() {
			this.checked = isChecked;
	    });
	 });
	 $('#checkAll2').click(function(){
		    var isChecked = this.checked;
			$('input:checkbox[name="att_chk"]').each(function() {
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
	
	
	function fn_submit(idx) {
		var idxArray = new Array();

		idxArray.push(idx);
		if(confirm('제출 하시겠습니까?')) {
			setAtt(idxArray);
		}
	}

	var btnSubmit = function() {
		var idxArray = new Array();

		$("input[name=att_chk]:checked").each(function() {
			idxArray.push($(this).val());
		});
		if(idxArray.length < 1){
			alert("선택한 내역이 없습니다.");
			return false;
		}
		if(confirm('제출 하시겠습니까?')) {
			setAtt(idxArray);
		}
	};

	var setAtt = function(idxArray){
	    $.ajax({
	        url: "<c:url value='/user/courUserAtt.do'/>?sch_no="+$("#sch_no").val(),
	        type: "POST",
	        data: { "userArr" : idxArray },
	        success: function(data) {
	        	if(data == 'SUCCESS'){
	        		alert("교육 결과 보고서가 정상적으로 제출되었습니다.\n [마이페이지]에서 확인이 가능합니다.");
	        		document.location = "<c:url value='/user/org02List.do'/>";
	        	}
	        },
	        error: function(data) {
	        	console.log(JSON.stringify(data));
	        	alert("처리중 오류가 발생했습니다.");
	        }
	    });
	};
</script>

<!-- container  begin -->
                <div id="container">
				
                    <div class="tit-wrap">
                        <h1 class="h1-tit">기관회원 교육신청 현황</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관회원 공간</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기관회원 교육신청 현황</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
                        <div class="comp">
                            <h4 class="h4-tit">교육 결과 보고</h4>
                            <button class="mid-btn white-btn">엑셀 다운로드</button>
                            
                            <div class="comp mt20">
                            <div class="table-wrap">
            					<input type="hidden" id="sch_no" name="sch_no" value="${sch_no}">
                                <table class="detail-tb">
                                    <caption>기관명, 기관주소, 신청자명, 휴대폰, 이메일, 강사명, 교육일시, 교육명, 교육대상, 교육인원, 교육장소, 비고 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="15%"/>
                                        <col width="20%"/>
                                        <col width="15%"/>
                                        <col width="20%"/>
                                        <col width="15%"/>
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
                                        </tr>
                                        <tr>
                                            <th>휴대폰</th>
                                            <td>${result.USER_TELNO}</td>
                                            <th>이메일</th>
                                            <td>${result.USER_EML}</td>
                                            <th>강사명</th>
                                            <td>${result.EDU_TEAC_NAME}</td>
                                        </tr>
                                        <tr>
                                            <th>교육일시</th>
                                            <td>${result.EDU_START_DATE}</td>
                                            <th>교육명</th>
                                            <td>${result.EDU_NAME}</td>
                                            <th>교육대상</th>
                                            <td>${result.EDU_TARGET}</td>
                                        </tr>
                                        <tr>
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
                        </div>
                        
                         <div class="comp">
                            <div class="tit-cont">
                                <h4 class="h4-tit">생명지킴이 교육생 참석 여부</h4>
                                <button class="mid-btn white-btn" onClick="btnDel();">선택삭제</button>
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
                                        <col width="9%"/>
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
                                            <th>
                                                참석여부<br/>
                                                <input type="checkbox" id="checkAll2" name='checkAll2' class="check-box"/>
                                            </th>
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
                                            <td><input type="checkbox" class="check-box" id="att_chk" name="att_chk" value="${result.USER_ID}"/></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!---- button begin ---->
                        <div class="btn-cont">
                            <button class="lg-btn orange-btn" onClick="btnSubmit();">제출</button>
                            <button class="lg-btn white-btn" onClick="javascript:history.back();">목록</button>
                        </div>
                        <!---- button end ---->

                    </div>
                </div>