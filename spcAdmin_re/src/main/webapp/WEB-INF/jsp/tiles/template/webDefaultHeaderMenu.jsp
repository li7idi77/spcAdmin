
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 
path 사용하기 위해 
Controller에 추가하면 사용 가능.
model.addAttribute("path", request.getServletPath());
 -->
 	<div class="menu-wrap">
	     <div class="menu-cont">
	         <ul class="depth2">
	             <li><a href="${pageContext.request.contextPath}/user/summaryList01.do">생명지킴이</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/summaryList02.do">생명지킴이 교육 강사</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/summaryList03.do">자살 유족 서비스 전문가</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/summaryList04.do">심리부검 주면담원</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/summaryList05.do">자살 사후대응 전문가</a></li>
	         </ul>
	         <ul class="depth2">
	             <li><a href="${pageContext.request.contextPath}/user/info01.do">생명지킴이 교육</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/info02.do">생명지킴이 강사<br/>양성 교육</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/info03.do">실무자 역량 강화 교육</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/info04.do">자살 유족 서비스제공<br/>인력교육</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/info05.do">광역주도형 심리부검면담원 양성교육</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/info06.do">자살사후대응 전문가 양성교육</a></li>
	         </ul>
	         <ul class="depth2">
	             <li>
	                 <a href="#">교육신청</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/lifeEduOnLineList.do">온라인교육</a></li>
	                     <li><a href="${pageContext.request.contextPath}/user/lifeEduOrgList.do">교육 기관별</a></li>
	                 </ul>
	             </li>
	             <li><a href="${pageContext.request.contextPath}/user/lifeEduSch.do">교육일정</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/lifeEduBoardList.do">생명지킴이 활동 수기</a></li>
	         </ul>
	         
	         <ul class="depth2">
	             <li>
	                 <a href="#">생명지킴이 강사 양성 교육</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/sectorList.do?idx=01">교육신청</a></li>
	                 </ul>
	             </li>
	             <li>
	                 <a href="#">실무자 역량 강화 교육</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/sectorList.do?idx=02">교육신청</a></li>
	                 </ul>
	             </li>
	             <li>
	                 <a href="#">자살유족서비스 제공 인력교육</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/sectorList.do?idx=03">교육신청</a></li>
	                 </ul>
	             </li>
	             <li>
	                 <a href="#">광역주도형 심리부검면담원 양성교육</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/sectorList.do?idx=04">교육신청</a></li>
	                 </ul>
	             </li>
	             <li>
	                 <a href="#">자살사후대응 전문가 양성교육</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/sectorList.do?idx=05">교육신청</a></li>
	                 </ul>
	             </li>
	         </ul>
	         <ul class="depth2">
	             <li>
	                 <a href="#">교육개설</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/org01info.do">개설절차</a></li>
	                     <li><a href="${pageContext.request.contextPath}/user/org01List.do">교육개설</a></li>
	                 </ul>
	             </li>
	             <li><a href="${pageContext.request.contextPath}/user/org02List.do">신청현황</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/org03List.do">결과보고</a></li>
	         </ul>
	         <c:if test="${ssessionId.edu_auth_cd == '03'|| sessionId.edu_auth_cd == '04'}">
	         <ul class="depth2">
	             <li><a href="${pageContext.request.contextPath}/user/instructor01List.do">공지사항</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/instructor02List.do">자료실</a></li>
	             <li><a href="${pageContext.request.contextPath}/user/instructor03List.do">활동신청</a></li>
	             <li>
	                 <a href="#">자격관리</a>
	                 <ul class="depth3">
	                     <li><a href="${pageContext.request.contextPath}/user/instructor04List.do">강사자격정보</a></li>
	                     <li><a href="${pageContext.request.contextPath}/user/instructor04lecture.do">강의내역</a></li>
	                     <li><a href="${pageContext.request.contextPath}/user/instructor04absence.do">강사휴직신청</a></li>
	                 </ul>
	             </li>
	             <li><a href="${pageContext.request.contextPath}/user/instructor05List.do">강사 보수 교육</a></li>
	         </ul>
	         </c:if>
	     </div>
	 </div>
	 