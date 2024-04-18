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
	.navbar-brand img {
        width: 200px;
        height: auto;
    }
	.footer-logo {
		display: block;
		margin: 0 auto;
		width: 300px;
		height: auto;
	}

</style>

</head>
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>
<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">
<%@ include file="../include/include-header.jsp" %>

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Bodiscovery</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With our shop Change your body, life</p>
                </div>
            </div>
        </header>
        
        <br><br>
        <div align="center">
        <form action = "CartView.do" method = "post">
			<input type="hidden" id="id" name="id" value="${user.id}">
				<h1>${user.id }님 <br></h1>
						<h1>장바구니가 모두 비워졌습니다.</h1>
			<input type = "submit" class="btn btn-outline-dark mt-auto" value = "장바구니 가기">
		</form>
		</div>
		<br><br>
 <%@ include file="../include/include-footer.jsp" %>
 
 
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>

</body>
</html>