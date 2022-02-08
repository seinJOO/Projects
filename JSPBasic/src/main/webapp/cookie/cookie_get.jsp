<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키 사용하기
	// 쿠키는 요청 시 자동으로 전송되고 request에 자동으로 저장됨
	Cookie[] arr = request.getCookies(); // 하나 혹은 여러 개의 쿠키값을 쿠키배열로 받아 처리한 후 사용함
	
	if (arr != null) { // 쿠키값이 존재하는 경우
		for (int i = 0 ; i < arr.length ; i++) {
			out.println(arr[i].getName() + "   "); // 쿠키 이름 가져오기
			out.println(arr[i].getValue() + "<br><br>"); // 쿠키 값 가져오기
			out.println("<br>");
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>