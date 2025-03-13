<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비교 연산자</title>
</head>
<body>
	<h1>
		\${10 == 10 } : ${10 == 10 }<br>
		\${10 eq 10 } : ${10 eq 10 }<br>
		\${"hello" == "hello" } : ${"hello" == "hello" }<br>
		\${"hello" eq "hello" } : ${"hello" eq "hello" }<br>
		\${20 != 10 } : ${20 != 10 }<br>
		\${20 ne 10 } : ${20 ne 10 }<br>
		\${"hello" != "hi" } : ${"hello" != "hi" }<br>
		\${"hello" ne "hi" } : ${"hello" ne "hi" }<br>
		\${10 < 10 } : ${10 < 10 }<br>
		\${10 lt 10 } : ${10 lt 10 }<br>
		\${100 > 10 } : ${100 > 10 }<br>
		\${100 gt 10 } : ${100 gt 10 }<br>
		\${100 <= 10 } : ${100 <= 10 }<br>
		\${100 le 10 } : ${100 le 10 }<br>
		\${100 >= 10 } : ${100 >= 10 }<br>
		\${100 ge 10 } : ${100 ge 10 }<br>
		
	</h1>
</body>
</html>