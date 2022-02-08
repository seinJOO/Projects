<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- 에러 발생 시 보여질 페이지임을 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box {
		display : flex;
		align-items : center;
		flex-direction : column;
		justify-content : center;
		height : 100px;
	}
</style>
</head>
<body>
	<div class="box">
		java.lang.NumberFormatException 에러
		<a href="##">홈으로</a>
	</div>
</body>
</html>