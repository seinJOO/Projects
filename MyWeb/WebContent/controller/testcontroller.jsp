<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  .test로 끝나면 전부 TestController로 연결됨
	하지만, 실제 폴더 경로에 맞춰서 url 주소를 사용하는 게 좋음 -->
	<a href="/MyWeb/controller/join.test">회원가입 요청</a>
	<a href="/MyWeb/controller/login.test">로그인 요청</a>
	<a href="/MyWeb/controller/update.test">수정 요청</a>
	<a href="/MyWeb/controller/delete.test">삭제 요청</a>
</body>
</html>