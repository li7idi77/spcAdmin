
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <script type="text/javaScript" language="javascript" defer="defer">
 <!--
 $(document).ready(function(){
	 $('.h3-tit').bind('click', function(){
		 var site = $(this).data('site');
		 var no = $(this).data('no');
		 $("#edu_site").val(site);
	     $("#edu_no").val(no);
		 $("#category1_key").val(0);
 		 $("#category2_key").val(0);
		 $("#category3_key").val(0);
		 
		 var frm = document.commonForm;
		 frm.action = "<c:url value='/user/lifeEduOnLineInfo.do'/>";
	   	 frm.submit();	   	 
	});
 });
 
 function fn_search(){
	 var frm = document.commonForm;
	 var category1_key = $("select[name=category1_key] option:selected").val();  //교육분류1
     var category2_key = $("select[name=category2_key] option:selected").val();  //교육분류2
  	 var category3_key = $("select[name=category3_key] option:selected").val();  //교육명		
  	 
  	 var sort_ordr = $("select[name=sort_ordr] option:selected").val();  // 정렬		
  	 var searchCondition = $("select[name=searchCondition] option:selected").val();  //검색조건		
  	 
  	 $("#sort_ordr").val(sort_ordr);
  	 $("#searchCondition").val(searchCondition);
  	 
  	 if (category1_key == ""){			
	   $("#category1_key").val(0);
	 }
	 if (category2_key == ""){			
		$("#category2_key").val(0);
	 }
	
	 if (category3_key == ""){			
		$("#category3_key").val(0);
	 }	
	 
	 var category1_name = $("select[name=category1_key] option:selected").text();  //교육분류1
	 var category2_name = $("select[name=category2_key] option:selected").text();  //교육분류1
	 var category3_name = $("select[name=category3_key] option:selected").text();  //교육분류1
	
	 $("#category1_name").val(category1_name);
	 $("#category2_name").val(category2_name);
	 $("#category3_name").val(category3_name);
	    
	 frm.action = "<c:url value='/user/lifeEduOnLineList.do'/>";
	 frm.submit();
}
 
 /* pagination 페이지 링크 function */
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 var category1_key = $("select[name=category1_key] option:selected").val();  //교육분류1
     var category2_key = $("select[name=category2_key] option:selected").val();  //교육분류2
  	 var category3_key = $("select[name=category3_key] option:selected").val();  //교육명		   
  	 
  	var category1_name = $("select[name=category1_key] option:selected").text();  //교육분류1
    var category2_name = $("select[name=category2_key] option:selected").text();  //교육분류1
    var category3_name = $("select[name=category3_key] option:selected").text();  //교육분류1
  	
    $("#category1_name").val(category1_name);
    $("#category2_name").val(category2_name);
    $("#category3_name").val(category3_name);
  	   
  	 if (category1_key == ""){			
	   $("#category1_key").val(0);
	 }
	 if (category2_key == ""){			
		$("#category2_key").val(0);
	 }
	
	 if (category3_key == ""){			
		$("#category3_key").val(0);
	 }	
	 $("#pageIndex").val(pageNo); 
	 frm.action = "<c:url value='/user/lifeEduOnLineList.do'/>";
   	 frm.submit();
 }
     //-->
 </script>
	
		   
		    <!-- container  begin -->
    <div id="container">

        <div class="tit-wrap">
            <h1 class="h1-tit">기관 생명 지킴이 교육</h1>
            <div class="side-cont">
                <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>생명지킴이교육</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>교육신청</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>기관 생명 지킴이 교육</span>
            </div>
        </div>

        <div class="contents-wrap">
             <!---- tab-cont begin ---->
             <div class="tab-cont">
                 <ul>
                     <li class="on">교육 신청 방법</li>
                     <li><a href="${pageContext.request.contextPath}/user/lifeEduOrgList02.do">교육 신청</a></li>
                 </ul>
             </div>
             <!---- tab-cont end ---->

             <img class="img-box" src="${pageContext.request.contextPath}/user/images/contents/step_cont_default.png" alt="기관 생명 지킴이 교육 절차"/>
             
         </div>

        </div>
    </div>
    <!--  container end -->
           