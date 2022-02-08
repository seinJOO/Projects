<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 로그인</h2>
	<form action = "session_login_ok.jsp" method="post">
	
		ID : <input type="text" name="id"><br><br>
		PW : <input type="password" name="pw"><br><br>
		NICK : <input type="text" name="nick"><br><br>
		<input type="submit" value="로그인">
	
	</form>
</body>
</html>