<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%/*
	페이지 누적 요청 및 랜덤 값을 출력, 매 10번째 방문자에게는 기프티콘을 드립니다 
	10번째 마다 "당첨되었습니다" 출력 / 
*/%>

<%!
	int total = 0;
	public int random() {
		Random rand = new Random();
		int num = 1 + rand.nextInt(9);
		return num;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>	
		매 10번째 방문자에게는 기프티콘을 드립니다.<br>
		<%
		int rnd = random();
		total++;
		if (total%10 == 0) {
			out.print("당첨되었습니다!>> <a href='#'>기프티콘 받기</a><br>");
		}		
		%>		
		페이지 누적 요청 : <%=total %><br>
	</p>
	<p>
		랜덤 값 출력 : <%=rnd %>
		<h2>랜덤 구구단 <%=rnd %>단 입니다.</h2>
		<%
			for (int i = 2 ; i < 10 ; i++) {
				int result = rnd * i;
		%>
		<%=rnd %> * <%=i %> = <%=result %> <br>
		<%
			}
		%>
	</p>
</body>
</html>