
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
.warrant-wrap{width: 515px; height: 762px; position: relative; margin: 0 auto; padding: 40px 40px;}
.warrant-wrap.number{background: url(../images/common/02bg.jpg) no-repeat center center; background-size: cover;}
.warrant-wrap.number .warrant-tit{padding-top: 85px;}
.warrant-wrap .warrant-tit{font-size: 40px;font-weight: 600; font-family: batang; color: #333; text-align: center; line-height: 54px; padding-top: 120px; letter-spacing: 8px;}

.warrant-wrap .warrant-cont2{padding: 55px 70px;}
.warrant-wrap .warrant-cont2 p{margin-bottom: 45px; font-size: 16px; font-weight: 500; line-height: 24px; text-align: center; color: #333;}
.warrant-wrap .warrant-cont2 p span{padding: 0px 3px 0px 0px; font-weight: 700; color: #000;}

.warrant-wrap .warrant-cont2 .name{}
.warrant-wrap .warrant-cont2 .title{}
.warrant-wrap .warrant-cont2 .subtitle{}
.warrant-wrap .warrant-cont2 .des{text-align: center; font-size: 18px; line-height: 30px; font-weight: 400;}
.warrant-wrap .warrant-cont2 .date{text-align: center;}
.warrant-wrap .warrant-cont2 .date span{padding: 0px 3px 0px 10px;}
.warrant-wrap .warrant-cont2 .date span:first-child{padding: 0px 3px 0px 0px;}

.warrant-wrap .warrant-foot2{padding: 0px 50px; text-align: right;}
.warrant-wrap .warrant-foot2 span{font-size: 20px; line-height: 30px; font-weight: 600; color: #000;}
.warrant-wrap .warrant-foot2 img{width: 32%; max-width: 300px;}
</style>
 <script type="text/javaScript" language="javascript" defer="defer">

 $(document).ready(function(){	
	 var nameList = opener.nameArr();
	 var entrpsList = opener.entrpsArr();
	 //alert(nameList);
	 //alert(entrpsList);
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
<input type="hidden" id="print_name" name="print_name" value="${result.USER_NM}">
<input type="hidden" id="print_url" name="print_url">
<div id="warrant_shot" class="warrant-wrap number" >
    <h1 class="warrant-tit">수료증</h1>

    <div class="warrant-cont2">
        <p class="name" style="text-align:right;"><span>홍길동</span>님</p>
        <p class="title">교육명 :<span>${result.CATEGORY3_NAME}</span></p>
        <p class="subtitle"><span>서울 강남 역삼보건소</span></p>
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

		<!-- <button type="button" onClick="downloadURI();" class="sm-btn white-btn">다운로드</button> -->
    <%-- <!--  class-wrap begin -->
            <div class="class-wrap">
				<div class="name">${result.USER_NM} 님</div>
                <img src="../images/common/01bg.jpg" style="width:800px;">
                    
            </div>
            <!--  class-wrap end --> --%>