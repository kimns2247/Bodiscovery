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

<!-- 아임포트 라이브러리 -->
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아임포트 라이브러리-end -->

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
	
	<h1><strong>주문/결제</strong></h1>
	<br>
	
	<hr>
	
	<div align="center">
		<form action="reservation.do">
		<table>
			<tr>
				<td colspan="3"><h3> 주문결제 금액  </h3></td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td></td>
				<td>  
					<strong>
					<h3>
						<fmt:formatNumber value="${total}" pattern="#,###" />원
						<input type="hidden" id="total" name="total" value="${total}">
					</h3>
					</strong>
				</td>
			</tr>
		</table>
		<hr>
		<table align="center">
			<tr>
				<td>
				<strong>
					처리위탁 및 3자 제공 동의(선택)
				</strong>
				</td>
				<td><input type="checkbox"></td>
			</tr>
			<tr>
				<td>
				<strong>
					개인정보 수집 및 이용 동의(선택)
				</strong>
				</td>
				<td><input type="checkbox"></td>
			</tr>
			
			
			
			
			
 			
</div>  
			
			
			
			
				
			</tr>
			<tr>
 		</table>
		</form>
		<br>
		<!-- 카카오 결제 버튼 -->
		<form action=""> 
      			<input type="button" class="btn btn-outline-dark mt-auto"
      			style="width: 200px; height: 60px;" id="reservbtn" onclick="requestPay1(); CheckTest();" value="카카오페이 결제"> 
 		</form>
 		<br>
 		<!-- 토스페이 결제 버튼 -->
 		<form action=""> 
      			<input type="button" class="btn btn-outline-dark mt-auto"
      			style="width: 200px; height: 60px;" id="reservbtn" onclick="requestPay2(); CheckTest();" value="토스페이 결제"> 
 		</form>
	</div>
	
	<br>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type = "text/javascript">  /* 체크가 안되면 가입이 되지않게 함수구현완료 */

function CheckTest(){

if(document.delete.agree.checked){

 document.delete.agree.value='on';
 document.delete.submit();
 
} else {
	Swal.fire({
	       icon: 'info',
	       title : '체크박스를 선택해주세요!',
	       text : '결제를 위해 내용과 체크박스 확인을 부탁드립니다!',
	    });
	return false;
		}
	}
</script>

	
	
  <!-- PortOne SDK -->
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
   
  <!-- jQueryAjax -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  
  <!-- 카카오페이 -->
 <script>
      var IMP = window.IMP;
      IMP.init("imp48732081");
 
      function requestPay1() {      
             
         var randomMerchantUid = "kakao-" + Math.random().toString(36).substring(2, 10);
                                                       
         var userID = document.getElementById("id").innerText;
         
         IMP.request_pay(
                 {
                   pg: "kakaopay",
                   pay_method: "card",
                   merchant_uid: randomMerchantUid,
                   name: "바디스커버리",
                   amount: ${total},
                   buyer_email: "kimns2247@naver.com",
                   buyer_name: "${user.id}",
                   buyer_tel: "010-1234-5678",
                   buyer_addr: "서울특별시 강남구 삼성동",
                   buyer_postcode: "123-456",

                 }, function (rsp) { // callback
                     if (rsp.success) {
                         // 결제 성공 시
                         console.log(rsp);
                          alert('결제에 성공하였습니다');
                         setTimeout('move_page()' , 1000);
                         
                         
                         // axios로 HTTP 요청
                        jQuery.ajax({ /* 결과 값 저장 위한 호출 */    //이 부분을 jquery ajax로 변경해보기
                           url: "purchasecomplete.do", /* 호출 url */
                           method: "post",
                         
                           data: {
                             
                              "name" : rsp.name
                             ,"merchant_uid" : rsp.merchant_uid
                             , "pg" : rsp.pg_provider
                             , "userID": rsp.buyer_name
                             , "amount" : ${total}
                           }
                         }).then((data) => {
                           // 서버 결제 API 성공시 로직
                           console.log('서버 결제 API 호출 성공', data);
                         }).catch((error) => {
                           // 서버 결제 API 실패시 로직
                           console.error('서버 결제 API 호출 실패', error);
                         });
                     } else {
                         // 결제 실패 시
                         console.log(rsp);
                         alert(`결제에 실패하였습니다. 다시 시도해주세요`);
                       
                     }
                     
                 });
             }
         
      function move_page() {
    	  location.href="purchasecomplete.do";
      }
     
    </script>
    
    
    
    <!-- 토스페이 -->
     <script>
      var IMP = window.IMP;
      IMP.init("imp48732081");
 
      function requestPay2() {      
             
         var randomMerchantUid = "toss-" + Math.random().toString(36).substring(2, 10);
                                                       
         var userID = document.getElementById("id").innerText;
         
         IMP.request_pay(
                 {
                   pg: "tosspay",
                   pay_method: "card",
                   merchant_uid: randomMerchantUid,
                   name: "바디스커버리",
                   amount: ${total},
                   buyer_email: "kimns2247@naver.com",
                   buyer_name: "${user.id}",
                   buyer_tel: "010-1234-5678",
                   buyer_addr: "서울특별시 강남구 삼성동",
                   buyer_postcode: "123-456",

                 }, function (rsp) { // callback
                     if (rsp.success) {
                         // 결제 성공 시
                         console.log(rsp);
                          alert('결제에 성공하였습니다');
                         setTimeout('move_page()' , 1000);
                         
                         
                         // axios로 HTTP 요청
                        jQuery.ajax({ /* 결과 값 저장 위한 호출 */    //이 부분을 jquery ajax로 변경해보기
                           url: "purchasecomplete.do", /* 호출 url */
                           method: "post",
                         
                           data: {
                             
                              "name" : rsp.name
                             ,"merchant_uid" : rsp.merchant_uid
                             , "pg" : rsp.pg_provider
                             , "userID": rsp.buyer_name
                             , "amount" : ${total}
                           }
                         }).then((data) => {
                           // 서버 결제 API 성공시 로직
                           console.log('서버 결제 API 호출 성공', data);
                         }).catch((error) => {
                           // 서버 결제 API 실패시 로직
                           console.error('서버 결제 API 호출 실패', error);
                         });
                     } else {
                         // 결제 실패 시
                         console.log(rsp);
                         alert(`결제에 실패하였습니다. 다시 시도해주세요`);
                       
                     }
                     
                 });
             }
         
      function move_page() {
    	  location.href="purchasecomplete.do";
      }
     
    </script>
    
    
    
    
    
   


<%@ include file="../include/include-footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        
          
</body>
</html>