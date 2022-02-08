<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> cfm = new ArrayList<>(); //예약 확정 리스트
	List<String> now = new ArrayList<>(); //현재 예약요청 받은 리스트
	
	if (application.getAttribute("seats") != null) {
		cfm = (List<String>) application.getAttribute("seats");
	} 
	
	String[] req = request.getParameterValues("seat");
	
	for (String s : req) {
		if (cfm.contains(s)) {
			break;
		} else {
			now.add(s);
		}
	}
	
	if (req.length == now.size()) {
		cfm.addAll(now);
	}
	
	application.setAttribute("seats", cfm);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 신청 결과</title>
</head>
<body>
	<div align="center">
	<h2>예약 신청 결과</h2>
	<b>선택한 좌석 <%=Arrays.toString(req) %></b><br><br>
	<h3>예약 신청 결과 : 
	<% if (req.length != now.size()) { %>	
	실패
	<% } else %> 성공	</h3>
	<a href="reserve2.jsp">다시 예약하기</a>
	</div>
</body>
</html>