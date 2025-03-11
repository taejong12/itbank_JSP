<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
	<%
		if(id == null || id.length() == 0) {
	%>
		<h1>아이디가 입력되지 않았습니다.</h1>
		<a href="login.html">로그인하기</a>
	<%
		} else {
	%>
		<h1>결과 출력</h1>
		<h3>아이디 : <%=id %></h3>
		<h3>암호 : <%=pwd %></h3>
	<%
		}
	%>
</body>
</html>





