package com.myweb.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;



public class UserDAO {
	
		
		private DataSource ds; 
		private Context ct; 
		
		private static UserDAO instance = new UserDAO();
		
		private UserDAO() {
			try {
				ct = new InitialContext();
				ds = (DataSource)ct.lookup("java:comp/env/jdbc/oracle");
			} catch (Exception e) {
				System.out.println("db 연결 오류");
			}
		}
		
		public static UserDAO getInstance() {
			return instance;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		

/*	
	DAO는 단수 DB연동을 담당하는 클래스
	여러 개 생성하도록 일반 클래스로 만들면, 메모리 과부하가 올 수 있다
	싱글톤 패턴을 적용해서 객체를 1개로 제한	

	// 1. 스스로의 객체를 멤버변수로 선언하고 1개로 제한
	private static UserDAO instance = new UserDAO();
	
	// 2. 외부에서 객체를 생성할 수 없도록 생성자에 private을 부여
	private UserDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("드라이버 호출 시 에러 발생");
		}
	}
	
	// 3. 외부에서 객체를 요구할 때 getter 메서드를 사용하여 반환
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	// ========== 중복되는 코드는 멤버변수로 선언 ==========
	// DB연동에 필요한 변수 및 객체 선언
	private String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private String user = "myjsp";
	private String password = "myjsp";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
*/	
// ====================== ID 확인 메서드
	
	public boolean idCfm(String id) {
		
		boolean result = true;
		String sql = "SELECT * FROM users WHERE id = ?";
				
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
		
	}
	
	
// ====================== 회원가입 메서드
	
	public int join(UserVO vo) {
		int result = 0;
		String sql = "INSERT INTO users VALUES (?,?,?,?,?,default)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddr());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}
	// ====================== 로그인 메서드(pw 반환)
	
	public String login(String id) {		
		String sql = "SELECT pw FROM users WHERE id = ?";
		String result = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("pw");
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	// ====================== id에 속한 정보 저장 메서드
	
	public UserVO getUserInfo(String id) {
		UserVO vo = new UserVO();
		String sql = "SELECT * FROM users WHERE id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setPw(rs.getString("pw"));
				vo.setEmail(rs.getString("email"));
				vo.setAddr(rs.getString("address"));
				vo.setRegdate(rs.getTimestamp("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	// ====================== 비밀번호 변경 메서드
	
	public int changePw(String id, String newpw) {
		int result = 0;
		String sql = "UPDATE users SET pw = ? WHERE id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newpw);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	// ====================== 회원정보 수정 메서드
	
	public int update(UserVO vo) {
		int result = 0;
		String sql = "UPDATE users SET (name, email, address) = (?,?,?) WHERE id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getAddr());
			pstmt.setString(4, vo.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	// ====================== 회원정보 삭제 메서드
	
	public int withdraw(UserVO vo) {
		int result = 0;
		String sql = "";
		
		try {
			conn = ds.getConnection();
			sql = "INSERT INTO tmp VALUES (?,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddr());
			result = pstmt.executeUpdate();
			if (result == 1) {
				sql = "DELETE FROM users WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getId());
				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}	
		return result;
	}
}
