<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "이순신");
	request.setAttribute("address", "서울 강남구");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<h1>request 에 바딩인 했습니다.</h1>
	<a href='request2.jsp'>두번째 페이지로 이동</a> -->
	<%
		RequestDispatcher dis = 
			request.getRequestDispatcher("request2.jsp");
		dis.forward(request, response);
	%>
</body>
</html>