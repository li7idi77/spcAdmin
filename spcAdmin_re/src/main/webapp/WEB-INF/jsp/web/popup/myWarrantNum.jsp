
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
.general {
	background:url(../images/common/01bg.jpg) no-repeat center center;
	background-size:contain;
}
.number{
	background:url(../images/common/02bg.jpg) no-repeat center center;
	background-size:contain;
}
.warrant-tit{font-size: 60px;font-weight: 600; font-family: batang; color: #333; text-align: center; line-height: 120px; padding-top: 150px; letter-spacing: 8px;}

.warrant-num{font-size: 16px; font-weight: 400; line-height: 24px; text-align: left; color: #333;padding-top:50px;padding-left:65px;}
.warrant-num span{font-weight: 500;}

.warrant-cont{padding: 55px 130px;}
.warrant-cont p{margin-bottom: 45px; font-size: 25px; font-weight: 500; line-height: 34px; text-align: left; color: #333;}
.warrant-cont p span{padding: 0px 3px 0px 0px; font-weight: 700; color: #000;}

.warrant-cont .title{}
.warrant-cont .des{text-align: center; font-size: 23px; line-height: 40px; font-weight: 400;}
.warrant-cont .date{text-align: center;}
.warrant-cont .date span{padding: 0px 3px 0px 10px;}
.warrant-cont .date span:first-child{padding: 0px 3px 0px 0px;}
.warrant-foot{padding: 50px 70px; text-align: center;margin-left:90px;}
.warrant-foot span{font-size: 25px; line-height: 30px; font-weight: 600; color: #000;}
.warrant-foot img{width: 15%; max-width: 300px;}
/* .warrant-foot{
	margin-left:360px;
} */
</style>
 <script type="text/javaScript" language="javascript" defer="defer">

 $(document).ready(function(){		
	 if($("#license_chk").val() == ""){
		 alert("해당 수료증 발급이 되지 않았습니다.");
		 self.close();
	 }
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

<div id="warrant_shot" class="warrant-wrap number" style="width:800px;height:1100px;">
    <p class="warrant-num">교육 제 <span>${result.NOWYEAR}</span> - <span>${result.LICENSE_NUMBER}</span> 호</p>
    <h1 class="warrant-tit">수료증</h1>

	<div class="warrant-cont">
        <p class="title">분야 : <span>${result.LICENSE_FIELD}</span></p>
        <p class="title mb10">소속 :<span>${result.COPER_NM}</span></p>
        <p class="name">이름 : <span>${result.USER_NM}</span></p>
        <p class="des">귀하는 한국생명존중희망재단에서 실시한<br/>전문가 양성과정 (<span>${result.LICENSE_FIELD}</span>) 교육을<br/>수료하였기에 이 증서를 수여합니다.</p>
        <p class="date mb0"><span>${result.DATE2}</span></p>
    </div>

    <div class="warrant-foot">
        <span>한국생명존중희망재단 이사장</span>
        <img src="${pageContext.request.contextPath}/images/common/stamp.png" alt="생명존중희망재단 이사장인"/>
    </div>
</div>
<div class="warrant-foot2">
		<button type="button" onClick="downloadURI();" class="sm-btn white-btn">다운로드</button>
    </div>
    <%-- <!--  class-wrap begin -->
            <div class="class-wrap">
				<div class="name">${result.USER_NM} 님</div>
                <img src="../images/common/01bg.jpg" style="width:800px;">
                    
            </div>
            <!--  class-wrap end --> --%>