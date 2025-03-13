<%@page import="sec01.ex01.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>

<%
	request.setCharacterEncoding("utf-8");
	MemberDTO member = new MemberDTO();
	member.setId("hong");
	member.setPwd("1234");
	member.setName("홍길동");
	member.setEmail("hong@test.com");
	
	request.setAttribute("member", member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="member8.jsp"></jsp:forward>
</body>
</html>