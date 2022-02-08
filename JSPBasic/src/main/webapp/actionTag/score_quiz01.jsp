<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--	session 사용 X!!!!
		이름,국어,영어,수학점수 받는 form태그 작성(post)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="score_quiz02.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		국어 : <input type="text" name="ko"><br>
		영어 : <input type="text" name="en"><br>
		수학 : <input type="text" name="math"><br><br>
		<input type="submit" value="합격 여부 확인">	
	</form>
</body>
</html>