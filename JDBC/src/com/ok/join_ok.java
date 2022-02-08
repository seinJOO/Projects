package com.ok;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/join_ok")
public class join_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public join_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// DAO를 통한 데이터 처리
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1") ;
		String phone2 = request.getParameter("phone2");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setPhone1(phone1);
		vo.setPhone2(phone2);
		vo.setEmail(email);
		vo.setGender(gender);
		
		try {
			MemberDAO dao = MemberDAO.getInstance();
			int result = dao.join(vo);
			if (result == 1) {
				response.sendRedirect("join_success.jsp");
			} else {
				response.sendRedirect("join_fail.jsp");
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
/*		DAO 사용하지 않을 때 !!!
		1. 값 받기 
  		2. db연동처리 
  		3. 처리결과에 따른 뷰 - 성공:success -> 회원가입에 성공하셨습니다 출력 / 실패시 실패메세지 전송 - 로그인/회원가입 페이지		
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1") ;
		String phone2 = request.getParameter("phone2");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1"; 
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		//String sql = "INSERT INTO testusers VALUES ('" + id + "','" + pw + "','" + name + "','" + phone1 +"','"+ phone2 +"','" + email+ "','" + gender + "')";	
		String sql = "INSERT INTO testusers VALUES (?,?,?,?,?,?,?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
			//stmt = conn.createStatement();
			//int result = stmt.executeUpdate(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, phone1);
			pstmt.setString(5, phone2);
			pstmt.setString(6, email);
			pstmt.setString(7, gender);
			int result = pstmt.executeUpdate();
		
			if (result == 1) {				
				response.sendRedirect("join_success.jsp");
			} else {
				response.sendRedirect("join_fail.jsp");
			}			
			
		} catch (ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException sqle) {
			System.out.println("DB 접속 실패");
		} catch (Exception e) {
			System.out.println("알 수 없는 오류");
		} finally {
			try {
				if (conn != null) conn.close();
				//if (stmt != null) stmt.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("join_fail.jsp");
			}
		}
		
	*/		
		
		
		
		
	}

}
