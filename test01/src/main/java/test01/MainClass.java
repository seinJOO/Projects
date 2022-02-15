package test01;

import java.sql.ResultSet;

import org.springframework.context.support.GenericXmlApplicationContext;

import test02.ex01.construct.Chef;
import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;
import test03.ex01.auto.AuTest;
import test03.ex01.auto.MemTest;

public class MainClass {
	public static void main(String[] args) {
		//SpringTest st = new SpringTest();
		//st.method();
		
		//1. XML 로드, applicationContext.xml을 이용한 객체 ct 생성
		String resources = "classpath:applicationContext.xml";		
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext(resources);
		
		
		//2. ct 객체에 의해 생성된 bean을 호출(getBean("객체이름",불러올 클래스 object)
		SpringTest test = ct.getBean("good", SpringTest.class);		
		test.method(); // test 객체에 스프링 Container에 생성되어 호출된 객체 저장. method() 사용
		
		
		//3. ApplicationContext.xml에서 정의된 Bean을 호출
		Hotel hotel = ct.getBean("hotel",Hotel.class);
		// XML에 정의된 DI에 의해서 Chef 클래스를 별도로 불러오지 않고, 정의하지 않은 상태에서 불러옴 => 의존성 주입 처리됨 (기본값이 싱글톤)
		hotel.getChef().cook();
		System.out.println("hotel 객체 : " + hotel);		
		Hotel hotel2 = ct.getBean("hotel",Hotel.class);	// 싱글톤이기 때문에 참조되는 객체의 위치가 동일함
		System.out.println("hotel2 객체 : " + hotel2);
		
			//프로토타입 설정 후
			SpringTest test2 = ct.getBean("good", SpringTest.class);
			System.out.println("프로토타입1 : " + test);
			System.out.println("프로토타입2 : " + test2);
		
		// .xml에서 qualifier 태그를 통해 각각 이름을 다르게 지정해줬기 때문에, 다른 객체가 생성된다!
		Chef cf = ct.getBean("chef", Chef.class);
		System.out.println("chef 객체 : " + cf);
		Chef cf2 = ct.getBean("chef2", Chef.class);
		System.out.println("chef2 객체 : " + cf2);
		
		//test03.ex01.auto
		AuTest atest = ct.getBean("auTest", AuTest.class);
		MemTest mtest = ct.getBean("memTest", MemTest.class);
		MemTest mtest2 = ct.getBean("memTest2", MemTest.class);
		
		System.out.println("atest 결과 : "+atest.getMem().getUid());
		System.out.println("memTest 결과 : "+mtest.getUid());
		System.out.println("memtest2 결과 : "+mtest2.getUid());
		
		
		/*	bean설정을 통해 sql구문 실행하기
		DatabaseDev DBdev = ct.getBean("DBdev", DatabaseDev.class);
		DBdev.test();
		ResultSet rs = DBdev.testQuery("SELECT * FROM users");
		try {
			System.out.println(" 아이디 : " + rs.getString("id") + " 비밀번호 : " + rs.getString("pw") + " 이름 : " + rs.getString("name"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		ct.close(); // 사용한 객체 닫기
		
		
		
	}
}
