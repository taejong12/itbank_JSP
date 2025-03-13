<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="sec01.ex02.MemberDTO" />
<jsp:setProperty property="*" name="m" />
<jsp:useBean id="addr" class="sec01.ex02.Address" />
<jsp:setProperty property="city" name="addr" value="서울시" />
<jsp:setProperty property="zipcode" name="addr" value="12345" />
<%
	m.setAddr(addr);
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
			<td width="10%"><b>도시</b></td>
			<td width="10%"><b>우편번호</b></td>
		</tr>
		<tr>
			<td><%=m.getId() %></td>
			<td><%=m.getPwd() %></td>
			<td><%=m.getName() %></td>
			<td><%=m.getEmail() %></td>
			<td><%=m.getAddr().getCity() %></td>
			<td><%=m.getAddr().getZipcode() %></td>
		</tr>
		<%-- ${부모.자식.속성 } --%>
		<tr>
			<td>${m.id }</td>
			<td>${m.pwd }</td>
			<td>${m.name }</td>
			<td>${m.email }</td>
			<td>${m.addr.city }</td>
			<td>${m.addr.zipcode }</td>
		</tr>
	</table>
</body>
</html>







