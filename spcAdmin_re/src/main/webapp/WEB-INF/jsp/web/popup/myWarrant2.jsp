
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
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>


<style>
@page{
	size:A4
}
@media print{
	html, body{
		width:210mm;
		-webkit-print-color-adjust:exact;
	}
}
body{
	width:100%;
	min-width:810px;
}
.warrant-wrap{width: 670px; height: 1000px; position: relative; margin: 20px; padding: 50px;}
.warrant-wrap.number{background: url(../images/common/02bg.jpg) no-repeat center center; background-size: cover;}
.warrant-wrap .warrant-tit{font-size: 70px;font-weight: 600; font-family: batang; color: #333; text-align: center; line-height: 54px; padding-top: 120px; letter-spacing: 8px;}

.warrant-wrap .warrant-cont2{padding: 110px 60px;}
.warrant-wrap .warrant-cont2 p{margin-bottom: 55px; font-size: 25px; font-weight: 500; line-height: 24px; text-align: center; color: #333;}
.warrant-wrap .warrant-cont2 p span{padding: 0px 3px 0px 0px; font-weight: 700; color: #000;}

.warrant-wrap .warrant-cont2 .name{}
.warrant-wrap .warrant-cont2 .title{}
.warrant-wrap .warrant-cont2 .subtitle{}
.warrant-wrap .warrant-cont2 .des{text-align: center; font-size: 18px; line-height: 30px; font-weight: 400;}
.warrant-wrap .warrant-cont2 .date{text-align: center;}
.warrant-wrap .warrant-cont2 .date span{padding: 0px 3px 0px 10px;}
.warrant-wrap .warrant-cont2 .date span:first-child{padding: 0px 3px 0px 0px;}

.warrant-wrap .warrant-foot2{padding: 0px 10px; text-align: right;}
.warrant-wrap .warrant-foot2 span{font-size: 20px; line-height: 30px; font-weight: 600; color: #000;}
.warrant-wrap .warrant-foot2 img{width: 32%; max-width: 300px;}
</style>
 <script type="text/javaScript" language="javascript" defer="defer">

 $(document).ready(function(){	
	 var nameList = opener.nameArr();
	 var entrpsList = opener.entrpsArr();
	 var printHtml = $("#warrant_shot").html();
	 for(var i=0;i<nameList.length;i++){
		 $("#printDiv").append('<div id="warrant_shot" class="warrant-wrap number" >'+printHtml+'</div>');
	 }
	 
	 for(var j=0;j<$("span[name=name]").length;j++){
		 $("span[name=name]").eq(j).text(nameList[j]);
		 $("span[name=entrps]").eq(j).text(entrpsList[j]);
	 }
	 //eq(1).text("11");
	 //alert(nameList);
	 //alert(entrpsList);
	 //imgShot();
 });
 
 window.onbeforeprint = beforePrint;
 window.onafterprint = afterPrint;
 
 function beforePrint(){
	$("#printbtn").hide(); 
	$("#warrant_shot").hide(); 
 }
 
 function afterPrint(){
	 $("#printbtn").show();
	 $("#warrant_shot").show(); 
 }
 
 function printPage(){
	 window.print();
 }
</script>
<input type="hidden" id="print_name" name="print_name" value="${result.USER_NM}">
<input type="hidden" id="print_url" name="print_url">
<button id="printbtn" type="button" onClick="printPage();" class="sm-btn white-btn">프린트 출력</button>
<div id="warrant_shot" class="warrant-wrap number" >
    <h1 class="warrant-tit">수료증</h1>

    <div class="warrant-cont2">
        <p class="name" style="text-align:right;"><span name="name">홍길동</span>님</p>
        <p class="title">교육명 :<span>${result.CATEGORY3_NAME}</span></p>
        <p class="subtitle"><span name="entrps">서울 강남 역삼보건소</span></p>
        <p class="des">에 시행하는 ○○○○ ○ ○○○○ ○○ ○○○<br/>○○○○ ○○○○ ○○ ○○ ○○ ○○<br/>○○○○○○○○○ ○○○○ ○○○ ○○○<br/>이 수료증을 드립니다.</p>
        <p class="date"><span>${result.DATE1}</span></p>
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
<div id="printDiv">
</div>

		<!-- <button type="button" onClick="downloadURI();" class="sm-btn white-btn">다운로드</button> -->
    <%-- <!--  class-wrap begin -->
            <div class="class-wrap">
				<div class="name">${result.USER_NM} 님</div>
                <img src="../images/common/01bg.jpg" style="width:800px;">
                    
            </div>
            <!--  class-wrap end --> --%>