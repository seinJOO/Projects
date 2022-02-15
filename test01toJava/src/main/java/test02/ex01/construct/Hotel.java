package test02.ex01.construct;

public class Hotel {
	
	private Chef chef;	

	public Hotel(Chef chef) {
		this.chef = chef;
	}


	public Chef getChef() {
		return chef;
	}

	public void setChef(Chef chef) {
		this.chef = chef;
	}

}
