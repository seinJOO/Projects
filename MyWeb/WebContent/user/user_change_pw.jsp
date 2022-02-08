<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="brand">MyPage</div>        
<div class="address-bar">비밀번호 변경</div>
<%@include file="../include/_header.jsp" %>
	<section>	
		<div align="center" class="address-bar">	
		<h2>비밀번호 변경</h2>	
			<form name="pwchange" action="user_change_pw_ok.jsp" method="post">
			<table class="tbl">
				<tr>
				<td>현재 비밀번호  </td>
				<td><input type="password" name="oldpw"></td>			
				</tr>
				
				<tr>
				<td>새로운 비밀번호  </td>
				<td><input type="password" name="newpw"></td>
				</tr>	
				
				<tr>
				<td>새로운 비밀번호 확인  </td>
				<td><input type="password" name="pwchk"></td>			
				</tr>			
				<tr></tr>
			</table> 
			<input type="submit" value="변경" class="btn btn-info">
			<input type="button" value="취소" class="btn btn-default" onclick="location.href='user_mypage.jsp'">	
			</form>
		</div>
	</section>
</body>

<%@include file="../include/_footer.jsp" %>
</body>
</html>