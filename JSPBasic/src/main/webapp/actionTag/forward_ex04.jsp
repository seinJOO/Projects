<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); 
	String id = (String) request.getParameter("id");
	String name = (String) request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward로 끌어올 페이지</title>
</head>
<body>
	<!-- request에 setAttribute를 하지 않아 null! -->
	forward로 넘어온 값 : <%=name %>(<%=id %>)

</body>
</html>