<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//		1. application은 session과 사용방법이 거의 비슷함
//		   서버가 동작할 때 1개 생성되고, 서버가 꺼질 때까지 유지가 됨(생명주기가 request, session과 다름)
		  
		int count = 0;

		if (application.getAttribute("visit") != null) {
			count = (int) application.getAttribute("visit");
		}
		
		count++;
		
		application.setAttribute("visit", count);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	누적값 : <%=count %>
</body>
</html>