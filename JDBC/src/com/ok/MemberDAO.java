package com.ok;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context; // context는 이걸로 import
import javax.naming.InitialContext;
import javax.sql.DataSource; 


public class MemberDAO {
	
	// Connection Pool을 활용한 JDBC 연결 (사전에 서버의 context.xml의 resource 정보 추가하기)
	
	private DataSource ds; // 데이터 소스 객체 생성
	private Context ct; // javax.naming.*
	
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {		
		try {	// context 정보를 이용해서 커넥션을 만들기
			ct = new InitialContext(); // 이니셜 컨텍스트 객체 생성 - context.xml파일 관련 명령을 처리할 수 있는 객체를 생성과 동시에 초기화
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/oracle"); //이니셜 컨텍스트로부터 context.xml의 설정값을 찾음
			// 이후에는 연결할 때마다 데이터소스 ds를 호출해서 쓰면 됨!!!!
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}	
/*	클래스를 통한 JDBC 연결	
 
	DAO는 단수 DB연동을 담당하는 클래스
	일반 클래스로 만들면 메모리 과부하가 올 수 있다
	싱글톤 패턴을 적용하여 객체를 1개로 제한	

	// 1. 스스로의 객체를 멤버변수로 선언하고 1개로 제한
	private static MemberDAO instance = new MemberDAO();
	
	// 2. 외부에서 객체를 생성할 수 없도록 생성자에 private 처리를 함
	private MemberDAO() {
		// 생성자가 한 번 동작할 때 아래 내용을 처리 (생성자가 만들어지면 드라이버 로딩)
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		} catch (Exception e) {
			System.out.println("드라이버 로딩 실패!");
		}
	}
		
	// DB 연동을 위해 필요한 변수와 객체 선언 (이 클래스에서만 사용되어야 하기 때문에 private(은닉)객체로 선언한다)
	private String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private String user = "myjsp";
	private String password = "myjsp";
*/	
	// 3. 외부에서 객체를 요구할 때 getter메서드만 써서 반환
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
// =============== 기능을 메서드로 선언 ===============
// 회원 가입 메서드
	public int join(MemberVO vo) {		
		int result = 0;
		String sql = "INSERT INTO testusers VALUES (?,?,?,?,?,?,?)";
		try {
			//conn = DriverManager.getConnection(url, user, password);
			conn = ds.getConnection();	// 커넥션풀 생성!
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone1());
			pstmt.setString(5, vo.getPhone2());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getGender());
			
			// SQL 실행
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
// 로그인 메서드
	public String login(String id,String pw) {
		String name = null;
		String sql = "select name from testusers where id=? and pw = ?";
		
		try {
			//conn = DriverManager.getConnection(url,user,password);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(conn!= null) conn.close();
			if(pstmt!= null) pstmt.close();
			if(rs!=null) rs.close();
		}catch(Exception e2) {
			e2.printStackTrace();
		} 
		}

		return name;
	}
	
// 회원정보 조회
		public MemberVO getInfo(String id) {
				MemberVO vo = null;
				
				String sql = "select * from testusers where id =?";
				
				
				try {
					//객체생성
					//conn = DriverManager.getConnection(url,user,password);
					conn = ds.getConnection();
					
					//객체생성
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					//SQL쿼리 실행
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						//rs.getString 을 사용해서 값을 얻어오는 코드를 작성
						String name = rs.getString("name");
						String phone1 = rs.getString("phone1");
						String phone2 = rs.getString("phone2");
						String email = rs.getString("email");
						String gender = rs.getString("gender");			
						
						vo = new MemberVO(id,null,name,phone1,phone2,email,gender);
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(conn!= null)conn.close();
						if(pstmt!= null)pstmt.close();
						if(rs!=null) rs.close();
					
					}catch (Exception e) {
					
					}
				}
				return vo;
		}
		
// 회원정보 업데이트
			public int update(MemberVO vo) {
				int result = 0;
				String sql = "update testusers set pw =?, name =?, phone1 =?, phone2=?, email=?, gender=? where id =?";
				
				try {
					//conn = DriverManager.getConnection(url,user,password);
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, vo.getPw());
					pstmt.setString(2, vo.getName());
					pstmt.setString(3, vo.getPhone1());
					pstmt.setString(4, vo.getPhone2());
					pstmt.setString(5, vo.getEmail());
					pstmt.setString(6, vo.getGender());
					pstmt.setString(7, vo.getId());
					
					result = pstmt.executeUpdate();
				
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(conn!=null)conn.close();
						if(pstmt!=null)pstmt.close();
						
					}catch(Exception e2) {
						
					}
					
				}
				
				return result;
				
			}
			
// 회원정보 삭제
			public int delete(String id) {
				int result = 0;
				
				String sql = "DELETE FROM testusers WHERE id = ?";
				
				try {
					//conn = DriverManager.getConnection(url, user, password);
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
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
	
}
