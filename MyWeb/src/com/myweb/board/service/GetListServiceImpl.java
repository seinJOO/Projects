package com.myweb.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();		
		
		// 목록 조회 메서드(getList()) 생성 후 결과를 List형태로 받음 -> 다음으로 전달하기 위해 request객체에 강제 저장		
		ArrayList<BoardVO> list = dao.getList();
		request.setAttribute("list", list);
	}

}
