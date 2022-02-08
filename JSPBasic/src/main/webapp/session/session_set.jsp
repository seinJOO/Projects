<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		세션 : 쿠키와 마찬가지로 인증정보를 유지하기 위해서 사용하는 JSP 내장 객체
		설정은 setAttribute("이름","값") 으로 저장
		
	*/
	
	session.setAttribute("id", "kkk123");
	session.setAttribute("name", "세니");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션값 설정하기</title>
</head>
<body>
	<a href = "session_get.jsp">세션값 확인하기</a>
</body>
</html>