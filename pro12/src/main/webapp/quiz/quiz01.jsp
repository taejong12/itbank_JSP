<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dan = request.getParameter("dan");
	int int_dan = Integer.parseInt(dan);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력</title>
</head>
<body>
	<%--
		gugudan.html 에서 출력할 단을 입력해서 보내면 
		quiz01.jsp 에서 출력
	 --%>
	 <h1><%=int_dan %> 단</h1>
	 <%
	 	for(int i=1;i<=9;i++){
	 %>
	 	<h3><%=int_dan %> * <%=i %> = <%=int_dan * i %></h3>
	 <%
	 	}
	 %>
</body>

</html>