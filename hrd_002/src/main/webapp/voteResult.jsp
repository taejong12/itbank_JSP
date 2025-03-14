<%@page import="hrd_002.VoteResult"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<jsp:useBean id="dao" class="hrd_002.DAO" />
<%
	List<VoteResult> voteResult = dao.voteResult();
%>
<c:set var="voteResult" value="<%=voteResult %>" />
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="css/style.css">
<title></title>
<script>
</script>
</head>
<body>
	<%@ include file="layout/header.jsp" %>
	<%@ include file="layout/nav.jsp" %>
	<section>
		<h3>후보자등수</h3>
		<table border="1" style="border-collapse: collapse;">
			<tr align="center">
				<td>후보번호</td>
				<td>성명</td>
				<td>총투표건수</td>
			</tr>
			<c:forEach var="v" items="${voteResult }">
			<tr>
				<td>${v.m_no }</td>
				<td>${v.m_name }</td>
				<td>${v.votecnt }</td>
			</tr>
			</c:forEach>
		</table>
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>