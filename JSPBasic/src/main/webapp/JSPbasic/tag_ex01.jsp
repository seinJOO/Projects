<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		/*     	
		1. 페이지를 접속할 때마다 랜덤으로 생성된 값을 출력 (오늘의 숫자 : 랜덤 숫자)
		2. 페이지 누적요청 숫자를 계산하여 출력 (페이지 누적 요청 : 누적 요청 수)
		3. 요청한 페이지 개별 요청 숫자를 표시 (페이지 개별 요청 : 개별 요청 수) 	    	
		*/
%>
    <%!
		 // 선언자와 스크립틀릿의 차이 : 멤버변수는 전역변수의 성질을 가지면서 전체 어플에 영향을 준다
    	
    	public int random() {
    	Random rand = new Random();
    	int num = 10 + rand.nextInt(91);
    	return num;
    }
    	int total = 0;
    %>
    
    <% 	//페이지가 실행될 때마다 발생하는 코드를 작성 in 스크립틀릿	
   		total++;
    
    	int each = 0;
    	each++;
	%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
	오늘의 숫자 : <%=random() %><br>
	페이지 누적 요청 : <%=total %><br>
	페이지 개별 요청 : <%=each %><br>
</p>
</body>
</html>