<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! //페이지 전체에 가져가야 할 값이 있다면 전역변수 설정이 편하다
	String name = "홍길동";
	int age = 20;
%>
<%
	String email = "abc@naver.com";
	String addr = "서울시 서대문구";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println("이름 : <strong>"+ name + "</strong><br>");
		out.println("나이 : "+ age + "<br>");
		out.println("이메일 : "+ email + "<br>");
		out.println("주소 : "+ addr + "<br>");
	%>
	<hr>
	이름 : <%=name %><br>
	나이 : <%=age %><br>
	이메일 : <%=email %><br>
	주소 : <%=addr %><br>
</body>
</html>