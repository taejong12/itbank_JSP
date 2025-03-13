<%@page import="java.util.ArrayList"%>
<%@page import="sec01.ex01.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<MemberDTO> list = new ArrayList<MemberDTO>();
	MemberDTO m1 = new MemberDTO();
	MemberDTO m2 = new MemberDTO();
	MemberDTO m3 = new MemberDTO();
	
	m1.setId("hong");
	m1.setPwd("1234");
	m1.setName("홍길동");
	m1.setEmail("hong@test.com");
	m2.setId("lee");
	m2.setPwd("1234");
	m2.setName("이순신");
	m2.setEmail("lee@test.com");
	m3.setId("kim");
	m3.setPwd("1234");
	m3.setName("김유신");
	m3.setEmail("kim@test.com");
	
	list.add(m1);
	list.add(m2);
	list.add(m3);
%>
<c:set var="list" value="<%=list %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99CCFF">
			<td width="10%"><b>아이디</b></td>
			<td width="10%"><b>암호</b></td>
			<td width="10%"><b>이름</b></td>
			<td width="10%"><b>이메일</b></td>
		</tr>
		<%-- 
			for(int i=0;i<list.size();i++){
				memberList.get(i).getId();
			}
		 --%>
		<c:forEach var="i" begin="0" 
			end="${list.size() -1 }" step="1">
			<tr>
			<td>${list[i].id }</td>
			<td>${list[i].pwd }</td>
			<td>${list[i].name }</td>
			<td>${list[i].email }</td>
			</tr>
		</c:forEach>
		<%--
			for(MemberDTO member : list){
				member.getId()
			}
		 --%>
		<c:forEach var="m" items="${list }">
			<tr>
			<td>${m.id }</td>
			<td>${m.pwd }</td>
			<td>${m.name }</td>
			<td>${m.email }</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>