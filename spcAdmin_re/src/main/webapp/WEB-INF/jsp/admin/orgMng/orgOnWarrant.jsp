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

<h1 class="h1-tit">기본양식</h1>

<div class="warrant-wrap number">
    <h1 class="warrant-tit">수료증</h1>

    <div class="warrant-cont2">
        <p class="name" style="text-align:right;"><span>홍길동</span>님</p>
        <p class="title">교육명 :<span> 보고듣고 말하기</span></p>
        <p class="subtitle"><span>서울 강남 역삼보건소</span></p>
        <p class="des">에 시행하는 ○○○○ ○ ○○○○ ○○ ○○○<br/>○○○○ ○○○○ ○○ ○○ ○○ ○○<br/>○○○○○○○○○ ○○○○ ○○○ ○○○<br/>이 수료증을 드립니다.</p>
        <p class="date"><span>2022</span>년<span>12</span>월<span>04</span>일</p>
    </div>

    <div class="warrant-foot2">
    	<c:set var="ppx1" value="${fn:split(resultList[0].FILE_NAME,'.')}" />
		<img src="/${webPath}/warrantLogo/${resultList[0].FILE_ID}.${ppx1[1]}"  alt="${resultList[0].FILE_NAME}"/>
		<c:set var="ppx2" value="${fn:split(resultList[1].FILE_NAME,'.')}" />
		<img src="/${webPath}/warrantLogo/${resultList[1].FILE_ID}.${ppx2[1]}"  alt="${resultList[1].FILE_NAME}"/>
		<c:set var="ppx3" value="${fn:split(resultList[2].FILE_NAME,'.')}" />
		<img src="/${webPath}/warrantLogo/${resultList[2].FILE_ID}.${ppx3[1]}"  alt="${resultList[2].FILE_NAME}"/>
    </div>
</div>