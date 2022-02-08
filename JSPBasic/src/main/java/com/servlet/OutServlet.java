package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OutServlet")
public class OutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿에서 out객체를 사용하는 방법
		// 화면으로 자바스크립트의 형태를 써서 보낼 때 사용함
		
		// 화면으로 응답보낼 문서에 대한 정보를 기술(HTTP헤더 정보)
		response.setContentType("text/html;character=utf-8");
		// = response.setCharacterEncodint("utf-8");
		
		PrintWriter out = response.getWriter(); // 이게 바로 톰캣에서 자동으로 만들어줬던 out 객체!
		
		out.println("<p>안녕하세요</p>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
