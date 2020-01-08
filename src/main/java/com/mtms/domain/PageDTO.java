package com.mtms.domain;

import com.mtms.domain.Criteria;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		//50으로 들어올경우.... page넘버가 만약 5이라면...10이 나오고
		this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))*10;
		// startPage 는 1이 나온다.
		this.startPage = this.endPage-9;
		// realEnd 는 50/10이므로. 5가 된다.
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		// endPage가 10이고 realEnd가 12이다. endPage가 더 클 경우. endPage에는 realEnd가 들어간다.
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
}
