<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>if절 확인</h2>
	<form action="jstl_if.jsp">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		<input type="submit" value="전송">	
	</form>
	<hr>
	<h2>else if절 확인 1</h2>
	<form action="jstl_choose.jsp">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		<input type="submit" value="전송">	
	</form>
	<hr>
	<h2>else if절 확인 2</h2>
	<form action="jstl_choose2.jsp">
		이름 : <input type="text" name="name"><br>
		성적 : <input type="text" name="score"><br>
		<input type="submit" value="전송">	
	</form>
</body>
</html>