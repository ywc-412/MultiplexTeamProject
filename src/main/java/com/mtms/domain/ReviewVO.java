package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private String movieNo;
	private String memberId;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private int reviewView;
}
