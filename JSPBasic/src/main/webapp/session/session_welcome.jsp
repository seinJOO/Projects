<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 세션 정보가 없다면 로그인페이지로 이동
	if (session.getAttribute("user_id") == null) {
		response.sendRedirect("session_login.jsp");
	}
	
	String id = (String) session.getAttribute("user_id");
	String nick = (String) session.getAttribute("user_name");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 로그인 확인</title>
</head>
<body>
	<h2><%=id %>(<%=nick %>)님 환영합니다.</h2><br>
	<a href="session_logout.jsp">로그아웃</a>
	
</body>
</html>