<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="hong" />
<c:set var="pwd" value="1234" />
<c:set var="name" value="홍길동" />
<c:set var="age" value="22" />
<c:set var="height" value="177" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문 실습</title>
</head>
<body>
	<c:if test="${true }">
		<h1>참 입니다.</h1>
	</c:if>
	
	<c:if test="${11 == 11 }">
		<h1>두 값은 같습니다.</h1>
	</c:if>
	
	<c:if test="${id == 'hong' }">
		<h1>아이디는 hong 입니다.</h1>
	</c:if>
	
	<c:if test="${age == 22 }">
		<h1>나이는 22 입니다.</h1>
	</c:if>
	
	<c:if test="${(id == 'hong') && (pwd == '1234') }">
		<h1>아이디는 ${id }이고 암호는 ${pwd } 입니다.</h1>
	</c:if>
	
	<c:if test="${height > 160 }">
		<h1>키는 160cm 이상입니다.</h1>
	</c:if>
	
</body>
</html>






