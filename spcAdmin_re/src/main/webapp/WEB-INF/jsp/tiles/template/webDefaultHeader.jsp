<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">	
/**
 * 
 * @param fileId
 * @returns
 */
function gfnLogout(){
	var msg = "정말로 로그아웃 하시겠습니까?";
	var yn = confirm(msg);		
	if(yn){
		location.href = "${pageContext.request.contextPath}/login/logout.do";
	}
}
function openWindowPop(url, name){
    var options = 'top=10, left=10, width=1200px, height=800px, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}	

</script>
	<div id="header">
        <div class="top-wrap">
            <a  href="${pageContext.request.contextPath}/user/webMain.do">홈</a>|<a href="${pageContext.request.contextPath}/user/notice01List.do">공지사항</a><c:if test="${sessionId != null}">|
            <c:if test="${sessionId.edu_auth_cd == '01'}">
            	<a href="${pageContext.request.contextPath}/my/my01info.do">마이페이지</a>|
            </c:if>
            <c:if test="${sessionId.edu_auth_cd == '02'}">
            	<a href="${pageContext.request.contextPath}/my/my02info.do">마이페이지</a>|
            </c:if>
            <c:if test="${sessionId.edu_auth_cd == '03'}">
            	<a href="${pageContext.request.contextPath}/my/my03info.do">마이페이지</a>|
            </c:if>
            <c:if test="${sessionId.edu_auth_cd == '04'}">
            	<a href="${pageContext.request.contextPath}/my/my04info.do">마이페이지</a>|
            </c:if>
            <a onClick="javascript:openWindowPop('<c:url value='/my/popMyClass.do'/>','popup');">나의 강의실</a>|<a Onclick="javascript:gfnLogout()">로그아웃</a></c:if>
        	<c:if test="${sessionId.user_group_cd eq '0003'}">
        	|<a href="${pageContext.request.contextPath}/admin/">LMS 관리자</a>
        	</c:if>
        </div>
        <div class="nav-wrap">
            <a class="logo" href="http://www.kfsp.co.kr/web">
            	<c:if test="${not empty logoForm.logo_no }">
            		<c:set var="ppx" value="${fn:split(logoForm.file_name,'.')}" />
            		<img src="/${logoForm.webPath}/${logoForm.gubun2}/${logoForm.file_id}.${ppx[1]}"  alt="${logoForm.file_name}"/>
            	</c:if>
            	<c:if test="${empty logoForm.logo_no }">
            		<img src="${pageContext.request.contextPath}/user/images/common/logo.png" alt="생명존중희망재단 사용자 로고"/>
            	</c:if>
            	                
            </a>
            <nav id="navigation">
                <ul>
                    <li><a href="#">개요</a></li>
                    <li><a href="#">교육안내</a></li>
                    <li><a href="#">생명지킴이 교육신청</a></li>
                    <li><a href="#">분야별 교육신청</a></li>
                    <li><a href="#">기관회원 공간</a></li>
                    <c:if test="${sessionId.edu_auth_cd == '03'|| sessionId.edu_auth_cd == '04'}">
                    <li><a href="#">생명지킴이 강사 공간</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>