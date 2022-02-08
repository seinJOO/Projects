<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
	Cookie[] coo = request.getCookies();
	String name = null;
	/*
	if (coo != null) {
		for (int i = 0 ; i < coo.length ; i++) {
			if (coo[i].getName().equals("user_id")) {
				name = coo[i].getValue();		
			}
		}
	}
*/
if (coo != null) {
	for (Cookie each : coo) { //each 객체에 Cookie 자료형 배열의 각 값이 들어가기 때문에 자료형을 Cookie로 설정해야함
		if (each.getName().equals("user_id")) {
			name = each.getValue();		
		}
	} // for-each구문은 새로 생성한 객체가 null일 경우 = 값이 더 없을 경우 자동으로 종료~
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %>님 환영합니다!<br>
</body>
</html>