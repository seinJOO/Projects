package com.myweb.util;

public class Criteria {
	// mysql, mariadb : select * from board by num desc limit ?,?;
	// oracle : select * from (select rownum as rnum, num, writer from board 
	//			where ? >= rownum order by num desc) where rnum >= ? ;
	
	private int pageNum; // 조회할 페이지 번호
	private int count; // 몇 개의 데이터를 게시판에 출력할지 결정
	
	public Criteria() {
		// 최초 게시판에 진입할 때 기본값 1번 페이지, 10개 데이터 세팅
		this.pageNum = 1;
		this.count = 10;
	}
	
	public Criteria(int pageNum, int count) {
		// 전달받은 매개변수를 이용한 페이지 값 출력
		super();
		this.pageNum = pageNum;
		this.count = count;
	}
	
	
	public int getPageStart() {
		// return ((pageNum - 1) * count) -> myspl, mariadb limit x, count 구문의 x값을 구하는 메서드
		return ((pageNum - 1) * count) + 1;	
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}
	
	public int getCount_oracle() { // 위 쿼리에 따라 첫번째의 ?값 (불러올 마지막 rownum)이 달라지기 때문
		return (pageNum * count);
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
}
