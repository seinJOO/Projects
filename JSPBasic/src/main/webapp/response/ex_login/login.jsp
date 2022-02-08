<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>res_ex00_login</title>
<!-- margin : 태그와 태그 사이의 간격 -->
	<style>
		.wrap{
			width : 257px;
			margin : 0 auto;
			text-align : center;			
		}
		.btn {
			width : 60px;
			height : 50px;
			background-color: aqua;
		}
	</style>

</head>
<body>
<div class="wrap">
	<h2>Redirect 로그인 연습</h2>
	<hr>
	<form action="login_chk.jsp" method="post">
		<table border = "1">
			<tr>
				<td><input type="text" name="id" placeholder="아이디"></td>
				<td rowspan=2><input type="submit" value="로그인" class="btn"></td>
			</tr>
			<tr>
				<td><input type="password" name="pw" placeholder="비밀번호"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>