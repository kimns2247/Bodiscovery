<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<canvas id="myChart" width="400" height="300"></canvas>

<script>
// 차트를 그릴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('myChart').getContext('2d');

// 데이터 정의
var data = {
    // x축 레이블
    labels: ['아침     ,     점심   ,  저녁   ,  간식'],
    // 데이터셋 배열
    datasets: [{
        label: '# 아침에 드신 거요^^',
        data: [<c:forEach var="morning" items="${morning1}">${morning.kcal},</c:forEach>],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '# 점심에 드신 거요^^',
        data: [<c:forEach var="lunch" items="${lunch1}">${lunch.kcal},</c:forEach>],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }, {
        label: '# 저녁에 드신 거요^^',
        data: [<c:forEach var="dinner" items="${dinner1}">${dinner.kcal},</c:forEach>],
        backgroundColor: 'rgba(255, 206, 86, 0.2)',
        borderColor: 'rgba(255, 206, 86, 1)',
        borderWidth: 1
    },  {
        label: '# 간식으로 드신 거요^^',
        data: [<c:forEach var="snack" items="${snack1}">${snack.kcal},</c:forEach>],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
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



${user.id}님이 드신 음식들의 영양성분입니다.
<br><br>


<c:forEach var="morning" items="${morning1}">
아침
칼로리 : ${morning.kcal} 
탄수 : ${morning.carbon} 
단백질 : ${morning.protein} 
지방 : ${morning.fat}
<br>
</c:forEach> <br><br>

점심 
<c:forEach var="lunch" items="${lunch1}">
칼로리 : ${lunch.kcal} 
탄수 : ${lunch.carbon} 
단백질 : ${lunch.protein} 
지방 : ${lunch.fat}
<br>
</c:forEach>  <br><br>

저녁 
<c:forEach var="dinner" items="${dinner1}">
칼로리 : ${dinner.kcal}
탄수 : ${dinner.carbon} 
단백질 : ${dinner.protein} 
지방 : ${dinner.fat}
<br>
</c:forEach>  <br><br>

간식
<c:forEach var="snack" items="${snack1}">
칼로리 : ${snack.kcal} 
탄수 : ${snack.carbon} 
단백질 : ${snack.protein} 
지방 : ${snack.fat}
<br>
</c:forEach>  <br><br>

</body>
</html>