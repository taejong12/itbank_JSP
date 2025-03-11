<%@page import="java.util.List"%>
<%@page import="sec01.ex01.MemberDAO"%>
<%@page import="sec01.ex01.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="member" 
		class="sec01.ex01.MemberDTO" />
	<jsp:useBean id="dao"
		class="sec01.ex01.MemberDAO" />
<%
	member.setId(request.getParameter("id"));
	member.setPwd(request.getParameter("pwd"));
	member.setName(request.getParameter("name"));
	member.setEmail(request.getParameter("email"));
	
	dao.addMember(member);
	
	List<MemberDTO> memberList =
			dao.listMembers(null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<table align="center" width="100%">
		<tr align="center" bgcolor="#99CCFF">
			<td width="10%">아이디</td>
			<td width="10%">암호</td>
			<td width="10%">이름</td>
			<td width="10%">이메일</td>
			<td width="10%">가입일자</td>
		</tr>
		<%
		if(memberList.size() == 0) {
		%>
		<tr>
			<td colspan="5">
				<b>등록된 회원이 없습니다.</b>
			</td>
		</tr>
		<%
		} else {
			for(MemberDTO m : memberList) {
		%>
			<tr>
				<td><%=m.getId() %></td>
				<td><%=m.getPwd() %></td>
				<td><%=m.getName() %></td>
				<td><%=m.getEmail() %></td>
				<td><%=m.getJoinDate() %></td>
			</tr>
		<%
			}
		}
		%>
	</table>
</body>
</html>