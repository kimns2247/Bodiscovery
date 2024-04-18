<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 천원단위 콤마 표시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 천원단위 콤마 - end -->    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>Bodiscovery</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
	crossorigin="anonymous">

<!-- 파비콘 -->
    <link rel="shortcut icon" href="<c:url value='/resources/assets/favicon.ico'/>" type="image/x-icon"/>
    <link rel="icon" href="<c:url value='/resources/assets/favicon.ico'/>" type="image/x-icon"/>
<!-- 파비콘-end -->

<style>

	.footer-logo {
		display: block;
		margin: 0 auto;
		width: 300px;
		height: auto;
	}
	.navbar-brand img {
        width: 200px;
        height: auto;
    }	
</style>

</head>
<body>

<%@ include file="./include/include-header.jsp" %>

<!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white tracking-in-contract">  
                    <h1 class="display-4 fw-bolder">Bodiscovery</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With our shop Change your body, life</p>
                </div>
            </div>
        </header>
        
	<br>
	
		<div align="center">	
		<h1><strong>비밀번호 찾기</strong></h1><br>
		<h5>비밀번호를 찾고자 하는 아이디와 정보를 입력해주세요.</h5><br>
		
		<c:if test="${not empty msg}">
      	   <p>${msg}</p>
    	</c:if> 
    	
		<form action = "findPW" method="post">
			<table>
				<tr>
					<td>
					<input type="text" name="id" id="id" placeholder="아이디" style="width: 400px; height: 60px;"></td>
				</tr>
				<tr>
					<td>
					<input type="text" name="name" id="name" placeholder="이름" style="width: 400px; height: 60px;"></td>
				</tr>
				<tr>
					<td>
					<input type="text" name="email" id="email" placeholder="이메일" style="width: 400px; height: 60px;"></td>
				</tr>
			</table>
			<br>
				<input class="btn btn-outline-dark mt-auto" type= "submit" value="비밀번호 찾기" style="width: 200px; height: 50px;">
		</form> 
		
	  
        </div>
	<br>




<%@ include file="./include/include-footer.jsp" %>	
	
</body>        
</html>
