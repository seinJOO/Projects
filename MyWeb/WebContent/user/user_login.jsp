<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style>
	.tbl {
		border-collapse : separate;
		border-spacing : 20px;	
		margin : auto;
		text-align : center;		
	}	
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="brand">My Web</div>        
<div class="address-bar">로그인 페이지</div>
<%@include file="../include/_header.jsp" %>
	<section>	
		<div align="center" class="address-bar">	
		<h2>로그인</h2>	
		<hr>
			<form name="loginform" action="/MyWeb/user/user_login_ok.jsp" method="post">
			<table class="tbl">
				<tr>
				<td>아이디  </td>
				<td><input type="text" name="id"></td>			
				</tr>
				<tr>
				<td>비밀번호  </td>
				<td><input type="password" name="pw"></td>			
				</tr>
				<tr>
				</tr>
			</table> 
			<input type="button" value="로그인" class="btn btn-default" onclick="check()">	
			<input type="button" value="회원가입" class="btn btn-default" onclick="location.href='join.jsp'">	
			</form>
		</div>
	</section>
</body>

<%@include file="../include/_footer.jsp" %>
<script type="text/javascript">
	function check() {
		if (document.loginform.id.value.length < 4 || document.loginform.id.value.length > 8) {
			alert('아이디는 4글자 이상 8글자 이하입니다');
			return;
		} else {
			document.loginform.submit();
		}
		
	}

</script>
</html>