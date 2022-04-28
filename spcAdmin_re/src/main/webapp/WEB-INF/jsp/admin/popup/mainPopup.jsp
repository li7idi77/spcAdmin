
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>


<div class="dim-layer"></div>

    <div class="main-pop pop-wrap sm-pop" style="height: 300px, width:800px ;">
        <div class="pop-header">
            <h1 class="h1-tit"><c:out value="${mainForm.popup_nm}"/></h1>
            <button type="button" class="close-btn"  onclick="self.close();"><img src="${pageContext.request.contextPath}/user/images/common/close.png" alt="닫기"/></button>
        </div>
        <div class="pop-cont">
            <c:out value="${mainForm.popup_cn}" escapeXml="false" />                
        </div>
        <div class="pop-footer">
            <div class="check-cont">
                <input type="checkbox" class="check-box" onclick="gfnCloseWin('pop<c:out value="${mainForm.popup_no}" />')" id="pop" style="vertical-align: middle;" /> 
                <label>오늘하루 열지 않기</label>
            </div>
        </div>
    </div>
