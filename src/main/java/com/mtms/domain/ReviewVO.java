package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private int movieNo;
	private String memberId;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private int reviewView;	// 리뷰 조회수
	private int replyCnt;
	private String movieTitle;
}
