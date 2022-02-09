package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IBoardService {
/*	
	Service 클래스에서 구현할 메서드를 추상 메서드로 선언 => 어떻게 사용할 지 내용을 정의(구현하지 않음!!)
	request와 response의 정보를 그대로 전달받을 수 있게 선언
	
	
*/	
	
	public void execute(HttpServletRequest request, HttpServletResponse response) ;
		// 인터페이스는 request와 response값에 대하여 값을 넘겨줄 메서드만 정의하고, 기능은 값을 받은 클래스에서 구현
		// 추상적으로, 러프하게 정의만 내리는 것
	
}
