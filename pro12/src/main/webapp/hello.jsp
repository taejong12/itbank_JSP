<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// <%! 으로 시작 하면 : 선언문
	// 변수 또는 메서드 선언이 가능하다
	String name = "홍길동";
	public String getName() {
		return name;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문</title>
</head>
<body>
	<%-- <%= 로 시작하면 값 또는 메서드의 결과값을 출력 --%>
	<h1>안녕하세요. <%=name %></h1>
	<h1>안녕하세요. <%=getName() %></h1>
</body>
</html>