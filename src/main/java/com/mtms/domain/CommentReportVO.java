package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentReportVO {
	private int commentReportNo;
	private int commentNo;
	private String commentReportContent;
	private String memberId;
	private boolean commentReportResult;
	private Date commentReportDate;
}
