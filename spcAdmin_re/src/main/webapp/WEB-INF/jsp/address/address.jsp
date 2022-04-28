<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : EgovGoodswList.jsp
 * @Description : 품목 리스트 화면
 * @Modification Information
 *
 *   수정일         수정자                   수정내용
 *  -------    --------    ---------------------------
 *  2011.07.11  신혜연          최초 생성
 *
 * author 실행환경팀
 * Copyright (C) 2011 by MOPAS  All right reserved.
 */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<title>Excel 예제</title>

<script type="text/javaScript" language="javascript" defer="defer">



/* excel download function */
function fn_egov_excel(){
	document.listForm.action = "<c:url value='/address/excelDownload.do'/>";
   	document.listForm.submit();
}

/* excel download function */
function fn_egov_excelPOI(){
	document.listForm.action = "<c:url value='/address/excelPOIDownload.do'/>";
   	document.listForm.submit();
}

/* excel upload function */
function fn_egov_regist_cxcel(){
	document.listForm.action = "<c:url value='/address/excelUpload.do'/>";
   	document.listForm.submit();
}

/* excel upload function */
function fn_egov_regist_cxcelPOI(){
	document.listForm.action = "<c:url value='/gds/excelPOIUpload.do'/>";
   	document.listForm.submit();
}


</script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
	<div id="content_pop">
		<form:form commandName="searchVO" id="listForm" name="listForm" method="post" enctype="multipart/form-data" >
		
		
		 <input name="excelFileName" type="text" value="fileNm"/>
 			<div id="sysbtn">
				<ul>
					<li><a href="#link" class="button" onClick="fn_egov_excel(); return false;">excel down</a></li>
					<li><a href="#link" class="button" onClick="fn_egov_excelPOI(); return false;">excelPOI down</a></li>
				</ul>
			</div>

			<div id="table">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="품목을 확인 할 수 있습니다.">
				    <caption>품목 목록</caption>
					<colgroup>
						<col width="60" >
						<col width="100">
						<col width="400">
						<col width="120">
					</colgroup>
					<thead>
						<tr>
							<th align="center">NAME</th>
							<th align="center">HP</th>							
						</tr>
					</thead>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td align="center"><c:out value="${result.address_name}"/>&nbsp;</td>
							<td align="center"><c:out value="${result.address_hp}"/>&nbsp;</td>							
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div id="sysbtn1">
				<table width="500" border="0" cellpadding="1" cellspacing="0" class="table-register" summary="엑셀파일을 첨부할 수 있는 등록 테이블이다.">
	                <caption style="display:none;">엑셀파일 등록</caption>
					<tr>
						<th><label for="fileNm">엑셀파일 업로드</label></th>
						<td><input name="fileNm" type="file" id="fileNm"/></td>
						<td><input type="submit" class="button" onclick="fn_egov_regist_cxcel(); return false;"></td>
					</tr>
				</table>
			</div>
			<%-- <div id="sysbtn1">
				<table width="500" border="0" cellpadding="1" cellspacing="0" class="table-register" summary="엑셀파일을 첨부할 수 있는 등록 테이블이다.">
	                <caption style="display:none;">엑셀파일 등록</caption>
					<tr>
						<th><label for="fileNm">xlsx 엑셀파일 업로드</label></th>
						<td><input name="fileNm" type="file" id="fileNm"/></td>
						<td><input type="submit" class="button" onclick="fn_egov_regist_cxcelPOI(); return false;"></td>
					</tr>
				</table>
			</div> --%>

		</form:form>
	</div>

</body>
</html>
