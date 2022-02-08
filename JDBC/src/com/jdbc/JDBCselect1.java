package com.jdbc;

import java.sql.*;

public class JDBCselect1 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		// DB 연결을 위한 변수 : url, uid, upw
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		// DB 연동을 위한 필요 클래스 변수 선언
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// SQL 구문
		String sql = "SELECT * FROM member";
		
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. 커넥션 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 3. Statement 객체 생성
		stmt = conn.createStatement();
		
		// 4. SQL문 실행
		rs = stmt.executeQuery(sql);

		// rs 객체 값 사용 - rs.next()
		while (rs.next()) {
/*			
			rs.getString(컬럼명) : 문자열 결과를 얻음
			rs.getInt(컬럼명) : 숫자데이터를 얻음 (정수)
			rs.getDouble(컬럼명) : 숫자 데이터를 얻음 (실수)
			rs.getTimestamp(컬럼명) : 날짜 데이터를 얻음						
*/
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String email = rs.getString("email");
			System.out.println("--------------------------------------");
			System.out.println("DB로부터 받은 id값 : " + id);
			System.out.println("DB로부터 받은 id값 : " + pw);
			System.out.println("DB로부터 받은 id값 : " + name);
			System.out.println("DB로부터 받은 id값 : " + email);
			
		}
		
		// 시스템으로 객체 반환
		conn.close();
		stmt.close();
		rs.close();
		
		
	}
}
