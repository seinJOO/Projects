<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UUID uuid = UUID.randomUUID();
	String uid = uuid.toString();
	String[] uu = uid.split("-");
	session.setAttribute("auth", uu[1]);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘서트 예약 - 보안인증</title>
<style type="text/css">
	.auth {
		color : red;
		font-size : 30px;
		font-style: italic;
		text-decoration:line-through;
		border : 1px solid black;
		font-weight: bold;
		text-align : center;
	}
	.wrap {
		text-align : center;
	}
	form {
		margin : auto;
		width : 200px;
	}
</style>
</head>
<body>
	<div class=wrap>
	<h3>인증 페이지</h3>
	<hr>
	<form action="auth2_ok.jsp" method="post">
	<p class="auth"><%=uu[1] %></p>
	<input type="text" size="8" name="code"> <input type="submit" value="확인">	
	</form>
	</div>
	
</body>
</html>