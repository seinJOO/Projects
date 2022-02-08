<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if (session.getAttribute("id") != null)  {
	session.invalidate(); 
	response.sendRedirect("/MyWeb/user/user_login.jsp");	
	}
%>