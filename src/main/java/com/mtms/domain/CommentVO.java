package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int commentNo;
	private int movieNo;
	private String memberId;
	private String content;
	private int star;
}
