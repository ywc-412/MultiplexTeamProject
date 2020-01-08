package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyNo;
	private int reviewNo;
	private String replyContent;
	private String memberId;
	private Date replyDate;
}
