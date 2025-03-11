<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	String address =
			(String)session.getAttribute("address");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두번째 JSP</title>
</head>
<body>
	이름은 <%=name %> 이고,<br>
	주소는 <%=address  %> 입니다.
</body>
</html>