<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입 연습</h2>

<form action="join_ok" method="post"> 
ID : <input type="text" name="id" size="10" placeholder="아이디"><br>
PW : <input type="password" name="pw" size="10" placeholder="비밀번호"><br>
이름 : <input type="text" name="name" size="10" placeholder="이름"><br>
전화번호 : 
<select name ="phone1">
<option>010</option>
<option>011</option>
<option>018</option>
</select> <input type="text" name="phone2" size="20"><br>

email : <input type="email" name="email" size="30" placeholder="이메일"><br>
성별 : 
<input type="radio" name="gender" value="M">남자
<input type="radio" name="gender" value="F">여자
<br>
<input type="submit" value="회원가입">

</form>
</body>
</html>