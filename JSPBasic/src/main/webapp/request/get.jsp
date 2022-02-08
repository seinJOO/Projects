<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get방식 실습</title>
</head>
<body>
<!-- GET방식은 반드시 폼태그를 사용할 필요는 없다! 
	 주소를 통해서 강제로 파라미터를 전달할 수 있음 
	 단일 변수값 전달 시 : 웹어플리케이션?변수명=값
	 여러 변수값 전달 시 : 웹어플리케이션?변수명=값&변수명=값	ex)http://localhost:8080/login.jsp?id=user&pw=pass
	 
	 * 브라우저에서 URL 인코딩을 하지 않으면 오류가 발생할 수 있음
	 -->
	 
	 <a href="post_parameter.jsp?id=hong&pw=1234">get방식 확인</a>
	 
</body>
</html>