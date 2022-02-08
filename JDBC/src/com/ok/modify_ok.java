package com.ok;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/modify_ok")
public class modify_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public modify_ok() {
        super();
    }
	// form 태그를 통한 정보수집 외의 작업은 get에서 진행!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			//정보 수정을 위한 페이지
		
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			//DAO생성
			MemberDAO dao = MemberDAO.getInstance();
			
			//getInfo()를 실행결과를 vo에 받게 처리....
			MemberVO vo = dao.getInfo(id);
			
			//vo객체를 update.jsp 에게 포워드 처리
			request.setAttribute("vo", vo);
			request.getRequestDispatcher("update.jsp").forward(request, response);
		
		
/*		DAO 사용 전 해결법
		// 정보 수정을 위한 페이지 이동 시 DB정보를 전달하기 위한 작업 - forward 할 예정!
		
		// session에서 id값 얻어오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		// DB 연동
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String user = "myjsp";
		String password = "myjsp"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM testusers WHERE id = ?";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String email = rs.getString("email");
				String gender = rs.getString("gender");

				request.setAttribute("pw", pw);
				request.setAttribute("name", name);
				request.setAttribute("phone1", phone1);
				request.setAttribute("phone2", phone2);
				request.setAttribute("email", email);
				request.setAttribute("gender", gender);
				RequestDispatcher dp = request.getRequestDispatcher("update.jsp");
				dp.forward(request, response);
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
	
*/	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
