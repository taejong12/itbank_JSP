<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="url1" value="/test01/member1.jsp">
	<c:param name="id" value="hong" />
	<c:param name="pwd" value="1234" />
	<c:param name="name" value="홍길동" />
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>url 실습</title>
</head>
<body>
	<a href="/pro14/test01/member1.jsp?id=hong&pwd=1234&name=홍길동">회원정보출력</a>
	<br><br>
	<a href="${url1 }">회원정보보기</a>
</body>
</html>