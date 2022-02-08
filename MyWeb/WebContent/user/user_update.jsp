<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
	if (session.getAttribute("id") == null) response.sendRedirect("user_login.jsp");

	String id = (String) session.getAttribute("id"); 
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.getUserInfo(id);	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.tbl {
		border-collapse : separate;
		border-spacing : 20px;	
		margin : auto;
		text-align : center;		
	}	
</style>
</head>
<body>
<div class="brand">My Page</div>        
<div class="address-bar">회원 정보 업데이트</div>
<%@include file="../include/_header.jsp" %>
<section>	
	<div align="center" class="address-bar">	
	<h2>내 정보 수정</h2>	
		<form name="updateform" action="user_update_ok.jsp" method="post">
		<table class="tbl">
			<tr>
			<td>아이디  </td>
			<td><input type="text" name="id" value="<%=vo.getId() %>" readonly></td>			
			</tr>
			<tr>
			<td>이름  </td>
			<td><input type="text" name="name" value="<%=vo.getName() %>"></td>			
			</tr>
			<tr>
			<td>이메일  </td>
			<td><input type="email" name="email" value="<%=vo.getEmail() %>"></td>			
			</tr>
			<tr>
			<td>주소  </td>
			<td><input type="text" name="addr" value="<%=vo.getAddr() %>"></td>			
			</tr>
			<tr>
			<td>가입일  </td>
			<td><input type="text" name="addr" value="<%=sdf.format(vo.getRegdate()) %>" readonly></td>			
			</tr>
		</table>
		<input type="button" value="정보 수정" class="btn btn-primary" onclick="check()"> 
		<input type="button" value="비밀번호 변경" class="btn btn-info" onclick="location.href='user_change_pw.jsp'">	
		<input type="button" value="취소" class="btn btn-default" onclick="location.href='user_mypage.jsp'">		
		</form>
	</div>
</section>
</body>	
<%@include file="../include/_footer.jsp" %>	
	<script type="text/javascript"> 
	function check() {
		if (document.updateform.name.value == '') {
			alert("이름은 필수 입력 사항입니다.");
			return;
		} else if (confirm("정보를 수정하시겠습니까?")) {			
			document.updateform.submit(); 
		}
	}
	</script>
</html>




	

