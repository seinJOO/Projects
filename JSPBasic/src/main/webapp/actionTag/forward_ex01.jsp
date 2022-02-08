<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	액션 태그 : jsp 안에서 특정 동작을 지시하는 태그들
			 태그이기 때문에 여는 태그, 닫는 태그가 있음
			 종속 태그가 없을 때는 "/"로 닫는 태그를 생략 가능
			 
	<jsp:forward page="url"></jsp:forward> : forward의 page속성은 포워드 처리할 URL 지정
	<jsp:forward page="url"/> 로도 사용 가능

 --%>
 
 	<jsp:forward page="forward_ex02.jsp"/>
</body>
</html>