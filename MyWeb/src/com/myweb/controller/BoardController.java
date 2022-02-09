package com.myweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.service.GetListServiceImpl;
import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegisterServiceImpl;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }
    	// get, post 요청을 하나의 메서드(doAction)으로 연결
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
		
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// context path를 제거 
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		System.out.println(command);
		
		IBoardService service = null;
		
			// 요청이 들어오면 해당 화면(view)으로 이동 (command에 따른 동작 구현)
		if (command.equals("/board/list.board")) {
				// 게시글 목록을 가지고 화면으로 이동 -> forward로 결과값 전달 예정
			service = new GetListServiceImpl();
			service.execute(request, response);		//response.sendRedirect("/MyWeb/board/board_list.jsp");
			RequestDispatcher dp = request.getRequestDispatcher("/board/board_list.jsp");
			dp.forward(request, response);
			
			// 글 작성 페이지 (View)로 이동	
		} else if (command.equals("/board/write.board")) {			
			response.sendRedirect("/MyWeb/board/board_write.jsp");
			
			// 글 등록
		} else if (command.equals("/board/register.board")) {			
			service = new RegisterServiceImpl();
			service.execute(request, response);
			response.sendRedirect("board_list.jsp");
		}
	
	}

}
