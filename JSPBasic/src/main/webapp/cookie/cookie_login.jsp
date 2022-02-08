<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	로그인 성공 시 cookie를 통해서 로그인 정보를 추가 -> 로그인 정보를 유지하는 내용 !!
--%>
<%
/*
	1. idCheck 쿠키를 찾아서 idCheck쿠키가 있다면 해당 값을 얻어서 아이디 안에 미리 값을 갖게 코드를 작성
	2. form 태그를 사용하여 로그인 정보를 전달할 수 있는 페이지 만들기 -> cookie_login_ok

*/
	Cookie[] idcheck = request.getCookies();
	String cid = "";
	if (idcheck != null) {
		for (int i = 0 ; i < idcheck.length ; i++) {
			if (idcheck[i].getName().equals("idCheck")) {
				cid = idcheck[i].getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 사용하기</title>
</head>
<body>
	<form action="cookie_login_ok.jsp" method="post">
		아이디 : <input type="text" name="id" placeholder="아이디" value="<%=cid%>"><br>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호"><br>
		<input type="submit" value="로그인"><br>
		<input type="checkbox" name="idCheck" value="y">로그인 기억하기
	</form>
</body>
</html>