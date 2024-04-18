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
    <link rel="icon" href="<c:url value='/resources/assets/favicon.ico'/>" type="image/x-icon"/>
<!-- 파비콘-end -->

<style>

	.footer-logo {
		display: block;
		margin: 0 auto;
		width: 300px;
		height: auto;
	}
	a {text-decoration: none;}
	a:link {color: grey; text-decoration: none;}
	a:visited {color: grey; text-decoration: none;}
	a:hover {color: orange; text-decoration: none;}
	.navbar-brand img {
        width: 200px;
        height: auto;
    }
    
    
    .btn-shopping {
    	border: 2px solid #000; /* 검은색 테두리 */
    	background-color: transparent; /* 투명한 배경 */
    	color: #000; /* 검정색 텍스트 */
	}
	.btn-shopping:hover {
    	background-color: #000; /* 마우스 호버 시 배경색 변경 */
    	color: #fff; /* 마우스 호버 시 텍스트 색상 변경 */
	}
	.btn_submit {
		background-image: url(${pageContext.request.contextPath}/resources/image/x.svg);
		background-repeat: no-repeat;
		width: 25px;
		height: 25px;
		border: 0;
	}
    
</style>


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
        
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>

<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">

<div align="center">
<br><br>
<h3>${user.id }님의
장바구니가 선택 삭제 완료되었습니다.</h3>
</div><br><br>
<div class="btns" align="center">
<form action="CartView.do" method="post">
<input type="hidden" id="id" name="id" value="${user.id }">
<input type="submit" class="btn btn-outline-dark mt-auto" value="장바구니 가기">
</form> <br>

<form action="ItemAll.do" method="post">
	<input type="submit" class="btn btn-outline-dark mt-auto" value="쇼핑계속하기">
</form>
<br><br>
</div>








 <%@ include file="../include/include-footer.jsp" %>




</body>
</html>