<%@page import="hrd_002.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:useBean id="dao" class="hrd_002.DAO" />
<%
	List<Member> memberList = dao.memberList();
%>
<c:set var="memberList" value="<%=memberList %>" />
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="css/style.css">
<title></title>
</head>
<body>
	<%@ include file="layout/header.jsp" %>
	<%@ include file="layout/nav.jsp" %>
	<section>
		<h3>후보조회</h3>
		<table border="1">
			<tr align="center">
				<th width="5%">후보번호</th>
				<th width="7%">성명</th>
				<th width="7%">소속정당</th>
				<th width="5%">학력</th>
				<th width="15%">주민번호</th>
				<th width="15%">지역구</th>
				<th width="15%">대표전화</th>
			</tr>
			<c:forEach var="m" items="${memberList }">
			<tr align="center">
				<td>${m.m_no }</td>
				<td>${m.m_name }</td>
				<td>${m.p_name }</td>
				<td>${m.p_school }</td>
				<td>${m.m_jumin }</td>
				<td>${m.m_city }</td>
				<td>${m.tel }</td>
			</tr>
			</c:forEach>
		</table>
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>