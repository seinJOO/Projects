package com.ok;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login_ok")
public class login_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public login_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			//DAO객체생성 
			MemberDAO dao = MemberDAO.getInstance();
			
		    String name = dao.login(id, pw);
		    
			if (name != null) {
				HttpSession session = request.getSession(); //session 객체 생성
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				response.sendRedirect("mypage.jsp");
			}else {
				response.sendRedirect("login_fail.jsp");
			}
/*
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String user = "myjsp";
		String password = "myjsp";
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM testusers WHERE id = ? and pw = ?";
		try {
			Class.forName(driver); // 드라이버 로딩
			conn = DriverManager.getConnection(url, user, password); // 커넥션 객체 생성
			pstmt = conn.prepareStatement(sql); // preparedStatement 객체 생성 및 sql 작성
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery(); // 쿼리 실행
			if (rs.next()) {
				// 아이디 패스워드 일치할 경우
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("name", rs.getString("name"));
				response.sendRedirect("mypage.jsp");
			} else {
				// 로그인 실패 - 아이디나 비밀번호 틀린 경우
				response.sendRedirect("login_fail.jsp");
			}
			
		} catch (Exception e) {
			
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (Exception e2) {
				
			}
		}
		
*/		
	}

}
