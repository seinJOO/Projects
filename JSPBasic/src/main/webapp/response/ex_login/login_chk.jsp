<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1번 페이지에서 넘어온 id, pw값을 받아서 처리
	id가 abc123이고, 비밀번호가 asd123이면 로그인 성공 - login_welcome으로 리다이렉트
	id가 틀린 경우 login_id_fail로 리다이렉트
	pw가 틀린 경우 login_pw_fail로 리다이렉트
   
   */
   
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if (id.contains("abc123") && pw.contains("asd123")) {
		response.sendRedirect("login_welcome.jsp");
	} else if  (id.contains("abc123") == false) {
		response.sendRedirect("login_id_fail.jsp");
	} else if (pw.contains("asd123") == false) {
		response.sendRedirect("login_pw_fail.jsp");
	}
   
%>
