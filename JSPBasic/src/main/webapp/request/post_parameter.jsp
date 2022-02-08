<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터값 확인</title>
</head>
<body>
	전달받은 값<br>
	아이디 : <%=id %><br>
	비밀번호 : <%=pw %><br>
</body>
</html>