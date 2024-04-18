<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 천원단위 콤마 표시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 천원단위 콤마 - end -->    

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


<script type="text/javascript">
    
    function checkCapsLock(e) { // Caps Lock 키가 눌렸는지 여부를 확인하는 함수
        var capsLockOn = e.getModifierState && e.getModifierState('CapsLock');
        var warningElement = document.getElementById('capsLockWarning');

        if (capsLockOn) {
            warningElement.style.display = 'block'; // Caps Lock이 켜져 있으면 경고 메시지를 표시합니다.
        } else {
            warningElement.style.display = 'none'; // Caps Lock이 꺼져 있으면 경고 메시지를 숨깁니다.
        }
    }

    // input 요소에 이벤트 핸들러를 추가하여 Caps Lock 상태 확인
    document.addEventListener('DOMContentLoaded', function() {
        var passwordInput = document.getElementById('pw');
        var warningElement = document.getElementById('capsLockWarning');

        passwordInput.addEventListener('keydown', function(e) {
            checkCapsLock(e);
        });
        passwordInput.addEventListener('keyup', function(e) {
            checkCapsLock(e);
        });
    });
</script>

<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">  


      
        <style>
    .centered-form {
        text-align: center;
    }
</style>


           
<br>
<div class="centered-form">
	<form class="container" action="login" method="post" style="margin-left: auto; margin-right: auto;">
	<h3><strong>안녕하세요 :) <br>
		Bodiscovery 입니다.</strong></h3>
	<br>
		<table align="center" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>
					<input type="text" name="id" id="id" placeholder="아이디" style="width: 400px; height: 60px;"></td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pw" id="pw" placeholder="비밀번호" style="width: 400px; height: 60px;"></td>
					<div id="capsLockWarning" style="display: none; color: red;">Caps Lock이 켜져 있습니다.</div>
			</tr>
			
			
			
			
		</table><br>
					<input class="btn btn-outline-dark mt-auto" type= "submit" value="로그인"> &nbsp; &nbsp; &nbsp; &nbsp; 
				
				
					<a href="userInsert.do" class="btn btn-outline-dark mt-auto">회원가입</a>
	</form>	
	</div>
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
			<img src="${pageContext.request.contextPath}/resources/image/kakao-login.png" art="" width="225px" height="48px">
		</a>
		
		&nbsp;&nbsp;&nbsp;
			
		<!-- 네이버 로그인 창으로 이동 -->			
		<a href="${url}">		
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
			</a>		
		<br>

	</div>
	
	
	
	<div>
			
				
		

	</div>
	
	
	
	
	
		

<%@ include file="./include/include-footer.jsp" %>
