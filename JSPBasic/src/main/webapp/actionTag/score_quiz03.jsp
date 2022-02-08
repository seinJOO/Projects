<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");
	String name = (String) request.getParameter("name");
	String avg = (String) request.getParameter("avg");
	
	double res = Double.parseDouble(avg);
	Math.round(res);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=name %>님 평균 <%=res %>점 합격입니다!
</body>
</html>