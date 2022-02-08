package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/forward") // url맵핑
public class forward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public forward() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		// request에 일회성으로 사용하기 위해 값을 강제로 저장
		// request.setAttribute("변수명",값);
		request.setAttribute("name","홍길동");
		// response.sendRedirect("actionTag/forward_ex04.jsp"); 
				//ㄴ> request를 위임하지 않고 새로운 request를 생성하게 됨 (request의 생명주기를 벗어남)
		RequestDispatcher dp = request.getRequestDispatcher("actionTag/forward_ex04.jsp"); //서블릿을 이용한 forward를 사용할 때 씀! (***)
				// ex04의 페이지를 forward.java로 가져온 것과 같음!!!!!!
		dp.forward(request, response); // ex03의 form태그에서 받은 값을 ex04로 넘긴다!
	}

}






