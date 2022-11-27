

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <script type="text/javaScript" language="javascript" defer="defer">
 
 $(document).ready(function(){
   
	 $("#train_s_date, #train_e_date").datepicker({
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
	 
	 $("#files").on('change', function(){
	    readInputFile(this);
	}); 
	 
	$("#btn-delete").click(function(event) {
	    var $input = $(".inp-img");
	    var $preview = $('#preview');
	    resetInputFile($input, $preview);
	});
   	
	$('.cdate').bind('click', function(){
		var checkdate = $("input[name='set_use_yn']:checked").val();
		if(checkdate =="NONE"){
			$("#train_s_date").val(''); 
			$("#train_e_date").val(''); 
		}
 	});
	
	 $('#category1_key').change(function(){
		var val  = $(this).val();

		if( val ==""){
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
			return;
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
	
	$("#addTR").click(function () {
		var addNum = parseInt($("#addNum").val()) + 1;
		$("#addNum").val(addNum);

		var row = "<div class='grid-box'>";
			row += "<input type='text' id='edu_curr1_arr'  name='edu_curr1_arr' placeholder='ex.1차시(차시)' class='input-box' />";
			row += "<input type='text' id='edu_curr2_arr'  name='edu_curr2_arr' placeholder='ex.기초편(차시명)' class='input-box' />";
			row += "<input type='text' id='edu_curr3_arr'  onKeyup=this.value=this.value.replace(/[^0-9]/g,'') name='edu_curr3_arr' placeholder='ex.60(학습시간)' class='input-box' />";
			//row += "<span>삭제</span>";
			row += "<button type='button' class='sm-btn black-btn'>삭제</button>";
			
			row += "</div>";
		$("#insertCurr").append(row);
	});
	
	$("#insertCurr").on("click", "button", function() {
		var addNum = parseInt($("#addNum").val()) - 1;
		$("#addNum").val(addNum);
	 	$(this).closest("div").remove();
	});
	

	
  });	
 
  function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		$("#inst_nm").val('');      //강사명
		$("#edu_target").val('');      //교육대상
		$("#train_s_date").val(''); //교육기간
		$("#train_e_date").val(''); //교육기간
		$("#category1_key").val(0); //교육분류
		$("#category2_key").val(0); //교육분류
		$("#category3_key").val(0); //교육명
		$("#category3_name").val(''); //교육명
		$("#category3_name").val(''); //교육명
		frm.action = "<c:url value='/orgMng/orgOnlineList.do'/>";
		frm.submit();
   }
	    
  	function data_cal(){
  		var regExp = /^[0-9]*$/;
  		if(!regExp.test($("#train_date").val())){
  			alert("숫자만 입력 가능합니다.");
  			$("#train_date").val("");
  			return false;	
  		}
	  	$("#train_s_date").val(gfnCurDate());
	  	$("#train_e_date").val(gfnDateCal($("#train_date").val()));
  	}
  
	function fn_save(gubun1){
	
	   var addNum = parseInt($("#addNum").val());
		
	   var arr1 = [];
	   var arr2 = [];
	   var arr3 = [];
	   for(i=0; addNum > i; i++){
			var edu_curr1 = $('input[name=edu_curr1_arr]').eq(i).val();
			var edu_curr2 = $('input[name=edu_curr2_arr]').eq(i).val();
			var edu_curr3 = $('input[name=edu_curr3_arr]').eq(i).val();
			if(edu_curr1 == "" || edu_curr2 == "" || edu_curr3 == ""){
				alert("차시를 전부 입력 하세요.");
				return;
			}
			arr1[i] = edu_curr1;
			arr2[i] = edu_curr2;
			arr3[i] = edu_curr3;
	   }
	   var edu_no       = $("#edu_no").val();
	   var edu_site     = $("#edu_site").val();
	   var gubun2       = $("#gubun2").val();
	   
	   var inst_nm      = $("#inst_nm").val();      //강사명
	   var set_use_yn   = $('input:radio[name="set_use_yn"]:checked').val();    //교육기간설정여부
	   var train_s_date = $("#train_s_date").val(); //교육기간
	   var train_e_date = $("#train_e_date").val(); //교육기간
	   
	   var edu_cont     = $("#edu_cont").val();      //교육내용
	   var edu_method   = $("#edu_method").val();    //교육방식
	   var edu_target   = $("#edu_target").val();    //교육대상
	   var edu_time     = $("#edu_time").val();      //학습시간
	   var edu_garden   = $("#edu_garden").val();    //교육정원
	   
	   var edu_status   = $('input:radio[name="edu_status"]:checked').val();    //교육상태(신청중:I,신청취소:C, 신청마감:F, 사용중지:P, 결과보고:R)*
	   var exp_use_yn   = $('input:radio[name="exp_use_yn"]:checked').val();    //교육 노출여부
	   var edu_notice   = $("#edu_notice").val();       //안내문
	   
	   var edu_intro      = $("#edu_intro").val();         //교육소개
	   var edu_goals      = $("#edu_goals").val();         //교육목표
	   
	   //var edu_curr1_arr  = $("#edu_curr1_arr").val();     //커리큘럼1
	   //var edu_curr2_arr  = $("#edu_curr2_arr").val();     //커리큘럼2
	   //var edu_curr3_arr  = $("#edu_curr3_arr").val();     //커리큘럼3
	   
	   var category1_key = $("select[name=category1_key] option:selected").val();  //교육분류1
       var category2_key = $("select[name=category2_key] option:selected").val();  //교육분류2
	   var category3_name = $("#category3_name").val();  //교육명		   
	   	   
	   if (category1_key == ""){			
			alert("교육분류을 선택 하세요.");
			return;
		}
		if (category2_key == ""){			
			alert("교육분류을 선택 하세요.");
			return;
		}
		
		if (category3_key == ""){			
			alert("교육명을 선택 하세요.");
			return;
		}	
		
	   if (inst_nm == ""){			
			alert("강사명을 입력하세요.");
			$("#inst_nm").focus();
			return;
		}		
	   
	   if (train_s_date == "" || train_e_date == ""){			
			alert("교육기간을 입력 하세요.");
			return;
		}	
	   
	   if (edu_garden == ""){			
			alert("교육정원을 입력 하세요.");
			return;
		}	
		
		var msg = "온라인 교육을  등록 하시겠습니까?";
		if (gubun1 == "E"){
			msg = "온라인 교육을  수정 하시겠습니까?"
		}
		
		var fileExit = "YES";
		var file= $("input[name=files]")[0].files[0];
		if( file ==null || file =='null' || file =='undefined' || file ==undefined){
	 		fileExit = "NO";
	 	}
				
		var formData = new FormData(); 
		formData.append("gubun1",       gubun1);
		formData.append("gubun2",       gubun2);		
		formData.append("edu_no",       edu_no);
		formData.append("edu_site",     edu_site);
		
		formData.append("category1_key",   category1_key);
		formData.append("category2_key",   category2_key);
		formData.append("category3_name",   category3_name);
		
	    formData.append("inst_nm",      inst_nm);
		formData.append("set_use_yn",   set_use_yn);
		formData.append("train_s_date", train_s_date);
		formData.append("train_e_date", train_e_date);
		
		formData.append("edu_cont",    edu_cont);
		formData.append("edu_method",  edu_method);
		formData.append("edu_target",  edu_target);
		formData.append("edu_time",    edu_time);		
		formData.append("edu_garden",  edu_garden);
		
		formData.append("edu_status",   edu_status);
		formData.append("exp_use_yn",   exp_use_yn);
		formData.append("edu_notice",   edu_notice);
		
			
		formData.append("edu_intro",     edu_intro);
		formData.append("edu_goals",     edu_goals);
		formData.append("edu_curr1_arr", arr1);
		formData.append("edu_curr2_arr", arr2);
		formData.append("edu_curr3_arr", arr3);
		
		formData.append("files",    $("input[name=files]")[0].files[0]);
		formData.append("fileExit", fileExit);
		
		var yn = confirm(msg);		
		if(yn){
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/orgMng/orgOnlineSave.do'/>",
			    dataType   : "JSON",
		        processData: false, 
		        contentType: false,
				type	   : "POST",	
		        success    : function(obj) {
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
	
	function fn_load(){	
		var frm = document.commonForm;
		$("#gubun1").val('I'); 
		frm.action = "<c:url value='/main/popupReg.do'/>";
		frm.submit();
	}
	
	// 등록 이미지 등록 미리보기
	function readInputFile(input) {
	    if(input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#preview').html("<img heigth='200px' width='120px' src="+ e.target.result +">");
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	 
	 
	// 등록 이미지 삭제 ( input file reset )
	function resetInputFile($input, $preview) {
	    var agent = navigator.userAgent.toLowerCase();
	    if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
	        // ie 일때
	        $input.replaceWith($input.clone(true));
	        $preview.empty();
	    } else {
	        //other
	        $input.val("");
	        $preview.empty();
	    }       
	}
	 

 </script>
 		   
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="gubun1"   name="gubun1"   class="input-box" />
			<input type="hidden" id="gubun2"   name="gubun2"   class="input-box" value='eduInfoOnline2'/>
			<input type="hidden" id="gubun3"   name="gubun3"   class="input-box" />
			<input type="hidden" id="edu_no"   name="edu_no"   class="input-box" value='${categoryVo.edu_no}'/>
			<input type="hidden" id="edu_site" name="edu_site" class="input-box" value='on'/>
			<input type="hidden" id="edu_notice" name="edu_notice" class="input-box" value='${categoryForm.edu_notice}'/>

			<c:if test="${not empty categoryFormSubList }">
          		<c:set var="addNum" value="" />
          		<input type="hidden" id="addNum"   name="addNum"   value='${fn:length(categoryFormSubList)}' />
          	</c:if>
          	<c:if test="${empty categoryFormSubList }">
          	 	<input type="hidden" id="addNum"   name="addNum"   value='1' />
          	</c:if>

            <h1 class="h1-tit">온라인 교육 등록</h1>

                <div class="table-wrap">
                    <table class="detail-tb">
                        <caption>교육분류, 교육명, 강사명, 교육기간, 교육내용, 교육방식, 학습시간, 교육대상, 교육정원,교육상태, 노출여부, 안내문, 교육 소개, 교육 목표, 커리큘럼 정보가 있는 테이블</caption>
                        <colgroup>
                            <col width="10%"/>
                            <col width="15%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th colspan="2"><span class="red-txt">*</span>교육분류</th>
                                <td>
                                    <select class="select"  id="category1_key" name="category1_key">
										<option value='9'>기관</option>
						            </select>
                                    <select class="select"  id="category2_key" name="category2_key">
										<option value='16'>교육기관별(ON-LINE)</option>
						            </select>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><span class="red-txt">*</span>교육명</th>
                                <td>
                                	<input type="text"  id="category3_name" name="category3_name" class="input-box" value="${categoryForm.category3_name}"/>
                                	<input type="hidden"  id="category3_key" name="category3_key" class="input-box" value="${categoryForm.category3_key}"/>
                                    <%-- <select class="select lg-width"  id="category3_key" name="category3_key">
						            	<option value='' >선택 하세요</option>
										<c:forEach var="result" items="${category3list}" varStatus="status">
											<option value='${result.CATEGORY3_KEY}' >${result.CATEGORY3_NAME}</option>
										</c:forEach>
						            </select> --%>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><span class="red-txt">*</span>강사명</th>
                                <td><input type="text" placeholder="ex.김동훈" id="inst_nm" name="inst_nm" class="input-box" value="${categoryForm.inst_nm}"/> 강사</td>
                            </tr>
                            <tr>
                                <th colspan="2"><span class="red-txt">*</span>교육기간</th>
                                <td>
                                    <div class="tb-cont">
                                    	<input type="hidden" id="set_use_yn" name="set_use_yn" value="TERM">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box cdate" id="set_use_yn" name="set_use_yn" value="NONE" <c:if test="${categoryForm.train_s_date == '' || (empty categoryForm.train_s_date)}">checked </c:if>>
                                            <label for="">설정 없음</label>
                                        </div>
                                        <div class="radio-cont mr10">
                                            <input type="radio" class="radio-box cdate" id="set_use_yn" name="set_use_yn" value="TERM" <c:if test="${categoryForm.train_s_date != ''}">checked </c:if>>
                                            <input type="text" placeholder="ex.365" id="train_date"  name="train_date" class="input-box" onchange="data_cal();"/> 일
                                        </div>
    
                                        <div class="picker-wrap">
                                            <input type="text" id="train_s_date"  name="train_s_date" readonly value="${categoryForm.train_s_date}" class="input-box"/>
                                            <span class="next-ico">-</span>
                                            <input type="text" id="train_e_date"  name="train_e_date" readonly value="${categoryForm.train_e_date}" class="input-box"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">교육내용</th>
                                <td><input type="text" id="edu_cont"  name="edu_cont" class="input-box" value="${categoryForm.edu_cont}"/></td>
                            </tr>
                            <tr>
                                <th colspan="2">교육방식</th>
                                <td><input type="text" id="edu_method"  name="edu_method" class="input-box" value="${categoryForm.edu_method}"/></td>
                            </tr>
                            <tr>
                                <th colspan="2">총 학습시간</th>
                                <td>
                                    <input type="text" placeholder="ex.90" id="edu_time"  name="edu_time" class="input-box" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  value="${categoryForm.edu_time}"  maxlength="5"/>분
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">교육대상</th>
                                <td>
                                    <input type="text" placeholder="ex.직장인" id="edu_target"  name="edu_target" class="input-box" value="${categoryForm.edu_target}"/>
                                    <span class="point">ex. 성인, 청소년, 중장년, 노인, 이어줌인, 대학생, 직장인 등</span>
                                </td>
                            </tr>
                          
                            <tr>
                                <th colspan="2"><span class="red-txt">*</span>교육정원</th>
                                <td>
                                    <input type="text" placeholder="ex.200" id="edu_garden"  name="edu_garden" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="5" class="input-box" value="${categoryForm.edu_garden}"/>
                                    <span class="point">*기입하지 않으면 무한대</span>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">교육상태</th>
                                <td>
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="신청중" <c:if test="${categoryForm.edu_status =='신청중'  || (empty categoryForm.edu_status) }">checked </c:if>>
                                            <label for="">교육중</label>
                                        </div>
                                          
                                        <%-- <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="신청취소" <c:if test="${categoryForm.edu_status =='신청취소'}">checked </c:if>>
                                            <label for="">신청취소</label>
                                        </div> --%>
                                        
                                        <div class="radio-cont mr10">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="신청마감" <c:if test="${categoryForm.edu_status =='신청마감'}">checked </c:if>>
                                            <label for="">교육종료</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="사용중지" <c:if test="${categoryForm.edu_status =='사용중지'}">checked </c:if>>
                                            <label for="">사용중지</label>
                                        </div>
                                        
                                        <%-- <div class="radio-cont mr10">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="결과보고" <c:if test="${categoryForm.edu_status =='결과보고'}">checked </c:if>>
                                            <label for="">결과보고</label>
                                        </div> --%>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">교육 노출여부</th>
                                <td>
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box"  id="exp_use_yn"  name="exp_use_yn" value="Y" <c:if test="${categoryForm.exp_use_yn =='Y'  || (empty categoryForm.exp_use_yn) }">checked </c:if>>
                                            <label for="">YES</label>
                                        </div>
                                          
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="exp_use_yn"  name="exp_use_yn" value="N" <c:if test="${categoryForm.exp_use_yn =='N'}">checked </c:if>>
                                            <label for="">NO</label>
                                        </div>
                                        <span class="point">* 특별한 상황이 아니라면 NO를 선택하시고 콘탠츠 등록 후 YES를 선택하세요.</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">안내문<br><span class="red-txt">*분야별 교육신청에서 필요 및 노출</span></th>
                                <td>
                                    <div class="upload-box">
                                        <input  id="files"  type="file"   name="files" accept=".jpg, .jpeg, .png"/>
                                        <button id="btn-delete" type='button' class="sm-btn black-btn">삭제</button>
                                        <div id="preview"></div>
                          				<c:if test="${not empty categoryForm.file_name }">
								           	<c:set var="ppx" value="${fn:split(categoryForm.file_name,'.')}" />
								           <img heigth="200px" width="120px" src="/${categoryVo.webPath}/${categoryVo.gubun2}/${categoryForm.edu_notice}.${ppx[1]}" />
							        	</c:if>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="3" class="no-border-b">교육상세</th>
                                <th>교육 소개</th>
                                <td><input type="text" id="edu_intro"  name="edu_intro"  class="input-box lg-width" value="${categoryForm.edu_intro}""/></td>
                            </tr>
                            <tr>
                                <th>교육 목표</th>
                                <td><input type="text" id="edu_goals"  name="edu_goals"  class="input-box lg-width" value="${categoryForm.edu_goals}""/></td>
                            </tr>
                            <tr>
                                <th><span class="red-txt">*</span>차시</th>
                                <td>
                                 <div id="insertCurr">
                                   <c:if test="${empty categoryFormSubList }">
                                    <div class="grid-box">
                                        <input type="text" id="edu_curr1_arr" placeholder="ex.1차시(차시)" name="edu_curr1_arr" class="input-box" value=""/>
                                        <input type="text" id="edu_curr2_arr" placeholder="ex.기초편(차시명)" name="edu_curr2_arr" class="input-box" value=""/>
                                        <input type="text" id="edu_curr3_arr" placeholder="ex.60(학습시간)" name="edu_curr3_arr" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="input-box" value=""/>
                                    </div>
                                    </c:if>
                                     <c:forEach var="result" items="${categoryFormSubList}" varStatus="status">
                                     <div class="grid-box">
                                        <input type="text" id="edu_curr1_arr" placeholder="ex.1차시(차시)"    name="edu_curr1_arr"  class="input-box" value="${result.edu_curr1}"/>
                                        <input type="text" id="edu_curr2_arr" placeholder="ex.기초편(차시명)"   name="edu_curr2_arr"  class="input-box" value="${result.edu_curr2}"/>
                                        <input type="text" id="edu_curr3_arr" placeholder="ex.60(학습시간)"  name="edu_curr3_arr"  class="input-box" value="${result.edu_curr3}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                                        <c:if test="${status.index !=0 }">
                                        	<button type='button' class='sm-btn black-btn'>삭제</button>
                                		</c:if>
                                    </div>
                                     </c:forEach>
                                 </div>
                                  <button type="button" id="addTR" class="sm-btn black-btn">+ 추가</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btn-cont">
                    <c:if test="${not empty categoryForm }">
                   		 <button type="button"  onClick="javascript:fn_save('E');"  id="btnSave" class="mid-btn blue-btn ">수정</button>
                    </c:if>
                    <c:if test="${empty categoryForm }">
                   		 <button type="button"  onClick="javascript:fn_save('I');"  id="btnSave" class="mid-btn blue-btn ">저장</button>
                    </c:if>
                      
                    <button type="button"  onClick="javascript:history.back();" class="mid-btn white-btn btncan">목록</button>
                </div>

			</form>
            