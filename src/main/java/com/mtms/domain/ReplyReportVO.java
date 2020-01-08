package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyReportVO {
	private int replyReportNo;
	private String memberId;
	private int replyNo;
	private String replyReportContent;
	private boolean replyReportResult;
	private Date replyReportDate;
}
