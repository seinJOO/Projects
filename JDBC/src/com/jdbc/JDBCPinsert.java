package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBCPinsert {
	public static void main(String[] args) {
		// 입력값 받는 처리 (member)
		Scanner scan = new Scanner(System.in);
		System.out.print("id > ");
		String id = scan.next();
		System.out.print("pw > ");
		String pw = scan.next();
		System.out.print("name > ");
		String name = scan.next();
		System.out.print("email > ");
		String email = scan.next();
		
		// 연결 변수
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String user = "myjsp";
		String password = "myjsp";
		
		// 객체 생성
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member VALUES (?,?,?,?)";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			int result = pstmt.executeUpdate(); // 주의 : sql 구문을 인자로 전달하지 않음 (객체 생성 시 이미 전달함)
			 // 성공 시 1, 실패 시 0 반환
			if (result == 1) {
				System.out.println("입력 성공");
			} else System.out.println("입력 실패");
			
		} catch(Exception e) {
			
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				
			} catch (Exception e2) {
				
			}
		}
		
	}
}
