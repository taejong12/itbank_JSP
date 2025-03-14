<%@page import="hrd_002.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:useBean id="dao" class="hrd_002.DAO" />
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="css/style.css">
<title></title>
<script>
	function fn_submit(){
		let frm = document.frm;
		
		let v_jumin = frm.v_jumin.value;
		let v_name = frm.v_name.value;
		let m_no = frm.m_no.value;
		let v_time = frm.v_time.value;
		let v_area = frm.v_area.value;
		let v_confirm = frm.v_confirm.value;
		
		if (v_jumin == "" || v_jumin.length == 0){
			alert("주민번호가 입력되지 않았습니다.")
			document.frm.v_jumin.focus();
		} else if (v_name == "" || v_name.length == 0){
			alert("성명이 입력되지 않았습니다.");
			document.frm.v_name.focus();
		} else if (m_no == "" || m_no.length == 0){
			alert("후보번호가 선택되지 않았습니다.");
			document.frm.m_no.focus();
		} else if (v_time == "" || v_time.length == 0){
			alert("투표시간이 입력되지 않았습니다.");
			document.frm.v_time.focus();
		} else if (v_area == "" || v_area.length == 0){
			alert("투표장소이 입력되지 않았습니다.");
			document.frm.v_area.focus();
		} else if (v_confirm == "" || v_confirm.length == 0){
			alert("유권자확인이 선택되지 않았습니다.");
			document.frm.v_confirm.focus();
		} else {
			alert("투표하기 정보가 정상적으로 등록 되었습니다.");
			
			frm.method="post";
			frm.action="voteCheck.jsp?check=y";
			frm.submit();
		}
	}
	
	function fn_clear(){
		
		
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		let frm = document.frm;
		
		frm.v_jumin.value = "";
		frm.v_name.value = "";
		frm.m_no.value = "";
		frm.v_time.value = "";
		frm.v_area.value = "";
		frm.v_confirm.value = "";
		
		frm.v_jumin.focus();
			
	}
</script>
</head>
<body>
	<%@ include file="layout/header.jsp" %>
	<%@ include file="layout/nav.jsp" %>
	<section>
		<h3>투표하기</h3>
		<form name="frm">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th width="200px" align="center">주민번호</th>
				<td width="500px"><input type="text" name="v_jumin"> 예 : 8906153154726</td>
			</tr>
			<tr>
				<th  align="center">성명</th>
				<td><input type="text" name="v_name"></td>
			</tr>
			<tr>
				<th  align="center">투표번호</th>
				<td>
					<select name="m_no">
						<option value="1">[1] 김후보</option>
						<option value="2">[2] 이후보</option>
						<option value="3">[3] 박후보</option>
						<option value="4">[4] 조후보</option>
						<option value="5">[5] 최후보</option>
					</select>
				</td>
			</tr>
			<tr>
				<th  align="center">투표시간</th>
				<td><input type="text" name="v_time"></td>
			</tr>
			<tr>
				<th  align="center">투표장소</th>
				<td><input type="text" name="v_area"></td>
			</tr>
			<tr>
				<th  align="center">유권자확인</th>
				<td>
					<input type="radio" name="v_confirm" value="Y">확인
					<input type="radio" name="v_confirm" value="N">미확인
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" onclick="fn_submit()" value="투표하기">
					<input type="button" onclick="fn_clear()" value="다시하기">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<%@ include file="layout/footer.jsp" %>
</body>
</html>