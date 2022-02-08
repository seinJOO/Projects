<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String test = "문자열 변수입니다.";
	int num = 100;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> 출력 태그 </h4>
	test 변수 값 1 : <c:out value = "<%=test %>"></c:out><br>
	test 변수 값 2 : <c:out value = "<%=test %>"/><br>
	<hr>
	<h4> 변수 선언 태그 </h4>
	<c:set var="var1" value="100" scope="page" />
	var1의 변수 값 : ${var1 }<br>
	<hr>
	<h4> 변수 제거 태그 </h4>
	<c:remove var="var1" scope="page"/>
	var1의 변수 제거 후 : ${var1 }<br>
</body>
</html>