<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>나의 식단 기록</title>

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
	.btn_submit {
		background-image: url(${pageContext.request.contextPath}/resources/image/x.svg);
		background-repeat: no-repeat;
		width: 25px;
		height: 25px;
		border: 0;
	}
</style>

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

	<h3 align="center"><strong>${user.id} 님 다이어리 일지 입니다.</strong></h3>

	<hr>	
 
	<div align="center">
		<table>
			<tr>
				<strong>아침식사 &nbsp;</strong>
				<img src="${pageContext.request.contextPath}/resources/image/fork.png" alt=""
					width="30" height="auto"/>
			</tr>
			<br>		
			<c:forEach var="bk" items="${breakfast}">
			<tr>
				<td> 메뉴 : ${bk.menu} </td>
				<td> 칼로리 : ${bk.kcal} </td>
				<td> 날짜 : ${bk.day} </td>
				<td>
					<form action="breakDel" method="post">
                  		<input type="hidden" id="cart" name="cart" value="${citem.item_No}">
				  		<input type="hidden" id="id" name="id" value="${user.id}">
				  		<input type="hidden" id="day" name="day" value="${bk.day}">
				  		<input type="hidden" id="kcal" name="kcal" value="${bk.kcal}">
                  		<input type="submit" value="" class="btn_submit">
                  	</form>
                </td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<div align="center">
		<table>
			<tr>
				<strong>점심식사 &nbsp;</strong>
				<img src="${pageContext.request.contextPath}/resources/image/fork.png" alt=""
					width="30" height="auto"/>
			</tr>
			<br>
			<c:forEach var="lun" items="${lunch}">
			<tr>
				<td> 메뉴 : ${lun.menu} </td>
				<td> 칼로리 : ${lun.kcal} </td>
				<td> 날짜 : ${lun.day} </td>
				<td>
					<form action="lunchDel" method="post">
                  		<input type="hidden" id="cart" name="cart" value="${citem.item_No}">
				  		<input type="hidden" id="id" name="id" value="${user.id}">
				  		<input type="hidden" id="day" name="day" value="${lun.day}">
				  		<input type="hidden" id="kcal" name="kcal" value="${lun.kcal}">
                  		<input type="submit" value="" class="btn_submit">
                  	</form>
                </td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<div align="center">
		<table>
			<tr>
				<strong>저녁식사 &nbsp;</strong>
				<img src="${pageContext.request.contextPath}/resources/image/fork.png" alt=""
					width="30" height="auto"/>
			</tr>
			<br>
			<c:forEach var="di" items="${dinner}">
			<tr>
				<td> 메뉴 : ${di.menu} </td>
				<td> 칼로리 : ${di.kcal} </td>
				<td> 날짜 : ${di.day} </td>
				<td>
					<form action="dinnerDel" method="post">
                  		<input type="hidden" id="cart" name="cart" value="${citem.item_No}">
				  		<input type="hidden" id="id" name="id" value="${user.id}">
				  		<input type="hidden" id="day" name="day" value="${di.day}">
				  		<input type="hidden" id="kcal" name="kcal" value="${di.kcal}">
                  		<input type="submit" value="" class="btn_submit">
                  	</form>
                </td>
			</tr>
			</c:forEach>
		</table>
	</div>

	<div align="center">
		<table>
			<tr>
				<strong>간식 &nbsp;</strong>
				<img src="${pageContext.request.contextPath}/resources/image/chips.png" alt=""
					width="30" height="auto"/>
			</tr>
			<br>
			<c:forEach var="sn" items="${snack}">
			<tr>
				<td> 메뉴 : ${sn.menu} </td>
				<td> 칼로리 : ${sn.kcal} </td>
				<td> 날짜 : ${sn.day} </td>
				<td>
					<form action="SnackDel" method="post">
                  		<input type="hidden" id="cart" name="cart" value="${citem.item_No}">
				  		<input type="hidden" id="id" name="id" value="${user.id}">
				  		<input type="hidden" id="day" name="day" value="${sn.day}">
				  		<input type="hidden" id="kcal" name="kcal" value="${sn.kcal}">
                  		<input type="submit" value="" class="btn_submit">
                  	</form>
                </td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<div align="center">
		<table>
			<tr>
				<strong>운동 &nbsp;</strong>
				<img src="${pageContext.request.contextPath}/resources/image/ride.png" alt=""
					width="30" height="auto"/>
			</tr>
			<br>
			<c:forEach var="sport" items="${sport}">
			<tr>
				<td> 운동명 : ${sport.sport} </td>
				<td> 운동시간(분) : ${sport.duration} </td>
				<td> 소모칼로리 : ${sport.kcal} </td>
				<td> 운동날짜 : ${sport.day} </td>
				<td>
					<form action="SportDel" method="post">
                  		<input type="hidden" id="cart" name="cart" value="${citem.item_No}">
				  		<input type="hidden" id="id" name="id" value="${user.id}">
				  		<input type="hidden" id="day" name="day" value="${sport.day}">
				  		<input type="hidden" id="kcal" name="kcal" value="${sport.kcal}">
                  		<input type="submit" value="" class="btn_submit">
                  	</form>
                </td>
			</tr>
			</c:forEach>
		</table>
	</div>

	
	<hr>
	
	<div align="center">
 		<h3>일자별 식단 확인하기 <br>
			조회하시려는 날짜를 입력해주세요! </h3> <br>

		<form action = "dayKcal" method="post" name = "test1">
			<input type="hidden" name="id" value=${user.id}><br>
			
			<select name="text" id="option" onchange = "selectDay()">
				<c:forEach var="breakfast" items="${breakfast}">
					<option value="${breakfast.day}">${breakfast.day}</option>
				</c:forEach>

				<c:forEach var="lunch" items="${lunch}">
					<option value="${lunch.day}">${lunch.day}</option>
				</c:forEach>

				<c:forEach var="dinner" items="${dinner}">
					<option value="${dinner.day}">${dinner.day}</option>
				</c:forEach>
			
				<c:forEach var="snack" items="${snack}">
					<option value="${snack.day}">${snack.day}</option>
				</c:forEach>
				
				<c:forEach var="sport" items="${sport}">
					<option value="${sport.day}">${sport.day}</option>
				</c:forEach>
				
			</select>
			<input class="btn btn-outline-dark mt-auto" type="submit" value="칼로리계산">
			<input type="hidden"  id= "day1" name = "day1" value=""> 
		</form>
<br><br>

		<form action="MyMeal.do" method="post">
			<button type="submit"  class="btn btn-outline-dark mt-auto">식단 추가 페이지 가기</button>
		</form>
		<br>
	</div>
	
<!-- 함수 영역 -->
<script>
    // 각 식사의 칼로리를 더하는 함수
    function calculateTotalCalories() {
        // 각 식사의 칼로리를 가져와서 더합니다.
        var totalCalories = 0;

        // 아침식사
        <c:forEach var="bk" items="${breakfast}">
            totalCalories += ${bk.kcal};
        </c:forEach>

        // 점심식사
        <c:forEach var="lun" items="${lunch}">
            totalCalories += ${lun.kcal};
        </c:forEach>

        // 저녁식사
        <c:forEach var="di" items="${dinner}">
            totalCalories += ${di.kcal};
        </c:forEach>

        // 간식
        <c:forEach var="sn" items="${snack}">
            totalCalories += ${sn.kcal};
        </c:forEach>

        return totalCalories;
    }

    // 페이지 로드 시 총 칼로리를 업데이트합니다.
    window.onload = function() {
        // 총 칼로리 요소를 가져와서 업데이트합니다.
        var totalCaloriesElement = document.getElementById('mykcal');
        if (totalCaloriesElement) {
            // 총 칼로리를 계산하여 업데이트합니다.
            totalCaloriesElement.value = calculateTotalCalories();
        }
    };
    
  /* 고객이 select한 날짜 함수 */
    function selectDay(){
       
       var sel = document.getElementById('option').value;
       document.getElementById('day1').value=sel;
        
    }



    
</script>
        
        
<%@ include file="../include/include-footer.jsp" %>