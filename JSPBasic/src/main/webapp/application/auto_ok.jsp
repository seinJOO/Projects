<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	1. 앞페이지에서 사용자가 입력한 값과 arr[1] 값을 비교 / arr[1]은 세션에 저장함
	2. 두 값이 일치한다면 reserve.jsp / 일치하지 않으면 auth.jsp
*/

	String auth = (String) session.getAttribute("auth");
	session.setAttribute("auth", auth);
	String code = request.getParameter("code");
	
	if (auth.equals(code)) {
		response.sendRedirect("reserve.jsp");
	} else response.sendRedirect("auth.jsp");

%>