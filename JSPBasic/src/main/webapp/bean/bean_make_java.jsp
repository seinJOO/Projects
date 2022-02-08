<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자바코드를 이용해서 bean을 사용</h2>
	<%@ page import="com.bean.User" %><%--user 클래스 import --%> 
	<%
		User user = new User();
		user.setId("zzz123");
		user.setName("주세니");
		
		// 자바 코드로 다음 페이지로 값을 전달하는 경우 강제로 request 객체에 데이터 저장
		request.setAttribute("user", user);
		
		// forward 할 경로 지정 (편의를 위한 객체 생성~ 안해두됨)
		RequestDispatcher dp = request.getRequestDispatcher("bean_use_java.jsp");
		dp.forward(request, response);		

		%>


</body>
</html>