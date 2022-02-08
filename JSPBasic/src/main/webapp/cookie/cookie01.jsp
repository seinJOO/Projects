<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	cookie01.jsp는 웹 페이지에 접근한 시간을 xxxx년 xx월 xx일 형태로 쿠키를 생성
				  날짜 형식을 문자열 형태로 show라는 이름의 쿠키로 생성
	cookie02.jsp는 cookie01에서 생성된 쿠키를 확인하는 페이지
				   show쿠키가 있다면 쿠키가 가진 값을 화면에 출력 / 없다면 "쿠키가 없습니다" 출력
	cookie03.jsp
*/
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String now = (format.format(date)).toString();
	Cookie nowCoo = new Cookie("show",now);
	
	nowCoo.setMaxAge(20);
	response.addCookie(nowCoo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성 페이지</title>
</head>
<body>
	<a href="cookie02.jsp">쿠키 확인하기</a>
</body>
</html>