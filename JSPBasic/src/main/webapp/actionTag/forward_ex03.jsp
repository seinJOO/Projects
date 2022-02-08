<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>servlet을 통한 forward</title>
</head>
<body>

	<!-- form태그를 사용하여 ID를 입력 받아 처리 -->
	<h2>Servlet을 통한 forward</h2>
	<form action="/forward" method="post">
		ID : <input type="text" name="id"><input type="submit" value="확인">			
	</form>
	<hr>
	<h2>JSP를 통한 forward</h2>
	<form action="forward.jsp" method="post">
		ID : <input type="text" name="id"><br>
		NAME : <input type="text" name="name"><br>
		
		<input type="submit" value="확인">			
	</form>

</body>
</html>