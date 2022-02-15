package test;

import java.sql.ResultSet;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import test01.JavaConfig;
import test01.SpringTest;
import test02.ex01.construct.Chef;
import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;

public class MainClass {
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(JavaConfig.class);
		SpringTest t = ctx.getBean("good", SpringTest.class);
		t.method1();
		t.method2();	
		
		Hotel h = ctx.getBean("hotel", Hotel.class);
		h.getChef().cook();
		
		Chef cf = ctx.getBean("chef", Chef.class);
		System.out.println("chef 객체 : " + cf);
		
		DatabaseDev DBdev = ctx.getBean("DBdev", DatabaseDev.class);
		DBdev.test();
		ResultSet rs = DBdev.testQuery("SELECT * FROM users");
		try {
			System.out.println(" 아이디 : " + rs.getString("id") + " 비밀번호 : " + rs.getString("pw") + " 이름 : " + rs.getString("name"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ctx.close();
	}
}
