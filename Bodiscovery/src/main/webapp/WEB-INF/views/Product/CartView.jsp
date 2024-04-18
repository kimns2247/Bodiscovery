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

</style>

</head>
<script>
    function checkAndSubmit() {
        var grandTotal = parseInt(document.getElementById('grandTotal').value);
        var totalQuantity = parseInt(document.getElementById('totalQuantity').value);

        if (grandTotal === 0 || totalQuantity === 0) {
            alert('선택된 상품이 없습니다.');
            return false; // 구매를 막음
        } else {
            // 구매하기 액션 수행
            return true;
        }
    }
</script>
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
   
    <br>    
	<h1><strong>장바구니</strong></h1>
	
		<div class="clear" align="right">
		<form action="CartDelAll.do" onsubmit="return confirm('장바구니를 비우시겠습니까?');">
			<input type="hidden" id="id" name="id" value="${user.id}">
			<input type="submit"  class="btn btn-dark" value="장바구니 비우기">
		</form>
	</div>
	
	<hr>
	<c:if test="${empty vlist}">
    <table style="margin: 0 auto;">
       
       <div align ="center">
    	<h2>${user.id}님 장바구니에 담겨있는 물건이 없습니다 <br>
    	Bodiscovery에서 상품을 구매해보시는것은 어떠신가요?</h2>
       </div>	
	</table>
	</c:if>
	
	<c:if test="${not empty vlist}">
    <table style="margin: 0 auto;">
        <thead>
            <tr align="center">
                <td>이미지</td>
                <td>상품명</td>
                <td>가격</td>
                <td>수량</td>
                <td>합계금액</td>
                <td>Remove</td>
            </tr>
    	</thead>
    	
    	<tbody>
    	<!-- ***************************** 디자인 수정 필요!!!!!!! ******************** -->
     	   <c:forEach var="citem" items="${vlist}">
           <tr align="center">
              <td><img src="resources/image/${citem.item_No}.jpg" class="card-img-top" width="100" height="100" ></td>
               <td>${citem.item_Name}</td>
               <td><fmt:formatNumber value="${citem.item_Price}" pattern="#,###" />원</td>
               <td>${citem.cnt}</td>
               
               
          	<c:set var="total" value="${citem.item_Price * citem.cnt}" />
               <td><fmt:formatNumber value="${total}" pattern="#,###" />원</td>
               <td>
                  <form action="CartDel.do" method="post">
                  <input type="hidden" id="cart" name="cart" value="${citem.item_No}">
				  <input type="hidden" id="id" name="id" value="${user.id}">
				  <input type="submit" value="" class="btn_submit">
                  </form>
               </td>
           </tr>
      	 </c:forEach>
       
       <!-- ***************************** 디자인 수정 필요!!!!!!! ******************** -->
       
    	</tbody>
   	 		<tr align="center">
        		<td colspan="2">총 합계</td>
        		<td>
        	<c:set var="totalQuantity" value="0" />
        	<c:forEach var="citem" items="${vlist}">
        		<c:set var="totalQuantity" value="${totalQuantity + citem.cnt}" />
        	</c:forEach>
        		${totalQuantity} 개
        		</td>
    		</tr>
    		<tr align="center">
        		<td colspan="2">총 금액</td>
        		<td>
            <c:set var="grandTotal" value="0" />
            <c:forEach var="citem" items="${vlist}">
                <c:set var="total" value="${citem.item_Price * citem.cnt}" />
                <c:set var="grandTotal" value="${grandTotal + total}" />
            </c:forEach>
            <fmt:formatNumber value="${grandTotal}" pattern="#,###" />원
        		</td>
    		</tr>
	</table>
	</c:if>
	
	<hr>
	
		<div class="btns" align="center">
			<table>
			<tr>
				<td>
					<form action="ItemAll.do" method="post">
					<input type="submit" class="btn btn-shopping" value="쇼핑계속하기">
					</form>
				</td>
				<td></td>
				<td>
        			<form action="Order.do" method="post" onsubmit="return checkAndSubmit();">
        				<input type="hidden" name="grandTotal" id="grandTotal" value="${grandTotal}">
						<input type="hidden" name="totalQuantity" id="totalQuantity" value="">
						<input type="hidden" name="item_No" id="item_No" value="">
						<input type="hidden" name="cnt" id="cnt" value="">
						<input type="hidden" name="id" id="id" value="">
        				<input type="submit" class="btn btn-dark" value="구매하기">
        			</form>
        		</td>
    		</table>
    	</div>
    	
    	<br>
    	
    	<div class="guide">
    		<li>배송방법 선택 또는 배송지에 따라 배송비가 달라질 수 있습니다.</li>
    		<li>제품별로 출고지 및 출고일정이 상이하여 합포장 또는 개별발송될 수 있습니다.</li>
    		<li>상온과 냉동 합배송이 가능한 품목의 경우에는 상온 마감시간 기분으로 합배송 출고될 수 있습니다.</li>
    	</div>

		<br><br><br>
		
<!-- 함수영역 -->

	
	
	 <%@ include file="../include/include-footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        
          
</body>
</html>