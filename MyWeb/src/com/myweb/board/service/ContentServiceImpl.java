package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class ContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		 1. dao에 getContent(num) 메서드를 생성하고 호출
		 2. getContent() 메서드에서는 num을 가지고, 게시글에 대한 정보를 vo객체에 담는 코드를 작성
		 3. 메서드 리턴타입 BoardVO
		 4. 화면 전송을 위한 리턴값을 vo라는 이름으로 강제 저장 처리
		 */
		BoardDAO dao = BoardDAO.getInstance();
		String num =  request.getParameter("num");
			String hit = request.getParameter("hit");		
			
			// cookie를 이용해 방문자수 카운트  (쿠키를 생성하면 서버에 요청할 때 자동으로 request에 담겨서 전달됨)			
			Cookie[] arr = request.getCookies();		
			//쿠키 검사(게시글 번호에 해당하는 쿠키값인지 확인)
			boolean bool = true;
			for (Cookie c : arr) {
				if (c.getName().equals("hitNum"+num)) { 
					bool = false;
					break;
				}
			}
			//조회수 업데이트
			if (bool) {
				dao.upHit(num);	//hitNum 값을 +1 해서 업데이트하는 메서드
			}	
			
		BoardVO vo = dao.getContent(num);
		request.setAttribute("vo", vo);
		
			//쿠키 생성(처음에 쿠키값이 있는지 확인한 후에 업데이트 된 hit값을 넣어줘야 하기 때문에 쿠키는 마지막에 생성!)
			Cookie cookie = new Cookie("hitNum"+num, hit);
			cookie.setMaxAge(60*60);
			response.addCookie(cookie);
	}

}
