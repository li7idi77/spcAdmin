<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<META http-equiv="Expires" content="-1">
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Cache-Control" content="No-Cache">
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<title><tiles:getAsString name="title" /></title>
<head>        
    <link href="<c:url value='/user/css/reset.css'        />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/user/css/user.css'         />" rel="stylesheet" type="text/css"> 
    <link href="<c:url value='/user/slick/slick.css'      />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/user/slick/slick-theme.css'/>" rel="stylesheet" type="text/css">
    
    <script src="<c:url value='/user/js/jquery-2.2.0.min.js' />"></script>	
    <script src="<c:url value='/user/js/commonUtil.js'       />"></script>
    <script src="<c:url value='/user/slick/slick.js'         />"></script>	
    
    <script src="<c:url value='/resources/js/common.js' />"></script>
    <script src="<c:url value='/js/common.js' />"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
        
</head>
  
<body>
   	<header>
       	<tiles:insertAttribute  name="header" />
       	<tiles:insertAttribute  name="headermenu" />
    </header>
    <article id="sub-layer">
        <div class="sub-cont">
        	<tiles:insertAttribute name="menu" />
			<tiles:insertAttribute name="body" />
    	</div>
     </article>
	 <tiles:insertAttribute name="footer" />

</body>
</html>
