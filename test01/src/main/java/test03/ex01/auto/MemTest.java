package test03.ex01.auto;

import org.springframework.stereotype.Component;

@Component
public class MemTest {
	
	private String uid;
	private String upw;
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}
	
	
	

}
