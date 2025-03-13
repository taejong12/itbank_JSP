<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<String> list = new ArrayList<String>();
	list.add("hello");
	list.add("hi");
	list.add("bye");
%>
<c:set var="fruits" value="사과,파인애플,복숭아,바나나,망고" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문 실습</title>
</head>
<body>
	<%-- var는 변수
		begin 숫자 부터 end 숫자까지 step 간격만큼 반복 
		varStatus : index, count, first, last
		index 는 items가 있을 때 인덱스 번호
		count 는 반복 횟수 1부터 시작
		first 는 첫번째 일때 true
		last 는 마지막 일때 true	
	--%>
	<c:forEach var="i" begin="1" end="10" step="1"
		varStatus="loop" >
		i = ${i } &nbsp;&nbsp;&nbsp; ${loop.last }<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		5 * ${i } = ${5 * i }<br>
	</c:forEach>
		
	<%-- for(String data: list){} --%>
	<c:forEach var="data" items="<%=list %>">
		${data }<br>
	</c:forEach>
	
	<c:set var="dataList" value="<%=list %>" />
	<c:forEach var="data" items="${dataList }">
		${data }<br>
	</c:forEach>
	
	<c:forTokens var="token" items="${fruits }" delims=",">
		${token }<br>
	</c:forTokens>
</body>
</html>




