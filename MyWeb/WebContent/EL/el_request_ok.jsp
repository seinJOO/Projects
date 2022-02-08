<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${requestScope.vo.name }<br>
	아이디 : ${requestScope.vo.id }<br>
	주소 : ${requestScope.vo.addr }<br>
</body>
</html>