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
<div class="brand">My Web</div>        
<div class="address-bar">회원 가입을 진행해주세요!</div>
<%@include file="../include/_header.jsp" %>


<section>	
	<div align="center" class="address-bar">	
	<h2>회원 가입 페이지</h2>	
		<form name="regform" action="user_join_ok.jsp" method="post">
		<table class="tbl">
			<tr>
			<td>아이디  </td>
			<td><input type="text" name="id" placeholder="4글자 이상 8글자 이하"></td>			
			</tr>
			<tr>
			<td>비밀번호  </td>
			<td><input type="password" name="pw"></td>			
			</tr>
			<tr>
			<td>비밀번호 확인  </td>
			<td><input type="password" name="pw_check"></td>			
			</tr>
			<tr>
			<td>이름  </td>
			<td><input type="text" name="name"></td>			
			</tr>
			<tr>
			<td>이메일  </td>
			<td><input type="email" name="email"></td>			
			</tr>
			<tr>
			<td>주소  </td>
			<td><input type="text" name="addr"></td>			
			</tr>
		</table>
		<input type="button" value="회원가입" class="btn btn-default" onclick="check()"> 
																	<%-- 회원가입 클릭 시 아래에서 지정한 check 함수 불러오기 --%>
		<input type="button" value="로그인" class="btn btn-default" onclick="location.href='user_login.jsp'">		
		</form>
	</div>
</section>
	
<%@include file="../include/_footer.jsp" %>	
	<script type="text/javascript"> //생략 가능! default가 javascript
	function check() {
		// form은 document.태그이름.태그이름으로 하위 태그에 접근 가능!
		// 브라우저에서 F12 개발자모드의 콘솔에 console.log (document.regform.id.value); 입력 시 input에 입력된 데이터에 접근 가능함을 볼 수 있음!									 
		
		if (document.regform.id.value == '') {
			alert("아이디는 필수 입력 사항입니다.");
			return;
		} else if (document.regform.id.value.length < 4 || document.regform.id.value.length > 8) {
			alert("아이디는 4글자 이상 8글자 이하로 입력하세요.");
			return;
		} else if (document.regform.pw.value == '') {
			alert("비밀번호는 필수 입력 사항입니다.");
			return;
		} else if (document.regform.pw.value != document.regform.pw_check.value) {
			alert("비밀번호가 일치하지 않습니다!");
			return;
		} else if (document.regform.name.value == '') {
			alert("이름은 필수 입력 사항입니다.");
			return;
		} else if (confirm("회원 가입을 하시겠습니까?")) {
			// confirm() 확인창에 "예"를 클릭하면 true 반환, "아니오"는 false 반환
			document.regform.submit(); //자바스크립트를 이용한 submit() 메서드
		}
	}
	</script>
</body>
</html>




	

