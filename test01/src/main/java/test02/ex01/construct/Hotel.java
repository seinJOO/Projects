package test02.ex01.construct;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Hotel {	
	
	/* @Autowired : 속성값,setter,생성자에 적용 가능 / (private Chef chef = 속성값)
					= <constructor-arg ref="chef" /> 태그와 같은 기능 
			Hotel 클래스의 객체는 chef값이 있어야 생성됨 > 데이터타입(Chef)를 찾음 -> chef객체가 없어도 자동으로 Hotel객체가 생성됨 
					속성값은 데이터타입->이름->변수명 순서로 찾는다	 */	
	
	/*@Resource (name="chef") -> 빈의 이름을 직접 지정, 이 이름으로 불러오겠다고 선언하는 것!
	 							 이름을 지정하지 않으면 타입을 봄 (chef라는 이름이 없다면 -> Chef클래스의 객체를 찾음)
	 																	*/
	@Autowired(required=false) // Autowired의 기본값은 true임!
	@Qualifier("c2")
	private Chef chef;	
	

	private Hotel(Chef chef) {
		this.chef = chef;
		System.out.println("Hotel에서 DI된 Chef 객체 : "+this.chef);
	}

	public Chef getChef() {
		return chef;
	}

	public void setChef(Chef chef) {
		this.chef = chef;
	}

}
