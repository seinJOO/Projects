<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form태그를 사용하여 ID와 PW를 입력받고 처리하는 JSP -->
	<form action="forward_ex02.jsp" method="post">
		ID : <input type="text" name="id"><br>
		PW : <input type="text" name="pw"><br><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>