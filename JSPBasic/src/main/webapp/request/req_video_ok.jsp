<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer num = Integer.parseInt(request.getParameter("num"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if (num == null) {
		out.print("잘못된 접근입니다.");
	} else if (num == 1) { // = num.equals("1")
%>
		<div align="center">
			<h2>시스코 네트워크</h2>
			<p> 1. 종소리 </p>
			<hr>
			<iframe width="699" height="393" src="https://www.youtube.com/embed/2N4eTTipm9I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
<%
	} else if (num == 2) {
%>
		<div align="center">
			<h2>시스코 네트워크</h2>
			<p> 2. 자기소개 </p>
			<hr>
			<iframe width="699" height="393" src="https://www.youtube.com/embed/qrs96Z-JHgA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
<%		
	}
%>
</body>
</html>