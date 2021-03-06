package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;


import javax.naming.InitialContext;
import javax.servlet.http.Cookie;
import javax.sql.DataSource;

import com.myweb.util.Criteria;
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
	
	// 페이징 게시물 목록 처리 메서드
	public ArrayList<BoardVO> getList(Criteria cri) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql =  "select * from (select rownum r, b.* from (select * from board order by num desc) b where ? >= rownum) where r >= ? order by r";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getCount_oracle());
			pstmt.setInt(2, cri.getPageStart());
			// 검증
			System.out.println("끝:" + cri.getCount_oracle());
			System.out.println("시작:"+cri.getPageStart());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO vo = new BoardVO(rs.getInt("num"), rs.getString("writer"), 
						rs.getString("title"), rs.getString("content"), 
						rs.getTimestamp("regdate"), rs.getInt("hit"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
		
	}
	
	public int getTotal() {
		int total = 0;
		String sql = "SELECT COUNT(*) as total FROM board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt("total");
				System.out.println("총 게시물 개수 :" + total);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return total;
	}
	
	
/*	페이징 작업 전 게시글 목록 조회
	public ArrayList<BoardVO> getList(){
		ArrayList<BoardVO> list = new ArrayList<>();
		String sql = "SELECT * FROM board ORDER BY num DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO vo = new BoardVO(rs.getInt("num"), rs.getString("writer"), 
										rs.getString("title"), rs.getString("content"), 
										rs.getTimestamp("regdate"), rs.getInt("hit"));								
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
*/	
	public BoardVO getContent(String num) {
		BoardVO vo = null;
		String sql = "SELECT * FROM board WHERE num = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new BoardVO(rs.getInt("num"), rs.getString("writer"), 
								rs.getString("title"), rs.getString("content"), 
								rs.getTimestamp("regdate"), rs.getInt("hit"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	public void update(String num, String title, String content) {
	
		String sql = "UPDATE board SET title = ?, content = ? WHERE num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	public void delete(String num) {
		String sql = "DELETE FROM board WHERE num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}		
	}
	
	public void upHit(String num) {
		
		String sql = "UPDATE board SET hit = hit + 1 WHERE num = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}		
	}
	
	
	
	
}
