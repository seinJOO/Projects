package com.jdbc;

import java.sql.*;
import java.util.Scanner;

public class JDBCinsert {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
													//try catch 구문 없이 가능
		// 입력값을 받는 코드 작성
		Scanner scan = new Scanner(System.in);
		System.out.print("id > ");
		String id = scan.next();
		System.out.print("pw > ");
		String pw = scan.next();
		System.out.print("name > ");
		String name = scan.next();
		System.out.print("email > ");
		String email = scan.next();
		
		//System.out.printf("입력 아이디 : %s%n 입력 암호 : %s%n 입력한 이름 : %s%n 입력한 이메일 : %s%n", id, pw, name, email);
		
		// DB 연결을 위한 변수
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1"; // Oracle URL
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		Statement stmt = null;
		
		// SQL 구문
		String sql = "INSERT INTO member VALUES ('"+ id +"','"+ pw +"','"+ name +"','"+ email+"')";

		// 1. JDBC 드라이버 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. Connection 객체 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 3. Statement 객체 생성
		stmt = conn.createStatement();
		
		// 4. Statement 객체로 SQL 구문 전달
		int result = stmt.executeUpdate(sql);
		
		if (result == 1) {
			System.out.println("입력 성공!");
		} else System.out.println("입력 실패 ㅠㅠ");
		
		// 5. 객체 종료
		conn.close();
		stmt.close();
		
		
		
		
	}

}
