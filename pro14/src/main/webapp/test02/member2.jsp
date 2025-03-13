<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="id" value="hong" />
<c:set var="pwd" value="1234" />
<c:set var="name" value="홍길동" />
<c:set var="email" value="hong@test.com" />
<c:remove var="name" />
<c:remove var="email" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		${id }<br>
		${pwd }<br>
		${name }<br>
		${email }<br>
	</h1>
</body>
</html>

