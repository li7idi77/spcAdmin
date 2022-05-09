
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="//vjs.zencdn.net/7.8.4/video-js.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
<script src="//vjs.zencdn.net/7.8.4/video.js"></script>


 
    <!--  class-wrap begin -->
            <div class="class-wrap">
            	<input type="hidden" id="user_id" name="user_id" value="${UserAccount.user_id}">
            	<input type="hidden" id="edu_no" name="edu_no" value="${result.EDU_NO}">
            	<input type="hidden" id="edu_sub_no" name="edu_sub_no" value="${edu_sub_no}">
            	<input type="hidden" id="cour_no" name="cour_no" value="${cour_no}">
            	<input type="hidden" id="cour_time" name="cour_time" value="${result.COUR_TIME}">
            	<input type="hidden" id="cour_stat" name="cour_stat" value="${result.COUR_STAT}">
            	
            	<input type="hidden" id="finish" name="finish">
				<video id="myvideo" class="video-js vjs-big-play-centerd" controls preload="auto" width="1200" height="600" data-setup="{'autoplay': true}">
					<source src="http://14.32.115.22:8001/lmseditor/video/1.mp4" type="video/mp4" />
				</video>
            </div>
            <!--  class-wrap end -->
            <script>
 if(document.getElementById("myvideo")){
		videojs("myvideo").ready(function(){
			var myPlayer = videojs('myvideo');
			var currentTime = 0;
			if($("#cour_time").val() != ""){
				
				
				//myPlayer.play();
				/* if(confirm("최종 수강한 위치에서부터 이어보기를 하시겠습니까?")){
					myPlayer.currentTime(30.0000);
					myPlayer.play();
				}else{
					alert(0);
					myPlayer.currentTime(0);
				} */
				
			}
			myPlayer.on("play", function(event){
				if(confirm("이어서 보시겠습니까?")){
					currentTime = $("#cour_time").val();
					myPlayer.currentTime(currentTime);
				}
			});
			
			/* myPlayer.on("seeking", function(event){
				if(currentTime < myPlayer.currentTime()){
					myPlayer.currentTime(currentTime);
				}
			});
			myPlayer.on("seeked", function(event){
				if(currentTime < myPlayer.currentTime()){
					myPlayer.currentTime(currentTime);
				}
			}); */
			myPlayer.on('ended', function() {
				classUpdate(1);
				$("#finish").val("Y");
				alert("해당 차시 학습이 완료 되었습니다.");
				//if(Number($("#step").val()) > Number($("#movie").val())){
					
					/* if(confirm("다음 영상으로 넘어 가시겠습니까?")){
						var nextMovie = Number($("#movie").val())+1;
						$("#movie").val(nextMovie);
					   myPlayer.src({"type":"video/mp4", "src":"/video/"+nextMovie+".mp4"});
					   myPlayer.play(); 
					} */
				/* }else{
					
				} */
	         });
			setInterval(function(){
				if(!myPlayer.paused()){
					currentTime = myPlayer.currentTime();
				}
			},1000);
		  });
	}
 $(window).bind("beforeunload", function (){
		if($("#finish").val() != "Y"){
			videojs("myvideo").ready(function(){
				classUpdate(2);
			});
			return "해당 시청기록은 저장 됩니다.\n 정말 종료 하시겠습니까?";
		}
	});
 function classUpdate(stat){
	 videojs("myvideo").ready(function(){
		 var myPlayer = this;
		 var curTime = myPlayer.currentTime();
		 $.ajax({
			type: "POST",
			url: "<c:url value='/my/onclassUpdate.do'/>",
			cache: false,
			async: false,
			data: { cour_no: $("#cour_no").val(),edu_sub_no: $("#edu_sub_no").val(),edu_no: $("#edu_no").val(),cour_time: curTime,cour_stat: stat},
			dataType: "json",
			success: function(data) {
				/* opener.location.reload();
				if(data.result == "SUCCESS") {
					if(confirm("다음 영상으로 넘어 가시겠습니까?")){
						var nextMovie = Number($("#movie").val())+1;
						//$("#movie").val(nextMovie);
					   myPlayer.src({"type":"video/mp4", "src":"/video/"+nextMovie+".mp4"});
					   myPlayer.play(); 
					}
				}else{
					alert("수강정보 업데이트 도중 에러발생.");
				} */
			}
		});
	 });
 }

</script>