<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>

 <div class="lnb-wrap">
 	  <c:if test="${fn:contains(path, '/user/summaryList')}">
	      <aside class="tit">개요</aside>
	      <div class="lnb-menu">
	          <ul>
	                 <li <c:if test="${path =='/user/summaryList01.do'}">   class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/summaryList01.do">생명지킴이</a>
	                 </li>
		             <li <c:if test="${path =='/user/summaryList02.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/summaryList02.do">생명지킴이 교육 강사</a>
		             </li>
		             <li <c:if test="${path =='/user/summaryList03.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/summaryList03.do">자살 유족 서비스 전문가</a>
		             </li>
		             <li <c:if test="${path =='/user/summaryList04.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/summaryList04.do">심리부검 주면담원</a>
		             </li>
		             <li <c:if test="${path =='/user/summaryList05.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/summaryList05.do">자살 사후대응 전문가</a>
		            </li>
		      </ul>
	      </div>
     </c:if>
     <c:if test="${fn:contains(path, '/user/info')}">
	      <aside class="tit">교육안내</aside>
	      <div class="lnb-menu">
	          <ul>
	                 <li <c:if test="${path =='/user/info01.do'}">   class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/info01.do">생명지킴이 교육</a>
	                 </li>
		             <li <c:if test="${path =='/user/info02.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/info02.do">생명지킴이 강사<br/>양성 교육</a>
		             </li>
		             <li <c:if test="${path =='/user/info03.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/info03.do">실무자 역량 강화 교육</a>
		             </li>
		             <li <c:if test="${path =='/user/info04.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/info04.do">자살 유족 서비스제공<br/> 인력교육</a>
		             </li>
		             <li <c:if test="${path =='/user/info05.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/info05.do">광역주도형 심리부검면담원<br/> 양성교육</a>
		            </li>
		            <li <c:if test="${path =='/user/info06.do'}">   class="on" </c:if>>
		             	<a href="${pageContext.request.contextPath}/user/info06.do">자살사후대응 전문가<br/> 양성교육</a>
		            </li>
		      </ul>
	      </div>
     </c:if>

     <c:if test="${fn:contains(path, '/user/lifeEdu')}">
	      <aside class="tit">생명지킴이교육</aside>
	      <div class="lnb-menu">
	          <ul>
	                 <li <c:if test="${fn:contains(path, '/user/lifeEduOnLine') || fn:contains(path, '/user/lifeEduOrg') }">  class="on" </c:if>>
	                 	<a href="#">교육신청</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${fn:contains(path, '/user/lifeEduOnLine') }">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/lifeEduOnLineList.do">온라인교육</a></li>
	                    	<li <c:if test="${fn:contains(path, '/user/lifeEduOrg') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/lifeEduOrgList.do">교육 기관별</a></li>
	                    </ul>
	                 </li>
		             <li <c:if test="${fn:contains(path, '/user/lifeEduSch') }">    class="on" </c:if>>   <a href="${pageContext.request.contextPath}/user/lifeEduSch.do">교육일정</a></li>
	             	 <li <c:if test="${fn:contains(path, '/user/lifeEduBoard') }">  class="on" </c:if>> <a href="${pageContext.request.contextPath}/user/lifeEduBoardList.do">생명지킴이 활동 수기</a></li>
		      </ul>
	      </div>
     </c:if>
     
     <c:if test="${idx != '' and idx != null}">
	      <aside class="tit">분야별 교육신청</aside>
	      <div class="lnb-menu">
	          <ul>
	                 <li <c:if test="${idx == '01'}">  class="on" </c:if>>
	                 	<a href="#">생명지킴이 강사 양성 교육</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${idx == '01'}">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/sectorList.do?idx=01">교육신청</a></li>
                        </ul>
	                 </li>
	                 <li <c:if test="${idx == '02'}">  class="on" </c:if>>
	                 	<a href="#">실무자 역량 강화 교육</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${idx == '02'}">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/sectorList.do?idx=02">교육신청</a></li>
                        </ul>
	                 </li>
	                 <li <c:if test="${idx == '03'}">  class="on" </c:if>>
	                 	<a href="#">자살유족서비스 제공 인력교육</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${idx == '03'}">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/sectorList.do?idx=03">교육신청</a></li>
                        </ul>
	                 </li>
	                 <li <c:if test="${idx == '04'}">  class="on" </c:if>>
	                 	<a href="#">광역주도형 심리부검면담원 양성교육</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${idx == '04'}">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/sectorList.do?idx=04">교육신청</a></li>
                        </ul>
	                 </li>
	                 <li <c:if test="${idx == '05'}">  class="on" </c:if>>
	                 	<a href="#">자살사후대응 전문가 양성교육</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${idx == '05'}">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/sectorList.do?idx=05">교육신청</a></li>
                        </ul>
	                 </li>
		      </ul>
	      </div>
     </c:if>
     
     <c:if test="${fn:contains(path, '/user/notice')}">
	      <aside class="tit">공지사항</aside>
	      <div class="lnb-menu">
	          <ul>
	                 <li <c:if test="${fn:contains(path, '/user/notice01')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/notice01List.do">공지사항</a>
		             </li>
		             
		             <c:if test="${sessionId == null}">
		             <li <c:if test="${fn:contains(path, '/user/notice02')}">  class="on" </c:if> title="개인 회원가입 후 이용이 가능합니다.">
			             <a title="개인 회원가입 후 이용이 가능합니다.">자료실</a>
			         </li>
			         </c:if>  
			         <c:if test="${sessionId != null}">
					 <li <c:if test="${fn:contains(path, '/user/notice02')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/notice02List.do">자료실</a>
		             </li>
		             </c:if>
		             <li <c:if test="${fn:contains(path, '/user/notice03')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/notice03List.do">F&Q</a>
		             </li>
		      </ul>
	      </div>
     </c:if>
     
     <c:if test="${fn:contains(path, '/user/org')}">
	      <aside class="tit">기관회원 공간${sessionId.user_gu}</aside>
	      <div class="lnb-menu">
	          <ul>
	          		<li <c:if test="${fn:contains(path, '/user/org01')}">  class="on" </c:if>>
	                 	<a href="#">교육개설</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${fn:contains(path, '/user/org01info') }">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/org01info.do">개설절차</a></li>
                        	<c:if test="${sessionId.user_gu == '2'}">
	                    	<li <c:if test="${fn:contains(path, '/user/org01List') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/org01List.do">교육개설</a></li>
	                    	</c:if>
                        </ul>
	                 </li>
	                 <c:if test="${sessionId.user_gu == '2'}">
	                 <li <c:if test="${fn:contains(path, '/user/org02')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/org02List.do">신청 현황</a>
		             </li>
		             <li <c:if test="${fn:contains(path, '/user/org03')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/org03List.do">결과 보고</a>
		             </li>
		             </c:if>
		      </ul>
	      </div>
     </c:if>
     
     <c:if test="${fn:contains(path, '/my')}">
	      <aside class="tit">마이페이지</aside>
	      <div class="lnb-menu">
	          <ul>
	          		<c:if test="${sessionId.edu_auth_cd == '01'}">
	                 <li <c:if test="${fn:contains(path, '/my/my01')}">  class="on" </c:if>>
	                 	<a href="#">일반</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${fn:contains(path, '/my/my01info') }">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my01info.do">기본정보</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my01cart') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my01cart.do">장바구니</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my01status') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my01status.do">신청현황</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my01edu') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my01edu.do">학습/교육현황</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my01warrant') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my01warrant.do">수료증발급</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my01mylist') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my01mylist.do">나의 글 보기</a></li>
                        </ul>
	                 </li>
	                </c:if>
	                <c:if test="${sessionId.edu_auth_cd == '02' || sessionId.edu_auth_cd == '04'}">
	                 <li <c:if test="${fn:contains(path, '/my/my02')}">  class="on" </c:if>>
	                 	<a href="#">강사</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${fn:contains(path, '/my/my02info') }">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my02info.do">기본정보</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my02act') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my02act.do">강사 활동 신청 내역</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my02absence') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my02absence.do">휴직 신청 내역</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my02edu') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my02edu.do">교육 신청내역</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my02warrant') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my02warrant.do">수료증발급</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my02mylist') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my02mylist.do">나의 글 보기</a></li>
                        </ul>
	                 </li>
	                </c:if>
	                <c:if test="${sessionId.edu_auth_cd == '03' || sessionId.edu_auth_cd == '04'}">
	                 <li <c:if test="${fn:contains(path, '/my/my03')}">  class="on" </c:if>>
	                 	<a href="#">실무자</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${fn:contains(path, '/my/my03info') }">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my03info.do">기본정보</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my03cart') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my03cart.do">장바구니</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my03status') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my03status.do">신청현황</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my03edu') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my03edu.do">학습/교육현황</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my03warrant') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my03warrant.do">수료증발급</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my03mylist') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my03mylist.do">나의 글 보기</a></li>
                        </ul>
	                 </li>
	                </c:if>
	                <c:if test="${sessionId.user_gu == '2'}">
	                 <li <c:if test="${fn:contains(path, '/my/my04')}">  class="on" </c:if>>
	                 	<a href="#">기관</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${fn:contains(path, '/my/my04info') }">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my04info.do">기본정보</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my04app') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my04app.do">교육신청 내역</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my04insSel') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my04insSel.do">강사 미선택 현황</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my04eduApp') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my04eduApp.do">교육명 별 신청자</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my04eduResult') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my04eduResult.do">교육 결과 보고서 제출/수료증</a></li>
	                    	<li <c:if test="${fn:contains(path, '/my/my04mylist') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/my/my04mylist.do">나의 글 보기</a></li>
                        </ul>
	                 </li> 
	                </c:if>
		      </ul>
	      </div>
     </c:if>
     
     <c:if test="${fn:contains(path, '/user/instructor')}">
	      <aside class="tit">생명지킴이 강사공간</aside>
	      <div class="lnb-menu">
	          <ul>
	                 <li <c:if test="${fn:contains(path, '/user/instructor01')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/instructor01List.do">공지사항</a>
		             </li>
		             <li <c:if test="${fn:contains(path, '/user/instructor02')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/instructor02List.do">자료실</a>
		             </li>
		             <li <c:if test="${fn:contains(path, '/user/instructor03')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/instructor03List.do">활동신청</a>
		             </li>
		             <li <c:if test="${fn:contains(path, '/user/instructor04')}">  class="on" </c:if>>
	                 	<a href="#">자격관리</a>
	                 	<ul class="sub-lnb">
                        	<li <c:if test="${fn:contains(path, '/user/instructor04List') }">  class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/instructor04List.do">강사자격정보</a></li>
	                    	<li <c:if test="${fn:contains(path, '/user/instructor04lecture') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/instructor04lecture.do">강의내역</a></li>
	                    	<li <c:if test="${fn:contains(path, '/user/instructor04absence') }">    class="active" </c:if>> <a href="${pageContext.request.contextPath}/user/instructor04absence.do">강사휴직신청</a></li>
                        </ul>
	                 </li>
		             <li <c:if test="${fn:contains(path, '/user/instructor05')}">  class="on" </c:if>>
	                 	<a href="${pageContext.request.contextPath}/user/instructor05List.do">강사 보수 교육</a>
		             </li>
		      </ul>
	      </div>
     </c:if></li>
	                 
  </div>