<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : ${sessionScope.id }<br>
	이메일 : ${sessionScope.vo.email }<br>
	어플리케이션 정보 : ${applicationScope.admin }
</body>
</html>