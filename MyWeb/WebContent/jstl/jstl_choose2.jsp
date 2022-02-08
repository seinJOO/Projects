<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- choose절을 이용하여 90 이상은 A, 80 이상은 B, 70 이상은 C, 나머지는 F -->
	${param.name } 님의 성적은 
	<c:choose>
		<c:when test="${param.score >= 90 }">A</c:when>
		<c:when test="${param.score >= 80 }">B</c:when>
		<c:when test="${param.score >= 70 }">C</c:when>
		<c:otherwise>F</c:otherwise>
	</c:choose>
	입니다!<br>
</body>
</html>