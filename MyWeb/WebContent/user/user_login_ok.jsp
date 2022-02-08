<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = new UserVO();
	String pwchk = dao.login(id);
	
	try {
		if (pwchk == null) {	%>
			alert('존재하지 않는 id입니다 !');
			history.go(-1);
<%		} else if (pw.equals(pwchk)) {
			session.setAttribute("id", id);
			response.sendRedirect("/MyWeb/user/user_mypage.jsp");
			
		} else {	%>
		alert('비밀번호가 일치하지 않습니다 !');
		history.go(-1);
<%		}
	} catch (Exception e) {
		
	}

%>


</script>
