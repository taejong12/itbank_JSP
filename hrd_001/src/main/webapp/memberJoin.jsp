<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="test.DAO" />

<%
	int custNo = dao.maxCustNo();

	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String format = sdf.format(today);
%>
<c:set var="custNo" value="<%=custNo %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="css/style.css">
<title></title>
<script>
	window.onload = function(){
		document.frm.custname.focus();
	}
	function fn_submit(){
		let frm = document.frm;
		
		let gradeArr = ["A", "B", "C"];
		let custname = frm.custname.value;
		let phone = frm.phone.value;
		let address = frm.address.value;
		let grade = frm.grade.value.toUpperCase();
		let city = frm.city.value;
		
		if(custname == "" || custname.length == 0) {
			alert("회원성명이 입력되지 않았습니다.");
			document.frm.custname.focus();
		} else if (phone == "" || phone.length == 0) {
			alert("회원전화가 입력되지 않았습니다.");
			document.frm.phone.focus();
		} else if (address == "" || address.length == 0) {
			alert("회원주소가 입력되지 않았습니다.");
			document.frm.address.focus();
		} else if (grade == "" || grade.length == 0) {
			alert("고객등급이 입력되지 않았습니다.");
			document.frm.grade.focus();
		} else if (gradeArr.indexOf(grade) == -1) {
			alert("사용할 수 없는 고객 등급입니다. 다시 입력하세요.");
			document.frm.grade.value = "";
			document.frm.grade.focus();
		} else if (city == "" || city.length == 0) {
			alert("도시코드가 입력되지 않았습니다.");
			document.frm.city.focus();
		} else if (!/^\d{1,2}$/.test(city)) {
		    alert("도시코드는 숫자만 입력 가능하며, 최대 2자리까지 입력할 수 있습니다.");
		    document.frm.city.focus();
		} else {
			alert("회원 가입이 완료 되었습니다.");
			frm.method="post";
			frm.action="memberSelect.jsp";
			frm.submit();
		}
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
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="${custNo}" readonly></td>
				<tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" value="<%=format %>" readonly></td>
				</tr>
				<tr>
					<th>고객등급(A:VIP,B:일반,C:직원)</th>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="fn_submit()" value="등록">
						<input type="button" onclick="aa()" value="조회">
					</td>
				</tr>					
			</table>
		</form>		
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>