<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css' />"  >
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common.css' />"  >	
	<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.ico' />" />	
	<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>	
	<script src="<c:url value='/resources/js/jquery-ui.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.bpopup.min.js' />"></script>
	<script src="<c:url value='/resources/js/default.js' />"></script>	
</head>
  
<body>
    <header id="header">
        <tiles:insertAttribute name="header" />
    </header>

    <section id="sidemenu">
        <tiles:insertAttribute name="menu" />
    </section>
	             
    <section id="siteContent">
        <tiles:insertAttribute name="body" />
    </section>

    <footer id="footer">
        <tiles:insertAttribute name="footer" />
    </footer>
</body>
</html>
