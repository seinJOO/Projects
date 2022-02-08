<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. a태그를 이용해 req_video 페이지로 상대경로로 이동설정
		 2. a태그를 이용해 req_video 페이지로 절대경로로 이동설정
		 3. TestServlet 페이지로 상대경로로 이동설정
		 4. TestServlet 페이지로 절대경로로 이동설정
		 5. request에 img폴더에 있는 노을 이미지를 참조(img태그의 src활용 w100)-->
		 
	<a href="../request/req_video.jsp"> req_video (상대경로)</a><br>
	<a href="/basicJSP/request/req_video.jsp"> req_video (절대경로)</a><br>
	<a href="../apple"> TestServlet (상대경로)</a><br>
	<a href="/basicJSP/apple"> TestServlet (절대경로)</a><br>
	<img src="../request/img/test1.png" alt="상대경로" width=100><br>
	<img src="/basicJSP/request/img/test2.png" alt="절대경로" width=100><br>
</body>
</html>