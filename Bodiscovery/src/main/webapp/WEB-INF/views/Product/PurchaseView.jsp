<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

@font-face {
    font-family: 'SBAggro';
    font-weight: 300;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroLight.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroLight.eot?#iefix') format('embedded-opentype'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroLight.woff2') format('woff2'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroLight.woff') format('woff'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroLight.ttf') format("truetype");
    font-display: swap;
}
@font-face {
    font-family: 'SBAggro';
    font-weight: 500;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroMedium.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroMedium.eot?#iefix') format('embedded-opentype'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroMedium.woff2') format('woff2'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroMedium.woff') format('woff'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroMedium.ttf') format("truetype");
    font-display: swap;
}
@font-face {
    font-family: 'SBAggro';
    font-weight: 700;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroBold.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroBold.eot?#iefix') format('embedded-opentype'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroBold.woff2') format('woff2'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroBold.woff') format('woff'),
        url('https://cdn.jsdelivr.net/gh/webfontworld/sandbox/SBAggroBold.ttf') format("truetype");
    font-display: swap;
}

svg {
        font-family: 'SBAggro';
        font-size: 140px;
        position: absolute; /* 부모 요소에 대한 상대적 위치 설정 */
        font-weight: 700;
        width: 100%;
        height: 100%;
        text-transform: uppercase;
        fill: rgba(124, 71, 197, 1);
        animation: stroke 4s infinite alternate;
    }
@keyframes stroke {
  0% {
    stroke-dashoffset: 25%;
    stroke-dasharray: 0 50%;
    fill: rgba(124, 71, 197, 0);
    stroke: rgba(81, 45, 131, 0);
    stroke-width: 2;
  }
  10% {
    fill: rgba(124, 71, 197, 0);
    stroke: rgba(81, 45, 131, 1);
  }
  70% {
    fill: rgba(124, 71, 197, 0);
    stroke: rgba(81, 45, 131, 1);
  }
  80% {
    fill: rgba(124, 71, 197, 0);
    stroke: rgba(81, 45, 131, 1);
  }
  95% {
    fill: rgba(124, 71, 197, 1);
    stroke: rgba(81, 45, 131, 0);
  }
  100% {
     stroke-dashoffset: -25%;
     stroke-dasharray: 50% 0; 
     fill: rgba(124, 71, 197, 1);
     stroke: rgba(81, 45, 131, 0);
     stroke-width: 2;
  }
}
.parent-container {
  display: flex;
  justify-content: center;
  align-items: center;
   height: 50vh; /* 상대적인 값으로 변경 */
   position: relative; /* 부모 요소의 위치 지정 */
}

 

</style>

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

	<div class="parent-container">
    	<svg width=auto height=auto > 
  			<text x="50%" y="50%" dy="20px" text-anchor="middle">결제완료! 감사합니다 :)</text>
		</svg>
	</div>

	<div align="center">
		<form action="takeit" method="post">
			<input type="hidden" id="id" name="id" value="${user.id}">
    		<input type="submit" class="btn btn-outline-dark mt-auto" value="${user.id} 님 구매내역 확인" 
    			style="width: 300px; height: 100px;">
    	</form>
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
