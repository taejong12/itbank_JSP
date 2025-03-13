<%@page import="test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="test.DAO" />
<jsp:useBean id="m" class="test.MemberDTO" />
<jsp:setProperty name="m" property="*" />
<%
	String mod = request.getParameter("mod");
	
	if(mod != null) {
		dao.updateMember(m);
	} else if(m.getCustname() != null) {
		int result = dao.insertMember(m);
	}
	
	List<MemberDTO> memberList = dao.listMembers();
%>
<c:set var="memberList" value="<%=memberList %>" />
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
		<h3>회원목록조회/수정</h3>
		<table border="1">
			<tr>
				<th width="7%">회원번호</th>
				<th width="7%">회원성명</th>
				<th width="10%">전화번호</th>
				<th width="15%">주소</th>
				<th width="7%">가입일자</th>
				<th width="7%">고객등급</th>
				<th width="7%">거주지역</th>
			</tr>	
			<c:if test="${empty memberList  }">
				<tr>
					<td colspan="7">
						<h1>데이터가 없습니다.</h1>
					</td>
				</tr>
			</c:if>	
			<c:if test="${not empty memberList }">
				<c:forEach var="m" items="${memberList }"> 
					<tr align="center">
						<td>
							<a href="memberMod.jsp?custno=${m.custno }">
								${m.custno }
							</a>
						</td>
						<td>${m.custname }</td>
						<td>${m.phone }</td>
						<td>${m.address }</td>
						<td>${m.joindate }</td>
						<c:choose>
							<c:when test='${m.grade == "A" }'>
								<td>VIP</td>		
							</c:when>
							<c:when test='${m.grade == "B" }'>
								<td>일반</td>
							</c:when>
							<c:otherwise>
								<td>직원</td>
							</c:otherwise>
						</c:choose>
						<td>${m.city }</td>
					</tr>
				</c:forEach>
			</c:if>			
		</table>
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>