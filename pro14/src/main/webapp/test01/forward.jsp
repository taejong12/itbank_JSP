<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>

<%
	request.setCharacterEncoding("utf-8");
	request.setAttribute("address", "서울 종로구");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="member2.jsp"></jsp:forward>
</body>
</html>