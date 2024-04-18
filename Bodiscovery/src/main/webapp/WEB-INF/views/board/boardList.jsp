<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/custom.css">

<title>Bodiscovery</title>



<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
	crossorigin="anonymous">

<!-- 파비콘 -->
    <link rel="icon" href="<c:url value='/resources/assets/favicon.ico'/>" type="image/x-icon"/>
<!-- 파비콘-end -->



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
	</style>

</head>
<body>

<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            	<!-- Logo -->
            	
            	<a class="navbar-brand" href="main.do">
            		<img src="${pageContext.request.contextPath}/resources/image/bodiscovery logo.jpg" alt=""/></a>
            		
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                		aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                			<span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="ItemAll.do">상품보기</a></li>
                        
        <!-- **************************************************** 희지님 부분 추가부분 ******************** -->                
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/publicData/list_user.do">운동정보</a></li>
                        
		<!--***** 희지님 시작 부분 링크 위쪽 '운동정보' 앞 href="" 콤마 안에 넣어주시면 시작되요! *****-->
		
		
                        <li class="nav-item"><a class="nav-link" data-hidden-value="${user.id}" href="MyMeal.do">다이어리</a></li>
                        <li class="nav-item"><a class="nav-link" href="boardListpage">게시판</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" 
                            	aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="ItemAll.do">상품보기</a></li>
                            </ul>
                        </li>
                    </ul>
                    
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
 					<c:if test="${user != null }">
               			<li>${user.id}님 환영 합니다.</li>
               			<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
               			<li class="nav-item"><a class="nav-link" href="userUpdateView.do">내정보</a></li>
               			<form action="CartView.do" method="post">
                			<input type="hidden" id="id" name="id" value="${user.id}">
    						<input type="submit" class="btn btn-shopping" value="장바구니">
    					</form>
               		</c:if>
               		<c:if test = "${user == null }">
               			<li class="nav-item"><a class="nav-link" href="userInsert.do">회원가입</a></li>
               			<li class="nav-item"><a class="nav-link" href="Naverlogin">로그인</a>
               		</c:if>
               			<c:if test="${sessionId != null }">
               			<li>${sessionId}님 환영 합니다.</li>
               			<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
               			<li class="nav-item"><a class="nav-link" href="userUpdateView.do">내정보</a></li>
               			<form action="CartView.do" method="post">
                			<input type="hidden" id="id" name="id" value="${user.id}">
    						<input type="submit" class="btn btn-shopping" value="장바구니">
    					</form>
               		</c:if>
               		
					</ul>
                    
                	
                
                </div>
            </div>
        </nav>
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


</head>
<body>
	<div class="container">
		<div class="row">
		<form action = "toBoardWrite.do" method = "post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeee; text-align: center;">작성일시</th>
						<th style="background-color: #eeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${blist }">
				<tbody>
					<tr>
						<td>${list.bno }</td>
						<td><a href="getBoard?bno=${list.bno }">${list.title }</a></td>
						<td>${list.id }</td>
						<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd hh:mm" /></td>
						<td>${list.viewcnt }</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<c:if test = "${user.id  != null }">
			<input type = "submit" value = "글쓰기">
			</c:if>
			</form>
			<c:if test = "${user.id  == null }">
			<form action = "loginplz" method = "post">
			<input type = "submit" value = "글쓰기">
			</form>
			</c:if>
		</div>
	</div>
	
	
	
	
	
	
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