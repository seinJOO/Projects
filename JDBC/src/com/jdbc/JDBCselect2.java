package com.jdbc;

import java.sql.*;

public class JDBCselect2 {

	public static void main(String[] args) {
		
		// 접속을 위한 변수 설정
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		// 객체 생성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// sql구문 생성
		String sql = "SELECT * FROM member";
		
		try {
			// 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// conn, stmt, rs 객체에 정보 입력
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int i = 1;
			while (rs.next()) {
				
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				System.out.println(i + "번째---------------------------");
				System.out.println("입력받은 id : " + id);
				System.out.println("입력받은 pw : " + pw);
				System.out.println("입력받은 name : " + name);
				System.out.println("입력받은 email : " + email);
				
				i++;				
			}
		} catch (ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 오류" + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속 오류" + sqle.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
			} catch (Exception e) {
				
			}
		}
		
		
		
	}

}
