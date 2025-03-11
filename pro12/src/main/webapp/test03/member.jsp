<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	import="java.util.*"
	import="sec02.ex01.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> memberList = dao.listMembers(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	h1 {
		text-align: center;
	}
</style>
<title>회원정보출력창</title>
</head>
<body>
	<h1>회원정보출력</h1>
	<table border="1" width="800" align="center">
		<tr align="center" bgcolor="#ffff66">
			<td>아이디</td>
			<td>암호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>가입일자</td>
		</tr>
		<% for(MemberDTO m : memberList)  { %>
		<tr align="center">
			<td><%=m.getId() %></td>
			<td><%=m.getPwd() %></td>
			<td><%=m.getName() %></td>
			<td><%=m.getEmail() %></td>
			<td><%=m.getJoinDate() %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>





