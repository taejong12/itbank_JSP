<%@page import="test.SaleDTO"%>
<%@page import="test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="test.DAO" />
<%
	List<SaleDTO> saleList = dao.saleList();
%>
<c:set var="saleList" value="<%=saleList %>" />
<!DOCTYPE html>
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
		<h3>회원매출조회</h3>
		<table border="1">
			<tr>
				<th width="7%">회원번호</th>
				<th width="7%">회원성명</th>
				<th width="10%">고객등급</th>
				<th width="7%">매출</th>
			</tr>	
			<c:forEach var="s" items="${saleList }">
				<tr align="center">
					<td>${s.custno }</td>
					<td>${s.custname }</td>
					<td>${s.grade }</td>
					<td>${s.price }</td>
				</tr>
			</c:forEach>			
		</table>
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>