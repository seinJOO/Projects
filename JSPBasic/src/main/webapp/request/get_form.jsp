<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form 안에 작성된 데이터를 서버로 보낼 때 처리할 경로는 action, 전송방식은 method에서 지정 (method 디폴트는 get)-->
	
	<form action="get_parameter.jsp">
		아이디 : <input type="text" size="10" name="id"><br>
		비밀번호 : <input type="password" size="10" name="pw"><br>
		관심분야 : 
		<input type="checkbox" name="interest" value="JAVA">자바
		<input type="checkbox" name="interest" value="JSP">JSP
		<input type="checkbox" name="interest" value="Database">DB		
		<br>
		전공 : 
		<input type="radio" name="major" value="컴공">컴퓨터공학과
		<input type="radio" name="major" value="디자인">디자인과
		<input type="radio" name="major" value="경영">경영학과
		<br>
		통신사 : 
			<select name="phone">
				<option value="KT">KT</option>
				<option value="SKT" selected>SKT</option>
				<option value="LG">U+</option>
			</select>
		<br>
		이름 : <input type="text" size="10" name="name"><br>
		주소 : <input type="text" size="20" name="addr"><br>
		<input type="submit" value="가입">
	</form>
</body>
</html>