package test03.ex01.auto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class AuTest {
	
	private MemTest mem;

	public AuTest() {
		System.out.println(this.mem);		
	}

	public MemTest getMem() {
		return mem;
	}
	
	@Autowired
	@Qualifier("t2")
	public void setMem(MemTest mem) {
		System.out.println("setter :"+mem);
		this.mem = mem;
	}
	
	

	
	
    

}
