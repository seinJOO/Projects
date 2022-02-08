<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	UserVO vo = new UserVO();
	String id = (String)session.getAttribute("id");
	if (id == null) {
		response.sendRedirect("user_login.jsp");
	} else {
		UserDAO dao = UserDAO.getInstance();
		vo = dao.getUserInfo(id);
	}	
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
<div class="brand">My Page</div>        
<div class="address-bar"><%=vo.getName() %>님의 페이지</div>
<%@ include file="/include/_header.jsp" %>
<section>
	<div align="center">
		<h2>MY INFO</h2>
		<hr>
		<%=vo.getName() %>(<%= id %>)님 환영합니다!
		<hr>
		<input type="button" value="비밀번호 변경" class="btn btn-info" onclick="location.href='user_change_pw.jsp'">
		<input type="button" value="회원정보 변경" class="btn btn-primary" onclick="location.href='user_update.jsp'">
		<input type="button" value="회원탈퇴" class="btn btn-default" onclick="location.href='user_delete_check.jsp'">
	</div>
</section>	
</body>
</html>
<%@ include file="/include/_footer.jsp" %>