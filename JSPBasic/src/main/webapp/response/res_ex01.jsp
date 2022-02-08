<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 나이를 입력받아 성인 여부를 확인하는 내용을 출력하는 예제 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성인 여부 판별하기</title>
</head>
<body>
	<h2>res_ex01</h2>
	<form action="res_ex01_chk.jsp">		
		<%--
		나이 : <input type="text" name="age">
		<input type="submit" value="확인">
		
		 --%>
		 
		 생년월일 : <input type="text" size = "5" name="year"> - 
		<input type="text" size = "5" name="month"> - 
		<input type="text" size = "5" name="days">
		<input type="submit" value="확인">
	</form>
</body>
</html>