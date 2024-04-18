<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴처리 완료 되었습니다~</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
	crossorigin="anonymous">



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
        </header><br><br><br>
        
<div align="center">
<h1>탈퇴완료되었습니다</h1> <br>
<h1>지금까지 Bodiscovery를 이용해주셔서 감사합니다.</h1><br><br><br>

<a href="main.do" class="btn btn-outline-dark mt-auto">HOME</a><br><br><br><br><br>

</div>

     <%@ include file="./include/include-footer.jsp" %>



</body>
</html>