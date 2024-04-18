<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 
	웹프라우저 - was
	
		1)
		
		session 구성
			쿠키 > 세션 (서버에 저장 - 클라이언트 session id )
		예) 자동으로 4353445131 - 구두신상보러왔음
		
		세션의 디폴트값은 true ==> 웹페이지 입장시 세션이 자동으로 시작됨
		
		<%-- page session="false" --%>
		
		page session = "false" 의미는 지금 페이지 세션 만들지마
		true인 경우에는 세션이 만들어지고 브라우저 나가면 삭제 
		
		(적용) 로그인페이지로 접속 - session id와 로그인 정보가 was에 저장
		
		--------------------------------------------------------------------
		
		2) HttpSession
 -->


<!DOCTYPE html>
<html>
<head>
<title></title>
</head>      
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>
<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">
    
    
	<h1>관리자 페이지 - 가입한 유저 정보 열람</h1>
	<h1>뒤로가기 금지 처리 완료 + 유저 접근불가</h1>
	<table border="1">
	<thead>	
	
	<tr>
	<th>아이디</th>
	<th>비밀번호</th>	
	<th>이름</th>
	<th>주소</th>
	<th>키</th>
	<th>몸무게</th>
	<th>목표몸무게</th>
	<th>성별</th>
	<th>나이</th>
	<th>이메일</th>
	</tr>
	
	</thead>
	<tbody>
		<c:forEach var="user" items="${alist}">
		<tr>
			<td>${user.id}</td>
			<td>${user.pw}</td>
			<td><a href="getUserinfo.do?name=${user.name}">${user.name}</a></td>
			<td>${user.address}</td>
			<td>${user.ki}</td>
			<td>${user.weight}</td>
			<td>${user.goal}</td>
			<td>${user.sex}</td>
			<td>${user.age}</td>
			<td>${user.email}</td>
		</tr>
		</c:forEach>

	</tbody>
	</table>
	<div>
	<a href="Naverlogin">[로그인]</a>
	<a href="main.do">[메인화면]</a>
	<a href="userInsert.do">[회원가입]</a>
	</div>
	
	
	<div>
			
				
		<br>

	</div>

</body>
</html>
