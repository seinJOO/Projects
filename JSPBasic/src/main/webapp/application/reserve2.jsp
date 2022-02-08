<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> cfm = new ArrayList<>();
	if (application.getAttribute("seats") != null) {
		cfm = (List<String>)application.getAttribute("seats");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘서트 예약 페이지</title>
<style>
	.stage {
		text-align : center;
		border : 1px solid black;
		width : 300px;
		height : 100px ;		
	}

</style>
</head>
<body>
	<div align="center">
	<h2>콘서트 예약 페이지</h2>
	<h5>예약할 좌석을 선택하세요</h5>
	<hr>
	<h3>좌석 배치도</h3>
		<form action="reserve2_ok.jsp" method="post">
		<div class=stage>
		<h3>STAGE</h3>
		</div>
		<table>
		<tr>
		<td>&nbsp;&nbsp;
<%		for (char c = 'A' ; c <= 'Z' ; c++) {		%>
			&nbsp;&nbsp;<small><%=c %></small>
<%		} 		%>
		</td></tr>
		
<% 		for (int i = 1 ; i <= 6 ; i++) {		%>
		<tr>
		<td><%=i %>
<% 			for (char c = 'A' ; c <= 'Z' ; c++) { 
			if (cfm.contains(i+"-"+c)) {%>
			<input type="checkbox" name="seat" value="<%=i %>-<%=c %>" disabled>
<%			} else {%>
			<input type="checkbox" name="seat" value="<%=i %>-<%=c %>">
<% 			}	
		}%>
		</td></tr>		
<%		} 		%>	
		</table>
		<br>
		<input type="submit" value="예약">&nbsp;<input type="reset" value="취소">		
		</form>
	</div>
</body>
</html>