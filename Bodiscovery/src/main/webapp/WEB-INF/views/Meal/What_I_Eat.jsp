<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>나의 식단 기록</title>



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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>	
	<br>
	
	<div align="center">
		<h1>${user.id}님이 ${day1} 에 드신 음식들의 영양성분입니다.</h1>
		<h4>전체kcal = 음식 총 kcal - 운동kcal 출력됩니다</h4>
		<br><br>
	
	   	
    	<div align="center">
    		<c:choose>
    			<c:when test="${user.sex == '남성'}">
				전체 kcal(평균남성 2,500 kcal)
    			<progress
    				class="tkcal"
    				id="mykcal"
    				value="${mykcal}"
    				min="0"
    				max="2500">${mykcal}</progress><br>
    			탄수화물
    			<progress
    				class="tan"
    				id="mytan"
    				value="${mytan}"
    				min="0"
    				max="250"></progress>
    			단백질
    			<progress
    				class="dan"
    				id="mydan"
    				value="${mydan}"
    				min="0"
    				max="200"></progress>
    			지방
    			<progress
    				class="gee"
    				id="mygi"
    				value="${mygi}"
    				min="0"
    				max="80"></progress>
    			</c:when>
    		<c:otherwise>	<!-- 여성일 경우 -->
				전체 칼로리(${mykcal}/1,700 kcal)
    			<progress
    				class="tkcal"
    				id="mykcal"
    				value="${mykcal}"
    				min="0"
    				max="1700">${mykcal}</progress><br>
    			탄수화물
    			<progress
    				class="tan"
    				id="mytan"
    				value="${mytan}"
    				min="0"
    				max="215">${mytan}</progress>
    			단백질
    			<progress
    				class="dan"
    				id="mydan"
    				value="${mydan}"
    				min="0"
    				max="150">${mydan}</progress>
    			지방
    			<progress
    				class="gee"
    				id="mygi"
    				value="${mygi}"
    				min="0"
    				max="35">${mygi}</progress>
    		</c:otherwise>
		</c:choose>
	</div>
	
	<br>
	<hr>
	
<div style="display: flex; flex-wrap: wrap; justify-content: center;">
    <div>
        <canvas id="kcal" width="400" height="300"></canvas>
    </div>
    <div style="display: flex; flex-direction: row;">&nbsp;&nbsp;&nbsp;
        <div style="margin-right: 20px;">
            <h2>아침</h2>
            <img src="${pageContext.request.contextPath}/resources/image/fork.png" alt="" width="30" height="auto"/>
            <c:forEach var="morning" items="${morning}">
                <p>kcal : ${morning.kcal}</p>
                <p>탄수화물 : ${morning.carbon}</p>
                <p>단백질 : ${morning.protein}</p>
                <p>지방 : ${morning.fat}</p>
            </c:forEach>
        </div>
        <div style="margin-right: 20px;">
            <h2>점심</h2>
            <img src="${pageContext.request.contextPath}/resources/image/fork.png" alt="" width="30" height="auto"/>
            <c:forEach var="lunch" items="${lunch}">
                <p>kcal : ${lunch.kcal}</p>
                <p>탄수화물 : ${lunch.carbon}</p>
                <p>단백질 : ${lunch.protein}</p>
                <p>지방 : ${lunch.fat}</p>
            </c:forEach>
        </div>
        <div style="margin-right: 20px;">
            <h2>저녁</h2>
            <img src="${pageContext.request.contextPath}/resources/image/fork.png" alt="" width="30" height="auto"/>
            <c:forEach var="dinner" items="${dinner}">
                <p>kcal : ${dinner.kcal}</p>
                <p>탄수화물 : ${dinner.carbon}</p>
                <p>단백질 : ${dinner.protein}</p>
                <p>지방 : ${dinner.fat}</p>
            </c:forEach>
        </div>
        <div style="margin-right: 20px;">
            <h2>간식</h2>
            <img src="${pageContext.request.contextPath}/resources/image/chips.png" alt="" width="30" height="auto"/>
            <c:forEach var="snack" items="${snack}">
                <p>kcal : ${snack.kcal}</p>
                <p>탄수화물 : ${snack.carbon}</p>
                <p>단백질 : ${snack.protein}</p>
                <p>지방 : ${snack.fat}</p>
            </c:forEach>
        </div>
        <div style="margin-right: 20px;">
            <h2>운동</h2>
            <img src="${pageContext.request.contextPath}/resources/image/ride.png" alt="" width="30" height="auto"/>
            <c:forEach var="sport" items="${sport}">
                <p>소모 칼로리 : ${sport.kcal}</p>
            </c:forEach>
        </div>
    </div>
</div>

	  <div align="center">
		<form action="main.do" method="post">
    		<input type="submit" class="btn btn-outline-dark mt-auto" value="홈으로">
    	</form>
    </div>
    
	 
	
	
	
    
    <br>
    
    
    


     
    </div>






<script>
// 차트를 그럴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('kcal').getContext('2d');

// 데이터 정의
var data = {
    // x축 레이블
    labels: ['아침,점심,저녁,간식'],
    // 데이터셋 배열
    datasets: [{
        label: '# ${user.id}님의 아침 칼로리',
        data: [
        	<c:forEach var="morning" items="${morning}">
          	  ${morning.kcal},
      		 </c:forEach>
        	],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '# ${user.id}님의 점심 칼로리',
        data: [<c:forEach var="lunch" items="${lunch}">${lunch.kcal},</c:forEach>],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }, {
        label: '# ${user.id}님의 저녁 칼로리',
        data: [<c:forEach var="dinner" items="${dinner}">${dinner.kcal},</c:forEach>],
        backgroundColor: 'rgba(255, 206, 86, 0.2)',
        borderColor: 'rgba(255, 206, 86, 1)',
        borderWidth: 1
    },  {
        label: '# ${user.id}님의 간식 칼로리',
        data: [<c:forEach var="snack" items="${snack}">${snack.kcal},</c:forEach>],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }
    ]
};

// 차트 생성
var myChart = new Chart(chartArea, {
    type: 'bar',
    data: data,
    options: {
        responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
    
    
    
	
	<!-- 함수 영역 -->
<script>
    // 칼로리를 더하는 함수
    function calculateTotalCalories() {
        
    	// 각 식사의 칼로리를 가져와서 더합니다.
        var totalCalories = 0;
        var totaltan = 0;
        var totaldan = 0;
        var totalgi = 0;
        
        
        // 아침식사
        <c:forEach var="morning" items="${morning}">
            totalCalories += ${morning.kcal};
            totaltan += ${morning.carbon};
            totaldan += ${morning.protein};
            totalgi += ${morning.fat};
        </c:forEach>

        // 점심식사
        <c:forEach var="lunch" items="${lunch}">
            totalCalories += ${lunch.kcal};
            totaltan += ${lunch.carbon};
            totaldan += ${lunch.protein};
            totalgi += ${lunch.fat};            
        </c:forEach>

        // 저녁식사
        <c:forEach var="dinner" items="${dinner}">
            totalCalories += ${dinner.kcal};
            totaltan += ${dinner.carbon};
            totaldan += ${dinner.protein};
            totalgi += ${dinner.fat};            
        </c:forEach>

        // 간식
        <c:forEach var="snack" items="${snack}">
            totalCalories += ${snack.kcal};
            totaltan += ${snack.carbon};
            totaldan += ${snack.protein};
            totalgi += ${snack.fat};
        </c:forEach>
        
        //운동
        <c:forEach var="sport" items="${sport}">
        	totalCalories -= ${sport.kcal};
        </c:forEach>
        
        return {
        	totalCalories: totalCalories,
       		totaltan: totaltan,
       		totaldan: totaldan,
       		totalgi: totalgi
        };
    
    }

    // 페이지 로드 시 총 칼로리를 업데이트합니다.
    window.onload = function() {
        // 총 칼로리 요소를 가져와서 업데이트합니다.
        var totalCaloriesElement = document.getElementById('mykcal');
        var totaltanElement = document.getElementById('mytan');
        var totaldanElement = document.getElementById('mydan');
        var totalgiElement = document.getElementById('mygi');
        
        if (totalCaloriesElement) {
            // 총 칼로리를 계산하여 업데이트합니다.
        	var totals = calculateTotalCalories();
            totalCaloriesElement.value = totals.totalCalories;
            totaltanElement.value = totals.totaltan;
            totaldanElement.value = totals.totaldan;
            totalgiElement.value = totals.totalgi;
            
            
            document.getElementById('mykcal').value = totals.totalCalories;
        }
    };
    
    </script>
    
    
    
    <script>
    	var mealsData = ${mealsJson}; // mealsJson은 서버에서 생성된 JSON 데이터를 의미합니다.
	</script>
        
        
<%@ include file="../include/include-footer.jsp" %>
