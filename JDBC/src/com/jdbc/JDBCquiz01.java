package com.jdbc;

import java.util.Scanner;
import java.sql.*;

public class JDBCquiz01 {
	
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		System.out.print("조회할 id를 입력하세요 >> ");
		String id = scan.next();
		
		// 변수 설정
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String uid = "myjsp";
		String upw = "myjsp";
		
		//드라이버 로딩
		try {
			Class.forName(driver);
		
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();
		
		String sql = "SELECT * FROM member where id = '" + id + "'";
		rs = stmt.executeQuery(sql);
		
			if (rs.next()) {
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.printf("ID %s의 비밀번호는 %s, 이름은 %s, 이메일은 %s입니다%n", id,pw,name,email);			
			} 
		
		} catch (ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException sqle) {
			System.out.println("DB 접속 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
			
		
		
		
	}
	
	

}
