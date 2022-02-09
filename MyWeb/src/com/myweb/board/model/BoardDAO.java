package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;


import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

public class BoardDAO {
	
	// 1. 싱글톤 : 스스로 객체를 멤버변수로 선언하고 1개로 제한
	// 2. 외부에서 객체를 생성할 수 없도록 private 설정
	
	private static BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {		
		// 커넥션풀 꺼내기
		try {
			InitialContext ctx = new InitialContext(); // context.xml에 설정된 것을 저장
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); // context.xml 환경설정에서 name = "jdbc/oracle" 으로 저장된 이름값 찾기
			
		} catch (Exception e) {
			System.out.println("커넥션 풀링 에러 발생!");
		}
	}
	
	// 3. 외부에서 객체를 요구할 때 getter 메서드만 써서 반환
	public static BoardDAO getInstance() {
		return instance;
	}
	
// -------------- 중복되는 코드를 멤버변수로 선언 --------------
	private static DataSource ds; // 객체지향적 언어에서는 아래에서 선언해주는 것도 가능하다 ~^^
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
// ---(↑ 모델 작업 끝!)------- 컨트롤 작업 = 메서드 구현 --------------	
	
	public void regist(String writer, String title, String content){
		String sql = "INSERT INTO board (writer, title, content) VALUES (?, ?, ?)";		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	public ArrayList<BoardVO> getList(){
		ArrayList<BoardVO> list = new ArrayList<>();
		String sql = "SELECT * FROM board ORDER BY num DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO vo = new BoardVO(rs.getInt("num"), rs.getString("writer"), rs.getString("title"), rs.getString("content"), rs.getTimestamp("regdate"), rs.getInt("hit"));								
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
	
}
