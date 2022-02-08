<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// 예약현황이 있다면 예약 좌석을 꺼내서 처리 
	List<String> list = new ArrayList<>();
	if (application.getAttribute("seats") != null) {
		list = (List<String>) application.getAttribute("seats");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align = center>
	<h2>콘서트 예약</h2>
	<h4>예약할 좌석을 선택하세요</h4>
	<hr>
	<form action = "reserve_ok.jsp" method="post">
	<h5>좌석 배치도</h5>
	
<% 	for (char c = 'A' ; c <= 'Z' ; c++) {%>
		&nbsp;&nbsp;<small><%=c %></small>
<% } %>
<br>
<%	
	for (int i = 1 ; i <= 6 ; i++) {
		out.print(i + " ");
		for (char c = 'A' ; c <= 'Z' ; c++) { %>
		<% if (list.contains(i + "-" + c)) { %>
			<input type="checkbox" name="seat" value="<%=i %>-<%=c %>" checked disabled >
		<% } else {%>
		<input type="checkbox" name="seat" value="<%=i %>-<%=c %>">
<%		}
		}
		out.print("<br>");
		if ( i == 3) out.print("<br>");	
	}
%>	
	<br>
	<input type="submit" value="예약"><input type="submit" value="취소">
	</form>	 
	</div>
</body>
</html>