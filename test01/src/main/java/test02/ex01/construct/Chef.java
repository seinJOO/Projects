package test02.ex01.construct;

import org.springframework.stereotype.Component;

@Component	// 컴포넌트 스캔으로 의존성 주입 - 알아서 bean으로 들어가게 됨
public class Chef {
	
	public void cook() {
		System.out.println("맛난 파스타 요리");
	}
	
}
