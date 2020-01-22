package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyReportVO {
	private int replyReportNo;			// 댓글 신고 번호
	private String memberId;			// 회원 아이디
	private int replyNo;				// 댓글 번호
	private String replyContent;        //신고받은 댓글의 내용
	private String replyReportContent;	// 댓글신고 내용
	private int replyReportResult;	// 댓글 신고 처리 여부
	private Date replyReportDate;		// 댓글신고날짜
}
