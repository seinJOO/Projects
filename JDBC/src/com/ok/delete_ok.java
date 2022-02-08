package com.ok;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete_ok")
public class delete_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public delete_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.delete(id);
		
		if (result == 1) {
			session.invalidate();
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('회원 탈퇴가 완료되었습니다'); location.href='"+"login.jsp"+"';</script>"); 
			writer.close();
			
		} else response.sendRedirect("mypage.jsp");
		
		
/*		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String user = "myjsp";
		String password = "myjsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			String sql = "DELETE FROM testusers where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				session.invalidate();
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter writer = response.getWriter(); 
				writer.println("<script>alert('회원 탈퇴가 완료되었습니다'); location.href='"+"login.jsp"+"';</script>");
				writer.close();
			} else {
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('회원 탈퇴 실패!'); location.href='"+"mypage.jsp"+"';</script>");
				writer.close();
			}
			
		} catch (ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException sqle) {
			System.out.println("sql 구문오류");
		} catch (Exception e) {
			System.out.println("알 수 없는 오류");
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
*/	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
