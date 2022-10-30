
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
  
</script>
     <!-- container  begin -->
            <div id="container">

                    <div class="tit-wrap">
                        <h1 class="h1-tit">기본정보</h1>

                        <div class="side-cont">
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_home.png" alt="홈 바로가기"/>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>마이페이지</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>강사</span>
                            <img src="${pageContext.request.contextPath}/user/images/common/ico_next.png" alt="다음 아이콘"/>
                            <span>기본정보</span>
                        </div>
                    </div>

                    <div class="contents-wrap">
						<div class="comp">
                            <div class="table-wrap">
                                <table class="detail-tb">
                                    <caption>회원유형, 이름, 아이디, 휴대폰, 이메일 정보가 있는 테이블</caption>
                                    <colgroup>
                                        <col width="20%"/>
                                        <col width="*"/>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>회원유형</th>
                                            <td>
	                                            <c:if test="${UserAccount.user_gu == '1'}">개인</c:if>
	                                            <c:if test="${UserAccount.user_gu == '2'}">기업</c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>이름</th>
                                            <td>${UserAccount.user_nm}</td>
                                        </tr>
                                        <tr>
                                            <th>아이디</th>
                                            <td>${UserAccount.user_id}</td>
                                        </tr>
                                        <tr>
                                            <th>휴대폰</th>
                                            <td>${UserAccount.mbl_telno}</td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td>${UserAccount.eml_addr}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--  container end -->