<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. quiz01.jsp 파일은 ID, PW, PW CHECK, Name을 입력받아서 처리
	2. quiz02.jsp는 01로부터 전달받은 값을 처리
		pw와 pw체크가 같다면 User객체에 전달받은 id, pw, name을 저장 -> quiz03.jsp로 전달
		다르다면 quiz04.jsp로 넘어가서 회원가입에 실패했습니다 출력
	3. quiz03.jsp 에서는 id(name)님 회원 가입을 축하합니다. 비밀번호는 *****입니다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align=center>
	<h2>회원가입</h2>
	<form action="quiz02.jsp" method="post"><br>
	<table>
	<tr>
	<td>ID : </td>
	<td><input type="text" name="id"><br></td>
	<td rowspan=4><input type="submit" value="가입하기"></td>
	</tr>
	<tr>
	<td>PW : </td>
	<td><input type="password" name="pw"><br></td>
	</tr>	
	<tr>
	<td>PW Check : </td>
	<td><input type="password" name="pwchk"><br></td>
	</tr>
	<tr>
	<td>Name : </td>
	<td><input type="text" name="name"></td>
	</tr>	
	</table>
	</form>
	</div>
</body>
</html>