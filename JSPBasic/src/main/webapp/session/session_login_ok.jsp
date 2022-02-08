<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
/*	
	1. 아이디와 비밀번호, 닉네임 받기
	2. 아이디와 비밀번호가 서로 동일하면 로그인
	   로그인 시 user_id로 id값을 세션에 저장 / user_name에 nick 값을 세션에 저장
	   session_welcome.jsp로 리다이렉트하여 "id님(nick) 환영합니다" 출력
	3. 로그인 실패 시 session_login.jsp로 리다이렉트
*/
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	
	
	
	if (id.equals(pw)) {
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", nick);
		response.sendRedirect("session_welcome.jsp");
	} else {
		//response.sendRedirect("session_login.jsp");
		
		/* 자바스크립트를 써보자!
		
			자바스크립트의 변수 선언 (var=변수)
			var a = 1;
			var b = "1";
			let c = 1;		변수에 재할당 가능
			const d = "1";	immutable - 변수 재선언, 재할당 모두 불가 (let보다 자주씀)
			
			자바스크립트의 함수 선언
			function 이름(매개변수) {
				예전방식~
			}
			
			함수 (es6방식)
			이름 = (매개변수) => {
				새 방식~
			}
			
			제어 : for, if, switch, while, try ...
			
			자바스크립트에서 자주 사용되는 내장 객체
			alert(); : 경고창
			confirm(); : 확인창
			history.go(-1); : 뒤로가기
			location.href ="경로"; // 웹페이지를 "경로" 정보로 redirect
		
		*/
		
%>
		<script>
			check(); // 함수 호출. 선언되면 앞뒤 어디서든 사용 가능
			function check() {
				alert("로그인에 실패했습니다."); // 경고창
				history.go(-1); //뒤로가기
			}
		
		</script>
		
		
		
<%		
	}


%>