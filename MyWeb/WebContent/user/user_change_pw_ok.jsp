<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	request.setCharacterEncoding("utf-8");
	if (session.getAttribute("id") == null) {	// 강제url 접속 차단
		response.sendRedirect("user_login.jsp");
	}
	String id = (String)session.getAttribute("id");
	UserDAO dao = UserDAO.getInstance();

	String oldchk = request.getParameter("oldpw");
	String newpw = request.getParameter("newpw");
	String newchk = request.getParameter("pwchk");
	
%>

<script type="text/javascript">

<%	if (!oldchk.equals(dao.login(id))) {	%>
		alert("현재 비밀번호가 일치하지 않습니다");
		history.go(-1);
<% 	} else if (!newpw.equals(newchk)) {	%>
		alert("비밀번호를 다시 확인해주세요");
		history.go(-1);
<%	} else {	
		int result = dao.changePw(id, newpw);
		if (result == 1) { %>
			alert("비밀번호 변경 처리 되었습니다!");
			location.href="/MyWeb/user/user_mypage.jsp";
<%		} else {	%>
			alert("비밀번호 변경에 실패하였습니다ㅠㅠ");
			history.go(-1);
<%		}
	}

%>

</script>
