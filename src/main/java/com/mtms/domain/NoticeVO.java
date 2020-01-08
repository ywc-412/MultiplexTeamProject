package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeView;
}
