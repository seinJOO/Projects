<%@page import="java.util.Arrays"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인증 정보를 생성, 전달하는 JSP
	// 자바 UUID 중복되지 않는 16bit 값을 생성
	UUID uuid = UUID.randomUUID();
	String struuid = uuid.toString();
	//System.out.println(struuid);
	
	String[] arr = struuid.split("-");
	
	session.setAttribute("auth", arr[1]);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인증 페이지</h2>
	<hr>
	<form action = "auto_ok.jsp" method = "post">
		<h3>인증문자 : <del><%=arr[1] %></del></h3>
		인증 문자를 입력하세요 : <input type="text" name="code">
		<input type="submit" value="인증"><br>
	</form>
</body>
</html>