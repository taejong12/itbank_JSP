<%@page import="hrd_002.VoteOutput"%>
<%@page import="hrd_002.Vote"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<jsp:useBean id="dao" class="hrd_002.DAO" />
<jsp:useBean id="v" class="hrd_002.Vote" />
<jsp:setProperty name="v" property="*" />
<%
	String check = request.getParameter("check");
	
	List<VoteOutput> voteList = null;
	if(check != null){
		dao.insertVote(v);
		voteList = dao.select(v.getV_jumin());
	} else {
		voteList = dao.select();
	}
%>
<c:set var="voteList" value="<%=voteList %>" />
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
		<h3>투표검수조회</h3>
		<table border="1" style="border-collapse: collapse;">
			<tr align="center">
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<c:forEach var="v" items="${voteList }">
			<tr>
				<td>${v.v_name }</td>
				<td>${v.birth }</td>
				<td>${v.age }</td>
				<td>${v.gender }</td>
				<td>${v.m_no }</td>
				<td>${v.v_time }</td>
				<td>${v.v_confirm }</td>
			</tr>
			</c:forEach>
		</table>
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>