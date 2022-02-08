<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String driver_oracle = "oracle.jdbc.driver.OracleDriver";
	String url_oracle = "jdbc:oracle:thin:@localhost:1521/XEPDB1";

/*
	=driver=	
	Oracle : oracle.jdbc.driver.OracleDriver
	MariaDB : org.mariadb.jdbc.Driver	
	MySQL 6 이전 : com.mysql.jdbc.Driver
	MySQL 6 이상 : com.mysql.cj.jdbc.Driver	
	

	=URL설정=
	Oracle : jdbc:oracle:thin:@[서버주소(IP 또는 도메인)]:[서비스포트(1521)]/[세션]	*현재 세션 : XEPDB1
	MariaDB : jdbc:mysql://[서버주소(IP 또는 도메인)]:[서비스포트(3306)]/[DB명]
	MySQL 6 이전 : jdbc:mysql://[서버주소(IP 또는 도메인)]:[서비스포트(3306)]/[DB명]	
	MySQL 6 이상 : jdbc:mysql://[서버주소(IP 또는 도메인)]:[서비스포트(3306)]/[DB명]	?serverTimezone=[지역UTC]  * 서울 : Asia/Seoul
	
	
	
*/
	String user = "myjsp";
	String password = "myjsp";
	
	Connection conn = null;
	boolean connect = false;
	
	try {
		Class.forName(driver_oracle);			
		conn = DriverManager.getConnection(url_oracle, user, password);
		connect = true;
		
	} catch (ClassNotFoundException cnfe) {
		connect = false;
		System.out.println("드라이버 로딩 실패");
		
	} catch (SQLException sqle) {
		connect = false;
		System.out.println("DB 접속 실패");
		
	} catch (Exception e) {
		connect = false;
		System.out.println("알 수 없는 오류 발생");
		e.getStackTrace();
	}

	if (connect) {	%>
		<h2>DB 연결 성공!</h2>
<%	} else {	%>
		<h2>DB 연결 실패 ㅠㅠ</h2>
<%	}	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>