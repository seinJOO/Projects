package com.jdbc;

import java.sql.*;
import java.util.Scanner;

//		입력한 id가 이미 존재하면 데이터 덮어쓰기

public class JDBCdelete {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();
		
		Scanner scan = new Scanner(System.in);
		System.out.print("id > ");
		String id = scan.next();
		
		String sql = "SELECT * FROM member where id = '" + id + "'";
		rs = stmt.executeQuery(sql);
		
		if (rs != null) {
			sql = "DELETE FROM member WHERE id = '"+ id +"'";
			stmt.executeUpdate(sql);
		} 
		
		System.out.print("pw > ");
		String pw = scan.next();
		System.out.print("name > ");
		String name = scan.next();
		System.out.print("email > ");
		String email = scan.next();
		
		sql = "INSERT INTO member VALUES ('" + id + "','" + pw + "','" + name+ "','" + email + "')";
		
		int result = stmt.executeUpdate(sql);
		
		if (result == 1) {
			System.out.println("입력 성공");
		} else {
			System.out.println("입력 실패ㅠㅠ");
		}
		
		conn.close();
		stmt.close();
				
	}
}
