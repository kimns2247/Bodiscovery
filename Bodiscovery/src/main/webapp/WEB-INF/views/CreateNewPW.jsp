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

<!-- swiper -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
<style>
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
<h1>
  새로운 임시 비밀번호가 발급되었습니다 <br>
  확인부탁드립니다!<br>
  로그인 후 비밀번호 변경 부탁드립니다</h1><br>
  <h3>임시 비밀번호 : ${newPW}</h3>  
</div>  

<div class="btns" align="center">


		<td>
			<form action="login1.do" method="post">
			<input type="submit" class="btn btn-outline-dark mt-auto" value="로그인 하러가기">
			</form>

			
			
			
		</td>
</div>
<br>
	
	
	
	
	 <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container text-center">
            <!-- Logo -->
            <img src="${pageContext.request.contextPath}/resources/image/footerImage.png" alt="" class="footer-logo">
            <p class="m-0 text-white">Copyright &copy; 2024 Bodiscovery.</p>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>

</body>
</html>