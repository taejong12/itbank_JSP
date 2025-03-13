<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<jsp:useBean id="m1" class="sec01.ex01.MemberDTO" />
<jsp:setProperty name="m1" property="id" value="hong" />
<jsp:useBean id="m2" class="sec01.ex01.MemberDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empty 연산자</title>
</head>
<body>
	\${empty m1 } : ${empty m1 }<br>
	\${not empty m1 } : ${not empty m1 }<br>
	\${empty m2 } : ${empty m2 }<br>
	\${not empty m2 } : ${not empty m2 }<br>
	\${empty "hello" } : ${empty "hello" }<br>
	\${empty null } : ${empty null }<br>
	\${empty "" } : ${empty "" }<br>
</body>
</html>




