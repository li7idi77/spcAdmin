
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
	 	
 });
 
 function pop(){
	 alert("준비중 입니다.");
 }
 
 function fileDownload(key1){
		var frm = document.commonForm;
		$("#file_id").val(key1)
		frm.action = "<c:url value='/my/fileIdDown.do'/>";
		frm.submit();
	}
 
 function openWindowPop(url, name){
	    var options = 'top=10, left=10, width=1200px, height=600px, status=no, menubar=no, toolbar=no, resizable=no';
	    window.open(url, name, options);
	}
</script>
    <!--  class-wrap begin -->
    <form id="commonForm" name="commonForm" method="post">
    <input type="hidden" id="file_id" name="file_id">
            <div class="class-wrap">
				<input type="hidden" id="cour_no"  name="cour_no" value="${cour_no}" />
                <div class="tit-wrap flex-colum">
                    <!---- info-group begin ---->
                    <div class="info-group left-cont">
                        <h1 class="h1-tit">나의 강의실</h1>
                        <p><span class="name">${UserAccount.user_nm}</span>회원</p>
                        <p>|</p>
                        <p>${today}</p>
                    </div>
                    <!---- info-group end ---->

                    <div class="right-cont">
                        <button class="sm-btn white-btn" type="button" onClick="location.href='${pageContext.request.contextPath}/my/popMyClass.do'">강의실 홈</button>
                    </div>
                </div>
                

                <!---- view-wrap begin ---->
                 <div class="view-wrap">
                    <span class="badge-normal">${result.CATEGORY1_NAME}</span>
                    <span class="tag">${result.CATEGORY2_NAME}</span>

                    <h3 class="h3-tit">
                        <span>${result.CATEGORY3_NAME}</span>
                        <button class="sm-btn navy-btn" onClick="pop();">퀴즈풀기</button>
                    </h3>
                    
                    <ul class="summary-cont">
                        <li>
                            <label>강사명 :</label>
                            <span>${result.INST_NM}</span>
                        </li>
                        <li>
                            <label>교육신청일 :</label>
                            <span>${result.REG_DT}</span>
                        </li>
                        <li>
                            <label>차시별 학습현황 :</label>
                            <span>${result.SECTOR_CNT1}/${result.SECTOR_CNT2}</span>
                        </li>
                        <li>
                            <label>총 학습인증시간 :</label>
                            <span>${result.EDU_TIME}</span>분
                        </li>
                        <li>
                            <label>총 누적학습시간 :</label>
                            <span>${result.COUR_TIME}</span>
                        </li>
                        <li>
                            <label>학습현황 :</label>
                            <span>${result.COUR_STAT}</span>
                        </li>
                        
                    </ul>
                </div>
                <!---- view-wrap end ---->

                <div class="comp">
                    <h4 class="h4-tit">차시</h4>
                    
                    <div class="table-wrap">
                        <table class="list-tb">
                            <caption>차시, 차시명, 교육자료, 학습인증시간, 누적학습시간, 학습여부, 학습하기 정보가 있는 테이블</caption>
                            <colgroup>
                                <col width="5%"/>
                                <col width="8%"/>
                                <col width="*"/>
                                <col width="10%"/>
                                <col width="13%"/>
                                <col width="13%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>차시</th>
                                    <th>차시명</th>
                                    <th>교육자료</th>
                                    <th>학습인증시간</th>
                                    <th>누적학습시간</th>
                                    <th>학습여부</th>
                                    <th>학습하기</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${resultList}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${list.EDU_CURR1}</td>
                                    <td class="tl">${list.EDU_CURR2}</td>
                                    <td><c:if test="${list.FILE_ID != null && list.FILE_ID != ''}"><a class="link" onclick="javascript:fileDownload('${list.FILE_ID}');">다운로드</a></c:if></td>
                                    <td><span>${list.EDU_CURR3}</span>분</td>
                                    <td><span>${list.COUR_TIME}</span>분</td>
                                    <td>${list.COUR_STAT}</td>
                                    <td><button class="sm-btn white-btn" onClick="javascript:openWindowPop('<c:url value='/my/popMyPlayer.do'/>?edu_sub_no=${list.EDU_SUB_NO}&cour_no=${cour_no}','popup2');">바로가기</button></td>
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
            </div>
       </form>
            <!--  class-wrap end -->