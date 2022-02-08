<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
<%	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("id") == null) response.sendRedirect("user_login.jsp");	
	String id = (String)session.getAttribute("id");
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");

	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.getUserInfo(id);
	vo.setName(name);
	vo.setEmail(email);
	vo.setAddr(addr);	
	int result = dao.update(vo);
	
	if (result == 1) {	
		session.setAttribute("name", name); %>
		alert("정보 수정이 완료되었습니다!");
		location.href="user_mypage.jsp";
<% 	} else {	%>
		alert("정보 수정에 실패하였습니다 ㅠㅠ");
		history.go(-1);
<%	} %>

</script>
