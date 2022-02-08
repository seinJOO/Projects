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
	<c:if test="true">
		무조건 실행되는 문장
	</c:if>
	<hr>
	<c:if test="${param.name eq '홍길동' }">
		홍길동입니다.
	</c:if>
	<c:if test="${param.name == '이순신' }">
		이순신입니다.
	</c:if>
	<hr>
	<c:if test="${param.age >= 20 }">
		성인입니다.
	</c:if>
	<c:if test="${param.age < 20 }">
		미성년입니다.
	</c:if>
	
</body>
</html>