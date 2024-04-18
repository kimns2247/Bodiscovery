<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="aa">
		<!-- Navigation S -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            	<!-- Logo -->
            	
            	<a class="navbar-brand" href="${pageContext.request.contextPath}/main.do">
            		<img src="${pageContext.request.contextPath}/resources/image/bodiscovery_logo.png" alt=""/></a>
            		
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                		aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                			<span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 nav-right"> <!-- nav-right 클래스 추가 -->
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ItemAll.do">상품보기</a></li>
                        
        <!-- **************************************************** 희지님 부분 추가부분 ******************** -->                
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/publicData/list_user.do">운동정보</a></li>
                        
		<!--***** 희지님 시작 부분 링크 위쪽 '운동정보' 앞 href="" 콤마 안에 넣어주시면 시작되요! *****-->
		
					<c:if test="${user.id != null }">
                        <li class="nav-item"><a class="nav-link" data-hidden-value="${user.id}" href="${pageContext.request.contextPath}/MyMeal.do">다이어리</a></li>
                    </c:if>
                    <c:if test = "${user.id == null }">
                    	<li class="nav-item"><a class="nav-link" data-hidden-value="${user.id}" href="${pageContext.request.contextPath}/Naverlogin">다이어리</a></li>
                     </c:if> 
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/boardListpage">게시판</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ItemAll.do">상품보기</a></li>
                            </ul>
                        </li>
                    </ul>
                   
                    
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
 					<c:if test="${user != null }">
   					 <li class="nav-item">
       					 <div class="row align-items-center">
          				  <div class="col">
                			<span>${user.id}님 환영 합니다.</span>
           				 </div>
            			<div class="col-auto">
                		<a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
           				 </div>
           				 <div class="col-auto">
                		<a class="nav-link" href="${pageContext.request.contextPath}/userUpdateView.do">내정보</a>
            			</div>
            			<div class="col-auto">
               			 <form action="${pageContext.request.contextPath}/CartView.do" method="post">
                   		 	<input type="hidden" id="id" name="id" value="${user.id}">
                    		<input type="submit" class="btn btn-shopping" value="장바구니">
              		  	</form>
           			 </div>
           			 <div class="col-auto">
               			 <form action="${pageContext.request.contextPath}/takeit" method="post">
                   		 	<input type="hidden" id="id" name="id" value="${user.id}">
                    		<input type="submit" class="btn btn-shopping" value="구매목록">
              		  	</form>
           			 </div>
           			 
           			 
        			</div>
    					</li>
					</c:if>
               		<c:if test = "${user == null }">
               			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/userInsert.do">회원가입</a></li>
               			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Naverlogin">로그인</a>
               		</c:if>              			
               		
					</ul>
                    
                	
                </div>
            </div>
        </nav>
        <!-- Navigation E -->
	</div>
	