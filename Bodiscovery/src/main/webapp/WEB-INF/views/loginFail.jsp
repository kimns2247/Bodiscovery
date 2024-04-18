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
	a {text-decoration: none;}
	a:link {color: grey; text-decoration: none;}
	a:visited {color: grey; text-decoration: none;}
	a:hover {color: orange; text-decoration: none;}
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
        
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>  


<br>

	<form class="container" action="login" method="post" align="center">
		<h3><strong>입력하신 아이디 또는 비밀번호가 <br>
					틀렸습니다.</strong></h3>
		<br>
		<table align="center" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>
					<input type="text" name="id" id="id" placeholder="아이디" style="width: 400px; height: 60px;"></td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pw" id="pw" placeholder="비밀번호" style="width: 400px; height: 60px;"></td>
			</tr>
			
			
			
			
		</table><br>
					<input class="btn btn-outline-dark mt-auto" type= "submit" value="로그인"> &nbsp; &nbsp; &nbsp; &nbsp; 
				
				
					<a href="userInsert.do" class="btn btn-outline-dark mt-auto">회원가입</a>
	</form>	
			
		

<br>
<div class="container text-center">
		<ul class="list-inline">
			<li class="list-inline-item"><a href="connectFindId.do">아이디 찾기</a></li>
			<li class="list-inline-item"><a href="connectFindPw.do">비밀번호 찾기</a></li>
		</ul>
	</div>
	<br>
	
	
	<div class="wrap" align="center">
		<a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=7d7ee6e5a0e8ac4116ec85eed1191433&redirect_uri=http://localhost:8080/controller/kakaoLogin&response_type=code">
			<img src="${pageContext.request.contextPath}/resources/image/kakao-login.png" art="">
		</a>
	</div>
	
	
	
	<div>
			
		<!-- 네이버 로그인 창으로 이동 -->			
		<div id="naver_id_login" style="text-align:center"><a href="${url}">		
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
			</a>
		</div>			
		<br>

	</div>

<%@ include file="./include/include-footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        
</body>
</html>