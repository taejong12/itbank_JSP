<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String name = "이순신";
	public String getName (){
		return name;
	}
%>
<%
	// 스트립트릿 은 자바 코드를 사용할 수 있다.
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿 연습</title>
</head>
<body>
	<%-- 마지막에 ; 을 사용하면 에러 발생 한다. --%>
	<h1>이름 : <%=name %></h1>
	<h1>나이 : <%=age %></h1>
	<h1>키 : <%=180 %></h1>
	<h1>10년 후 : <%=Integer.parseInt(age) + 10 %></h1>
</body>





</html>