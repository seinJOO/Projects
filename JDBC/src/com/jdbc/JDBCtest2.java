package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCtest2 {
	public static void main(String[] args) {	//throws 예외처리를 안했기 때문에 try-catch 구문 사용!
		
		Scanner scan = new Scanner(System.in);
		System.out.print("id > ");
		String id = scan.next();
		System.out.print("pw > ");
		String pw = scan.next();
		System.out.print("name > ");
		String name = scan.next();
		System.out.print("email > ");
		String email = scan.next();
		
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1"; // Oracle URL
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		Statement stmt = null;
		
		String sql = "INSERT INTO member VALUES ('"+ id +"','"+ pw +"','"+ name +"','"+ email+"')";
		
		try {
			Class.forName("oracle.jdbc.driver.oracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			
			if (result == 1) {
				System.out.println("입력 성공");
			} else {
				System.out.println("입력 실패");
			}
		} catch (ClassNotFoundException cnfe) {
			System.out.println("드라이버를 로드하지 못함" + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속 실패" + sqle.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // SQLException을 throw하지 않았기 때문에 객체 시스템 반환 시 따로 try-catch 구문 사용
			try {
				if (conn != null) conn.close();
				if (stmt != null) stmt.close();
			} catch (Exception e2) {				
			}
		}
		
		
	}
}
