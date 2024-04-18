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
	
	<br>
	<div align="center">
	<h1>${user.id}님의 Mypage</h1>		
	<br><hr>
		
	<h4>비밀번호는 암호화되어 관리되기때문에 재발급만 가능하오니 각별한 주의 부탁드립니다</h4>
	
	<h4>아이디와 이메일의 변경을 원하시는 회원님은 관리자에게 채팅 문의 부탁드립니다</h4>
	<form action="userUpdate" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" id = "id" name ="id" value="${user.id}" readonly style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="text" id = "pw" name ="pw" value="${user.pw}" style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>	
			<td>이름</td>
			<td>
				<input type="text" id = "name" name ="name" value="${user.name}" style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>	
			<td>주소</td>
			<td>
				<input type="text" id = "address" name ="address" value="${user.address}" style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>	
			<td>신장</td>
			<td>
				<input type="number" id = "ki" name ="ki" value="${user.ki}" style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>
			<td>체중</td>
			<td>
				<input type="number" id = "weight" name ="weight" value="${user.weight}" style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>	
			<td>목표 체중</td>
			<td>
				<input type="number" id = "goal" name ="goal" value="${user.goal}" style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>	
			<td>성별</td>
			<td>
				<input type="text" id = "sex" name ="sex" value="${user.sex}" readonly style="width: 300px; height: 40px;">
			</td>
		</tr>
		<tr>	
			<td>나이</td>
			<td>
				<input type="number" id = "age" name ="age" value="${user.age}" style="width: 300px; height: 40px;" >
			</td>
		</tr>
		<tr>	
			<td>이메일</td>
			<td>
				<input type="email" id = "email" name ="email" value="${user.email}" readonly style="width: 300px; height: 40px;">
			</td>
		</tr>	
	</table>
	
	<br>
	
	<input type="submit" class="btn btn-outline-dark mt-auto" value="내 정보수정">	 &nbsp;
	<button type="button" class="btn btn-outline-dark mt-auto" onclick="removeMember();"> 탈퇴하기 </button>
	
	<br>
	
		
	</form>
	<br><br>
	</div>
		
		
<script>
function removeMember() {
	if(window.confirm("탈퇴하시겠습니까?")){
			location.href="deleteUser.do";
	}
	
}
</script>

<!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container text-center">
            <!-- Logo -->
            <img src="${pageContext.request.contextPath}/resources/image/footerImage.png" alt="" class="footer-logo"><form action="CartView.do" method="post">
                		<input type="hidden" id="id" name="id" value="${user.id}">
    					<input type="submit" class="btn btn-shopping" value="Cart">
    				</form>
            <p class="m-0 text-white">Copyright &copy; 2024 Bodiscovery.</p>
            </div>
        </footer>
        
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