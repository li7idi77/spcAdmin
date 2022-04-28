
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
 		 
 		 $('#category1_key').change(function(){
 			var val  = $(this).val();
 			if( val ==""){
 				return;
 			}
 			$("#gubun3").val('categorycode2');
 			$("#category2_key").val(0);
 			$("#category3_key").val(0);
 			$("#edu_number").val(0);
 			
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
 				return;
 			}
 			$("#gubun3").val('categorycode3');
 			$("#category3_key").val(0);
 			$("#edu_number").val(0);
 			
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
	
     });	
	
    
     function fn_load(str) {
    	var frm = document.commonForm;
    	$("select[name=category1_key] option:selected").val(0);
  	    $("select[name=category2_key] option:selected").val(0);
  	    $("select[name=category3_key] option:selected").val(0);
  	    $("#edu_number").val(0); 
 		$("#gubun1").val('R'); 
		$("#gubun2").val('eduInfoScheduleList'); 
    	frm.action = "<c:url value='/edu/eduInfoScheduleList.do'/>";    
    	frm.submit();
     }
     
	
    function fn_save(gubun1){
    	
    	$("#gubun1").val(gubun1); 
    	
    	var edu_name       = $("#edu_name").val();
 		var category3_cont = $("#category3_cont").val();
 	    var edu_org_name   = $("#edu_org_name").val();
 	    var edu_target     = $("#edu_target").val();
 	    var edu_number     = $("#edu_number").val();
 	    var edu_teac_name  = $("#edu_teac_name").val();
 	
 	    var category1_key = $("select[name=category1_key] option:selected").val();
 	    var category2_key = $("select[name=category2_key] option:selected").val();
 	    var category3_key = $("select[name=category3_key] option:selected").val();
 	
 	    if (edu_number == ""){			
			$("#edu_number").val(0); 
		}
 	   
 	   if (category1_key == ""){			
			alert("교육분류1을 선택 하세요.");
			return;
		}
		if (category2_key == ""){			
			alert("교육분류2을 선택 하세요.");
			return;
		}
		
		if (category3_key == ""){			
			alert("교육명을 선택 하세요.");
			return;
		}	
		
 		var msg = "교육과정을 등록 하시겠습니까?";
 		if (gubun1 == "E"){
 			msg = "교육일정 등록을 수정 하시겠습니까?";
 		}
 		
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
 				fn_load('R');				 
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
 
          <h1 class="h1-tit">교육일정 등록</h1>
   		  <form  id="commonForm" name="commonForm"  method="post"  action="">
   		  	<input type="hidden" id="gubun3"  name="gubun3"  />
   		  	<input type="hidden" id="gubun2"  name="gubun2"  />
   		  	<input type="hidden" id="gubun1"  name="gubun1"  />
   		  	<input type="hidden" id="edu_key" name="edu_key" value='${categoryVo.edu_key}' />
   		 
		        <div class="table-wrap">
                    <table class="detail-tb">
                        <caption>교육분류, 교육명, 교육일시, 기관명, 교육대상, 교육인원, 강사명 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                             <tr>   
                                <th><span class="red-txt">*</span>교육분류</th>
                                <td>
                                    <select class="select mr30"  id="category1_key" name="category1_key" >
                                    	<c:if test="${not empty categoryForm.category1_name }">
                                    		<option value='${categoryForm.category1_key}'>${categoryForm.category1_name}</option>
                                    	</c:if>
                                        <option value=''>선택 하세요</option>
	                                    <c:forEach var="result" items="${category1list}" varStatus="status">
	                                    	<option value='${result.code_cd}'>${result.code_name}</option>
	                                    </c:forEach>
                                    </select>
                                    <select class="select"  id="category2_key" name="category2_key" >
                                    	<c:if test="${not empty categoryForm.category2_name }">
                                    		<option value='${categoryForm.category2_key}'>${categoryForm.category2_name}</option>
                                    	</c:if>
                                        <option value=''>선택 하세요</option>
	                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="red-txt">*</span>교육명</th>
                                <td>
                                    <select class="select lg-width"  id="category3_key" name="category3_key" >
                                    	<c:if test="${not empty categoryForm.category3_name }">
                                    		<option value='${categoryForm.category3_key}'>${categoryForm.category3_name}</option>
                                    	</c:if>
                                    	<option value=''>선택 하세요</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>교육일시</th>
                                <td>
                                   <input type="text" id="edu_start_date" name='edu_start_date' value="${categoryForm.edu_start_date}" readonly class="input-box"/>
                                   <span class="next-ico">-</span>
                                   <input type="text" id="edu_end_date"   name='edu_end_date'   value="${categoryForm.edu_end_date}" readonly class="input-box"/>
                                </td>
                            </tr>
                            <tr>
                                <th>기관명</th>
                                <td><input type="text" class="input-box" id='edu_org_name' name='edu_org_name' value="${categoryForm.edu_org_name}" maxlength="100" /></td>
                            </tr>
                            <tr>
                                <th>교육대상</th>
                                <td><input type="text" class="input-box" id='edu_target' name='edu_target' value="${categoryForm.edu_target}" maxlength="100" /></td>
                            </tr>
                            <tr>
                                <th>교육인원</th>
                                <td><input type="text" class="input-box"  id='edu_number' name='edu_number' value="${categoryForm.edu_number}"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="5"/>숫자만 가능합니다.</td>
                            </tr>
                            <tr>
                                <th>강사명</th>
                                <td><input type="text" class="input-box" id='edu_teac_name' name='edu_teac_name' value="${categoryForm.edu_teac_name}"  maxlength="100"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			   </form>	
               <div class="btn-cont">
           		 	<c:if test="${empty categoryForm.edu_key }">
                   		<button type="button" class="mid-btn blue-btn"   onClick="javascript:fn_save('I');">저장</button>
                   </c:if>
                    <c:if test="${not empty categoryForm.edu_key }">
                   		<button type="button" class="mid-btn blue-btn"   onClick="javascript:fn_save('E');">저장</button>
                   </c:if>
                   <button type="button" class="mid-btn white-btn"  onClick="javascript:history.back();">취소</button>
                </div>

	            

   
