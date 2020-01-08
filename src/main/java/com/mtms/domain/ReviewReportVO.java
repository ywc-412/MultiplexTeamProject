package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewReportVO {
	private int reviewReportNo;				// 리뷰 신고 번호
	private String memberId;				// 회원 아이디
	private int reviewNo;					// 리뷰 번호
	private String reviewReportContent;		// 리뷰 신고 내용
	private boolean reviewReportResult;		// 리뷰 신고 처리 결과
	private Date reviewReportDate;			// 리뷰 신고 날짜
}
