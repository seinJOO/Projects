package com.myweb.controller;
// 모든 기능 작업은 인터페이스-클래스를 통해 구현하기 때문에 컨트롤러에서는 인터페이스를 상속받아서 기능을 구현한 각 클래스로 경로 안내만 해주면 됨!
// 각 클래스에서는 DAO에서 작성한 메서드를 통해 받아낸 값을 다시 전달해주는 역할을 함!!
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.service.ContentServiceImpl;
import com.myweb.board.service.DeleteServiceImpl;
import com.myweb.board.service.GetListServiceImpl;
import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegisterServiceImpl;
import com.myweb.board.service.UpdateServiceImpl;

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
			
		} else if (command.equals("/board/write.board")) {	
			// 글 작성 페이지 (View)로 이동	
			response.sendRedirect("/MyWeb/board/board_write.jsp");			
		
		} else if (command.equals("/board/register.board")) {
			// 글 등록 - writeform에서 전달된 값을 처리 
			// 목록 조회 메서드(getList()) 생성 후 결과를 List형태로 받음 -> 다음으로 전달하기 위해 request객체에 강제 저장	
			service = new RegisterServiceImpl();
			service.execute(request, response);
			response.sendRedirect("list.board");
		
		} else if (command.equals("/board/content.board")) {
			// 글 상세 보기
			/*
			 1. dao에 getContent(num) 메서드를 생성하고 호출
			 2. getContent() 메서드에서는 num을 가지고, 게시글에 대한 정보를 vo객체에 담는 코드를 작성
			 3. 메서드 리턴타입 BoardVO
			 4. 화면 전송을 위한 리턴값을 vo라는 이름으로 강제 저장 처리
			 */
			service = new ContentServiceImpl();
			service.execute(request, response);
				// 게시글 내용을 가지고 화면으로 이동 -> forward로 결과값 전달 예정
			RequestDispatcher dp = request.getRequestDispatcher("board_content.jsp");
			dp.forward(request, response);
			
		} else if (command.equals("/board/modify.board")) {
			// 글 수정페이지
			service = new ContentServiceImpl();
			service.execute(request, response);
			RequestDispatcher dp = request.getRequestDispatcher("board_modify.jsp");
			dp.forward(request, response);
			
		} else if (command.equals("/board/update.board")) {
		/*  	DB에 글 수정하기
				1. UpdateServiceImpl을 생성
				2. 서비스 영역에서 num, title, content를 받아서 update() 메서드를 실행
				3. DAO의 update()에서 update 구문으로 데이터 수정
				4. 페이지 이름을 상세보기화면으로 연결(컨트롤러를 거쳐서)
		*/
			service = new UpdateServiceImpl();
			service.execute(request, response);
			String num = request.getParameter("num");
			response.sendRedirect("content.board?num=" + num);
			
		} else if (command.equals("/board/delete.board")) {
		/* 		DB에 글 삭제하기
				1. DeleteServiceImpl을 생성
				2. 서비스 영역에는 num을 받아서 delete() 메서드를 실행
				3. DAO의 delete()에서 delete 구문으로 데이터 수정
				4. 페이지 목록으로 이동 처리 - 추가로 board_modify.jsp에서 삭제를 javascript를 이용하여 확인하는 function 생성 
		*/
			service = new DeleteServiceImpl();
			service.execute(request, response);
			response.sendRedirect("list.board");
		}
	
	}

}
