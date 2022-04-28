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


<form id="commonForm" name="commonForm" method="post">
<input type="hidden" name="cour_no" id="cour_no" value="${cour_no}">
<div class="pop-wrap sm-pop">
        <!-- <div class="pop-header">
            <h1 class="h1-tit"></h1>
            <button class="close-btn"><img src="./images/common/close.png" alt="닫기"/></button>
        </div> -->
        <div class="pop-cont">
            <div class="warrant-wrap number">
                <p class="warrant-num">교육 제 <span>21</span> - <span>00068</span> 호</p>
                <h1 class="warrant-tit">수료증</h1>

                <div class="warrant-cont">
                    <p class="title">분야 : <span>분야명이 들어갑니다</span></p>
                    <p class="title mb10">소속 :<span> 삼성물산</span></p>
                    <p class="name">이름 : <span>홍길동</span></p>
                    <p class="des">귀하는 한국생명존중희망재단에서 실시한<br/>전문가 양성과정 (<span>과정명이 들어갑니다</span>) 교육을<br/>수료하였기에 이 증서를 수여합니다.</p>
                    <p class="date mb0"><span>2022</span>년<span>01</span>월<span>04</span>일</p>
                </div>

                <div class="warrant-foot">
                    <span>한국생명존중희망재단 이사장</span>
                    <img src="./images/common/stamp.png" alt="생명존중희망재단 이사장인"/>
                </div>
            </div>
    </div>
</div>
</form>

<script type="text/javascript">

$(document).ready(function() {
});

</script>