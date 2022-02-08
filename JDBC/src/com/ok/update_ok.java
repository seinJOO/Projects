package com.ok;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update_ok")
public class update_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public update_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Form 데이터 처리
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");

		//1. 폼 데이터 값 저장(VO에 저장)
	     MemberVO vo = new MemberVO(id,pw,name,phone1,phone2,email,gender);
	     //2. DAO객체 생성. update()사용
	     MemberDAO dao = MemberDAO.getInstance();
	    
	     int result = dao.update(vo);
	     
	     if(result == 1) {
	    	 response.sendRedirect("update_success.jsp");
	     }else {
	    	 response.sendRedirect("mypage.jsp");
	     }
	     
	     /*  
	       
	       1. 폼 데이터 값을 VO에 저장
	       2. DAO 객체를 생성하고, update 메서드로 vo객체를 전달
	       3. update 메서드 안에서는 executeUpdate()메서드로 실행
	       	1을 반한하면 update_success.jsp로 이동
	       	0을 반환하면 mypage.jsp로 이동
	       
	      */
		
/*		
		// DB 처리
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String user = "myjsp";
		String password = "myjsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);			
			String sql = "UPDATE testusers SET pw = ?, name = ?, phone1 = ?, phone2 = ?, email = ?, gender = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, phone1);
			pstmt.setString(4, phone2);
			pstmt.setString(5, email);
			pstmt.setString(6, gender);
			pstmt.setString(7, id);
			int result = pstmt.executeUpdate();
			
				if (result == 1) {
					response.sendRedirect("update_success.jsp");
				} else {
					response.sendRedirect("update_fail.jsp");
				}	
			
			
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
*/		
	}
		
}
