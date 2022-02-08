<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
	/*
		세션에 저장된 값은 같은 브라우저가 종료되기까지 또는 기본시간(30분) 만료 전까지 어느 페이지에서든 사용이 가능하다
		getAttribute("세션이름") 매서드를 사용하여 세션값을 사용한다.
		session의 데이터 타입은 Object이기 때문에 캐스팅이 필요함
	*/
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	
	// 세션 유지시간 확인
	int time = session.getMaxInactiveInterval();
	
	// 세션 유지시간 변경
	session.setMaxInactiveInterval(3600);
	int time2 = session.getMaxInactiveInterval();
	
	// 특정 세션 삭제
	session.removeAttribute("id");
	
	// 모든 세션 삭제
	//session.invalidate();
	
	// getid() 매서드 사용
	String sid = session.getId();
	
	// getCreationTime() 매서드 사용 - milliseconds로 나오기 때문에 값 가공 필요함
	long ctime = session.getCreationTime();
	
	// getAttributeNames()
	Enumeration<String> list = session.getAttributeNames(); //?!?!?!?!
	/*
	ArrayList<String> names = new ArrayList<>();
	int i = 0;
	while (list.hasMoreElements()) {
		names[i] = String.valueOf(list.nextElement()); 
		i++;
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%=id %><br>
	이름 : <%=name %><br>
	유지시간(처음) : <%=time %><br>
	유지시간(변경) : <%=time2 %><br>
	세션 아이디 : <%=sid %><br>
	세션 생성 시간 : <%=ctime %><br>
	세션 이름 : <%=list %>
</body>
</html>