<%@page import="sec01.ex01.MemberDTO, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m1" class="sec01.ex01.MemberDTO" />
<jsp:setProperty name="m1" property="*" />
<jsp:useBean id="memberList" class="java.util.ArrayList" />
<jsp:useBean id="memberMap" class="java.util.HashMap" />
<%
	MemberDTO m2 = new MemberDTO();
	m2.setId("lee");
	m2.setPwd("1234");
	m2.setName("이순신");
	m2.setEmail("lee@test.com");
	memberList.add(m1);
	memberList.add(m2);
	
	memberMap.put("id", "hong");
	memberMap.put("pwd", "1234");
	memberMap.put("name", "홍길동");
	memberMap.put("email", "hong@test.com");
	memberMap.put("memberList", memberList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99CCFF">
			<td width="10%"><b>아이디</b></td>
			<td width="10%"><b>암호</b></td>
			<td width="10%"><b>이름</b></td>
			<td width="10%"><b>이메일</b></td>
		</tr>
		<%-- ${Map.key} --%>
		<tr>
			<td>${memberMap.id }</td>
			<td>${memberMap.pwd }</td>
			<td>${memberMap.name }</td>
			<td>${memberMap.email }</td>
		</tr>
		<%-- ${Map.List[index].속성}  --%>
		<tr>
			<td>${memberMap.memberList[0].id }</td>
			<td>${memberMap.memberList[0].pwd }</td>
			<td>${memberMap.memberList[0].name }</td>
			<td>${memberMap.memberList[0].email }</td>
		</tr>
		<tr>
			<td>${memberMap.memberList[1].id }</td>
			<td>${memberMap.memberList[1].pwd }</td>
			<td>${memberMap.memberList[1].name }</td>
			<td>${memberMap.memberList[1].email }</td>
		</tr>
	</table>
</body>
</html>







