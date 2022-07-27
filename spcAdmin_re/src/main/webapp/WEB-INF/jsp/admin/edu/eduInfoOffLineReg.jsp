

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
 <!-- 
	$(document).ready(function(){
	 	$('.cdate').bind('click', function(){
	 		var coper_check = $("input[name='coper_check']:checked").val();
			if(coper_check =="HAND"){
				$("#coper_nm_auto").val(''); 
			}
			if(coper_check =="AUTO"){
				$("#coper_nm").val(''); 
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
	
  });	
 
  function goOkPage(){	
		var frm = document.commonForm;
		$("#gubun1").val('R'); 
		$("#category1_key").val(0);
		$("#category2_key").val(0);
		$("#category3_key").val(0);
		$("#edu_target").val('');
		$("#coper_nm").val('');
		frm.action = "<c:url value='/edu/eduInfoOfflineList.do'/>";
		frm.submit();
   }
	    
	function fn_save(gubun1){
	   
	   var category1_key = $("select[name=category1_key] option:selected").val();  //교육분류1
       var category2_key = $("select[name=category2_key] option:selected").val();  //교육분류2
	   var category3_key = $("select[name=category3_key] option:selected").val();  //교육명		   
	   	   
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
		
		var msg = "오프라인[기관]을  등록 하시겠습니까?";
		if (gubun1 == "E"){
			msg = "오프라인[기관]을  수정 하시겠습니까?"
		}
		
		$("#gubun1").val(gubun1);
		
		var edu_no       = $("#edu_no").val();
		var edu_site     = $("#edu_site").val();
		var gubun1       = $("#gubun1").val();
		var gubun2       = $("#gubun2").val();
		
		var coper_nm     = $("#coper_nm").val();       //기관명
		var coper_nm_auto= $("#coper_nm_auto").val();  //기관명자동
		var coper_id     = $("#coper_id").val();       //기관명자동아이디
		var coper_check  = $('input:radio[name="coper_check"]:checked').val();    //기관Check(AUTO,HAND)
		
		if(coper_check =='AUTO'){
			if (coper_nm_auto == ""){			
				alert("기관명을 입력 하세요.");
				$("#coper_nm_auto").focus()
				return;
			}	
		}
		if(coper_check =='HAND'){
			if (coper_nm == ""){			
				alert("기관명을 입력 하세요.");
				$("#coper_nm").focus()
				return;
			}	
		}
		
		var edu_target   = $("#edu_target").val();    //교육대상
		var edu_time     = $("#edu_time").val();      //교육시간
		var edu_garden   = $("#edu_garden").val();    //교육인원
		var edu_status   = $('input:radio[name="edu_status"]:checked').val();    //교육상태(신청중:I,신청취소:C, 신청마감:F, 사용중지:P, 결과보고:R)*
		var exp_use_yn   = $('input:radio[name="exp_use_yn"]:checked').val();    //교육 노출여부
		
	
		
		if (edu_target == ""){			
			alert("교육대상을 입력 하세요.");
			$("#edu_target").focus()
			return;
		}	
		
		if (edu_time == ""){			
			alert("교육시간을 입력 하세요.");
			$("#edu_time").focus()
			return;
		}	
		if (edu_garden == ""){			
			alert("교육정원을 입력 하세요.");
			$("#edu_garden").focus()
			return;
		}	
	
		var formData = new FormData(); 
		
		formData.append("gubun1",       gubun1);
		formData.append("gubun2",       gubun2);		
		formData.append("edu_no",       edu_no);
		formData.append("edu_site",     edu_site);
		
		formData.append("category1_key",   category1_key);
		formData.append("category2_key",   category2_key);
		formData.append("category3_key",   category3_key);
		
	    formData.append("coper_nm",      coper_nm);
		formData.append("coper_nm_auto", coper_nm_auto);
		formData.append("coper_id",      coper_id);
		formData.append("coper_check",   coper_check);
		
		formData.append("edu_target",  edu_target);
		formData.append("edu_time",    edu_time);
		formData.append("edu_garden",  edu_garden);
		formData.append("edu_status",  edu_status);
		formData.append("exp_use_yn",  exp_use_yn);
		
		
		var yn = confirm(msg);		
		if(yn){
			$.ajax({	
				data       : formData,
			    url		   : "<c:url value='/edu/eduInfoOfflineSave.do'/>",
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
	
	function openWindowPop(url, name){
	    var options = 'top=10, left=10, width=720px, height=780px, status=no, menubar=no, toolbar=no, resizable=no';
	    window.open(url, name, options);
	}
	
    //-->
 </script>
 		   
           <form  id="commonForm" name="commonForm"  method="post"  >
			<input type="hidden" id="gubun1"   name="gubun1"   />
			<input type="hidden" id="gubun2"   name="gubun2"   value='eduInfoOffline'/>
			<input type="hidden" id="gubun3"   name="gubun3"   />
			<input type="hidden" id="edu_no"   name="edu_no"   value='${categoryVo.edu_no}'/>
			<input type="hidden" id="edu_site" name="edu_site" value='${categoryVo.edu_site}'/>
			<input type="hidden" id="coper_id" name="coper_id" value='${categoryVo.coper_id}'/>
			<input type="hidden" id="edu_site" name="site"     value='off'/>
		
            <h1 class="h1-tit">오프라인 교육 등록</h1>
 				<div class="tab-cont">
                    <ul>
                      <li class="on">기관</li>
                      <li><a href="<c:url value='/edu/eduInfoNoOrglineReg.do'/>">기관 이외</a></li>
                    </ul>
                </div>
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
                                    <select class="select mr30"  id="category1_key" name="category1_key">
                                       <c:if test="${not empty categoryForm.category1_name }">
                                    		<option value='${categoryForm.category1_key}'>${categoryForm.category1_name}</option>
                                    	</c:if>
                                        <option value=''>선택 하세요</option>
	                                    <c:forEach var="result" items="${category1list}" varStatus="status">
	                                    	<c:if test="${result.code_name == '기관'}">
	                                    	<option value='${result.code_cd}'>${result.code_name}</option>
	                                    	</c:if>
	                                    </c:forEach>
                                    </select>
                                    <select class="select"  id="category2_key" name="category2_key">
                                    	<c:if test="${not empty categoryForm.category2_name }">
                                    		<option value='${categoryForm.category2_key}'>${categoryForm.category2_name}</option>
                                    	</c:if>
                                        <option value=''>선택 하세요</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><span class="red-txt">*</span>교육명</th>
                                <td>
                                    <select class="select lg-width"  id="category3_key" name="category3_key">
                                       <c:if test="${not empty categoryForm.category3_name }">
                                    		<option value='${categoryForm.category3_key}'>${categoryForm.category3_name}</option>
                                    	</c:if>
                                        <option value=''>선택 하세요</option>
                                    </select>
                                </td>
                            </tr>
                           <tr>
                                <th  colspan="2">기관명</th>
                                <td>
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box cdate" id="coper_check"   name="coper_check"    value="AUTO" <c:if test="${categoryForm.coper_check =='AUTO' || (empty categoryForm.coper_check)  }">checked </c:if>>
                                            <input type="text"  class="input-box"  id="coper_nm_auto" name="coper_nm_auto"  readonly value="${categoryForm.coper_nm_auto}"/>
                                            <button type="button" onClick="javascript:openWindowPop('<c:url value='/edu/orgPopSearch.do'/>','popup');" class="sm-btn blue-btn">검색</button>
                                        </div>
                                          <!--   
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box cdate" id="coper_check" name="coper_check" value="HAND" <c:if test="${categoryForm.coper_check =='HAND'  }">checked </c:if>>
                                            <label for="">직접입력</label>
                                            <input type="text" class="input-box" id="coper_nm" name="coper_nm"  value="${categoryForm.coper_nm}"/>
                                        </div>
                                          -->
                                    </div>
                                </td>
                            </tr>
                             <tr>
                                <th colspan="2">교육대상(구분)</th>
                                <td>
                                    <input type="text" id="edu_target"  name="edu_target" class="input-box" value="${categoryForm.edu_target}"/>
                                    <span class="point">ex. 성인, 청소년, 중장년, 노인, 이어줌인, 대학생, 직장인 등</span>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">교육시간</th>
                                <td>
                                    <input type="text" id="edu_time"  name="edu_time" class="input-box" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  value="${categoryForm.edu_time}"  maxlength="5"/>분
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><span class="red-txt">*</span>교육정원</th>
                                <td>
                                    <input type="text" id="edu_garden"  name="edu_garden" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="5" class="input-box" value="${categoryForm.edu_garden}"/>
                                    <span class="point">교육정원을 꼭 기입하시기 바랍니다.</span>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">교육상태</th>
                                <td>
                                    <div class="tb-cont">
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="신청중" <c:if test="${categoryForm.edu_status =='신청중'  || (empty categoryForm.edu_status) }">checked </c:if>>
                                            <label for="">신청중</label>
                                        </div>
                                          
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="신청취소" <c:if test="${categoryForm.edu_status =='신청취소'}">checked </c:if>>
                                            <label for="">신청취소</label>
                                        </div>
                                        
                                        <div class="radio-cont mr10">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="신청마감" <c:if test="${categoryForm.edu_status =='신청마감'}">checked </c:if>>
                                            <label for="">신청마감</label>
                                        </div>
                                        <div class="radio-cont">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="사용중지" <c:if test="${categoryForm.edu_status =='사용중지'}">checked </c:if>>
                                            <label for="">사용중지</label>
                                        </div>
                                        
                                        <div class="radio-cont mr10">
                                            <input type="radio" class="radio-box" id="edu_status"  name="edu_status" value="결과보고" <c:if test="${categoryForm.edu_status =='결과보고'}">checked </c:if>>
                                            <label for="">결과보고</label>
                                        </div>
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
                                    </div>
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
            