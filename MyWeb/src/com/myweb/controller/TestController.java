package com.myweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 컨트롤러 : 내용을 받아서 처리해주는 기능 - 생성할 때는 매핑 형식을 확장자 패턴 방식으로 변경
	@WebServlet("*.test")
//@WebServlet("/TestController")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response); // doAction 메서드에 어떤 방법으로든 전달하도록 설정
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// http://localhost:8080/ 이후의 경로들을 가져옴 (URL은 앞경로 포함)
		String path = request.getContextPath(); // 프로젝트명을 가져옴
		String command = uri.substring(path.length()); // 경로 내에서 불필요한 프로젝트명 제거
		
		System.out.println("URI 정보 : " + uri);
		System.out.println("contextpath 정보 : " + path);
		System.out.println(command);
		
		if (command.equals("/controller/join.test")) { 
			//컨트롤러 폴더에 있는 join.test로 접근했을 경우  회원가입 관련 동작을 실행
			System.out.println("조인 동작 구현");
			
		}
		
		if (command.equals("/controller/login.test")) { 
			System.out.println("로그인 동작 구현");
			
		}
		
		if (command.equals("/controller/update.test")) { 
			System.out.println("수정 요청 동작 구현");
			
		}
		
		if (command.equals("/controller/delete.test")) { 
			System.out.println("삭제 요청 동작 구현");
			
		}
		
		
		
	}

}
