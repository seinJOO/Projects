package com.ok;

public class MemberVO {

	// VO클래스는 DB컬럼을 자바변수로 동일하게 선언
	// 은닉(private)된 클래스로 생성
	
	private String id;
	private String pw;
	private String name;
	private String phone1;
	private String phone2;
	private String email;
	private String gender;
	
	// 단축키 alt + shift + s
	
	// 기본 생성자
	public MemberVO() {
	}

	// 멤버 생성자 : 모든 멤버변수에 대해 초기화하는 생성자
	public MemberVO(String id, String pw, String name, String phone1, String phone2, String email, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.email = email;
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
}
