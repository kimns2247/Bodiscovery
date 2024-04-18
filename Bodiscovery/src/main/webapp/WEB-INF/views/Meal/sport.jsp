<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>

<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">

<br>

	<form action="sportComplete" method="post" align="center">
		<input type="hidden" name="Id" value="${user.id}"/>
		<h3><strong>${user.id}님 하신 운동을 추가 해주세요 :)</strong></h3>
		<br>
		
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>운동명</td>
				<td>
					<input type="text" name="sport">
				</td>
			</tr>
			<tr>
				<td>운동시간(분)</td>
				<td>
					<input type = "text" name = "duration">
				</td>
			</tr>
			<tr>
				<td>소모 칼로리</td>
				<td>
					<input type="text" name="kcal">
				</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>
				<input type="text" name="day" id="day" >
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="btn btn-outline-dark mt-auto" type="submit" value="추가하기">
				<td>
			</tr>
		</table>
	</form>

<br>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function getCurrentDate() {
        var today = new Date();
        var year = today.getFullYear(); // 연도
        var month = today.getMonth() + 1; // 월
        var day = today.getDate(); // 일

        // 월과 일이 한 자리 수인 경우 앞에 0을 붙여 두 자리로 만듦
        month = (month < 10) ? '0' + month : month;
        day = (day < 10) ? '0' + day : day;

        // 현재 날짜를 YYYY-MM-DD 형식으로 반환
        return year + '-' + month + '-' + day;
    }

    $(document).ready(function() {
        // 현재 날짜를 가져와서 날짜 입력 필드에 넣음
        $('#day').val(getCurrentDate());
    });
</script>
 <%@ include file="../include/include-footer.jsp" %>
