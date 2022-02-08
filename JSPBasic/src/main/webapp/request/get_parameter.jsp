<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

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
<title>Insert title here</title>
</head>
<body>
	아이디 : <%=id %><br>
	비밀번호 : <%=pw %><br>
	관심분야 : <%=Arrays.toString(interest) %><br> <!-- String 배열 전체를 문자열로 출력하는 방법 -->
	전공 : <%=major %><br>
	통신사 : <%=phone %><br>
	이름 : <%=name %><br>
	주소 : <%=addr %><br>
</body>
</html>