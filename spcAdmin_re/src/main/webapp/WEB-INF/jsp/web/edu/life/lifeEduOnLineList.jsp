
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
            <h1 class="h1-tit">온라인 생명 지킴이 교육</h1>
            <div class="side-cont">
                <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>생명지킴이교육</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>교육신청</span>
                <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                <span>온라인 생명 지킴이 교육</span>
            </div>
        </div>

        <div class="contents-wrap">
            <!---- search-wrap begin ---->
            <form  id="commonForm" name="commonForm"  method="post"  action="">
			<input type="hidden" id="gubun1"     name="gubun1"    value='I'/>
		    <input type="hidden" id="gubun2"     name="gubun2"    value='${categoryVo.gubun2}'  />	
		    <input type="hidden" id="edu_site"   name="edu_site"  value='${categoryVo.edu_site}'/>
		    <input type="hidden" id="edu_no"     name="edu_no"    value=0 />
		    <input type="hidden" id="pageIndex"  name="pageIndex" value=1 />	
		    <input type="hidden" id="category1_name"  name="category1_name" />	
		    <input type="hidden" id="category2_name"  name="category2_name" />	
		    <input type="hidden" id="category3_name"  name="category3_name" />	
		    
            <div class="search-wrap">
                <div class="search-cont">
                    <label>분류 :</label>
                    <select class="select" id="category1_key" name="category1_key">
                        <option value=''>선택 하세요</option>
                    	<c:forEach var="result" items="${category1list}" varStatus="status">
                        	<option value='${result.code_cd}' <c:if test="${categoryVo.category1_name == result.code_name}">selected </c:if> >${result.code_name}</option>
                        </c:forEach>
                    </select>                   
                    <select class="select" id="category2_key" name="category2_key">
                        <option value=''>선택 하세요</option>
                    	<c:forEach var="result" items="${category2list}" varStatus="status">
                        	<option value='${result.code_cd}' <c:if test="${categoryVo.category2_name == result.code_name}">selected </c:if>>${result.code_name}</option>
                        </c:forEach>
                    </select>
                    <select class="select" id="category3_key" name="category3_key">
                        <option value=''>선택 하세요</option>
                    	<c:forEach var="result" items="${category3list}" varStatus="status">
                        	<option value='${result.code_cd}' <c:if test="${categoryVo.category3_name == result.code_name}">selected </c:if> >${result.code_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="search-cont">
                    <label>기타 :</label>
                    <select id="searchCondition"     name="searchCondition" class="select">
                        <option value="CATEGORY3_NAME" <c:if test="${categoryVo.searchCondition =='CATEGORY3_NAME'}">selected </c:if>>교육명</option>
                        <option value="INST_NM"        <c:if test="${categoryVo.searchCondition =='INST_NM'}">selected </c:if>>강사명</option>
                    </select>
                    <input id="searchKeyword" name="searchKeyword" type="text" value='${categoryVo.searchKeyword}' class="input-box" placeholder="직접입력"/>
                </div>
                <div class="btn-cont">
                    <button type="submit" onClick="fn_search()" class="lg-btn orange-btn">검색</button>
                    <button type="reset"  class="lg-btn navy-btn">초기화</button>
                </div>
         </div>
      
         <!---- search-wrap end ---->

         <!---- sub-cont begin ---->
          <div class="tit-cont">
              <p class="total">전체 : <span>${paginationInfo.totalRecordCount}</span>건</p>
              <select class="select" id="sort_ordr" name="sort_ordr">
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
                    <h3 class="h3-tit" data-no="${result.edu_no}" data-site="${result.edu_site }"  >${result.category3_name}</h3>
                    <ul class="summary-cont">
                        <li>
                            <label>교육대상 :</label>
                            <span>${result.edu_method}</span>
                        </li>
                        <li>
                            <label>교육인원 :</label>
                            <span>${result.edu_garden}</span>명
                        </li>
                        <li>
                            <label>교육기간 :</label>
                            <span>${result.train_s_date}</span>~<span>${result.train_e_date}</span>
                        </li>
                        <li>
                            <label>학습시간 :</label>
                            <span>${result.edu_time}</span>분
                        </li>
                        <li>
                            <label>강사명 :</label>
                            <span>${result.inst_nm}</span>
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
           