<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<title>Bodiscovery</title>
		
		<!-- JSTL 태그 선언  -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<%@ taglib prefix="comUtil" uri="/WEB-INF/tlds/commonUtil.tld" %>
		 
		<!-- 부트스트랩 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"  rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
		<!-- 파비콘 -->
	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon"/>
	    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon"/>
		<!-- 파비콘-end -->
	
		<!-- swiper -->
		
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		
		<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
		
		<!-- jQuery JS 파일 -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-1.11.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-ui.min.js"></script>
		
		<!-- Datepicker -->
		<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
       
		<script type="text/javascript">
			let hostIndex = location.href.indexOf( location.host ) + location.host.length;
			let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		</script>
	</head>
	<body>
		<%@ include file="./header.jsp" %>