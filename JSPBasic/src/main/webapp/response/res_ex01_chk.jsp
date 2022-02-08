<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	String age = request.getParameter("age");
	int num = Integer.parseInt(age);
	
	if (num >= 20) {
		response.sendRedirect("res_ex01_yes.jsp");
	} else response.sendRedirect("res_ex01_no.jsp");
	*/	
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	if (month.length() == 1) month = "0" + month;
	String days = request.getParameter("days");
	if (days.length() == 1) days = "0" + days;
	String user = year + "-" + month + "-" + days;	
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.YEAR,-19);
	Date date = new Date(cal.getTimeInMillis());
	
	Date birth = format.parse(user);
	
	if (date.after(birth)) {
		response.sendRedirect("res_ex01_yes.jsp");
	} else response.sendRedirect("res_ex01_no.jsp");
	

%>