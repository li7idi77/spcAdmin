
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<c:url value='/css/admin.css' />" rel="stylesheet" type="text/css">
<style>
body {
	min-width:800px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>


 <script type="text/javaScript" language="javascript" defer="defer">

 $(document).ready(function(){	
	 imgShot();
 });
 function imgShot(){
	 html2canvas(document.querySelector("#warrant_shot")).then(canvas => {
		   document.body.appendChild(canvas)
		   $("#print_url").val(canvas.toDataURL());
	});
	 $("#warrant_shot").hide();
 }

 
 function downloadURI(){
	 var uri = $("#print_url").val();
	 var name = $("#print_name").val()+"님_수료증.png";
     var link = document.createElement("a")
     link.download = name;
     link.href = uri;
     document.body.appendChild(link);
     link.click();
 }
</script>
<input type="hidden" id="license_chk" name="license_chk" value="${result.LICENSE_CHK}">
<input type="hidden" id="print_name" name="print_name" value="${result.USER_NM}">
<input type="hidden" id="print_url" name="print_url">
<button type="button" onClick="downloadURI();" class="sm-btn white-btn">다운로드</button>
<div id="warrant_shot" class="warrant-wrap number" >
    <h1 class="warrant-tit">수료증</h1>

    <div class="warrant-cont2">
        <p class="name" style="text-align:right;"><span>${result.USER_NM}</span>님</p>
        <p class="title">교육명 :<span> ${result.CATEGORY3_NAME}</span></p>
        <p class="subtitle"><span>${result.COPER_NM}</span></p>
        <p class="des">에 시행하는 ○○○○ ○ ○○○○ ○○ ○○○<br/>○○○○ ○○○○ ○○ ○○ ○○ ○○<br/>○○○○○○○○○ ○○○○ ○○○ ○○○<br/>이 수료증을 드립니다.</p>
        <p class="date"><span>${result.NOWDATE}</span></p>
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