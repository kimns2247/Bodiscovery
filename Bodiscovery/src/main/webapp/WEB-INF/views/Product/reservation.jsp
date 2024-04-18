<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bodiscovery</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Link Swiper's CSS -->

<style>
    html,
    body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }
    .swiper {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .swiper {
      width: 100%;
      height: 300px;
      margin: 20px auto;
    }
    .append-buttons {
      text-align: center;
      margin-top: 20px;
    }
    .append-buttons button {
      display: inline-block;
      cursor: pointer;
      border: 1px solid #007aff;
      color: #007aff;
      text-decoration: none;
      padding: 4px 10px;
      border-radius: 4px;
      margin: 0 10px;
      font-size: 13px;
    }
.pgjaj02 {
    margin:0px 400px;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 52px;
    border-radius: 4px;
    box-sizing: border-box;
    background-color: #ff3d00;
    color: var(--_1ltqxco3);
    font-size: var(--_1ltqxcov);
    font-weight: var(--_1ltqxco10);
    z-index:1000;
	}
 .infobox{
 font-size: 20px;
}
#like{
      width: 50px;
      fill: #ddd;
}
#like.active{
      fill: red;
}
@font-face{
  font-family: "BMHANNAPro";
  src: url("fonts/BMHANNAPro.ttf");
}  
body{
   font-family:"BMHANNAPro";
}
#reservbtn{
    background-color: #ff3d00;
    border:0;
    font-family: 'NanumBarunGothicYetHangul';
    font-size: 20px;
    width: 150px;
    height: 40px;
}    
.bt{
	align:center
}  
.infobox input[type="date"] {
    width: 160px;
    height: 30px;
    font-size: 20px;
}    
.infobox select[name="people1"] {
    width: 160px;
    height: 30px;
    font-size: 15px;
}
.infobox select[name="time1"] {
    width: 160px;
    height: 30px;
    font-size: 15px;
}
.userID{
	font-color:#eee;
}
   
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

</head>

<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>



<body style="margin:0px 400px;" onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">

	
<div class="space"></div>
<br><br><br>

<div class="text-center" align="center">
<img src="./images/reservation.png">
</div><br>
 					<c:if test="${user != null }">
					<div>
					<p>${user.id}님 환영 합니다.</p>
					<a href="logout">[로그아웃하러가기]</a>
					<a href="userUpdateView.do">[내정보보기]</a>
					<a href="ItemAll.do">[상품 전체보기]</a>
					</div>
					</c:if>

<div id = "userID" align="center" style="color: #eee;"></div>
<h1 align="center"> <p>${user.id}님의 예약 페이지입니다</h1>
아이디 : <input type="text" id="id" name="id" value="${user.id}"> <br>
결제 금액 : <input type="text" id="total2" name="total2" value="${total2}"><br>


<div class="bt" align="center">
 <form action="reservation.jsp">  <!-- .do: servlet으로 찾아가라는 의미  -->
      <input type="button" id="reservbtn" onclick="requestPay1()" value="카카오페이 결제하기">
 </form>
</div>  

<div class="bt" align="center">
 <form action="reservation.jsp">  <!-- .do: servlet으로 찾아가라는 의미  -->
      <input type="button" id="reservbtn" onclick="requestPay2()" value="토스페이 결제하기">
 </form>
</div>  


<div class="space"></div>
<br><br><br>


    <!-- PortOne SDK -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
   
     <!-- jQueryAjax -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
   
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
                   amount: ${total2},
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
                             , "amount" : ${total2}
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
                         alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
                     }
                     
                 });
             }
      
      
      function requestPay2() {      
          
          var randomMerchantUid = "toss-" + Math.random().toString(36).substring(2, 10);
                                                        
          var userID = document.getElementById("id").innerText;
          
          IMP.request_pay(
                  {
                    pg: "tosspay",
                    pay_method: "card",
                    merchant_uid: randomMerchantUid,
                    name: "바디스커버리",
                    amount: ${total2},
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
                              , "amount" : ${total2}
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
                          alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
                      }
                      
                  });
              }
      
      
         
      function move_page() {
    	  location.href="purchasecomplete.do";
      }
     
    </script>
 
 
<div class="space"></div><br><br>
<div class="space"></div><br>
 
 



</body>
</html>