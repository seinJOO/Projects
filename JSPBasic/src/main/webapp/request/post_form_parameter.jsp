<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String[] interest = request.getParameterValues("interest");
	String major = request.getParameter("major");
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post 전송방식 2</title>
</head>
<body>
	아이디 : <%=id %><br>
	비밀번호 : <%=pw %><br>
	관심분야 : <%=Arrays.toString(interest) %><br> 
	관심분야 : <% for (int i = 0 ; i < interest.length ; i++) { %>
			<%=interest[i] %>
			<%} %>
	<br>
	전공 : <%=major %><br>
	통신사 : <%=phone %><br>
	이름 : <%=name %><br>
	주소 : <%=addr %><br>
</body>
</html>