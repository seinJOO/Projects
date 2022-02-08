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
	<!-- for Tokens 태그
		: 자바의 StringTokenizer를 JSTL로 구현하여 쓸 수 있다
		특정 패턴의 문자열이 있을 때 특정 문자로 문자열을 나누어서 쓰는 경우 (python의 split)
	 -->
	 <c:forTokens var = "split" items="안녕 하세요 지금은 JSP 수업 시간 입니다." delims=" ">
	 	${split }<br>
	 </c:forTokens>
	 
	 <!-- redirect 태그 : 특정 값***을 지정된 url로 전달할 때 사용 		get방식으로 넘겨짐 ㅠㅠ!!!-->
	 <c:redirect url="jstl_etc2.jsp">
	 	<c:param name="test" value="안녕, 난 redirect 태그야 !"></c:param>
	 </c:redirect>
</body>
</html>