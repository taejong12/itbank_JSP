<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어</title>
</head>
<body>
	<h1>표현언어로 여러 가지 데이터 출력</h1>
	<h1>
		\${100 }: ${100 }<br>
		\${"안녕하세요" } : ${"안녕하세요" }<br>
		\${10+1 } : ${10+1 }<br>
		\${"10" + 1 } : ${"10" +1 }<br> 
		\${null + 10 } : ${null + 10 }<br>
		<%--
			숫자문자열이 아닌 일반 문자열과 정수 연산은 서버에러발생
			\${"안녕" + 10 } : ${"안녕" + 10 }<br>
		 --%>
		 <%--
		 	문자열과 문자열 연산을 서버에러 발생
		 	\${"hello" + "안녕하세요" } : ${"hello" + "안녕하세요" }<br>
		  --%>
		 
	</h1>
</body>
</html>









