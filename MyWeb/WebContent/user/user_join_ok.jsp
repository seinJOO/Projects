<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--	진행 흐름
	1. 전달받은 값을 처리
	2. 회원 가입 여부를 확인
	3. 가입된 경우 실패처리(뒤로가기) | 가입 안된 경우 -> 가입 진행(join())
	4. 회원 가입 축하 및 로그인 페이지로 이동 | 실패 시 재가입 페이지로 이동
 --%>

<script type="text/javascript">
<%	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	
	
	UserDAO dao = UserDAO.getInstance();	
	UserVO vo = new UserVO(id,pw,name,email,addr,null);
	
	try {		
		if (dao.idCfm(id)) {	
			int result = dao.join(vo);
				if (result == 1) {		%>				
				alert("회원가입이 완료되었습니다!");
				location.href="/MyWeb/user/user_login.jsp";				
<%				} 
		} else {		%>
			alert("이미 존재하는 ID입니다 ㅠㅠ");
			history.go(-1);			
<%		} 	
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>
</script>