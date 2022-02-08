<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% request.setCharacterEncoding("utf-8");
/*
	1. 아이디와 비밀번호를 받아냄
	2. id = abc 이고 pw = 1234 라면 로그인 성공으로 간주, (user_id, id) 값을 갖는 쿠키를 생성
	3. 쿠키 문법을 사용하여 쿠키를 전송 & cookie_welcome.jsp로 이동("로그인id"님 환영합니다! 출력)
	4. 아이디와 비밀번호가 틀렸다면 cookie_login.jsp로 이동
*/

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String idCheck = request.getParameter("idCheck");
	
	if (id.equals("abc") && pw.equals("1234")) {
		Cookie logon = new Cookie("user_id", id);
		logon.setMaxAge(30);
		response.addCookie(logon);
		
		// idCheck에 대한 코드 추가
		if (idCheck != null) { 
			Cookie check = new Cookie("idCheck", id);
			check.setMaxAge(1800); //30분간 idcheck 쿠키 유지
			response.addCookie(check);
		}
		response.sendRedirect("cookie_welcome.jsp");
	} else response.sendRedirect("cookie_login.jsp");
	
%>