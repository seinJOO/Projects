<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 쿠키 생성 방법
    // 1. 쿠키 객체 생성 - 생성자 매개변수로 (쿠키이름, 쿠키값)
    Cookie idCoo = new Cookie("user_id","kkk123");
	Cookie nameCoo = new Cookie("user_name", "홍길동");
	
	// 2. 쿠키 시간 설정
	idCoo.setMaxAge(60*60); // 1시간 설정
	nameCoo.setMaxAge(30); // 30초 설정
	
	// 3. 응답바구니(response)에 쿠키를 탑재 = 브라우저가 저장	
	response.addCookie(idCoo);
	response.addCookie(nameCoo);
    
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="cookie_get.jsp">쿠키 확인하기</a>
</body>
</html>