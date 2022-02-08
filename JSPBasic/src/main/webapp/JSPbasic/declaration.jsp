<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%! 
    //선언자 설정 : 변수 또는 매서드를 선언할 경우에 사용
    // 선언된 변수나 매서드는 전역의 의미(멤버변수)    
    int i = 10;
    String str = "Hello World";
    public int method(int a, int b) {
    	return a+b;
    }   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언자 실습</title>
</head>
<body>
<%
	out.println("i값 : "+ i + "<br>");
	out.println("str값 : "+ str + "<br>");
	out.println("10과 20의 합 : "+method(10,20)+"<br>");
%>
	
	<h1>표현식을 이용한 출력</h1>
	i값 : <%=i%><br>
	str값 : <%=str %><br>
	10과 20의 합 : <%=method(10,20) %>
	
</body>
</html>