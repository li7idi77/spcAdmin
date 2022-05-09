<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<h1 class="h1-tit">번호 수료증</h1>

<div class="tab-cont">
    <ul>
        <li><a href="<c:url value='/warrant/warrantNumber.do' />">기본 양식</a></li>
        <li class="on"><a href="<c:url value='/warrant/warrantNumberReqList.do' />">등록</a></li>
        <li><a href="<c:url value='/warrant/warrantNumberModList.do' />">목록/수정</a></li>
    </ul>
</div>

<div class="search-wrap">
    <form id="listForm" name="listForm" target="_self" action="" method="post" onsubmit="">
    <input type="hidden" id="category3" name="category3" value="${category3_key}">
    <div class="search-cont">
    	<select class="select" id="site" name="site">
            <option value="on">온라인</option>
            <option value="off">오프라인</option>
        </select>
    	<select class="select mr30"  id="category1_key" name="category1_key">
        	<option value=''>선택 하세요</option>
			<c:forEach var="result" items="${category1list}" varStatus="status">
				<c:if test="${result.CATEGORY1_KEY != '7'}">
			     <option value='${result.CATEGORY1_KEY}' <c:if test="${category1_key == result.CATEGORY1_KEY}">selected</c:if>>${result.CATEGORY1_NAME}</option>
			    </c:if>
			 </c:forEach>
		</select>
        <select class="select"  id="category2_key" name="category2_key">
        	<option value=''>선택 하세요</option> 
			<c:forEach var="result" items="${category2list}" varStatus="status">
			     <option value='${result.CATEGORY2_KEY}' <c:if test="${category2_key == result.CATEGORY2_KEY}">selected</c:if>>${result.CATEGORY2_NAME}</option>
			</c:forEach>
        </select>
        <select class="select lg-width"  id="category3_key" name="category3_key">
            <option value=''>선택 하세요</option>
			<c:forEach var="result" items="${category3list}" varStatus="status">
			     <option value='${result.CATEGORY3_KEY}' <c:if test="${category3_key == result.CATEGORY3_KEY}">selected</c:if>>${result.CATEGORY3_NAME}</option>
			</c:forEach>
        </select>
		<select class="select" id="searchType" name="searchType">
            <option value="name">이름</option>
            <option value="id">아이디</option>
        </select>
        <input type="text" id="searchText" name="searchText" class="input-box lg-width" placeholder="직접입력">
        
        <button class="search-btn">검색</button>
        <button class="search-btn white-btn ml20" onclick="fn_clearBtn();">초기화</button>
    </div>
    </form>

</div>

<div class="btn-cont mb20">
    <button class="mid-btn white-btn">선택삭제</button>
</div>

<div class="table-wrap">
    <table class="list-tb">
       <caption>선택, 분류3(교육명), 이름, 아이디, 소속, 연락처, 수료증 발급 등록 정보가 있는 테이블</caption>
       <colgroup>
           <col width="6%"/>
           <col width="8%"/>
           <col width="*"/>
           <col width="10%"/>
           <col width="12%"/>
           <col width="15%"/>
           <col width="12%"/>
           <col width="10%"/>
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" class="check-box"/></th>
                <th>No.</th>
                <th>분류3(교육명)</th>
                <th>이름</th>
                <th>아이디</th>
                <th>소속</th>
                <th>연락처</th>
                <th>수료증 발급 등록</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="result" items="${resultList}" varStatus="status">
	            <tr>
	            	<td><input type="checkbox" id='checkNo' name='checkNo' value="${result.COUR_NO}" class="check-box"/></td>
                    <td>${status.index + 1}</td>
                    <td class="tl">${result.EDU_NAME}</td>
                    <td>${result.USER_NM}</td>
                    <td>${result.USER_ID}</td>
                    <td>${result.COPER_NM}</td>
                    <td>${result.MBL_TELNO}</td>
                    <td><c:if test="${result.ADD_CHK == null || result.ADD_CHK == ''}"><button onClick="javascript:openWindowPop('<c:url value='/warrant/popWarrantNumberReq.do'/>?cour_no=${result.COUR_NO}','popup');" class="sm-btn black-btn">등록하기</button></c:if></td>
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

<script type="text/javascript">
 
 $(document).ready(function(){
	 $('#category1_key').change(function(){
	 		var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category2_key").val("");
			$("#category3_key").val("");
			
			 $.ajax({	
			    url     : "<c:url value='/user/category2list_opt.do'/>",
			    data    : $("#listForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY2_KEY+'">'+ret.CATEGORY2_NAME+'</option>';		
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
			
			$("#category3_key").val("");
					
			 $.ajax({	
			    url     : "<c:url value='/user/category3list.do'/>",
			    data    : $("#listForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
				success: function(data, opt, inx){
				var option = '';
				option += '<option value="">선택 하세요</opton>'; //선택
				$.each(data, function(i, ret){
					option += '<option value="'+ret.CATEGORY3_KEY+'">'+ret.CATEGORY3_NAME+'</option>';		
				});
				$('select[name=category3_key]').html(option);						
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		 }); 
 });
 
 function fn_clearBtn(){
	 $("#searchDate").eq(0).prop("checked",true);
	 $("#searchCondition").eq(0).prop("checked",true);
	 $("[type='text']").val("");
 }
 
function fn_delete(idx) {
	var idxArray = new Array();

	idxArray.push(idx);
	if(confirm('삭제 처리하시겠습니까?')) {
		setDel(idxArray);
	}

}

var btnDel = function() {

	var idxArray = new Array();

	$("input[name=checkNo]:checked").each(function() {
		idxArray.push($(this).val());
	});

	if(idxArray.length < 1){
		alert("선택한 내역이 없습니다.");
		return false;
	}
	
	if(confirm('삭제 처리하시겠습니까?')) {
		setDel(idxArray);
	}
	
};

var setDel = function(idxArray){
    $.ajax({
        url: "<c:url value='/warrant/warrantNumberDel.do'/>",
        type: "POST",
        data: { "boardIdxArray" : idxArray },
        success: function(data) {
        	if(data == 'SUCCESS'){
        		alert("처리 완료하였습니다.");
        		location.reload();
        	}
        },
        error: function(data) {
        	console.log(JSON.stringify(data));
        	alert("처리중 오류가 발생했습니다.");
        }
    });
};

function openWindowPop(url, name){
    var options = 'top=10, left=10, width=540px, height=360px, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}	

function fn_egov_link_page(pageNo){
	 var frm = document.commonForm;
	 $("#pageIndex").val(pageNo); 
	 frm.action = "<c:url value='/warrant/warrantNumberReqList.do'/>";
  	 frm.submit();
}
 </script>