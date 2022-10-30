
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

	 $('.basket').bind('click', function(){
		var frm = document.commonForm;
		<c:if test="${empty sessionId }">
		 alert('해당 교육은 회원 가입 후 사용이 가능합니다.\n회원 가입 후 이용해 주시기 바랍니다.');
		 return;
		</c:if>
			
		var edu_no      = $(this).data('no');
		var schedule_no = $(this).data('schedule_no');
		$("#edu_no").val(edu_no);
	  	$("#schedule_no").val(schedule_no);
	  	$("#gubun2").val('basket'); 
	  	var msg = "장바구니에 담겠습니까?";
		var yn = confirm(msg);	
		if(yn){
				
			$.ajax({	
				data     : $("#commonForm").serialize(),
			    url		 : "<c:url value='/user/lifeEduOnLineSave.do'/>",
		        dataType : "JSON",
		        cache    : false,
		        async    : false,
				type	 : "POST",	
		        success  : function(obj) {
		        	commonCallBack(obj);				
		        },	       
		        error 	: function(xhr, status, error) {} 		        
		    });
		}	 
		
		function commonCallBack(obj){
			
			if(obj != null){		
				var result = obj.result;			
				if(result == "SUCCESS"){				
					alert("장바구니에 담았습니다.");				
				} else if(result == "EXIST"){				
					alert("이미 담겼습니다.");	
					return false;
				}else {				
					alert("등록이 실패 했습니다.");	
					return false;
				}
			}
		}
	});
	 
	$('.course').bind('click', function(){
		var frm = document.commonForm;
		<c:if test="${empty sessionId }">
		 alert('해당 교육은 회원 가입 후 사용이 가능합니다.\n회원 가입 후 이용해 주시기 바랍니다.');
		 return;
		</c:if>
		
		var edu_no      = $(this).data('no');
		var schedule_no = $(this).data('schedule_no');
		$("#edu_no").val(edu_no);
	  	$("#schedule_no").val(schedule_no);
		 
		frm.action = "<c:url value='/user/lifeEduOrgReg.do'/>";
		frm.submit();	 
	});
	 
	 $("#train_e_date, #train_s_date").datepicker({
		dateFormat: 'yy-mm-dd' //달력 날짜 형태
	    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "<c:url value='/images/common/ico_calendar.png'/>" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
 	});
 });
 
 
 
 function fn_search(){
	 var frm = document.commonForm;

	 
	 var sort_ordr = $("select[name=sort_ordr] option:selected").val();  // 정렬		
  	 var searchCondition = $("select[name=searchCondition] option:selected").val();  //검색조건		
  	 var gubun3 = $("#gubun3").val();
  	 $("#gubun2").val(gubun3); 
  	 $("#sort_ordr").val(sort_ordr);
  	 $("#searchCondition").val(searchCondition);
	    
	 frm.action = "<c:url value='/user/lifeEduOrgList02.do'/>";
	 frm.submit();
}
 
 /* pagination 페이지 링크 function */
 function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 var gubun3 = $("#gubun3").val();
  	 $("#gubun2").val(gubun3); 
	 var sort_ordr = $("select[name=sort_ordr] option:selected").val();  // 정렬		
  	 var searchCondition = $("select[name=searchCondition] option:selected").val();  //검색조건		
  	 
  	 $("#sort_ordr").val(sort_ordr);
  	 $("#searchCondition").val(searchCondition);
  	 
	 $("#pageIndex").val(pageNo); 
	 frm.action = "<c:url value='/user/lifeEduOrgList02.do'/>";
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
        
        	<div class="tab-cont">
                 <ul>
                     <li class="on"><a href="${pageContext.request.contextPath}/user/lifeEduOrgList.do">교육 신청 방법</a></li>
                     <li class="on">교육 신청</li>
                 </ul>
             </div>
             
            <!---- search-wrap begin ---->
            <form  id="commonForm" name="commonForm"  method="post"  action="">
			<input type="hidden" id="gubun1"      name="gubun1"      value='I'/>
		    <input type="hidden" id="gubun2"      name="gubun2"      value='${categoryVo.gubun2}'  />	
		    <input type="hidden" id="gubun3"      name="gubun3"      value='${categoryVo.gubun2}'  />
		    <input type="hidden" id="edu_site"    name="edu_site"    value='${categoryVo.edu_site}'/>
		    <input type="hidden" id="edu_no"      name="edu_no"      value=0 />
		    <input type="hidden" id="schedule_no" name="schedule_no" value=0 />
		    <input type="hidden" id="pageIndex"   name="pageIndex"   value=1 />	
		    
            <div class="search-wrap">
				<div class="search-cont">
                     <label>교육일 :</label>
                     <div class="radio-cont">
                         <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="ALL"   <c:if test="${categoryVo.checkdate =='ALL'  }">checked </c:if>  >
                         <label for="dateAll">전체</label>
                     </div>
                       
                     <div class="radio-cont">
                         <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TODAY"  <c:if test="${categoryVo.checkdate =='TODAY'}">checked </c:if>  >
                         <label for="dateToday">오늘</label>
                     </div>
                     
                     <div class="radio-cont mr10">
                         <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TERM" <c:if test="${categoryVo.checkdate =='TERM'}">checked </c:if>  >
                         <label for="dateTerm">기간선택</label>
                     </div>
                     <div class="picker-wrap">
                         <input type="text"  id="train_s_date" name="train_s_date" readonly value="${categoryVo.train_s_date}" class="input-box"/>
                         <span class="next-ico">-</span>
                         <input type="text"  id="train_e_date" name="train_e_date" readonly value="${categoryVo.train_e_date}" class="input-box"/>
                     </div>
                 </div>
                <div class="search-cont">
                    <label>검색 :</label>
                    <select id="searchCondition"     name="searchCondition" class="select">
                        <option value="CATEGORY3_NAME" <c:if test="${categoryVo.searchCondition =='CATEGORY3_NAME'}">selected </c:if>>교육명</option>
                        <option value="COPER_NM"   <c:if test="${categoryVo.searchCondition =='COPER_NM'}">selected </c:if>>교육기관</option>
                    </select>
                    <input id="searchKeyword" name="searchKeyword" type="text" value='${categoryVo.searchKeyword}' class="input-box" placeholder="직접입력"/>
                </div>
                <div class="btn-cont">
                    <button type="submit" onClick="fn_search()" class="lg-btn orange-btn">검색</button>
                    <button type="button"  class="lg-btn navy-btn" onClick="fn_clear();">초기화</button>
                </div>
         </div>
      
         <!---- search-wrap end ---->

         <!---- sub-cont begin ---->
          <div class="tit-cont">
              <p class="total">전체 : <span>${paginationInfo.totalRecordCount}</span>건</p>
              <select class="select" id="sort_ordr" name="sort_ordr" onChange="fn_search();">
                  <option value="TRAIN_S_DATE" <c:if test="${categoryVo.sort_ordr =='TRAIN_S_DATE'}">selected </c:if>> 교육기간순</option>
                  <option value="REG_DT"       <c:if test="${categoryVo.sort_ordr =='REG_DT'}">selected </c:if>>교육등록순</option>
              </select>
          </div>
          <!---- sub-cont end ---->
		 </form>
		 
          <div class="list-wrap">
              <ul>
              	<c:forEach var="result" items="${resultList}" varStatus="status">
                  <li>
                   <c:if test="${result.category1_name =='일반'}">
                   	<span class="badge-normal">일반</span>
                   </c:if>
                   <c:if test="${result.category1_name =='기관'}">
                   	<span class="badge-org">기관</span>
                   </c:if>
                   <c:if test="${result.category1_name =='강사'}">
                   	<span class="badge-instruct">강사</span>
                   </c:if>
                   <c:if test="${result.category1_name =='실무자'}">
                   	<span class="badge-worker">실무자</span>
                   </c:if>               
                    
                    <span class="tag">${result.category2_name}</span>
                    <h3 class="h3-tit" data-no="${result.edu_key}" data-site="${result.edu_site }"  >${result.category3_name}</h3>
                     <div class="btn-cont">
                       <button class="sm-btn white-btn  basket" data-no="${result.edu_key}" data-schedule_no="${result.schedule_no }" >장바구니</button>
                       <button class="sm-btn orange-btn course" data-no="${result.edu_key}" data-schedule_no="${result.schedule_no }" >수강신청</button>
                   </div>
                    <ul class="summary-cont">
                        <li>
                            <label>교육기관 :</label>
                            <span>${result.coper_nm}</span>
                        </li>
                        <li>
                            <label>교육대상 :</label>
                            <span>${result.edu_target}</span>
                        </li>
                        <li>
                            <label>교육일시:</label>
                            <span>${result.train_s_date}</span></span>
                        </li>
                        <li>
                            <label>교육시간:</label>
                            <span>${result.edu_time}</span>분
                        </li>
                        <li>
                            <label>교육인원 :</label>
                            <span>${result.edu_garden}명</span>
                        </li>
                        <li>
                            <label>교육장소 :</label>
                            <span>${result.edu_place}</span>
                        </li>
                    </ul>
                  </li>
                </c:forEach>
              </ul>
          </div>

           <!---- page begin ---->
           <div class="page-wrap">
               <ul class="paging">
    			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
  	  		 </ul>
           </div>
           <!---- page end ---->

        </div>
    </div>
    <!--  container end -->
           