<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	login.html 생성 한 후 
	아이디 패스워드가 전송 되면 '000님 환영합니다.' 출력
	아이디나 패스워드가 전송 되지 않으면 
	'아이디 및 암호를 입력하세요.' 출력
	로그인창으로 이동하는 a 태그 생성
 --%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제1</title>
</head>
<body>
	<c:if test="${(empty param.id) || 
					(empty param.pwd) }">
		<h1>아이디나 암호를 입력하세요.</h1>
		<a href="login.html">로그인 하기</a>
	</c:if>
	<c:if test="${(not empty param.id) &&
					(not empty param.pwd) }">
		<h1>${param.id }님 환영 합니다.</h1>
	</c:if>
</body>
</html>