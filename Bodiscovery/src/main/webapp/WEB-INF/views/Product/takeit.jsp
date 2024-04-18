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
	.guide li {
		text-align: center;
		font-size: 0.9rem;
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
	.tracking-in-contract {
		-webkit-animation: tracking-in-contract 4s cubic-bezier(0.190, 1.000, 0.220, 1.000) 2s infinite alternate both;
	        animation: tracking-in-contract 4s cubic-bezier(0.190, 1.000, 0.220, 1.000) 2s infinite alternate both;
	}
	@keyframes tracking-in-contract {
  		0% {
    		letter-spacing: 1em;
    		opacity: 0;
  		}
  		40% {
    		opacity: 0.6;
  		}
  		100% {
    		letter-spacing: normal;
    		opacity: 1;
  		}
	}

</style>

</head>

<body>

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

<h4>구매내역</h4>
	
    	
    
<hr>   
    
    <table>
    	<c:forEach var="alist" items="${alist}">
    	<tr>
    		<td>상품번호</td>
    		<td>
    			${alist.merchant_uid}
    		</td>
    	</tr>
    	<tr>
    		<td>금액</td>
    		<td>
    			${alist.amount}
    		</td>
    	</tr>
    	<tr>
    		<td>이름</td>
    		<td>
    			${alist.name}
    		</td>
    	</tr>
    	<tr>
    		<td>결제사</td>
    		<td>
    			${alist.pg}
    		</td>
    	</tr>
    	<tr>
    		<td>결제 아이디</td>
    		<td>
    			${alist.id}
    		</td>
    	</tr>
    	</c:forEach>
    </table>    
	

<br><br>
<h4>상세 구매내역</h4>
<hr>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4">
                    <c:forEach var="citem" items="${vlist}" varStatus="loop">
                       <div class="col">
    <div class="card h-100">
        <!-- 이미지 요소에 스타일 추가하여 크기 조절 -->
        <img src="resources/image/${citem.item_No}.jpg" class="card-img-top" style="max-height: 200px;" alt="...">
        <div class="card-body p-4">
            <div class="text-center">
                <h5 class="fw-bolder">${citem.item_Name}</h5>
                <p class="card-text">
                    ${citem.cnt}
                </p>
            </div>
        </div>
    </div>
</div>
					</c:forEach>
				</div>
			</div>
		</section>
    
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