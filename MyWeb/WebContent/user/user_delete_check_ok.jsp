<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
<% 	
	if (session.getAttribute("id") == null) response.sendRedirect("user_login.jsp");

	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	String upw = request.getParameter("pw");
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.getUserInfo(id);
	
	if (!upw.equals(dao.login(id))) {	%>
		alert("비밀번호를 확인하세요");
		history.go(-1);		
<%	} else {
			if (dao.withdraw(vo) == 1) {	
				session.invalidate();	%>		
				alert("회원 탈퇴가 완료되었습니다");
				location.href="/MyWeb/index.jsp";		
		<%	} else {	%>
				alert("회원 탈퇴 실패!");
				location.href="user_mypage.jsp";
		<%	}
		}	%>

</script>
