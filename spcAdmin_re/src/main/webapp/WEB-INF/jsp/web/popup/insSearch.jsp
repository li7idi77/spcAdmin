
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/common/jquery.js'/>"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

 $(document).ready(function(){		
 });
 function ins_checked(){
	 opener.insSelect($("input[name='int_check']:checked").val());
	 self.close();
 }
</script>
<div class="pop-wrap">
        <div class="pop-header">
            <h1 class="h1-tit">강사명 검색</h1>
        </div>
        <div class="pop-cont">

            <div class="search-wrap">
                <div class="search-cont">
                <form  id="commonForm" name="commonForm"  method="post"  action="">
                    <select class="select" id="area_nm" name="area_nm">
                        <option value="">지역선택</option>
                        <c:forEach var="code" items="${codeList}" varStatus="status">
							<option value='${code.CD}' <c:if test="${area_nm == code.CD}">selected</c:if>>${code.CD_NM}</option>
						</c:forEach>
                    </select>
                    <input type="text" id="ins_nm" name="ins_nm" value="${ins_nm}" class="input-box sm-width" placeholder="강사명"/>
                    <input type="text" id="coper_nm" name="coper_nm" value="${coper_nm}" class="input-box sm-width" placeholder="소속기관"/>
                    <button class="mid-btn blue-btn">검색</button>
                </form>
                </div>
            </div>

            <div class="table-wrap h360">
                <table class="list-tb">
                    <caption>선택, 지역명, 강사명, 소속기관 정보가 있는 테이블</caption>
                    <colgroup>
                        <col width="10%"/>
                        <col width="15%"/>
                        <col width="25%"/>
                        <col width="*"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>지역명</th>
                            <th>강사명</th>
                            <th>소속기관</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr>
                            <td><input type="radio" class="radio-box" id="int_check" name="int_check" value="${result.INSTRUCTOR_IDX},${result.AREA_NM},${result.USER_NM},${result.USER_ID}"></td>
                            <td>${result.AREA_NM}</td>
                            <td>${result.USER_NM}</td>
                            <td>${result.COPER_NM}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pop-footer">
            <button class="mid-btn navy-btn" onClick="ins_checked();">확인</button>
            <button class="mid-btn white-btn" onClick="self.close();">취소</button>
        </div>
    </div>