<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산술 연산자</title>
</head>
<body>
	<h1>
		\${10 + 10 } : ${10 + 10 }<br>
		\${20 - 10 } : ${20 - 10 }<br>
		\${10 * 10 } : ${10 * 10 }<br>
		<%-- / 와 div 는 소수점 자리까지 출력 --%>
		\${100 / 9 } : ${100 / 9 }<br>
		\${100 div 9 } : ${100 div 9 }<br>
		\${100 % 9 } : ${100 % 9 }<br>
		\${100 mod 9 } : ${100 mod 9 }<br>
	</h1>
</body>
</html>










