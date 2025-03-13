<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)request.getAttribute("id");
	String pwd = (String)request.getAttribute("pwd");
	String name = (String)session.getAttribute("name");
	String email = (String)application.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99CCFF">
			<td width="10%"><b>아이디</b></td>
			<td width="10%"><b>암호</b></td>
			<td width="10%"><b>이름</b></td>
			<td width="10%"><b>이메일</b></td>
		</tr>
		<tr>
			<td><%=id %></td>
			<td><%=pwd %></td>
			<td><%=name %></td>
			<td><%=email %></td>
		</tr>
		<%-- 바인딩 된 값을 바로 출력 가능 --%>
		<tr>
			<td>${id }</td>
			<td>${pwd }</td>
			<td>${name }</td>
			<td>${email }</td>
		</tr>
	</table>
</body>
</html>







