<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include1</title>
</head>
<body>
	<h1>구글 시작</h1>
	<hr>
	<jsp:include page="logo_image.jsp" flush="true">
		<jsp:param value="구글" name="name"/>
		<jsp:param value="google_logo.png" name="imgName" />
	</jsp:include>
	<hr>
	<h1>구글 끝</h1>
</body>
</html>