<%@page import="com.ok.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
		String id = (String)session.getAttribute("id"); //아이디만 세션에 저장했기 때문에  VO를 이용한 값 바꾸기
		MemberVO vo = (MemberVO)request.getAttribute("vo");
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		System.out.println(vo.getName());
		System.out.println(vo.getPhone1());
		System.out.println(vo.getPhone2());
		System.out.println(vo.getEmail());
		System.out.println(vo.getGender());
		
		
		String pw = vo.getPw();
		String name = vo.getName();
		String phone1 = vo.getPhone1();
		String phone2 = vo.getPhone2();
		String email = vo.getEmail();
		String gender = vo.getGender();

/*	세션을 이용한 값 받아오기
	String id = (String) session.getAttribute("id");
	String pw = (String) request.getAttribute("pw");
	String name = (String) request.getAttribute("name");
	String phone1 = (String) request.getAttribute("phone1");
	String phone2 = (String) request.getAttribute("phone2");
	String email = (String) request.getAttribute("email");
	String gender =(String) request.getAttribute("gender");
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	input 태그의 읽기만 허용하는 속성 - readonly
	select 태그의 기본 선택 속성 - selected
	radio 태그 - checked

 --%>
<h2>회원 정보 수정</h2>
	<form action="update_ok" method="post"> 
	ID : <input type="text" name="id" size="10" placeholder="아이디" value="<%=id %>" readonly><br>
	PW : <input type="password" name="pw" size="10" placeholder="비밀번호"><br>
	이름 : <input type="text" name="name" size="10" placeholder="이름" value="<%=name %>"><br>
	
	전화번호 :  <%--삼항연산자를 활용하여 간결하게 default값을 설정 가능! --%>
	<select name ="phone1">
	<option <%=phone1.equals("010") ? "selected" : "" %>>010</option>
	<option <%=phone1.equals("011") ? "selected" : "" %>>011</option>
	<option <%=phone1.equals("018") ? "selected" : "" %>>018</option>
	</select>-<input type="text" name="phone2" size="20" value="<%=phone2 %>"><br>
	
	email : <input type="email" name="email" size="30" placeholder="이메일" value="<%= email%>"><br>
	
	성별 : 
<%	if (gender == null || gender.equals("M")) { %>
	<input type="radio" name="gender" value="M" checked>남자
	<input type="radio" name="gender" value="F">여자	
<%} else {%>
	<input type="radio" name="gender" value="M" checked>남자
	<input type="radio" name="gender" value="F">여자	
<%}		 %>
	<br>
	<input type="submit" value="정보수정"><input type="button" value="취소" onclick="history.back(-1)">

	</form>
</body>
</html>