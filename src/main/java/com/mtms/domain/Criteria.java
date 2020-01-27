package com.mtms.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;	
	private int amount;		
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null?new String[] {} : type.split("");
	}
<<<<<<< HEAD
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount())
			.queryParam("type", this.getType())
			.queryParam("keyword", this.getKeyword());
			
			return builder.toUriString();
=======
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
>>>>>>> 2eab1067ca94b316eba59c19c678e0d6e0463d0a
	}
}
	
