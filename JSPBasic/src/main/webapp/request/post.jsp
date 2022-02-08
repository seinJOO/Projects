<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post방식 실습</title>
</head>
<body>
	<form action = "post_parameter.jsp" method="post">
	아이디 : <input type="text" size="10" name="id"><br>
	비밀번호 : <input type="password" size="10" name="pw"><br>
	<input type="submit" value="전송">
	</form>
</body>
</html>