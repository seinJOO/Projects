<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//ArrayList<String> list = new ArrayList<>();
	List<String> list = new ArrayList<>(); // 부모클래스의 List에서 자식클래스인 ArrayList를 부를 수 있다

	list.add("홍길동");
	list.add("홍길자");
	
	//HashMap<Integer, String> map = new HashMap<>();
	Map<Integer, String> map = new HashMap<>(); // 부모클래스의 Map에서 자식클래스인 HashMap 호출 가능
	
	map.put(1, "홍길동");
	map.put(2, "홍길자");
	
	Random rand = new Random();
	int i = rand.nextInt(10);
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
	String now = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	리스트의 크기 : <%=list.size() %><br>
	리스트의 형태 : <%=list.toString() %><br>
	<br>
	맵의 크기 : <%=map.size() %><br>
	맵의 형태 : <%=map.toString() %><br>
	<br>	
	랜덤 값 : <%=i %><br>
	날짜 : <%=now %><br>

</body>
</html>