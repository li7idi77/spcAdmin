
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
.warrant-tit{font-size: 60px;font-weight: 600; font-family: batang; color: #333; text-align: center; line-height: 120px; padding-top: 200px; letter-spacing: 8px;}

.warrant-num{font-size: 16px; font-weight: 400; line-height: 24px; text-align: left; color: #333;}
.warrant-num span{font-weight: 500;}

.warrant-cont{padding: 55px 130px;}
.warrant-cont p{margin-bottom: 45px; font-size: 25px; font-weight: 500; line-height: 34px; text-align: left; color: #333; text-align:center;}
.warrant-cont p span{padding: 0px 3px 0px 0px; font-weight: 700; color: #000;}

.warrant-cont .name{text-align:right;}
.warrant-cont .title{}
.warrant-cont .des{text-align: center; font-size: 23px; line-height: 40px; font-weight: 400;}
.warrant-cont .date{text-align: center;}
.warrant-cont .date span{padding: 0px 3px 0px 10px;}
.warrant-cont .date span:first-child{padding: 0px 3px 0px 0px;}
.warrant-foot{
	margin-left:360px;
}
</style>
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
<input type="hidden" id="print_name" name="print_name" value="${result.USER_NM}">
<input type="hidden" id="print_url" name="print_url">
<div id="warrant_shot" class="warrant-wrap general" style="width:800px;height:1100px;">
    <h1 class="warrant-tit">수료증</h1>

    <div class="warrant-cont">
        <p class="name"><span>${result.USER_NM}</span>님</p>
        <p class="title">교육명 :<span> ${result.CATEGORY3_NAME}</span></p>
        <p class="des">한국생명존중희망재단에서 시행하는 <br/>생명지킴이교육을 성실하게 마쳤으며,<br/>향후 생명지킴이로서의 역할을 충실히 <br/>이행할 준비가 되어 있으므로 이 수료증을 드립니다.</p>
        <p class="date"><span>${result.DATE1}</span></p>
    </div>

    
</div>
<div class="warrant-foot">
		<button type="button" onClick="downloadURI();" class="sm-btn white-btn">다운로드</button>
    </div>
    <%-- <!--  class-wrap begin -->
            <div class="class-wrap">
				<div class="name">${result.USER_NM} 님</div>
                <img src="../images/common/01bg.jpg" style="width:800px;">
                    
            </div>
            <!--  class-wrap end --> --%>