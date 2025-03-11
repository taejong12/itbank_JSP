<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
<body>
<%
	String msg = request.getParameter("msg");
	if(msg != null) {
%>
	<h1><%=msg %></h1>
<%
	}
%>
	<form action="result.jsp">
		아이디 : <input type="text" name="id"><br>
		암호 : <input type="password" name="pwd"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>



