<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String imgName = request.getParameter("imgName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로고 이미지</title>
</head>
<body>
	<h1>사이트 이름 <%=name %></h1>
	<img src="./image/<%=imgName %>" >
</body>
</html>