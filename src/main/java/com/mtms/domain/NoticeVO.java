package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;			// 공지사항 번호
	private String noticeTitle;		// 공지사항 제목
	private String noticeContent;	// 공지사항 내용
	private Date noticeDate;		// 공지사항 작성 날짜
	private int noticeView;			// 공지사항 조회수
}
