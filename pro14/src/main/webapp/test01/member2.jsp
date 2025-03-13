<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<%
	request.setCharacterEncoding("utf-8");
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
			<td width="10%"><b>주소</b></td>
		</tr>
		<%-- requestScope : request 와 동일 --%>
		<tr>
			<td>${param.id }</td>
			<td>${param.pwd }</td>
			<td>${param.name }</td>
			<td>${param.email }</td>
			<td>${requestScope.address }</td>
		</tr>
	</table>
</body>
</html>







