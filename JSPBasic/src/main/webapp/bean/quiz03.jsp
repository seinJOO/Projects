<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bean.User" %>
<% 	request.setCharacterEncoding("utf-8"); 
	//User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align=center>
<%--
	<h2>자바코드</h2>
	<%=user.getId() %>(<%=user.getName() %>)님 회원 가입을 축하합니다.<br>
	비밀번호는 <%=user.getPw() %>입니다.
--%>
	<h2>액션태그</h2>
	<jsp:useBean id="join" class="com.bean.User" scope="request" />
	<jsp:getProperty name="join" property="id" />(<jsp:getProperty name="join" property="name" />)님 회원 가입을 축하합니다.<br>
	비밀번호는 	<jsp:getProperty name="join" property="pw" /> 입니다.<br>

	</div>
</body>
</html>