<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	Double cm = Double.parseDouble(request.getParameter("height"));
	Double kg = Double.parseDouble(request.getParameter("weight"));
	// int bmi = (int) (kg / (cm/100 * cm/100));
	double bmi = kg / (cm/100 * cm/100);	
	bmi = (int)(bmi * 100) / 100; //연산을 통해 자리수 잘라내기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 측정 프로그램 2</title>
</head>
<body>
	이름 : <%=name %><br>
	키 : <%=cm %><br>
	몸무게 : <%=kg %><br>
	BMI지수 : <%=bmi %><br>
	당신의 BMI 지수는 
	<%
		if (bmi >= 25) {
			out.print("과체중");
		}else if (bmi <= 18) {
			out.print("저체중");
		}else out.print("정상");
	%>
	입니다! <br>
</body>
</html>