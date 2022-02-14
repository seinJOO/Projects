package test01;

import java.sql.ResultSet;

import org.springframework.context.support.GenericXmlApplicationContext;

import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;

public class MainClass {
	public static void main(String[] args) {
		//SpringTest st = new SpringTest();
		//st.method();
		
		// XML 로드, applicationContext.xml을 이용한 객체 ct 생성
		String resources = "classpath:applicationContext.xml";		
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext(resources);
		
		// ct 객체에 의해 생성된 bean을 호출(getBean("객체이름",불러올 클래스 object)
		SpringTest test = ct.getBean("good", SpringTest.class);		
		test.method(); // test 객체에 스프링 Container에 생성되어 호출된 객체 저장. method() 사용
		
		// ApplicationContext.xml에서 정의된 Bean을 호출
		Hotel hotel = ct.getBean("hotel",Hotel.class);
		// XML에 정의된 DI에 의해서 Chef 클래스를 별도로 불러오지 않고, 정의하지 않은 상태에서 불러옴 => 의존성 주입 처리됨.
		hotel.getChef().cook();		
		
		DatabaseDev DBdev = ct.getBean("DBdev", DatabaseDev.class);		
		DBdev.test();
		ResultSet rs = DBdev.testQuery("SELECT * FROM users");
		try {
			System.out.println(" 아이디 : " + rs.getString("id") + " 비밀번호 : " + rs.getString("pw") + " 이름 : " + rs.getString("name"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ct.close(); // 사용한 객체 닫기
		
		
		
	}
}
