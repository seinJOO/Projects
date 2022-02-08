<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if (session.getAttribute("id") == null) response.sendRedirect("user_login.jsp"); %>
<!DOCTYPE html>
<html>
	<div class="brand">My Web</div>        
	<div class="address-bar">회원 탈퇴</div>
	<%@ include file="/include/_header.jsp" %>
<section>
	<div align="center" style="margin : 100px auto">
		<form action="user_delete_check_ok.jsp" method="post">
			<h3> 비밀번호를 입력하세요 </h3>
			<hr>
			비밀번호 : <input type="password" name="pw">
			<input type = "submit" value="탈퇴">
		</form>	
	</div>
</section>

<%@ include file="/include/_footer.jsp" %>
</html>