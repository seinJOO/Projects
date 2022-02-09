package com.myweb.board.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class RegisterServiceImpl implements IBoardService {
	
	// 자동으로 implement를 하면 인터페이스에 정의만 해둔 메서드가 그대로 override됨 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// writeform에서 전달된 값을 처리
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDAO dao = BoardDAO.getInstance();
				
		dao.regist(writer, title, content);
	}

}
