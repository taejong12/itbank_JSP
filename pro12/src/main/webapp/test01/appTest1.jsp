<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("name", "홍길동");
	application.setAttribute("address", "서울 종로구");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application1</title>
</head>
<body>
	<h1>이름과 주소를 바인딩했습니다.</h1>
	<a href='appTest2.jsp'>두번째 페이지</a>
</body>
</html>