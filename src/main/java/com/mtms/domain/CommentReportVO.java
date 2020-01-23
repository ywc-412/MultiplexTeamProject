package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentReportVO {
	private int commentReportNo;			// 한줄평 신고 번호
	private int commentNo;					// 한줄평 번호
	private String commentReportContent;	// 한줄평 신고 내용
	private String memberId;				// 회원 아이디
	private int commentReportResult;	// 한줄평 신고 결과
	private Date commentReportDate;			// 한줄평 신고 날짜
	
	private CommentVO comment;
}
