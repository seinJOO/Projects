<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("id", "senny");
	UserVO vo = new UserVO();
	vo.setEmail("sen@test.com");
	session.setAttribute("vo", vo);
	application.setAttribute("admin", "배고팡");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="el_session_ok.jsp">세션값 확인</a>
</body>
</html>