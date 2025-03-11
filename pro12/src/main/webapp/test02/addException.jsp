<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isErrorPage="true"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<h3>
		숫자만 입력 가능합니다. 다시 시도하세요.<br>
		<a href='add.html'>다시 하기</a>
	</h3>
	<%= exception.toString() %><br>
	<%= exception.getMessage() %><br>
	<% exception.printStackTrace(); %>
</body>
</html>