<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="<c:url value='/user/slick/slick.css'      />" rel="stylesheet" type="text/css">
<link href="<c:url value='/user/slick/slick-theme.css'/>" rel="stylesheet" type="text/css">

<script>
<%--필수  --%>
$(document).ready(function(){
	//팝업 관련 - 
    <c:forEach var="result" items="${popupList}" varStatus="status">
 	    var url = '${pageContext.request.contextPath}/user/popup.do?popup_no=<c:out value="${result.popup_no}"/>';
		var name = '<c:out value="${result.popup_no}"/>';
		var option = 'top=<c:out value="${result.otpt_yaxs_lc}"/>px,left=<c:out value="${result.otpt_xaxs_lc}"/>px,width=<c:out value="${result.popup_ar}"/>px,height=<c:out value="${result.popup_hg}"/>px';
		
		if (gfnGetCookie('pop<c:out value="${result.popup_no}" />') == '') {
		<c:if test="${result.use_yn == 'Y' }">
		  window.open(url, 'popup' + name, option);
		 </c:if>
		}
</c:forEach>
});
<%--필수  --%>
</script>	

 <!--  main-layer begin -->
        <article id="main-layer">
            <section class="main-slider"><!--  main-slider begin -->
                <div class="lazy slider">
	                <c:forEach var="result" items="${imgList}" varStatus="status">
	                	<c:if test="${not empty result.file_name }">
				           	<c:set var="ppx" value="${fn:split(result.file_name,'.')}" />
				            <div><img class="img-box" src="/${mainVo.webPath}/${mainVo.gubun2}/${result.file_id}.${ppx[1]}" alt="${result.img_nm}" /></div>
				        </c:if>	
	                </c:forEach>
                </div>
            </section>
            <!--  main-slider end -->

            <section class="main-contents"><!-- main-contents begin -->
                <div class="cont-list">
                         
                    <h1>기관생명 지킴이 교육</h1> 
                    <a href="${pageContext.request.contextPath}/user/lifeEduOrgList02.do" class="more-btn white-btn">더보기 +</a>
                    <ul class="main-list">
                    	<c:forEach var="result" items="${lifeEduOffOrgList}" varStatus="status">
                        <li>
                            <p class="sm-tit tag">${result.coper_nm}</p>
                            <h2 class="h3-tit">${result.category3_name}</h2>                            
                            <div class="flex-colum">
                                <div class="left-cont">
                                    <button class="mid-btn orange-btn"> <a href="${pageContext.request.contextPath}/user/lifeEduOrgList02.do">수강신청</a></button>
                                </div>
                                <div class="right-cont">                                    
                                    <span class="sm-ico"><img src="${pageContext.request.contextPath}/user/images/common/ico_pc.png" alt="pc강의"/></span>
                                </div>
                            </div>
                            <ul class="summary-cont">
                                <li>
                                    <label>교육일시</label>
                                    <span>${result.train_s_date}</span>
                                    <span>${result.edu_datetime}</span>
                                </li>
                                <li>
                                    <label>교육대상</label>
                                    <span>${result.edu_target}</span>
                                </li>
                                <li>
                                    <label>교육인원</label>
                                    <span>${result.edu_garden}</span>명
                                </li>
                                <li>
                                    <label>교육장소</label>
                                    <span>${result.edu_place}</span>
                                </li>
                            </ul>
                        </li>
                      </c:forEach>
                    </ul>
                </div>
            </section>
            <!--  main-contents end -->

            <!--  noti-contents begin --> 
            <section class="noti-contents">
                <div class="cont-list">
                    <h1>공지사항</h1>
                    <a href="${pageContext.request.contextPath}/user/notice01List.do" class="more-btn white-btn">더보기 +</a>
                    <ul class="main-list">
                        <c:forEach var="result" items="${notiList}" varStatus="status">
                        <li>
                            <h2 class="h3-tit">${result.title}</h2>
                            <p class="date">${fn:substring(result.reg_dt,0,10)}</p>
                            <p class="txt">${result.contents}</p>
                        </li>
                        </c:forEach>                        
                    </ul>                     
            </section>

            <section class="footer-slider"><!--  footer-slider begin -->
               
                    <div class="slider-cont regular slider">
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner01.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner02.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner03.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner04.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner05.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner01.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner02.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner03.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner04.png" alt=""/></div>
                        <div><img src="${pageContext.request.contextPath}/user/images/contents/banner/footer_banner05.png" alt=""/></div>
                    </div>
                
            </section>
            <!--  footer-slider end -->

        </article>
        <!--  main-layer end -->