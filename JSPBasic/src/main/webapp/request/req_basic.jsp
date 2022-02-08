<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request에는 브라우저에 대한 정보, 사용자가 전달하고자 하는 많은 정보를 자동으로 저장함
	StringBuffer url = request.getRequestURL();
	String uri = request.getRequestURI();
	String path = request.getContextPath();
	String query = request.getQueryString(); 
	String addr = request.getRemoteAddr();
	String method = request.getMethod();
	int portno = request.getServerPort();
	String sname = request.getServerName();
	String protocol = request.getProtocol();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
url 주소 : <%=url %><br>
uri 주소 : <%=uri %><br>
context path : <%=path %><br>
쿼리값 : <%=query %><br> <!-- 해당 페이지의 인자값 : ?변수=값 에서 물음표 이후의 값이 나옴(전체 페이지에 대한 값?) -->
접속 경로 : <%=addr %><br> <!-- IPV6 상 로컬호스트 경로값 : 0:0:0:0:0:0:0:1 / 주소길이 128bit = 16byte -->
전송 방식 : <%=method %><br>
프로토콜 : <%=protocol %><br>
서버 이름 : <%=sname %><br>
포트 번호 : <%=portno %><br>
</body>
</html>