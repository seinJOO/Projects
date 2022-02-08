<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
		if (id == null) {
		response.sendRedirect("login.jsp");
		}
	String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<h2><%=name %>(<%=id %>)님 환영합니다!</h2>
	<a href="logout.jsp">로그아웃</a><br>
	<a href="modify_ok">회원 정보 수정</a><br>
	<a href="delete_ok">회원 탈퇴</a><br>
</body>
</html>