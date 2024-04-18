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
	.navbar-brand img {
        width: 200px;
        height: auto;
    }
    .card-img-top {
        width: 100%;
        height: 200px; /* 이미지 크기 조정 */
        object-fit: cover;
    }
    .footer-logo {
		display: block;
		margin: 0 auto;
		width: 300px;
		height: auto;
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


        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4">
                    <c:forEach var="imsi" items="${alist}" varStatus="loop">
                        <div class="col">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img src="resources/image/${imsi.item_No}.jpg" class="card-img-top" alt="...">
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${imsi.item_Name}</h5>
                                        <!-- Product price-->
                                        <p class="card-text">
                                            <h6><fmt:formatNumber value="${imsi.item_Price}" pattern="#,###"/>원</h6></p>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent" align="center">
                                    <form action="ItemGet.do" method="post">
                						<input type="hidden" name="Name" value="${imsi.item_Name}">
                                        <input type="hidden" name="No" value="${imsi.item_No}">
                                        <input type="hidden" name="Price" value="${imsi.item_Price}">
                                        <input type="hidden" name="id" value="${user.id}">
    									<input type="submit" class="btn btn-outline-dark mt-auto" value="상품보기">
    								</form>                 
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        
       <%@ include file="../include/include-footer.jsp" %>
        
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
