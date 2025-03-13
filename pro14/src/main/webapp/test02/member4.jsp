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
<title>선택문 실습</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty null }">
			<h1>이름을 입력하세요.</h1>
		</c:when>
		<c:otherwise>
			<h1>
				${id }<br>
				${pwd }<br>
				${name }<br>
				${age }<br>
				${height }<br>
			</h1>
		</c:otherwise>
	</c:choose>	
</body>
</html>






