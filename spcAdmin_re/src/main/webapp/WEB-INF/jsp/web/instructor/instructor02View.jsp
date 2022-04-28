
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


 <script type="text/javaScript" language="javascript" defer="defer">
 $(document).ready(function(){		
	 
 });
 
 function fn_goList(){
	document.location = "<c:url value='/user/instructor02List.do'/>";
}	
</script>
     <!-- container  begin -->
                <div id="container">
                    <div class="tit-wrap">
                        <h1 class="h1-tit">강사 공지사항</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>생명지킴이 강사 공간</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>강사 공지사항</span>
                        </div>
                    </div>

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
                                                <h4 class="h4-tit">${result.TITLE}</h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td>${result.REG_NM}</td>
                                            <th>작성일</th>
                                            <td>${result.REG_DT}</td>
                                            <th>조회수</th>
                                            <td>${result.VIEW_CNT}</td>
                                        </tr>
                                        <tr>
                                            <th>첨부파일</th>
                                            <td colspan="5">
                                                <a href="" class="link  block">${result.FILE_ID}</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <div class="viewer">${result.CONTENTS}</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>다음 글</th>
                                            <c:if test="${not empty result.NEXT_NM}">
                                            	<td colspan="5" class="tl"><a class="link" href="<c:url value='/user/instructor02View.do'/>?board_idx=${result.NEXT_IDX}">${result.NEXT_NM}</a></td>
                                            </c:if>
                                            <c:if test="${empty result.NEXT_NM}">
                                            	<td colspan="5" class="tl">다음 글이 없습니다.</td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <th>이전 글</th>
                                            <c:if test="${not empty result.PREV_NM}">
                                            	<td colspan="5" class="tl"><a class="link" href="<c:url value='/user/instructor02View.do'/>?board_idx=${result.PREV_IDX}">${result.PREV_NM}</a></td>
                                            </c:if>
                                            <c:if test="${empty result.PREV_NM}">
                                            	<td colspan="5" class="tl">이전 글이 없습니다.</td>
                                            </c:if>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!---- button begin ---->
                        <div class="btn-cont">
                            <button type="button" class="lg-btn white-btn" onClick="fn_goList();">목록</button>
                        </div>
                        <!---- button end ---->
                    </div>
                </div>
                <!--  container end -->