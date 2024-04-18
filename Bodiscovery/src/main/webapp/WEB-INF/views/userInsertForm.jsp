<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Bodiscovery</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
	crossorigin="anonymous">

<!-- 파비콘 -->
    <link rel="icon" href="<c:url value='/resources/assets/favicon.ico'/>" type="image/x-icon"/>
<!-- 파비콘-end -->


<style type="text/css">


*{
		margin: 0;
		padding: 0;
	}
	.mainslide{
		height: 80vh; text-align: center;
	}
	.mainslide .bg1 {
		background: url(${pageContext.request.contextPath}/resources/image/slide1.jpg) 
					no-repeat center/cover;
					color: #fff;
	}
	.mainslide .bg2 {
		background: url(${pageContext.request.contextPath}/resources/image/slide2.jpg) 
					no-repeat center/cover;
					color: #fff;
	}
	.mainslide .bg3 {
		background: url(${pageContext.request.contextPath}/resources/image/slide3.jpg) 
					no-repeat center/cover;
					color: #fff;
	}
	.mainslide .swiper-slide {
		display: flex; 
		align-items: center; 
		flex-direction: column; 
		justify-content: center;
	}
	.mainslide span {
		font-size: 30px
	}
	.mainslide .tit {
		font-size: 50px; 
		font-weight: bold; 
		opacity: 0;			/* 처음에 숨김 */
	}
	.mainslide .txt {
		font-size: 20px; 
		width: 800px; 
		margin-top: 20px; 
		opacity: 0;			/* 처음에 숨김 */
	}
	.mainslide .swiper-slide-active span{animation: ani 1s .3s both}
	.mainslide .swiper-slide-active .tit{animation: ani 1s .7s both}
	.mainslide .swiper-slide-active .txt{animation: ani 1s .1s both}
	
	@keyframes ani {
		0% {
			opacity: 0; transform: translateY(30px)
		}
		100% {
			opacity: 1; transform: translateY(0px)
		}
	}
    .video {
        width : 100%;
       	height : 70vh;
       	object-fit : cover;
       	margin: 0 auto;
       	display: block;
	}
	.section {
       	position: relative;
    }
    
    .header {
       	z-index:1000;

    }
    
    .overlay {
        position: absolute;		/* 세로 중앙에 맞춤 */
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	z-index: 2;
    	margin: 14px 3px;
    	display: inline-block;
    	vertical-align: top;
    	height: auto;
    	overflow: hidden;
    	color: white;
    }
    
    .description {
       	padding-left: 0;
       	margin: 0;
    }
    
    .description li {
        list-style: none;
    	line-height: 3em;
    	display: flex;
    	justify-content: center;
    	flex-wrap: nowrap;
    	animation-name: rolling;
    	animation-duration: 5s;
    	animation-iteration-count: infinite;
    }
    
	@keyframes rolling {
        0% {
        	transform: translateY(0);
    	}
    	33% {
        	transform: translateY(-3em);
    	}
    	66% {
        	transform: translateY(-6em);
    	}
    	100% {
        	transform: translateY(-9em);
    	}
	}
	.talk {
		position: fixed;
		right: 15px;
		bottom: 15px;
		width: 40px;
		height: 40px;
		z-index: 99;
	}
	.footer-logo {
		display: block;
		margin: 0 auto;
		width: 300px;
		height: auto;
	}
	.upper_blank {
		height: 300px;
        background: yellowgreen;
        text-align: center;
        padding-top: 200px;
    }
    .num-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        align-items: center;
        padding: 10%;
    }
    .num-item {
        text-align: center;
        padding: 10px;
        margin-bottom: 30px;
    }
    .in-title {
        font: 30px/1 'arial';
        color: gray;
        font-weight: 600;
        margin-bottom: 20px;
    }
    .sub-title {
        font: 14px/1 'arial';
        color: gray;
    }
    .nums {
        font: bold 80px/1 'arial';
        color: #343048;
    }
    #num-unit {
        font: bold 30px/1 'arial';
        color: dimgray;
    }
	.navbar-brand img {
        width: 200px;
        height: auto;
    }


 
      div.container{
    }
 
      div.insert{
    }
 
    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }
 
    table{
    height: 300px;
    width: 900px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
    border-bottom: 1px dotted black;
    }
 
    caption{
    text-align: left;
    }
 
    .col1 {
    background-color: #f1f3f5;
    width:75px;
    padding: 10px;
    text-align: right;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    .but1 {
    height: 25px;
    width: 80px;
    color: white;
    background-color: black;
    border-color: black;
    }
 
    .but2 {
    height: 27px;
    width: 120px;
    color: white;
    background-color: black;
    border-color: black;
    }
    
    #btn{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
     #btn2{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but3 {
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
    .but1:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but2:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but3:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
 
    .but4:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    #btn:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    #btn2:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    p{
    font-size: 0.7em;
    }
 
    .g{
    font-size: 0.7em;
    }
 
    .c{
    font-size: 0.7em;
    }
 
    .a{
    font-size: 0.7em;
    }
    
    .num{
    color: red;
    }
    
    .col1 {
       text-align:center;
    }
 
 	#title {
 	text-align: center;
 	}
 	
 	.id_ok{
		color:blue;
		display: none;
	}	

	.id_already{
		color:red; 
		display: none;
	}
	
	.email_ok{
		color:blue;
		display: none;
	}	

	.email_already{
		color:red; 
		display: none;
	}
	
	.no-border {
  border-width: 0;
}

.bottom-border {
  border-width: 0 0 1px;
}
input{
border-color: rgba(200, 200, 200, 0.7);
	border: 1px solid;
	border-color: rgba(200, 200, 200, 0.7);
	height:25px;
}


.textbox{
margin: 10px 0px 5px 0px;
}
.csv{
	height:15px;
}

.display{
display: flex;
	justify-content: center;

}

.text2_register{

	height: 40px;
	margin: 10px 0px 5px 0px;
	border: 1px solid;
	border-color: rgba(200, 200, 200, 0.7);
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





<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>

<%
Random r = new Random();
int cert = r.nextInt(888888) + 111111;
%>   
// 랜덤값 만드는 함수

function AuthEmail() {
	
	alert("이메일이 발송되었습니다! 이메일을 확인해주세요");
	const email = $("#email").val(); 
	var cert = $('#cert').val();
	
	  $.ajax({
      	url : './EmailAuth',
      	data : {
      		email : email,
      		cert : cert
      	},
      	type : 'POST',
      	dataType : 'json',
      	success : function(result) {
      		console.log("result : " + result);
      		$("#authCode").attr("disabled", false);
      		code = result;
      		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
     		}
	  }); //End Ajax
}
</script>
<script>  /* 회원가입테스트 버튼 클릭시 실행되는 함수들(제약조건) */	

function CheckID() {
    if ($('#id').val().length < 5) { // 아이디의 길이가 5 미만인 경우
        Swal.fire({
            icon: 'error',
            title: '아이디를 확인해주세요!',
            text: '아이디는 5글자 이상으로 입력해주세요',
        });
        event.preventDefault(); // 이벤트(서브밋) 방지
        return; // 더 이상 코드 실행하지 않도록 반환
    }
}

function CheckPW() {
	
	 if($('#pw').val() == '' || $('#pw').val() >= 10) {
	   	  Swal.fire({
	   	         icon: 'error',
	   	         title : '비밀번호를 확인해주세요!',
	   	         text : '비밀번호는 공백이 아닌 문자, 숫자, 특수문자의 조합으로 이뤄진 10~16자리로 입력바랍니다',
	   	      });
	   	  
	        event.preventDefault();  // 이벤트(서브밋) 방지
	        return;  // 더 이상 코드 진행하지 말 것
	     }
}

function PWConfirm() { 
	
	 if($('#pwcheck').val() != $('#pw').val()) {
	   	  Swal.fire({
	   	         icon: 'error',
	   	         title : '비밀번호와 비밀번호 확인은 같아야합니다',
	   	         text : '비밀번호는 공백이 아닌 문자, 숫자, 특수문자의 조합으로 이뤄진 10~16자리로 입력바랍니다',
	   	      });
	   	  
	        event.preventDefault();  // 이벤트(서브밋) 방지
	        return;  // 더 이상 코드 진행하지 말 것
	     }
}

/* 비밀번호에 조건문 여러개 달아줌 */
function check_pw(){

    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        document.getElementById('pw_pro_label').innerHTML ='비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
        document.getElementById('pw_pro').value='0';
        return;
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
    	 Swal.fire({
   	         icon: 'error',
   	         title : '비밀번호를 확인해주세요!',
   	         text : '!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.',
   	      });
        document.getElementById('pw_pro_label').innerHTML = '비밀번호에 !,@,#,$,% 의 특수문자를 포함시켜야 합니다.'
       
    }
    document.getElementById('pw_pro_label').innerHTML = '';
    if(pw.length < 8){
        document.getElementById('pw_pro').value='1';
    }
    else if(pw.length<12){
        document.getElementById('pw_pro').value='2';
    }
    else{
        document.getElementById('pw_pro').value='3';
    }
    if(document.getElementById('pw').value !='' && document.getElementById('pwcheck').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pwcheck').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}

function CheckName() {   /* 이름이 공백이라면 가입을 방지하는 함수 */
	if($('#name').val() == '') {
		Swal.fire({
		    icon: 'info',
		    title : '이름를 입력해주세요!',
		    text  : '필수입력사항입니다',
		 });
	}
	    event.preventDefault();
	    return;
 }
 
function checkName(){   /* 사용자로부터 숫자 혹은 영어의 입력을 방지하는 아스키코드의 조합 */
	   if(!(event.keyCode >= 12392 && event.keyCode <= 12687)) {
		   Swal.fire({
			    icon: 'info',
			    title : '이름은 한글만 입력가능합니다!',
			    text  : '영어 또는 숫자는 입력불가능합니다',
			 });
	      event.preventDefault();
	      return;
	   }
	}

function CheckAddress() {
	if($('#address').val() == '') {
		Swal.fire({
		    icon: 'info',
		    title : '주소를 입력해주세요!',
		    text  : '필수입력사항입니다',
		 });
	}
	    event.preventDefault();
	    return;
 }
 
function CheckKi() {
	if($('#ki').val() == '') {
		Swal.fire({
		    icon: 'info',
		    title : '회원님의 키를 입력해주세요!',
		    text  : '필수입력사항입니다',
		 });
	}
	    event.preventDefault();
	    return;
 }
 
function CheckWeight() {
	if($('#weight').val() == '') {
		Swal.fire({
		    icon: 'info',
		    title : '회원님의 몸무게를 입력해주세요!',
		    text  : '필수입력사항입니다',
		 });
	}
	    event.preventDefault();
	    return;
 }
 
function CheckGoal() {
	if($('#goal').val() == '') {
		Swal.fire({
		    icon: 'info',
		    title : '회원님이 목표하시는 몸무게를 입력해주세요!',
		    text  : '저희 사이트 서비스 이용을 위한 필수입력사항입니다',
		 });
	}
	    event.preventDefault();
	    return;
 }
 
function CheckAge() {
	if($('#age').val() == '') {
		Swal.fire({
		    icon: 'info',
		    title : '회원님의 나이를 입력해주세요!',
		    text  : '사이트의 원활한 이용을 위한 필수입력사항입니다',
		 });
	}
	    event.preventDefault();
	    return;
 }
 
function CheckEmail() {
	if($('#email').val() == '') {
		Swal.fire({
		    icon: 'info',
		    title : '이메일 인증을 위해 이메일을 입력해주세요',
		    text  : '저희 사이트 서비스 이용을 위한 필수입력사항입니다',
		 });
	}
	    event.preventDefault();
	    return;
 }

function CheckAuthNumber(){
	if($('#authCode').val() != $('#cert').val()) {
	      alert("인증번호가 틀렸습니다!")
	      event.preventDefault();
	      return;
	   }
}

function CheckTest(){    

	if(($('input[name="agree1"]').is(":checked"))&&
			($('input[name="agree2"]').is(":checked")) == true){

	 document.loginform.submit();
	 
	} else {
		Swal.fire({
		       icon: 'info',
		       title : '가입동의를 확인해주세요!',
		       text : '회원가입을 위해 이용약관과 서비스동의 확인을 부탁드립니다!',
		    });
		
		return false; // 조건을 만족하지 않았다면 회원가입이 되지않게
			}
		}
		
</script>

<script type="text/javascript">
//인증 코드 비교
$("#authCode").on("focusout", function() {
	const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
	
	console.log("입력코드 : " + inputCode);
	console.log("인증코드 : " + code);
		
	if(Number(inputCode) === code){
    	$("#emailAuthWarn").html('인증번호가 일치합니다.');
    	$("#emailAuthWarn").css('color', 'blue');
		$('#emailAuth').attr('disabled', true);
		$('#email').attr('readonly', true);
		$("#registerBtn").attr("disabled", false);
	}else{
    	$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
    	$("#emailAuthWarn").css('color', 'red');
    	$("#registerBtn").attr("disabled", true);
	}
});

</script>

<script>  

function checkId(){ /* 아이디 중복확인 ajax */
    var id = $('#id').val();  // id값 가져옴
    $.ajax({
        url:'./idCheck', // idCheck로 전달
        type:'post', //POST 방식으로 전달
        data:{id:id},
        async : false,
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
              /*   Swal.fire({
       	         icon: 'error',
       	         title : '다른 아이디 입력을 부탁드립니다!',
       	         text : '이미 사용중인 아이디입니다',
       	      }); */
                
            }
        },
    });
   };

</script>

<script>  /* 이메일 중복확인 ajax */

function emailCheck() {
    var email = $('#email').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'./EmailCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{
        	email:email
       		 },
        async : false,
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.email_ok').css("display","inline-block"); 
                $('.email_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.email_already').css("display","inline-block");
                $('.email_ok').css("display", "none");
                
            }
        },
    });
   };

</script>


<script>
// 인증 코드 비교 함수
function checkAuthNumber() {
    var enteredCode = $("#authCode").val(); // 입력한 인증번호
    var generatedCode = <%=cert%>; // 서버에서 생성한 랜덤 인증번호

    if (enteredCode !== generatedCode) { // 입력한 인증번호와 서버에서 생성한 인증번호가 다를 경우
        Swal.fire({
            icon: 'error',
            title: '인증번호 오류',
            text: '입력하신 인증번호가 일치하지 않습니다. 다시 확인해주세요.',
        });
        return false; // 회원가입을 진행하지 않고 함수를 종료함
    }
    // 인증번호가 일치할 경우 회원가입을 진행
    return true;
}

// 회원가입 확인 함수
function checkRegistration() {
    // 각 필수 입력란에 대한 유효성 검사를 추가로 수행할 수 있습니다.
    
    // 인증번호 확인 함수 호출하여 인증번호가 일치하는지 확인
    if (!checkAuthNumber()) {
        return false; // 인증번호가 일치하지 않으면 회원가입을 진행하지 않음
    }

    // 이후의 회원가입 절차를 진행할 수 있도록 true 반환
    return true;
}
</script>




<!-- 사용자가 입력한 인증번호가 일치하는지 확인해주는 함수 -->
<script> 
function check_mail(){

         var checknum = document.getElementById('authCode').value;

           if(document.getElementById('authCode').value == <%=cert%>){
               document.getElementById('email_check').innerHTML='인증번호가 일치합니다.'
               document.getElementById('email_check').style.color='blue';
           }
           else{
               document.getElementById('email_check').innerHTML='인증번호가 일치하지 않습니다.';
               document.getElementById('email_check').style.color='red';
           }
   }
   
</script>




<script type="text/javascript">
    // Caps Lock 키가 눌렸는지 여부를 확인하는 함수
    function checkCapsLock(e) {
        var capsLockOn = e.getModifierState && e.getModifierState('CapsLock');
        var warningElement = document.getElementById('capsLockWarning');

        if (capsLockOn) {
            warningElement.style.display = 'block'; // Caps Lock이 켜져 있으면 경고 메시지를 표시합니다.
        } else {
            warningElement.style.display = 'none'; // Caps Lock이 꺼져 있으면 경고 메시지를 숨깁니다.
        }
    }

    // input 요소에 이벤트 핸들러를 추가하여 Caps Lock 상태를 확인합니다.
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
<br>
<div id="title"><h1> Bodiscovery 회원가입</h1></div><br>
<form name = "loginform" id = "frm" action="Register.do" method = "post">   
  <table>
  
	<tr>
        <td class="col1">아이디</td>
        <td class="col2"><input type="text" name="id" id = "id" oninput = "checkId()" style = "width: 170px;" placeholder = "아이디 입력">
        <span class="id_ok">사용가능합니다</span>
		<span class="id_already">이미 사용중입니다.</span>
    </tr>		
	<tr>
        <td class="col1">비밀번호</td>
        <td class="col2">
            <!-- <input type="password" name="pw" maxlength="10" -->
            <input class = 'inputbox' type="password" name="pw" id="pw" onchange="check_pw()" placeholder = "비밀번호 입력">
            <span style="color:cadetblue">보안성</span> <progress id="pw_pro" value="0" max="3"></progress>&nbsp;<span id="pw_pro_label"></span>
        	<div id="capsLockWarning" style="display: none; color: red;">Caps Lock이 켜져 있습니다.</div>
         </td>
    </tr>
	<tr>
        <td class="col1">비밀번호 확인</td>
        <td class="col2">
           <!--  <input type="password" name="pwdcheack" maxlength="16"> -->
           <input type="password" name = "pwcheck" id = "pwcheck" onchange="check_pw()" placeholder = "동일한 비밀번호 입력">&nbsp;<span id="check"></span>
            <p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합
            10 ~ 16자리</span>로 입력이 가능합니다.</p>
       		<div id="capsLockWarning" style="display: none; color: red;">Caps Lock이 켜져 있습니다.</div>
        </td>
    </tr>
	<tr>
        <td class="col1">이름</td>
        <td class="col2"><!-- <input type="text" name="name" maxlength="16"> -->
        <input type="text" name = "name" id = "name" onkeypress = "checkName()" placeholder = "이름 입력"></td>
    </tr>
	<tr>
	  <td class="col1">주소</td>
      <td class="col2">
	  <input type = "text" name = "address" id="address"  placeholder = "주소 입력">
	  </td>
	</tr>
	<tr>
	  <td class="col1">키</td>
      <td class="col2">
	  <input type="number" pattern="[0-9]+" name = "ki" id="ki"  placeholder = "키 입력">(cm)
	  <p>※ 키는 <span class="num">숫자</span>만 입력이 가능합니다.</p>
	  </td>
	</tr>
	<tr>
	  <td class="col1">현재 몸무게</td>
      <td class="col2">
	<input type="number" pattern="[0-9]+" name = "weight" id="weight"  placeholder = "몸무게 입력">(kg)
	 <p>※ 몸무게는 <span class="num">숫자</span>만 입력이 가능합니다.</p>
		</td>
	</tr>
	<tr>
	  <td class="col1">목표 몸무게</td>
      <td class="col2">
	  <input type = "number" name = "goal" id = "goal" onkeypress = "checknumber()"  placeholder = "목표 몸무게 입력">(kg)
	  </td>
	</tr>
	<tr>
        <td class="col1">성별</td>
        <td class="col2">
        <input type="radio" name = "sex" id = "sex" autocomplete = "off" value = "남성" checked>남성
         <input type="radio" name = "sex" id = "sex" autocomplete = "off" value = "여성">여성</td>
    </tr>
	<tr>
        <td class="col1">나이</td>
        <td class="col2">
		<input type = "number" name = "age" id = "age" placeholder = "나이 입력">
		</td>
	</tr>
	<tr>
        <td class="col1">이메일</td>
     	<td class="col2">
            <input type="text" name = "email" id = "email" oninput = "emailCheck()" style = "width: 170px;" placeholder = "이메일 입력">
            <button type = "button"  class="btn btn-outline-dark mt-auto" id="checkEmail" onclick="AuthEmail()">이메일 인증하기</button>
             <input type = "hidden" readonly name = "cert" id = "cert" value = "<%=cert%>">
           <span class="email_ok">사용가능합니다</span>
		   <span class="email_already">이미 사용중입니다.</span>
	</tr>
	<tr>
		<td class="col1">인증번호</td>
		<td class="col2">
        	  <input  placeholder="인증 코드 6자리입력" maxlength="6" name="authCode" id="authCode" type="text">
        	  <button onclick="check_mail();" class="btn btn-outline-dark mt-auto" type="button">인증번호 확인</button>
        	   <span id="email_check"></span>
  			  <span id="emailAuthWarn"></span>
    </tr>
	<tr>
         <td class="col1">가입동의</td>
         <td class="col2 text2_register" style="height:15px;width:300px;">        
         <input type="checkbox" name="agree1" id="agree" value="terms">이용약관
         <input type="checkbox" name="agree2" id="agree" value="service"> 서비스 동의
         <input  type="checkbox" name="free" id="free" value="marketing">마케팅 동의(선택)</div>
     </tr>	
  </table>
 
  <div class="create">
  	   <input type="button" onclick=" checkRegistration(); checkAuthNumber(); CheckTest(); CheckEmail(); CheckAge(); CheckGoal(); CheckWeight(); CheckKi(); CheckAddress(); PWConfirm(); CheckName(); CheckPW(); CheckID();" 
  	   		style = "height: 50%;" class="btn btn-outline-dark mt-auto" value="회원가입" /> &nbsp;
       <input type="button" class="btn btn-outline-dark mt-auto" style = "height: 50%;" value="로그인화면으로" onClick="location.href='Naverlogin'">  
  </div>
  
</form>


      <%@ include file="./include/include-footer.jsp" %>
      
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        
        



</body>
</html>