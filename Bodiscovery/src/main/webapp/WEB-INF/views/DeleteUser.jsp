<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

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
</style>


<meta charset="UTF-8">
<title>회원탈퇴페이지입니다</title>
</head>

<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>

<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">


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



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type = "text/javascript">  /* 회원탈퇴시 체크가 안되면 가입이 되지않게 함수구현완료 */

function CheckTest(){

if(document.delete.agree.checked){

 document.delete.agree.value='on';
 document.delete.submit();
 
} else {
	Swal.fire({
	       icon: 'info',
	       title : '체크박스를 선택해주세요!',
	       text : '회원탈퇴를 위해 내용과 체크박스 확인을 부탁드립니다!',
	    });
	return false;
		}
	}
</script>
<br><br>
<div align="center">
<h3>${user.id}회원님이 사용하시던 정보가 맞는지 확인부탁드립니다!</h3>
<h3>비밀번호는 암호화처리되어 본래 비밀번호가 공개되지 않습니다</h3>
<h3>사용하고 계신 아이디 ${user.id}는 탈퇴할 경우 복구가 불가능합니다.</h3><br>

 <h3> 주의사항 </h3>
<h4>탈퇴후에는 개인정보가 <u>모두 삭제되어 복구가 불가능</u>합니다.</h4>


<form name = "delete" action="deleteUser" method="post">
	<table align="center">
  
	<tr>
       <td class="col1"><label class="control-label" for="userId">아이디</label></td>
	   <td class="col2"><input class="form-control" type="text" id="id" name="id" value="${user.id}" readonly="readonly"/>
       
    </tr>
    		
	 <tr>
		<td class="col1"><label class="control-label" for="userPass">패스워드</label></td>
		<td class="col2"><input class="form-control" type="text" id="pw" name="pw" value="${user.pw}" readonly="readonly"/>		
	 </tr>
	 	
	<tr>
		<td class="col1"><label class="control-label" for="userName">성명</label></td>
		<td class="col2"><input class="form-control" type="text" id="name" name="name" value="${user.name}" readonly="readonly"/>
    </tr>
    
	<tr>
        <td class="col1"><label class="control-label" for="userSex">성별</label></td>
		<td class="col2"><input class="form-control" type="text" id="sex" name="sex" value="${user.sex}" readonly="readonly"/>
    </tr>
	
  </table><br>
  	<div> 
		<input type="checkbox" name="agree" id="agree" value="terms">해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.

	</div>
	<br>
  	<input type="button" onclick="CheckTest()" class="cencle btn btn-danger" value="탈퇴하기" />
	
</form><br>

		<form action="main.do" method="post">
		<input type="submit" class="btn btn-outline-dark mt-auto" value="취소">
		</form>	
		
		<br><br>



   <%@ include file="./include/include-footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>




</body>
</html>