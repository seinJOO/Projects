package com.myweb.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		
		//페이징 작업
				
		Criteria cri = new Criteria();	// 기준값 객체 생성	
		if (request.getParameter("pageNum") != null) {
			// 전달받은 페이지 값 처리
			String pageNum = request.getParameter("pageNum");
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		
		// 목록 조회 메서드(getList()) 생성 후 결과를 List형태로 받음 -> 다음으로 전달하기 위해 request객체에 강제 저장		
		ArrayList<BoardVO> list = dao.getList(cri);	// 페이징 처리에 해당되는 게시물 리스트를 보여줌
		request.setAttribute("list", list);
		
		// 화면에 보여질 페이지 버튼을 계산 처리
		// 총 게시물 숫자 받아오기
			int total = dao.getTotal();
		// 총 게시물 숫자와 기준값을 인자값으로 넘기기
			PageVO vo = new PageVO(total, cri);
		// 다음으로 전달하기 위해 request객체에 강제 저장
			request.setAttribute("pagevo", vo);
	}

}
