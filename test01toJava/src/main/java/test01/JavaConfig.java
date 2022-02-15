package test01;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import test02.ex01.construct.Chef;
import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;

@Configuration
public class JavaConfig {
	
	
	//<bean id="good" class="test01.SpringTest"/>
	@Bean
	public SpringTest good() {
	return new SpringTest();
	}
	
	//<bean id="chef" class="day02.ex01.construct.Chef" />
	@Bean
	public Chef chef() {
	return new Chef();
	}
	
	//<bean id="hotel" class="day02.ex01.construct.Hotel">
	//	<constructor-arg ref="chef"></constructor-arg>
	//</bean>
	@Bean
	public Hotel hotel() {
	//Hotel은 생성자로 Chef객체를 받기 때문에 매개값으로 chef()함수를 주입!!!!		
	return new Hotel(chef());
	}
	
	@Bean
	public DatabaseDev DBdev() {
	//setter를 통해 값을 받고 있기 때문에 객체를 생성하고 세터 지정후 반환합니다.
	DatabaseDev dv = new DatabaseDev();
	dv.setUrl("jdbc:oracle:thin:@localhost:1521/XEPDB1");
	dv.setUid("myjsp");
	dv.setUpw("myjsp");
	return dv;
	}

}
