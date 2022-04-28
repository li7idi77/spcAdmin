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

<h1 class="h1-tit">일반 수료증</h1>

<div class="tab-cont">
    <ul>
        <li class="on"><a href="<c:url value='/warrant/warrantGeneralDefault.do' />">기본 양식</a></li>
        <li><a href="<c:url value='/warrant/warrantOnlineList.do' />">온라인 등록</a></li>
        <li><a href="<c:url value='/warrant/warrantOfflineList.do' />">오프라인 등록</a></li>
        <li><a href="<c:url value='/warrant/warrantOrgList.do' />">기관교육 등록</a></li>
    </ul>
</div>

<div class="warrant-wrap general">
    <h1 class="warrant-tit">수료증</h1>

    <div class="warrant-cont">
        <p class="name"><span>홍길동</span>님</p>
        <p class="title">교육명 :<span> 보고듣고 말하기</span></p>
        <p class="des">한국생명존중희망재단에서 시행하는 생명지킴이교육을<br/>성실하게 마쳤으며,<br/>향후 생명지킴이로서의 역할을<br/>충실히 이행 할 준비가 되어 있으므로<br/>이 수료증을 드립니다.</p>
        <p class="date"><span>2022</span>년<span>01</span>월<span>04</span>일</p>
    </div>

    <div class="warrant-foot">

    </div>
</div>