<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% //out.println(), while, break,로 구구단 4단 출력하기
	int j = 2;
	while (true) {
		out.println(4 + " x " + j + " = " + 4*j + "<br>");
	%>
	-----------------------------------<br>	
	<%	
		j++;
		if (j > 9) break;
	}	
	%>
	
	<hr>
	1. 체크박스 20개를 for문을 이용하여 가로로 생성
	<br>
	<%
		for (int i = 0 ; i < 20 ; i++) {
	%> 
		<input type="checkbox" name="test">
	<%		
		}	
	%>
	
	
</body>
</html>