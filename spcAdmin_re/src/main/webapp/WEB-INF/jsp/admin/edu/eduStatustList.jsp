
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
 <!--
    
     function fn_load(gubun2) {
    	var frm = document.commonForm;
    	
    	if(gubun2=='category4'){
    		frm.action = "<c:url value='/edu/eduInfoClassList.do'/>"; 
    	}    	
    	if(gubun2 !='category4'){
    		frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>"; 
    	}
    	if(gubun2=='category4'){
    		$("#gubun2").val("categoryClass");
    	} 
    	if(gubun2=='category5'){
    		$("#gubun2").val('category4');  
    	} 
    	if(gubun2=='category6'){
    		$("#gubun2").val('category5');  
    	} 

    	frm.submit();
     }
 
 	function fn_move(str) {
	  	var frm = document.commonForm;
	  	$("#gubun1").val("R"); 
		$("#site").val(str);  
	   	frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";
	  	frm.submit();
    }
     
 	function goOkPage(){	
		var frm = document.commonForm;
		frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";  
		frm.submit();
	}
	
     
    function fn_save(key1,key2, gubun2){
    		
 		var categoryName = $("#categoryName").val(); 		

 		if (categoryName == ""){			
 			alert("Category 이름을 입력해주세요.");
 			$("#categoryName").focus();
 			return;
 		}		
 		
 		$("#gubun1").val("I"); 
 		$("#gubun2").val(gubun2); 
 		$("#category1_key").val(key1); 
 		$("#category2_key").val(key2);
 	 	
 		var yn = confirm("카테고리를 등록 하시겠습니까?");		
 		if(yn){
 				
 			$.ajax({	
 				data     : $("#commonForm").serialize(),
 			    url		 : "<c:url value='/edu/eduInfoClassCateSave.do'/>", 
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
 	}	
 	/* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo){
    	var frm = document.commonForm;
    	$("#pageIndex").val(pageNo); 
    	frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";
       	frm.submit();
    }
 	
    function fn_edit(key1,key2,key3, name1,name2,idx,gubun1,gubun2){
 		
 		var categoryName = $("input[name=categoryname]:eq(" + idx + ")").val() ;
 		
 		if (categoryName == ""){			
 			alert("Category 이름을 입력해주세요.");
 			return;
 		}		
 
 		$("#category1_key").val(key1); 
 		$("#category2_key").val(key2); 
 		$("#category3_key").val(key3); 
 
 		
 		if(gubun2=='category4'){
 			$("#category1_name").val(categoryName); 
 		}else if(gubun2=='category5'){
 			$("#category1_name").val(name1);
 			$("#category2_name").val(categoryName); 
 		}else if(gubun2=='category6'){
 			$("#category1_name").val(name1);
 			$("#category2_name").val(name2); 
 			$("#category3_name").val(categoryName); 
 		}
 
 		$("#gubun1").val(gubun1); 
 		$("#gubun2").val(gubun2); 
 		
 		var msg = (gubun1=='E' ? "카테고리를 수정 하시겠습니까?" : "정말로 삭제 하시겠습니까?");
 		var yn = confirm(msg);		
 		if(yn){
 				
 			$.ajax({	
 				data     : $("#commonForm").serialize(),
 			    url		 : "<c:url value='/edu/eduInfoClassCateSave.do'/>",
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
  	}	
    
    function fn_regt(key1,key2,key3,name1,name2, idx,gubun1,gubun2){	
		var frm = document.commonForm;
		
		var categoryName = $("input[name=categoryname]:eq(" + idx + ")").val() ;
		
		$("#category1_key").val(key1); 
		$("#category2_key").val(key2);
		$("#category3_key").val(key3);
		
		$("#category1_name").val(name1);
		$("#category2_name").val(name2);
 		$("#category3_name").val(categoryName);
 		$("#gubun1").val(gubun1); 
 		$("#gubun2").val(gubun2);  
 		
 		frm.action = "<c:url value='/edu/eduInfoClassCate.do'/>";
 		
		frm.submit();
	}
    
 	function commonCallBack(obj){
 	
 		if(obj != null){		
 			
 			var result = obj.result;
 			
 			if(result == "SUCCESS"){				
 				alert("성공하였습니다.");				
 				goOkPage();				 
 			} else if(result == "EXIST"){				
 				alert("이미 등록 되었습니다.");	
 				return false;
 			}else {				
 				alert("등록이 실패 했습니다.");	
 				return false;
 			}
 		}
 	}	
     //-->
 </script>
 
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />
         	<h1 class="h1-tit">교육 신청 현황</h1>


         <div class="search-wrap">
             
             <div class="search-cont">
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="" checked>
                     <label for="">전체</label>
                 </div>
                 
                 <div class="radio-cont mr10">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <label for="">신청완료</label>
                 </div>

                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <label for="">신청취소</label>
                 </div>
                 
                 
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <label for="">교육완료/결과보고</label>
                 </div>
                 
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <label for="">보고완료</label>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">기관명</h3>

                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="" checked>
                     <label for="">전체</label>
                 </div>
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <input type="text" class="input-box" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">강사명</h3>

                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="" checked>
                     <label for="">전체</label>
                 </div>
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <input type="text" class="input-box" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">교육명</h3>

                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="" checked>
                     <label for="">전체</label>
                 </div>
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <input type="text" class="input-box" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont search-sub">
                 <h3 class="h3-tit">지역</h3>

                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="" checked>
                     <label for="">전체</label>
                 </div>
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="" name="" value="">
                     <input type="text" class="input-box" placeholder="직접입력"/>
                 </div>
             </div>

             <div class="search-cont">
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="dateAll" name="radioGroupDate" value="" checked>
                     <label for="dateAll">전체</label>
                 </div>
                   
                 <div class="radio-cont">
                     <input type="radio" class="radio-box" id="dateToday" name="radioGroupDate" value="">
                     <label for="dateToday">오늘</label>
                 </div>
                 
                 <div class="radio-cont mr10">
                     <input type="radio" class="radio-box" id="dateTerm" name="radioGroupDate" value="">
                     <label for="dateTerm">기간선택</label>
                 </div>
                 <div class="picker-wrap">
                     <input type="text" id="datepickerFrom" class="input-box"/>
                     <span class="next-ico">-</span>
                     <input type="text" id="datepickerTo" class="input-box"/>
                 </div>
                 
                 <button class="search-btn">검색</button>
                 <button class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
             </div>
             
         </div>
         
         <div class="btn-cont mb20">
             <dl class="count-txt">
                 <dt>전체 <span>115</span></dt>
                 <dt class="blue-txt">신청완료 <span>115</span></dt>
                 <dt class="red-txt">신청취소 <span>115</span></dt>
                 <dt class="green-txt">교육완료(결과보고) <span>115</span></dt>
                 <dt class="gray-txt">보고완료 <span>115</span></dt>
             </dl>

             <button class="mid-btn black-btn">엑셀다운</button>
             <button class="mid-btn white-btn">선택삭제</button>
         </div>
         
         <div class="table-wrap scroll-wrap">
             <table class="list-tb">
                 <caption>선택, 교육명, 교육일, 교육시간, 지역, 기관명, 교육개설 신청자, 교육대상, 교육장소, 교육인원, 강사(ID), 강사섭외 유무, 진행현황, 취소사유, 수정 정보가 있는 테이블</caption>
                 <colgroup>
                     <%-- <col width="3%"/> --%>
                     <col width="4%"/>
                     <col width="8%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="8%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="*"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                     <col width="6%"/>
                 </colgroup>
                 <thead>
                     <tr>
                         <!-- <th><input type="checkbox" class="check-box"/></th> -->
                         <th>No.</th>
                         <th>교육명</th>
                         <th>교육일</th>
                         <th>교육시간(분)</th>
                         <th>지역</th>
                         <th>기관명</th>
                         <th>교육개설<br/>신청자</th>
                         <th>교육대상</th>
                         <th>교육장소</th>
                         <th>교육인원</th>
                         <th>강사(ID)</th>
                         <th>강사 섭외<br/>유무</th>
                         <th>진행현황</th>
                         <th>취소사유</th>
                         <th>수정</th>
                     </tr>
                 </thead>
                 <tbody>
                 <c:forEach var="result" items="${resultList}" varStatus="status">
                     <tr>
                         <!-- <td><input type="checkbox" class="check-box"/></td> -->
                         <td>${status.index + 1}</td>
                         <td class="tl">${result.EDU_NAME}</td>
                         <td>${result.EDU_DATE}</td>
                         <td>${result.EDU_TIME}</td>
                         <td>${result.AREA_NM}</td>
                         <td>${result.EDU_ORG_NAME}</td>
                         <td>${result.USER_NM}</td>
                         <td>${result.EDU_TARGET}</td>
                         <td>${result.EDU_PLACE}</td>
                         <td><span>${result.EDU_NUMBER}</span></td>
                         <td><span class="block">${result.EDU_TEAC_NAME}</span><span  class="block">${result.EDU_TEAC_ID}</span></td>
                         <td><c:if test="${result.INS_STATUS == '완료'}"><span>완료</span></c:if>
                         	 <c:if test="${result.INS_STATUS != '완료'}"><span class="link">섭외중</span></c:if>
                         </td>
                         <td><c:if test="${result.SCH_STATUS == '신청완료'}"><span class="blue-txt">신청완료</span></c:if>
	                         <c:if test="${result.SCH_STATUS == '신청취소'}"><span class="red-txt">신청취소</span></c:if>
	                         <c:if test="${result.SCH_STATUS == '교육완료'}"><span class="green-txt">교육완료(결과보고)</span></c:if>
	                         <c:if test="${result.SCH_STATUS == '보고완료'}"><span class="gray-txt">보고완료</span></c:if>
                         </td>
                         <td><c:if test="${result.CANCEL_REASON != null}"><button class="sm-btn white-btn">보기</button></c:if></td>
                         <td><button class="sm-btn blue-btn">수정</button></td>
                     </tr>
                 </c:forEach>
                 <c:if test="${empty resultList }">
		             <tr>
		                 <td colspan='15'/>Data 없습니다.</td>
		             </tr>
		        </c:if>
                 </tbody>
             </table>
         </div>

          <div class="page-wrap">
		     <ul class="paging">
		         <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
		     </ul>
		</div>
