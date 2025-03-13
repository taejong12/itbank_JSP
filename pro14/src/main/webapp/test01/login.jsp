<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
<body>
	<form action="result.jsp">
		아이디 : <input type="text"><br>
		암호 : <input type="password"><br>
		<input type="submit" value="로그인">
	</form>
	<a href="/pro14/test01/memberForm.jsp">회원가입하기</a>
	<a href="http://localhost:8080/pro14/test01/memberForm.jsp">회원가입하기</a>
	<a href="<%=request.getContextPath() %>/test01/memberForm.jsp">회원가입하기</a>
	<a href="${pageContext.request.contextPath }/test01/memberForm.jsp">회원가입하기</a>
</body>
</html>





