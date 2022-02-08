<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	<!-- param은 request객체의 값으로 전달받은 parameter를 의미하는 것! -->
	이름 : ${param.name }<br>
	아이디 : ${param.id }<br>
	비밀번호 : ${param.pw }<br>
</body>
</html>