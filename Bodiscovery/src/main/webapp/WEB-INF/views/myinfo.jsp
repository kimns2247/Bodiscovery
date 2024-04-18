<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>"${user.name}"님의 마이페이지입니다.</h1>
<h3>위 페이지에서는 정보수정이 불가합니다 </h3>
<h3>정보수정을 원하시면 정보수정 버튼을 통해 정보수정이 가능합니다.</h3>


<table border="1">
	<tr><td>아이디</td><td>이름</td><td>비밀번호</td><td>생년월일</td><td>성별</td><td>이메일</td><td>주소</td>
	<tr>
		<td><input type="text" value="${user.id}" readonly name="id"></td>
		<td><input type="text" value="${user.name}"  readonly name="name"></td>
		<td><input type="text" value="${user.password}" readonly name="password"></td>
		<td><input type="text" value="${user.birth}" readonly name="birth"></td>
		<td><input type="text" value="${user.gender}" readonly name="gender"></td>
		<td><input type="text" value="${user.email}" readonly name="email"></td>
		<td><input type="text" value="${user.address1}" readonly name="address1"></td>
		<td><input type="text" value="${user.address2}" readonly name="address2"></td>
		<td><input type="text" value="${user.address3}" readonly name="address3"></td>
		<td><input type="text" value="${user.address4}" readonly name="address4"></td>		
		<input type="hidden" value="${user.name}" name="sname">		
	</tr>
	
</table>
<a href="main.jsp">뒤로가기</a>
<a href="Nagari.jsp">회원탈퇴</a>

</form><br>

	
	
</body>
</html>