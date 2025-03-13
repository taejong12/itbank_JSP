<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 실습</title>
</head>
<body>
	<c:set var="data" value="JSP" />
	<h1>
		<c:out value="${data }" />
		<br>
		${data }
	</h1>
	<h2>
		<pre>
			<c:out value="&lt;" escapeXml="true" />
			<c:out value="&lt;" escapeXml="false" />
			<c:out value="&gt;" escapeXml="true" />
			<c:out value="&gt;" escapeXml="false" />
			<c:out value="&amp;" escapeXml="true" />
			<c:out value="&amp;" escapeXml="false" />
		</pre>
	</h2>
</body>
</html>







