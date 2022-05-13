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
<script type="text/javaScript" language="javascript" defer="defer">
 $(document).ready(function(){		
	 	$('#category1_key').change(function(){
	 		var val  = $(this).val();

			if( val ==""){
				return;
			}
			
			$("#category2_key").val("");
			$("#category3_key").val("");
			
			 $.ajax({	
			    url     : "<c:url value='/user/category2list.do'/>",
			    data    : $("#commonForm").serialize(),
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
			    data    : $("#commonForm").serialize(),
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
  
 
 function fn_detail(id){
	document.location = "<c:url value='/inst/instructorAdm01View.do'/>?user_id="+id;
 }	
 
 function fn_egov_link_page(pageNo){
 	 var frm = document.commonForm;
 	 $("#pageIndex").val(pageNo); 
 	 frm.action = "<c:url value='/adm/studentList.do'/>";
   	 frm.submit();
 }
</script>
<h1 class="h1-tit">수강생/수료생 현황</h1>

<div class="search-wrap">
<form id="commonForm" name="commonForm" method="post" enctype="Multipart/form-data">
    <div class="search-cont">
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="user_gubun" name="user_gubun" value="ALL" <c:if test="${user_gubun == 'ALL' || (empty user_gubun)}">checked </c:if>>
            <label for="dateAll">전체</label>
        </div>
        <div class="radio-cont mr10">
            <input type="radio" class="radio-box" id="user_gubun" name="user_gubun" value="1" <c:if test="${user_gubun == '1'}">checked </c:if>>
            <label for="dateTerm">수강생</label>
        </div>
        <div class="radio-cont mr10">
            <input type="radio" class="radio-box" id="user_gubun" name="user_gubun" value="2" <c:if test="${user_gubun == '2'}">checked </c:if>>
            <label for="dateTerm">수료생</label>
        </div>
       * 적용될수 없는 조건
    </div>

    <div class="search-cont search-sub">
        <h3 class="h3-tit">구분</h3>

        <div class="radio-cont">
            <input type="radio" class="radio-box" id="cate_gubun" name="cate_gubun" value="ALL" <c:if test="${cate_gubun == 'ALL' || (empty cate_gubun)}">checked </c:if>>
            <label for="">전체</label>
        </div>
        <div class="radio-cont">
            <input type="radio" class="radio-box" id="cate_gubun" name="cate_gubun" value="SEL" <c:if test="${cate_gubun == 'SEL'}">checked </c:if>>
            <select class="select"  id="category1_key" name="category1_key">
            	<option value='' >선택 하세요</option>
				<c:forEach var="result" items="${category1list}" varStatus="status">
					<option value='${result.CATEGORY1_KEY}' >${result.CATEGORY1_NAME}</option>
				</c:forEach>
            </select>
                           <select class="select"  id="category2_key" name="category2_key">
            	<option value='' >선택 하세요</option>
				<c:forEach var="result" items="${category2list}" varStatus="status">
					<option value='${result.CATEGORY2_KEY}' >${result.CATEGORY2_NAME}</option>
				</c:forEach>
            </select>
            <select class="select lg-width"  id="category3_key" name="category3_key">
            	<option value='' >선택 하세요</option>
				<c:forEach var="result" items="${category3list}" varStatus="status">
					<option value='${result.CATEGORY3_KEY}' >${result.CATEGORY3_NAME}</option>
				</c:forEach>
            </select>
        </div>
        
        <button class="search-btn">검색</button>
        <button class="search-btn white-btn ml20" onClick="fn_clear();">초기화</button>
    </div>
</form>
</div>

<div class="btn-cont mb20">
    <dl class="count-txt">
        <dt>전체 <span>${count.ALLCNT}</span></dt>
        <dt>수강생 <span>${count.STATUS1}</span></dt>
        <dt>수료생 <span>${count.STATUS2}</span></dt>
    </dl>

    <button class="mid-btn black-btn">엑셀다운</button>
    <button class="mid-btn white-btn">선택삭제(불가)</button>
</div>

<div class="table-wrap">
    <table class="list-tb">
        <caption>선택, 분류1, 분류2, 분류3, 강사명, 개설일, 수강생, 수료생 정보가 있는 테이블</caption>
        <colgroup>
            <col width="6%"/>
            <col width="8%"/>
            <col width="12%"/>
            <col width="17%"/>
            <col width="*"/>
            <col width="9%"/>
            <col width="9%"/>
            <col width="8%"/>
            <col width="8%"/>
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" class="check-box"/></th>
                <th>No.</th>
                <th>분류1</th>
                <th>분류2</th>
                <th>분류3</th>
                <th>강사명</th>
                <th>개설일</th>
                <th>수강생</th>
                <th>수료생</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="result" items="${resultList}" varStatus="status">
            <tr>
                <td><input type="checkbox" class="check-box"/></td>
                <td>${status.index + 1}</td>
                <td class="tl">${result.CATEGORY1_NAME}</td>
                <td class="tl">${result.CATEGORY2_NAME}</td>
                <td class="tl">${result.CATEGORY3_NAME}</td>
                <td>${result.INST_NM}</td>
                <td>${result.REG_DT}</td>
                <td><a class="link">${result.APP_CNT}</a></td>
                <td><a class="link">${result.APP_FIN_CNT}</a></td>
            </tr>
            </c:forEach>
            <c:if test="${empty resultList }">
             <tr>
                 <td colspan='9'/>Data 없습니다.</td>
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