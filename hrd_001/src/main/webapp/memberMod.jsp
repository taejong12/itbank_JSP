<%@page import="test.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="test.DAO" />
<%
	request.setCharacterEncoding("utf-8");	
	int custno = 
		Integer.parseInt(request.getParameter("custno"));
	MemberDTO m = dao.select(custno);
%>
<c:set var="m" value="<%=m %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="css/style.css">
<title></title>
<script>
	function fn_submit(){
		let frm = document.frm;
		
		alert("회원정보수정이 완료되었습니다.");
		frm.method = "post";
		frm.action = "memberSelect.jsp?mod=mod";
		frm.submit();
	}
	function aa(){
		window.location.href="/hrd_001/memberSelect.jsp";
	}
</script>
</head>
<body>
	<%@ include file="layout/header.jsp" %>
	<%@ include file="layout/nav.jsp" %>
	<section>
		<h3>홈쇼핑 회원 등록</h3>
		<form name="frm">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custno" value="${m.custno}" readonly></td>
				<tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="${m.custname }"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="${m.phone }"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="${m.address }"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" value="${m.joindate }" readonly></td>
				</tr>
				<tr>
					<th>고객등급(A:VIP,B:일반,C:직원)</th>
					<td><input type="text" name="grade" value="${m.grade }"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="${m.city }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="fn_submit()" value="수정">
						<input type="button" onclick="aa()" value="조회">
					</td>
				</tr>					
			</table>
		</form>		
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>