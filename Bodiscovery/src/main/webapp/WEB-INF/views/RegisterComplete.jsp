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
   <h1> 관리자 페이지 - 회원 목록 관리 </h1> <hr>
   <table border="1">
      <tr>
         <td> 아이디 </td>
         <td> 비밀번호 </td>
         <td> 이름 </td>
         <td> 주소 </td>
         <td> 키 </td>
         <td> 몸무게 </td>
         <td> 목표몸무게 </td>
         <td> 성별 </td>
         <td> 나이 </td>
         <td> 이메일 </td>
      </tr>
      <!-- 아래 c: 이 적용되려면 web 에서는 web-inf 아래 lib 폴어데 standard.jar, jstl.jar spring에서는 pom.xml에 있어야함 -->
      <!-- java의 for : 같은것 --> <!-- model1.add .....("mAllTelinfo", -->
      <c:forEach var="user" items="${user}">
      <tr>
         <td>${user.id}</td>
         <td><a href="getUserinfo.do?name=${user.name}">${user.name}</a>
         <!--  url?name='hong'      <input type="text"   name="name">
            여기서 a태그 클릭하면 getTelinfo.do 위치(controller) - service - dao - db 를 찾아가서 한명을 꺼냄 -->
         <td>${user.pw}</td>
         <td>${user.name}</td>
         <td>${user.address}</td>
         <td>${user.ki}</td>
         <td>${user.weight}</td>
         <td>${user.goal}</td>
         <td>${user.sex}</td>
         <td>${user.age}</td>
         <td>${user.email}</td>
         
      </tr>
      </c:forEach>
   </table>
   <table border=0>
      <tr>
     	 <td><a class="nav-link" href="Naverlogin">로그인 하러가기</a></td>
         <td><a href="userInsert.do">회원가입</a></td>
   		 <td><a href="main.do">[메인으로가기]</a></td>
      </tr>
   </table>
</body>
</html>
   <!--  항상 spring legacy - spring MVC 작업은 입력 - 컨트롤러로 다시 - view 로 그래서 입력은 index.jsp 와 같은 위치에 작성할 예정
         but, 원래  -->