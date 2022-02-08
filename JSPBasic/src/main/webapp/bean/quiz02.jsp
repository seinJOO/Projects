<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bean.User" %>
<%	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwchk = request.getParameter("pwchk");
	String name = request.getParameter("name");
	
	if (pw.equals(pwchk)) {
/*		User user = new User();
		user.setId(id);
		user.setPw(pw);
		user.setName(name);
		request.setAttribute("user", user);	
		request.getRequestDispatcher("quiz03.jsp").forward(request, response);
		
*/
%>
		<jsp:useBean id="join" class="com.bean.User" scope="request" />
		<jsp:setProperty name="join" property="id" value="<%=id %>" />
		<jsp:setProperty name="join" property="pw" value="<%=pw %>" />
		<jsp:setProperty name="join" property="name" value="<%=name %>" />
		<jsp:forward page="quiz03.jsp" />

<%	} else {
		response.sendRedirect("quiz04.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
