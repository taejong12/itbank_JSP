<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과창</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String msg = "아이디가 입력되지 않았습니다. 아이디를 입력하세요.";
		if (id.length() == 0) {
/* 			RequestDispatcher dis =
				request.getRequestDispatcher("login.jsp");
			dis.forward(request, response); */
	%>
		<jsp:forward page="login.jsp">
			<jsp:param value="<%=msg %>" name="msg"/>
		</jsp:forward>
	<%
		}
	%>
	<h1>환영합니다. <%=id %>님!!!</h1>
</body>
</html>