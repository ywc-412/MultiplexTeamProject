package com.mtms.domain;

import java.util.Date;

import lombok.Data;



@Data
public class ReplyVO {
	private int replyNo;			// 댓글 번호
	private int reviewNo;			// 리뷰 번호
	private String replyContent;	// 댓글 내용
	private String memberId;		// 회원 아이디
	private Date replyDate;			// 댓글 작성 날짜
}
