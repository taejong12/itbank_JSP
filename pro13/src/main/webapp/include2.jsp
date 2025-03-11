<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include2</title>
</head>
<body>
<%-- 
	네이버 이미지를 image 폴더 넣고 include1 처럼 출력
	사이트 이름 네이버 
	네이버 로고 출력 
--%>
	<h1>네이버 시작</h1>
	<hr>
	<jsp:include page="logo_image.jsp">
		<jsp:param value="네이버" name="name" />
		<jsp:param value="naver_logo.png" name="imgName"/>
	</jsp:include>
	<hr>
	<h1>네이버 끝</h1>
	
</body>
</html>