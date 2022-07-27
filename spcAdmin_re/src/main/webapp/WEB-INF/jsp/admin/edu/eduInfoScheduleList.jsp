
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
 		 $("#edu_end_date, #edu_start_date").datepicker({
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
 		  
 		$('#checkAll').click(function(){
 		    var isChecked = this.checked;
 			$('input:checkbox[name="checkNo"]').each(function() {
    			this.checked = isChecked;
    	    });
    	 });
 		
 		$('.cdate').bind('click', function(){
 			var checkdate = $("input[name='checkdate']:checked").val();
 			if(checkdate !="TERM"){
 				$("#edu_start_date").val(''); 
 				$("#edu_end_date").val('');
 			}
 			if(checkdate =="ALL"){
 				$("#category3_name").val(''); 
 			}
     	});
 		
 		$('.btnOneApr').bind('click', function(){
 			var ischeckeds = false;
 			$('input:checkbox[name="checkNo"]').each(function() {
	 			if(this.checked){
		 			ischeckeds = true;
	 			}
 			});

 			if(!ischeckeds){
	 			alert('선택 된 건이 없습니다.');
	 			return false;
 			}
 			var checkNo ="";
 			$('input:checkbox[name="checkNo"]').each(function() {
	 			if(this.checked){
		 			ischeckeds = true;
		 			var strCheckdValue = this.value;
		 			checkNo = checkNo + ',' + strCheckdValue; 
	 			}
 			});
 			
 			checkNo = checkNo.substring( 1, checkNo.length );
 			
 			$("#edu_key").val(0); 
 			$("#sch_no").val(0); 
 			$("#gubun1").val("A"); 
			$("#gubun2").val("A");
			$("#checkdstr").val(checkNo);
						
			var msg = "정말로 삭제 하시겠습니까?";
			var yn = confirm(msg);		
			if(yn){
					
				$.ajax({	
					data     : $("#commonForm").serialize(),
				    url		 : "<c:url value='/edu/eduInfoScheduleSave.do'/>",
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
 		});
 		
 	 });

	 function fn_edit(key1,key2,gubun1,gubun2){
		
		var frm = document.commonForm;
		
		$("#edu_key").val(key1);
 		$("#gubun1").val(gubun1); 
 		$("#gubun2").val(gubun2);   		
 		$("#sch_no").val(key2);
 		
 		frm.action = "<c:url value='/edu/eduInfoScheduleCate.do'/>";
 		frm.submit();
	}	
	 
	 function fn_delete(key1,key2,gubun1,gubun2){
			
			$("#edu_key").val(key1); 
			$("#sch_no").val(key2); 
		
			$("#gubun1").val(gubun1); 
			$("#gubun2").val(gubun2); 
			
			var msg = (gubun1=='E' ? "카테고리를 수정 하시겠습니까?" : "정말로 삭제 하시겠습니까?");
			var yn = confirm(msg);		
			if(yn){
					
				$.ajax({	
					data     : $("#commonForm").serialize(),
				    url		 : "<c:url value='/edu/eduInfoScheduleSave.do'/>",
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
	
	function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		$("#gubun2").val('eduInfoScheduleList'); 
		frm.action = "<c:url value='/edu/eduInfoScheduleList.do'/>";
		frm.submit();
	}
	
	function fn_search(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		
		var checkdate = $("input[name='checkdate']:checked").val();
		if(checkdate =="TERM"){
			var edu_start_date = $("#edu_start_date").val(); 
			var edu_end_date   = $("#edu_end_date").val();
			if (edu_start_date == ""){			
				alert("기간을  선택 하세요.");
				return;
			}
			if (edu_end_date == ""){			
				alert("기간을  선택 하세요.");
				return;
			}
		}
		
		if(checkdate =="ALL"){
			$("#edu_start_date").val(''); 
			$("#edu_end_date").val('');
			$("#category3_name").val(''); 
		}
		
		$("#gubun2").val('eduInfoScheduleList'); 
		frm.action = "<c:url value='/edu/eduInfoScheduleList.do'/>";
		frm.submit();
	}
    
    
	function fn_load(str) {
    	var frm = document.commonForm;
     	frm.action = "<c:url value='/edu/eduInfoScheduleCate.do'/>";
    	frm.submit();
     }
     
     function fn_excel(){
    	 var frm = document.commonForm;
    	 frm.action = "<c:url value='/edu/excelDownload.do'/>";
    	 $("#excelFileName").val('교육일정'); 
    	 frm.submit();
    }
     /* pagination 페이지 링크 function */
     function fn_egov_link_page(pageNo){
    	var frm = document.commonForm;
    	$("#pageIndex").val(pageNo); 
     	frm.action = "<c:url value='/edu/eduInfoScheduleList.do'/>";
        frm.submit();
     }
     //-->
 </script>

        <h1 class="h1-tit">교육일정</h1>
		<form  id="commonForm" name="commonForm"  method="post"  action="">
			<input type="hidden" id="gubun1"         name="gubun1"         value='I'                   class="input-box" />
		    <input type="hidden" id="gubun2"         name="gubun2"         value='eduInfoScheduleList' class="input-box" />	
		    <input type="hidden" id="excelFileName"  name="excelFileName"  value=''                    class="input-box" />
		    <input type="hidden" id="edu_key"        name="edu_key"        value='0'                 class="input-box" />
		    <input type="hidden" id="sch_no"        name="sch_no"        value='0'                   class="input-box" />		
		    <input type="hidden" id="checkdstr"      name="checkdstr"      value=''                    class="input-box" />	
		    <input type="hidden" id="pageIndex"      name="pageIndex"      class="input-box" value=1 />	
		  
           <div class="search-wrap">
               <h2 class="h2-tit">교육일정 검색</h2>
               <div class="search-cont">
                   <div class="radio-cont">
                       <input type="radio" class="radio-box cdate" id="checkdate"  name="checkdate" value="ALL"  <c:if test="${categoryVo.checkdate =='ALL'  || (empty categoryForm.category1_name) }">checked </c:if>  >
                       <label for="dateAll">전체</label>
                   </div>                          
                   <div class="radio-cont">
                       <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TODAY" <c:if test="${categoryVo.checkdate =='TODAY'}">checked </c:if>  >
                       <label for="dateToday">오늘</label>
                   </div>
                   
                   <div class="radio-cont mr10">
                       <input type="radio" class="radio-box cdate" id="checkdate" name="checkdate" value="TERM" <c:if test="${categoryVo.checkdate =='TERM'}">checked </c:if>  >
                       <label for="dateTerm">기간선택</label>
                   </div>
                   <div class="picker-wrap">
                       <input type="text" id="edu_start_date" name="edu_start_date" readonly class="input-box" value="${categoryVo.edu_start_date}"/>
                       <span class="next-ico">-</span>
                       <input type="text" id="edu_end_date"   name="edu_end_date"   readonly class="input-box" value="${categoryVo.edu_end_date}"/>
                   </div>
                   <input type="text" class="input-box" id="category3_name" name="category3_name" value="${categoryVo.category3_name}" placeholder="교육명"/>
                   <button  type="button" class="search-btn" onClick="fn_search();">검색</button>&nbsp;&nbsp;
            <button type="button" class="search-btn white-btn" onClick="fn_clear();">초기화</button>    
               </div>
           </div>
           </form>

           <div class="btn-cont mb20">
               <button type="button" class="mid-btn black-btn"  onClick="fn_excel();">엑셀다운</button>
               <!-- <button type="button" class="mid-btn blue-btn"   onClick="fn_load('1');">등록</button> -->
               <!-- <button type="button" class="mid-btn white-btn btnOneApr">선택삭제</button> -->
           </div>
           
           <div class="table-wrap">
               <table class="list-tb">
                   <caption>카테고리1, 수정, 삭제, 카테고리2 정보가 있는 테이블</caption>
                   <colgroup>
                       <col width="4%"/>
                       <col width="6%"/>
                       <col width="10%"/>
                       <col width="*"/>
                       <col width="11%"/>
                       <col width="10%"/>
                       <col width="10%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="8%"/>
                       <col width="7%"/>
                       <%-- <col width="7%"/> --%>
                   </colgroup>
                   <thead>
                       <tr>
                           <th><input type="checkbox" id="checkAll" name='checkAll' class="check-box"/></th>
                           <th>No.</th>
                           <th>교육일시</th>
                           <th>기관명</th>
                           <th>분류1</th>
                           <th>분류2</th>
                           <th>분류3</th>
                           <th>교육 대상</th>
                           <th>교육 인원</th>
                           <th>강사명</th>
                           <th>관리</th>
                       </tr>
                   </thead>
                   <tbody>
                 	  <c:forEach var="result" items="${resultList}" varStatus="status">
                       <tr>
                           <td><input type="checkbox" id='checkNo' name='checkNo' value="${result.edu_key}" class="check-box"/></td>
                           <td><c:out value="${(categoryVo.pageIndex-1) * categoryVo.pageSize + (status.count)}"/></td>
                           <td>${result.edu_start_date}</td>
                           <td>${result.edu_org_name}</td>
                           <td>${result.category1_name}</td>
                           <td>${result.category2_name}</td>
                           <td>${result.category3_name}</td>
                           <td>${result.edu_target}</td>
                           <td>${result.edu_number}</td>
                           <td>${result.edu_teac_name}</td>
                           <td><button type="button" class="sm-btn blue-btn"  onClick="javascript:fn_edit('${result.edu_key}','${result.schedule_no}',  'E', 'eduInfoScheduleList');" >수정</button></td>
                           <%-- <td><button type="button" class="sm-btn white-btn" onClick="javascript:fn_delete('${result.edu_key}','D', 'eduInfoScheduleList');">삭제</button></td> --%>
                       </tr>
                      </c:forEach>
                   </tbody>
               </table>
           </div>

           <div class="page-wrap">
        	 <ul class="paging">
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
 		 </ul>
        </div>
           