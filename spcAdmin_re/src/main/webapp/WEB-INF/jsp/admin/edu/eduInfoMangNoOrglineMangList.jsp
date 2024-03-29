
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
 		
 		$('.goView').bind('click', function(){
 			
 			var site = $(this).data('site');
 			var no = $(this).data('no');
 			$("#edu_site").val(site);
 		    $("#edu_no").val(no);
 			$("#category1_key").val(0);
 	 		$("#category2_key").val(0);
 			$("#category3_key").val(0);
 			
 			var frm = document.commonForm;
 			frm.action = "<c:url value='/edu/eduInfoMangNoOrglineMangView.do'/>";
 			frm.submit();	   	 
 		})
 		
 		$("#category3_name1").keypress(function(e) {
 	        if ('13' == e.keyCode) {
 	        	fn_search();
 	            return false;
 	        }
 	    });
 		
 		 $('#category1_key').change(function(){
 			var val  = $(this).val();

 			if( val ==""){
 				var option = '';
 				option += '<option value="">선택 하세요</opton>'; //선택
 				$('select[name=category2_key]').html(option);
 				$('select[name=category3_key]').html(option);	
 				return;
 			}
 			$("#gubun3").val('categorycode2');
 			$("#category2_key").val(0);
 			$("#category3_key").val(0);
 			
 			 $.ajax({	
 			    url     : "<c:url value='/edu/eduInfoCategoryCodeList.do'/>",
 			    data    : $("#commonForm").serialize(),
 		        dataType: "JSON",
 		        cache   : false,
 				async   : true,
 				type	: "POST",	
 				success: function(data, opt, inx){
 				var option = '';
 				option += '<option value="">선택 하세요</opton>'; //선택
 				$.each(data, function(i, ret){
 					option += '<option value="'+ret.code_cd+'">'+ret.code_name+'</option>';		
 				});
 				$('select[name=category2_key]').html(option);						
 	        },	       
 		        error 	: function(xhr, status, error) {}
 		        
 		     });
 		 });
 				 
 		$('#category2_key').change(function(){
 			var val  = $(this).val();

 			if( val ==""){
 				var option = '';
 				option += '<option value="">선택 하세요</opton>'; //선택
 				$('select[name=category3_key]').html(option);	
 				 return false;
 			}
 			$("#gubun3").val('categorycode3');
 			$("#category3_key").val(0);
 					
 			 $.ajax({	
 			    url     : "<c:url value='/edu/eduInfoCategoryCodeList.do'/>",
 			    data    : $("#commonForm").serialize(),
 		        dataType: "JSON",
 		        cache   : false,
 				async   : true,
 				type	: "POST",	
 				success: function(data, opt, inx){
 				var option = '';
 				option += '<option value="">선택 하세요</opton>'; //선택
 				$.each(data, function(i, ret){
 					option += '<option value="'+ret.code_cd+'">'+ret.code_name+'</option>';		
 				});
 				$('select[name=category3_key]').html(option);						
 		        },	       
 		        error 	: function(xhr, status, error) {}
 		        
 		     });
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
 				$("#train_s_date").val(''); 
 				$("#train_e_date").val('');
 			}
 			if(checkdate =="ALL"){
 				$("#category3_name").val(''); 
 			}
     	});
 		
 		
 		
 	 });
 
	function fn_search(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		
		var checkdate = $("input[name='checkdate']:checked").val();
		if(checkdate =="TERM"){
			var train_s_date = $("#train_s_date").val(); 
			var train_e_date = $("#train_e_date").val();
			if (train_s_date == ""){			
				alert("기간을  선택 하세요.");
				return;
			}
			if (train_e_date == ""){			
				alert("기간을  선택 하세요.");
				return;
			}
		}
		
		if(checkdate =="ALL"){
			$("#train_s_date").val(''); 
			$("#train_e_date").val('');
		}
		
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
		
		frm.action = "<c:url value='/edu/eduInfoMangNoOrglineMang.do'/>";
		frm.submit();
	}
    
    

     function fn_excel(){
    	 var frm = document.commonForm;
    	 var category1_key = $("select[name=category1_key] option:selected").val();  //교육분류1
	     var category2_key = $("select[name=category2_key] option:selected").val();  //교육분류2
	  	 var category3_key = $("select[name=category3_key] option:selected").val();  //교육명		   
	  	   
	  	 if (category1_key == ""){			
		   $("#category1_key").val(0);
		 }
		 if (category2_key == ""){			
			$("#category2_key").val(0);
		 }
		
		 if (category3_key == ""){			
			$("#category3_key").val(0);
		 }	
    	 frm.action = "<c:url value='/edu/excelDownloadOnLine.do'/>";
    	 $("#excelFileName").val('오프라인 교육 신청자 관리'); 
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
     	 frm.action = "<c:url value='/edu/eduInfoMangNoOrglineMang.do'/>";
       	 frm.submit();
     }
     //-->
 </script>

        <div class="tab-cont">
               <ul>
                   <li><a href="<c:url value='/edu/eduInfoOnlineMangList.do'/>">온라인교육</a></li>
                   <li class="on">오프라인 교육</li>
               </ul>
         </div>
		<form  id="commonForm" name="commonForm"  method="post"  action="">
			<input type="hidden" id="gubun1"         name="gubun1"         value='I'  />
		    <input type="hidden" id="gubun2"         name="gubun2"         value='${categoryVo.gubun2}' />	
		    <input type="hidden" id="gubun3"         name="gubun3"         value=''  />
		    <input type="hidden" id="excelFileName"  name="excelFileName"  value=''  />
		    <input type="hidden" id="edu_no"         name="edu_no"         value='0' />		
		    <input type="hidden" id="edu_site"       name="edu_site"       value='${categoryVo.edu_site}'/>
		    <input type="hidden" id="site"           name="site"           value='${categoryVo.site}'/>
		    <input type="hidden" id="pageIndex"      name="pageIndex"        value=1  />	
		    <input type="hidden" id="category1_name"  name="category1_name"  value='' />
		    <input type="hidden" id="category2_name"  name="category2_name"  value='' />
		    <input type="hidden" id="category3_name"  name="category3_name"  value='' />
		   
           <div class="search-wrap">
               <div class="search-cont">
                    <select class="select mr30"  id="category1_key" name="category1_key">
                    	<c:if test="${not empty categoryVo.category1_name }">
                    		<option value='${categoryVo.category1_key}'>${categoryVo.category1_name}</option>
                       	</c:if>
                        <option value=''>선택 하세요</option>
                    	<c:forEach var="result" items="${category1list}" varStatus="status">
                        		<option value='${result.code_cd}'>${result.code_name}</option>
                        </c:forEach>
                    </select>
                    <select class="select"  id="category2_key" name="category2_key">
                       <c:if test="${not empty categoryVo.category2_name }">
                       		<option value='${categoryVo.category2_key}'>${categoryVo.category2_name}</option>
                       	</c:if>
                       	<option value=''>선택 하세요</option>
                    </select>
                    <select class="select lg-width"  id="category3_key" name="category3_key">
                    	<c:if test="${not empty categoryVo.category3_name }">
                       		<option value='${categoryVo.category3_key}'>${categoryVo.category3_name}</option>
                       	</c:if>
                       	<option value=''>선택 하세요</option>
                    </select>
                    
                </div>
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
                       <input type="text" id="train_s_date" name="train_s_date" readonly class="input-box" value="${categoryVo.train_s_date}"/>
                       <span class="next-ico">-</span>
                       <input type="text" id="train_e_date"   name="train_e_date"   readonly class="input-box" value="${categoryVo.train_e_date}"/>
                   </div>
                   <input type="text" class="input-box" id="category3_name1" name="category3_name1" value="${categoryVo.category3_name1}" size="12" placeholder="교육명"/>                   
               </div>
           </div>
           

           <div class="btn-cont mb20">
           	<button  type="button" class="search-btn" onClick="fn_search();">검색</button>
            <button type="button" class="search-btn white-btn" onClick="fn_clear();">초기화</button>
            <button type="button" class="mid-btn black-btn "  onClick="fn_excel();">엑셀다운</button>
           </div>
           </form>
            <div class="table-wrap scroll-wrap">
                    <table class="list-tb">
                        <caption>카테고리1, 수정, 삭제, 카테고리2 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="5%"/>
                            <col width="9%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="20%"/>
                            <col width="6%"/>
                            <col width="9%"/>
                            <col width="6%"/>                            
                        </colgroup>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>분류1</th>
                                <th>분류2</th>
                                <th>분류3</th>
                                <th>교육내용</th>
                                <th>교육대상</th>
                                <th>교육인원</th>
                                <th>신청자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="result" items="${resultList}" varStatus="status">
	                        <tr class="goView" style="cursor:pointer" data-no="${result.edu_no}" data-site="${categoryVo.edu_site}">
	                            <td><c:out value="${(categoryVo.pageIndex-1) * categoryVo.pageSize + (status.count)}"/></td>
                                <td class="tl">${result.category1_name}</td>
                                <td class="tl">${result.category2_name}</td>
                                <td class="tl">${result.category3_name}</td>
                                <td class="tl">${result.edu_cont}</td>
                                <td>${result.edu_target}</td>
                                <td>${result.edu_garden}</td>
                                <td>${result.cnt}명</td>
                            </tr>
                            </c:forEach>
                            <c:if test="${empty resultList }">
				             <tr>
				                 <td colspan='8'/>Data 없습니다.</td>
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
           