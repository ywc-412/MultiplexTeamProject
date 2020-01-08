package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;			// 리뷰 글 번호
	private String movieNo;			// 해당 영화 번호
	private String memberId;		// 회원 아이디
	private String reviewTitle;		// 리뷰 제목
	private String reviewContent;	// 리뷰 내용
	private Date reviewDate;		// 리뷰 작성 날짜
	private int reviewView;			// 리뷰 조회수
}
