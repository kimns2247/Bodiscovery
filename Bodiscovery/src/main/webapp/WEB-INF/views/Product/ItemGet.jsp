<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 천원단위 콤마 표시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 천원단위 콤마 - end -->
<!-- 난수생성 -->
<%@ page import="java.util.Random" %>
<!-- 난수생성 - end -->
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


.tilt-in-fwd-tr {
		-webkit-animation: tilt-in-fwd-tr 6s cubic-bezier(0.950, 0.050, 0.795, 0.035) alternate both;
	        animation: tilt-in-fwd-tr 6s cubic-bezier(0.950, 0.050, 0.795, 0.035) alternate both;
	}
	@keyframes tilt-in-fwd-tr {
  		0% {
    		-webkit-transform: rotateY(20deg) rotateX(35deg) translate(300px, -300px) skew(-35deg, 10deg);
            	transform: rotateY(20deg) rotateX(35deg) translate(300px, -300px) skew(-35deg, 10deg);
    		opacity: 0;
  		}
  		100% {
    		-webkit-transform: rotateY(0) rotateX(0deg) translate(0, 0) skew(0deg, 0deg);
            	transform: rotateY(0) rotateX(0deg) translate(0, 0) skew(0deg, 0deg);
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
                <div class="text-center text-white tracking-in-contract">
                    <h1 class="display-4 fw-bolder">Bodiscovery</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With our shop Change your body, life</p>
                </div>
            </div>
        </header>



<br>
	<div align="center">
	<h1> ${param.Name} - 상품 상세 내역 </h1>
<br>	
	<table border="1">
		<tr>
			<td rowspan="5">
				<img src="resources/image/${param.No}.jpg" width=250 height=250>
			</td>
			<td colspan="2" align="center"> ${param.Name} </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<fmt:formatNumber value="${param.Price}" pattern="#,###"/> 원 </td>
		</tr>
		<tr>
			<td align="center"> 구매수량 : </td>
			<td align="center">
			<input type="text" name="cnt" id="cnt" size="3" maxlength="3" 
					value="1" oninput="setQuantity()" autofocus
							oninput="setQuantity()">개
			</td>
		</tr>
	<c:if test="${user != null }">
		<tr>
			<td colspan="2" align="center">
				<form name="cart_${param.No}" id="cart_${param.No}" method="post" 
					action="CartAdd.do" onsubmit="return addCart()">
					<input type="hidden" name="Id" value="${user.id}">
            		<input type="hidden" name="item_No" value="${param.No}">
            		<input type="hidden" name="item_Name" value="${param.Name}">
            		<input type="hidden" name="item_Price" value="${param.Price}">
            		<input type="hidden" name="cnt" id="hiddenCnt" value="1">
            		<input type="submit" class="btn btn-outline-dark mt-auto" value="장바구니">
				</form>
			</td>
		</tr>
	</c:if>
	<c:if test = "${user == null }">
	<tr>
	<td colspan="2" align="center">
	<form action="Naverlogin" method="get">
	<input type="submit" class="btn btn-outline-dark mt-auto" value="장바구니">
	</form>
	</td>
	</tr>
	</c:if>  
	</table>
	</div>
<br>
<hr>
	<div align="center">
		<table>
			<tr>
				<td>판매량</td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td><strong><%
					Random ran = new Random();
					int number = ran.nextInt(100000);
					out.print(number);
					%></strong>팩 구매</td>
			</tr>
			<tr>
				<td>배송방법&nbsp;&nbsp;&nbsp;</td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td>&nbsp;&nbsp;&nbsp;특급배송(익일도착)[12:00 주문완료시]</td>
			</tr>
			<tr>
				<td>브랜드관&nbsp;&nbsp;&nbsp;</td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td>&nbsp;&nbsp;&nbsp;바디스커버리 닭</td>
			</tr>
			<tr>
				<td>보관방법&nbsp;&nbsp;&nbsp;</td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td>&nbsp;&nbsp;&nbsp;냉동 보관</td>
			</tr>
			<tr>
				<td>공지사항&nbsp;&nbsp;&nbsp;</td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td>&nbsp;&nbsp;&nbsp;* 추가옵션 상온 품목은 개별적으로 배송될 수 있습니다.</td>
			</tr>
		</table>
	</div>
<hr>
<div align="center">
<h3>내 가족이 먹는다 생각하고 만들었습니다.</h3> <br>
	<div class="container" align="center">
		<img src="${pageContext.request.contextPath}/resources/image/cook.jpg" 
			width="700" height="auto" class="tilt-in-fwd-tr"/>
	</div>
</div>
<br>
<div align="center">
	<h3> " 그저 그런 닭가슴살이라면 "</h3><br>
	<h3> 오래 찾는 닭가슴살이 될 수 없습니다.</h3><br>
	<img src="resources/image/${param.No}.jpg" width="500" height="auto">
	<br><br>
	<h3>롱런하는 사람의 식단에는 차이가 있습니다.</h3><br><br>
	<h3>식단에 진심인 사람들이 만들어</h3><br>
	<h3>함량, 식감, 맛 어느 하나 놓칠 수 없죠.</h3><br><br>
	
	<strong><h2> / </h2></strong> <br>
	
	<font color="brown">
	<h3> " 좋은 닭가슴살과 다양한 재료들로 "</h3><br>
	<h3> 맛있게 빚어내는</h3><br>
	<h3>" ${param.Name} " 이니까 믿고 드세요!</h3>
	</font>
</div>
<br><br>
<h4>배송안내</h4>
<hr>
<br>
	<div class="container">
		<table>
			<tr>
				<td rowspan="3" align="center"><img src="${pageContext.request.contextPath}/resources/image/fast.png" width="35px" height=auto/>
					<p style="color:#FF5D17">특급배송</p>
				</td>
				<td></td>
				<td></td>
				<td>
    			<strong>
        			<p><img src="${pageContext.request.contextPath}/resources/image/sun.png" width="20px" height="auto">
        			<font size="2" color="#FF531F">당일도착</font></p>
    			</strong>
				</td>
				<td><font size="2" color="grey">
					&nbsp;&nbsp;평일 12시까지 주문 시, 오늘 저녁 도착!<br>
					&nbsp;&nbsp;(수도권)
				</font>
				</td>
				<td rowspan="3">
				<font size="2" color="grey">
					&nbsp;&nbsp;특급배송 조건: 35,000원 이상 주문시 <br>
					&nbsp;&nbsp;(제주도 및 도서산간 제외 전 지역) <br>
					&nbsp;&nbsp;토요일, 공휴일 결제 시 다음 영업일 발송 <br>
					&nbsp;&nbsp;일요일 20시까지 주문시, 새벽도착 <br>
					&nbsp;&nbsp;일요일 21시까지 주문시, 내일도착 <br>
				</font>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>
				<strong>
					<p><img src="${pageContext.request.contextPath}/resources/image/moon.png" width="20px" height=auto>
					<font size="2" color="#FFD426">새벽도착</font></p>
				</strong>
				</td>
				<td><font size="2" color="grey">
					&nbsp;&nbsp;평일 20시까지 주문 시, 내일 새벽 도착!<br>
					&nbsp;&nbsp;(수도권 / 충청권 일부 지역)
				</font>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>
				<strong>
					<p><img src="${pageContext.request.contextPath}/resources/image/clock.png" width="20px" height=auto>
					<font size="2" color="#0AADFF">내일도착</font></p>
				</strong>
				</td>
				<td><font size="2" color="grey">
					&nbsp;&nbsp;평일 24시까지 주문 시, 내일 도착!<br>
					&nbsp;&nbsp;(제주도 및 도서산간 제외 전 지역)
				</font>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>택배사</td>
				<td><font size="2" color="grey">
					&nbsp;&nbsp;CJ대한통운 (1588-1255), 롯데택배 (1588-2121), 한진택배 (1588-0011)
				</font>
				</td>
			</tr>
			<tr>
				<td>유의사항</td>
				<td><font size="2" color="grey">
				 &nbsp;&nbsp;* 도서산간, 택배사 사유, 재고 상황 등의 이유로 도착 예정일은 변동될 수 있습니다. <br>
				 &nbsp;&nbsp;* 금요일 주문 마감 시간 이전 주문은 토요일에 배송됩니다. <br>
				 &nbsp;&nbsp;(공휴일인 경우, 다음 영업일 발송)
				</font>
				</td>
			</tr>
		</table>
	</div>
<br>
<h4>교환/반품 안내</h4>
<hr>
<br>
	<div class="container">
	<table>
		<tr>
			<td>주의사항</td>
			<td><font size="2" color="grey">
			&nbsp;&nbsp; - 본 상품은 제품 특성상 단순 변심에 의한 교환 * 반품은 불가합니다. <br>
			&nbsp;&nbsp; - 군부대, 사서함 주소의 경우 배송이 안될 수 있으니 고객센터 확인 후 주문 바랍니다. <br>
			&nbsp;&nbsp;&nbsp; (구매 전 제품 상세 및 배송 * 반품에 대한 내용을 확인해 주세요.)
			</font>
			</td>
		</tr>
		<tr>
			<td>교환/반품 신청</td>
			<td><font size="2" color="grey">
			&nbsp;&nbsp; 제품의 교환 및 반품 시 고객센터 담당자에게 교환 또는 반품 신청을 해주시기 바랍니다. <br>
			&nbsp;&nbsp; (전화 : 02-1234-5678 / 홈페이지 고객센터) <br><br>
			&nbsp;&nbsp; - 교환 및 반품은 고객센터 담당자와 협의를 통해 이루어지며, 임의로 수취거부 및 반송하는 경우 반품 처리 되지 않습니다. <br>
			&nbsp;&nbsp; - 냉동/냉장 식품의 경우 제품의 특성상 '단순변심'에 의한 반품 및 환불은 불가합니다. <br>
			&nbsp;&nbsp;&nbsp; 주문전 충분히 제품 상세페이지 및 제품 설명을 참고하시고 주문바랍니다.
			&nbsp;&nbsp; - 주문 완료건에 대해서 출고/반품 주소지가 상품별로 상이하여, 자동 수거 지시 기능이 불가합니다.
			</font>
			</td>
		</tr>
		<tr>
			<td>교환/반품이 가능한 경우</td>
			<td><font size="2" color="grey">
			&nbsp;&nbsp; - 판매자와 교환/반품에 대한 협의 없이 임의로 폐기 처분 또는 반품/배송한 경우 <br>
			&nbsp;&nbsp; - 냉동 * 냉장 보관 식품 및 채소 상품에 대한 단순 변심의 경우<br>
			&nbsp;&nbsp; - 잘못된 주소나 연락처 기재로 인한 반송 또는 고객의 부재로 인해 배송이 지연되어 제품이 변질된 경우<br>
			&nbsp;&nbsp; - 수령 후, 보관/취급 부주의로 인해 제품이 변질 또는 손상된 경우<br>
			&nbsp;&nbsp; - PC 및 휴대폰의 화면과 실제 상품의 색상이나 이미지 차이 또는 개인적 취향이나 기호에 따른 교환/반품<br>
			</font>
			</td>
		</tr>
		<tr>
			<td>교환/반품 절차</td>
			<td><font size="2" color="grey">
			&nbsp;&nbsp; - 전화 및 이메일을 통해 반송처 및 교환/반품 방법을 안내해드립니다. <br>
			&nbsp;&nbsp; - 반품시 결제 방식에 따라 카드 승인 취소 또는 계좌입금 처리를 해드립니다. <br>
			</font>
			</td>
		</tr>
	</table>
	</div>
<br>
<br>
<!-- 함수영역 -->
<script>

	function setQuantity() {
    	// 동적으로 현재 수량 값을 hidden field에 설정
    	var hiddenCntInput = document.getElementById('hiddenCnt');
    	var quantityInput = document.getElementById('cnt');
    	hiddenCntInput.value = quantityInput.value;
	}

	function addCart() {
	    // 현재 수량 값 불러오기
	    var quantityInput = document.getElementsByName('cnt')[0];
	    var quantityValue = quantityInput.value;

	    // 상품명 값 불러오기
	    var productNameInput = document.getElementsByName('item_Name')[0];
	    var productName = productNameInput.value;

	    // 가격 값 불러오기
	    var productPriceInput = document.getElementsByName('item_Price')[0];
	    var productPrice = productPriceInput.value;

	    // 현재 수량과 가격 합산 금액 가져오기
	    var totalPrice = quantityValue * parseInt(productPrice);;

	    // 상품번호 불러오기
	    var productNumInput = document.getElementsByName('item_No')[0];
	    var productNum = productNumInput.value;

	    // 아이디 불러오기
	    var member = document.getElementsByName('Id')[0];
	    var memberId = member.value;

	    // form1에 위 값을 설정
	    var form1 = document.forms['cart_${param.No}'];
	    form1.elements['Id'].value = memberId;
	    form1.elements['cnt'].value = quantityValue;
	    form1.elements['item_Name'].value = productName;
	    form1.elements['item_Price'].value = productPrice;
	    form1.elements['item_No'].value = productNum;

	    // form1 의 action 을 변경하여 컨트롤러로 이동
	    form1.action = 'CartAdd.do';
	    form1.submit();

	    // 장바구니에 추가되었음을 알리는 메시지 표시
	    alert('장바구니에 담았습니다.');

	    // 이동을 막기 위해 false 반환
	    return false;
	}//function addTocart-end

</script>		
	
 <%@ include file="../include/include-footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        
       
</body>
</html>
