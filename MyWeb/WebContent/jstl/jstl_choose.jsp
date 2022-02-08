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
	<!-- choose의 자식으로 when/otherwise를 사용한다 -->
	<c:choose>
		<c:when test="${param.name eq '주세인' }">관리자입니다!</c:when>
		<c:when test="${param.age >= 20 }"> 성인입니다 !</c:when>
		<c:otherwise>아무것도 아닙니다</c:otherwise>
	</c:choose>
</body>
</html>