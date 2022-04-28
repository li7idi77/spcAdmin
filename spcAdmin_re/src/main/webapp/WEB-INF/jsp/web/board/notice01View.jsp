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


  <!-- container  begin -->
   <div id="container">

       <div class="tit-wrap">
       
       		<h1 class="h1-tit">
				<c:if test="${adBoardVo.board_type =='01'}">공지사항</c:if>
				<c:if test="${adBoardVo.board_type =='02'}">자료실</c:if>
				<c:if test="${adBoardVo.board_type =='03'}">FAQ</c:if>
			</h1>
			
			<div class="side-cont">
			    <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
				<img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
				<span>공지사항</span>
				<img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
				<span>
					<c:if test="${adBoardVo.board_type =='01'}">공지사항</c:if>
					<c:if test="${adBoardVo.board_type =='02'}">자료실</c:if>
					<c:if test="${adBoardVo.board_type =='03'}">FAQ</c:if>
				</span>
			 </div>
       </div>

	<form id="commonForm" name="commonForm" method="post" >
	<input type="hidden" id="board_idx"   name="board_idx"   value="${ not empty detailData.board_idx ? detailData.board_idx : '0'}">
	<input type="hidden" id="board_type"  name="board_type"  value="${adBoardVo.board_type}">
	<input type="hidden" id="file_seq"    name="file_seq"    value=0/>

       <div class="contents-wrap">

           <div class="comp">
               <div class="table-wrap">
                   <table class="detail-tb">
                       <caption>제목, 작성자, 작성일, 조회수, 첨부파일 정보가 있는 테이블</caption>
                       <colgroup>
                           <col width="16%"/>
                           <col width="16%"/>
                           <col width="16%"/>
                           <col width="16%"/>
                           <col width="16%"/>
                           <col width="*"/>
                       </colgroup>
                       <tbody>
                           <tr>
                               <td colspan="6">
                                   <h4 class="h4-tit">${detailData.title}</h4>
                               </td>
                           </tr>
                           <tr>
                               <th>작성자</th>
                               <td>${detailData.reg_nm}</td>
                               <th>작성일</th>
                               <td>${detailData.reg_dt}</td>
                               <th>조회수</th>
                               <td>${detailData.view_cnt}</td>
                           </tr>
                           <tr>
                               <th>첨부파일</th>
                               <td colspan="5">
	                               <c:forEach var="result" items="${resultFileList}" varStatus="status">
	                               	<a  class="link  block" onclick="javascript:fileDownload('${result.file_seq}');"> ${result.file_name}</a>
	                               </c:forEach>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="6">
                                   <div class="viewer">${detailData.contents}</div>
                               </td>
                           </tr>
                          <c:if test="${not empty detailNextData.title }">
                           <tr>
                               <th>다음 글</th>
                               <td colspan="5" class="tl"  data-idx="${detailNextData.board_idx}"  style="cursor:pointer" >${detailNextData.title}</td>
                           </tr>
                           </c:if>
                           <c:if test="${not empty detailPreData.title }">
                           <tr>
                               <th>이전 글</th>
                               <td colspan="5" class="tl" data-idx="${detailPreData.board_idx}"  style="cursor:pointer" >${detailPreData.title}</td>
                           </tr>
                           </c:if>
                       </tbody>
                   </table>
               </div>
           </div>

          </form> 

           <!---- button begin ---->
           <div class="btn-cont">
                <button type="button" class="lg-btn white-btn" onClick="history.back();">목록</button>
           </div>
           <!---- button end ---->

           

       </div>
   </div>
   <!--  container end -->
<script type="text/javascript">
 
 $(document).ready(function(){

	 $('.tl').bind('click', function(){
	   	var board_idx  = $(this).data('idx');
	   	$("#board_idx").val(board_idx);
		var frm = document.commonForm;
	  	frm.submit();
	});
	

 });
 


function fn_load(){
	var frm = document.commonForm;
	var type = $("#board_type").val();
	frm.action = "<c:url value='/user/lifeEduBoardList.do'/>";	
  	frm.submit();
}

function fileDownload(key1){
	var frm = document.commonForm;
	$("#file_seq").val(key1)
	frm.action = "<c:url value='/user/fileDownload.do'/>";
	frm.submit();
}


 </script>
