package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int commentNo;		// 한줄평 번호
	private int movieNo;		// 영화 번호
	private String memberId;	// 회원 아이디
	private String content;		// 한줄평 내용
	private int star;			// 한줄평 별점?
	private Date commentDate;	// 한줄평 등록일
}
