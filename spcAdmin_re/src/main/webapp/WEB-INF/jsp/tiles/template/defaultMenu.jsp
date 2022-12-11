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
 <ul class="depth01-menu">
    <li <c:if test="${fn:contains(path, '/main/logo') || fn:contains(path, '/main/img')  || fn:contains(path, '/main/banner') || fn:contains(path, '/main/popup') }">  class="on" </c:if> >
        <a href="#">메인화면</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/main/logo')}">   class="active" </c:if> ><a href="<c:url value='/main/logoList.do' />">로고        </a></li>
            <li <c:if test="${fn:contains(path, '/main/img')}">    class="active" </c:if> ><a href="<c:url value='/main/imgList.do'    />">메인이미지 </a></li>
            <%-- <li <c:if test="${fn:contains(path, '/main/banner')}"> class="active" </c:if> ><a href="<c:url value='/main/bannerList.do' />">배너관리    </a></li> --%>
            <li <c:if test="${fn:contains(path, '/main/popup')}">  class="active" </c:if> ><a href="<c:url value='/main/popupList.do' />">팝업창 관리 </a></li>
        </ul>
    </li> 
    <li <c:if test="${fn:contains(path, '/edu/eduInfoReg') || fn:contains(path, '/edu/eduInfoSchedule') }">  class="on" </c:if> >
        <a href="#">교육안내</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/edu/eduInfoReg')}">        class="active" </c:if> > <a href="<c:url value='/edu/eduInfoRegList.do' />" onClick="alert('임의로 수정할 수 없습니다.\n개발회사에 문의 바랍니다.');">교육안내 등록</a></li>
            <li <c:if test="${fn:contains(path, '/edu/eduInfoSchedule')}">   class="active" </c:if> > <a href="<c:url value='/edu/eduInfoScheduleList.do' />">교육일정      </a></li>
        </ul>
    </li>
    <li <c:if test="${fn:contains(path, '/edu/eduInfoOnlineList') || fn:contains(path, '/edu/eduInfoOnlineReg') || fn:contains(path, '/edu/eduInfoOffline') || fn:contains(path, '/edu/eduInfoNoOrgline') || fn:contains(path, '/edu/eduInfoClass') || fn:contains(path, '/edu//edu/eduInfoOnlineList') }">  class="on" </c:if> >
        <a href="#">교육등록</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/edu/eduInfoClass')}">   class="active" </c:if> > <a href="<c:url value='/edu/eduInfoClassList.do'  />">교육분류 등록  </a></li>
            <li <c:if test="${fn:contains(path, '/edu/eduInfoOnlineList')  || fn:contains(path, '/edu/eduInfoOnlineReg')}">  class="active" </c:if> > <a href="<c:url value='/edu/eduInfoOnlineList.do' />">온라인 교육    </a></li>
            <li <c:if test="${fn:contains(path, '/edu/eduInfoOffline')  || fn:contains(path, '/edu/eduInfoNoOrgline')}">  class="active" </c:if> > <a href="<c:url value='/edu/eduInfoOfflineList.do'/>">오프라인 교육</a></li>
        </ul>
    </li>
    <li <c:if test="${fn:contains(path, '/edu/eduInfoOnlineMang') || fn:contains(path, '/edu/eduInfoMangNoOrglineMang') }">   class="on" </c:if> >
        <a href="#">교육신청</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/edu/eduInfoOnlineMang')  || fn:contains(path, '/edu/eduInfoMangNoOrglineMang') }">   class="active" </c:if> ><a href="<c:url value='/edu/eduInfoOnlineMangList.do'/>">신청자 관리</a></li>
        </ul>

    </li>
    <li <c:if test="${fn:contains(path, '/org/eduStatus') || fn:contains(path, '/org/eduTitle') || fn:contains(path, '/org/eduReport') }">  class="on" </c:if> >
        <a href="#">기관(결과보고)</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/org/eduStatus')}">   class="active" </c:if>><a href="<c:url value='/org/eduStatustList.do'/>">교육신청 현황</a></li>
            <li <c:if test="${fn:contains(path, '/org/eduTitle')}">    class="active" </c:if>><a href="<c:url value='/org/eduTitleList.do'/>">교육명 별 신청자  </a></li>
            <li <c:if test="${fn:contains(path, '/org/eduReport')}">   class="active" </c:if>><a href="<c:url value='/org/eduReportList.do'/>">교육결과 보고</a></li>
        </ul>
    </li>
    <li <c:if test="${fn:contains(path, '/inst/instructorAdm')}">   class="on" </c:if> >
        <a href="#">강사공간</a>
        <ul class="depth02-menu">
        	<li <c:if test="${fn:contains(path, '/inst/instructorAdm01')}">   class="active" </c:if> > <a href="<c:url value='/inst/instructorAdm01List.do'  />">강사 자격정보 </a></li>
            <%-- <li <c:if test="${fn:contains(path, '/inst/instructorAdm02')}">   class="active" </c:if> > <a href="<c:url value='/inst/instructorAdm02List.do'  />">강사 활동 지정</a></li> --%>
            <li <c:if test="${fn:contains(path, '/inst/instructorAdm02')}">   class="active" </c:if> > <a href="<c:url value='/inst/instructorAdm02List.do'  />">강사 활동 현황</a></li>
            <li <c:if test="${fn:contains(path, '/inst/instructorAdm03')}">   class="active" </c:if> > <a href="<c:url value='/inst/instructorAdm03List.do'  />">강사 활동 신청현황</a></li>
            <li <c:if test="${fn:contains(path, '/inst/instructorAdm04')}">   class="active" </c:if> > <a href="<c:url value='/inst/instructorAdm04List.do'  />">강사 휴직 신청</a></li>
        </ul>
    </li>  
    <li <c:if test="${fn:contains(path, '/lms/content') || fn:contains(path, '/lms/student') }">  class="on" </c:if>>
        <a href="#">LMS</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/lms/content')}">   class="active" </c:if>><a href="<c:url value='/lms/contentsList.do' />">콘텐츠/교육자료 등록</a></li>
            <li><a href='javascript:alert("준비중 입니다.");'>퀴즈 등록</a></li>
            <li <c:if test="${fn:contains(path, '/lms/student')}">   class="active" </c:if>><a href="<c:url value='/lms/studentList.do' />">수강생/수료생 현황</a></li>
        </ul>
    </li>
     
 
	<li <c:if test="${fn:contains(path, '/adBoard/') }">  class="on" </c:if> >
        <a href="#">게시판</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/adBoard/notice')}">    class="active" </c:if>><a href="<c:url value='/adBoard/noticeList.do' />">공지사항</a></li>
            <li <c:if test="${fn:contains(path, '/adBoard/reference')}"> class="active" </c:if>><a href="<c:url value='/adBoard/referenceList.do' />">자료실</a></li>
            <li <c:if test="${fn:contains(path, '/adBoard/faq')}">       class="active" </c:if>><a href="<c:url value='/adBoard/faqList.do' />">FAQ</a></li>
            <li <c:if test="${fn:contains(path, '/adBoard/part')}">      class="active" </c:if>><a href="<c:url value='/adBoard/partiList.do' />">참여마당</a></li>
            <li <c:if test="${fn:contains(path, '/adBoard/instructList') || fn:contains(path, '/adBoard/instructReq') }">   class="active" </c:if>><a href="<c:url value='/adBoard/instructList.do' />">강사 공지사항</a></li>
            <li <c:if test="${fn:contains(path, '/adBoard/instructRefer')}">   class="active" </c:if>><a href="<c:url value='/adBoard/instructReferList.do' />">강사 자료실</a></li>
        </ul>
    </li>
    <li <c:if test="${fn:contains(path, '/warrant/') }">  class="on" </c:if>>
        <a href="#">수료증/기타</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/warrant/warrantGeneralDefault')}"> class="active" </c:if>><a href="<c:url value='/warrant/warrantGeneralDefault.do' />">일반 수료증</a></li>
            <li <c:if test="${fn:contains(path, '/warrant/warrantNumber')}"> class="active" </c:if>><a href="<c:url value='/warrant/warrantNumber.do' />">번호 수료증</a></li>
            <!-- <li><a href="#">수료증 발급</a></li> -->
            <li><a href="#">업로드 자료</a></li>
        </ul>
    </li>
    
    <li <c:if test="${fn:contains(path, '/orgMng/orgOn') }">  class="on" </c:if>>
        <a href="#">기관관리자</a>
        <ul class="depth02-menu">
            <li <c:if test="${fn:contains(path, '/orgMng/orgOnlineList')}">   class="active" </c:if>><a href="<c:url value='/orgMng/orgOnlineList.do' />">온라인 교육등록</a></li>
            <li <c:if test="${fn:contains(path, '/orgMng/orgOnContentsList')}">   class="active" </c:if>><a href="<c:url value='/orgMng/orgOnContentsList.do' />">온라인 콘텐츠 등록</a></li>
            <li <c:if test="${fn:contains(path, '/orgMng/orgOnAppUserList')}">   class="active" </c:if>><a href="<c:url value='/orgMng/orgOnAppUserList.do' />">신청자 관리</a></li>
            <li <c:if test="${fn:contains(path, '/orgMng/orgOnStudentList')}">   class="active" </c:if>><a href="<c:url value='/orgMng/orgOnStudentList.do' />">수강생/수료생 현황</a></li>
            <li <c:if test="${fn:contains(path, '/orgMng/orgOnWarrant')}">   class="active" </c:if>><a href="<c:url value='/orgMng/orgOnWarrant.do' />">수료증 기본양식</a></li>
            <li <c:if test="${fn:contains(path, '/orgMng/orgOnLogo')}">   class="active" </c:if>><a href="<c:url value='/orgMng/orgOnLogo.do' />">수료증 로고 등록</a></li>
            <li <c:if test="${fn:contains(path, '/orgMng/orgOnOutputWarrant')}">   class="active" </c:if>><a href="<c:url value='/orgMng/orgOnOutputWarrant.do' />">수료증 발급</a></li>
        </ul>
    </li>
</ul>