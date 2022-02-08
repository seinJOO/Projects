package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCtest {

	public static void main(String[] args) {
		
		// Oracle 설정
		String driver_oracle = "oracle.jdbc.driver.OracleDriver";
		String url_oracle = "jdbc:oracle:thin:@localhost:1521/XEPDB1"; // 오라클 18c는 이렇게~!
		
			// MariaDB 설정
			String driver_maria = "org.mariadb.jdbc.Driver";
			String url_maria = "jdbc:mysql://localhost:3306/testdb";
			
			// MySQL 6 이상
			String driver_mysql = "com.mysql.cj.jdbc.Driver";
			String url_mysql = "jdbc:mysql://localhost:3306/testdb?serverTimezone=Asia/Seoul";
			
			// MySQL 6 이전
			String driver_mysql_pre6 = "com.mysql.jdbc.Driver";
			String url_mysql_pre6 = "jdbc:mysql://localhost:3306/testdb";
		
		
		// Oracle DB 접속 계정 정보
		String user = "myjsp";
		String password = "myjsp";
		
			// MariaDB 접속 계정 정보
			String m_user = "root";
			String m_password = "0000";
		
		// 연결을 위한 객체 생성
		Connection conn = null;
		
		// Connection 값을 판별하는 boolean 변수 생성
		boolean connect = false;
		
			// Oracle DB 연결 
			try { 
				// 1. Driver 로딩
				Class.forName(driver_oracle);
				
				// 2. DB 연결
				conn = DriverManager.getConnection(url_oracle, user, password);
				connect = true;
				
			} catch (ClassNotFoundException cnfe) { // 1번 오류 발생 시 캐치
				connect = false;
				System.out.println("DB 드라이버 로딩 실패 : " + cnfe);
				
			} catch (SQLException sqle) { // 2번 오류 발생 시 캐치
				connect = false;
				System.out.println("DB 접속 실패 : " + sqle);
			
			} catch (Exception e) { // 기타 오류 발생 시 캐치
				connect = false;
				System.out.println("Unknown Error");
				e.printStackTrace(); // 에러(e)에 관련된 내용들 모두 출력
			} 
		
			
/*				// MariaDB 연결
				try { 
					// 1. Driver 로딩
					Class.forName(driver_maria);
					
					// 2. DB 연결
					DriverManager.getConnection(url_maria, m_user, m_password);
					connect = true;
					
				} catch (ClassNotFoundException cnfe) { // 1번 오류 발생 시 캐치
					connect = false;
					System.out.println("DB 드라이버 로딩 실패 : " + cnfe);
					
				} catch (SQLException sqle) { // 2번 오류 발생 시 캐치
					connect = false;
					System.out.println("DB 접속 실패 : " + sqle);
				
				} catch (Exception e) { // 기타 오류 발생 시 캐치
					connect = false;
					System.out.println("Unknown Error");
					e.printStackTrace(); // 에러(e)에 관련된 내용들 모두 출력
				} 
			
*/			
			
		if (connect) {
			System.out.println("DB 연결 성공!");
		} else {
			System.out.println("DB 연결 실패 ㅠㅠ");
		}
		
		
		
	}
	
}
