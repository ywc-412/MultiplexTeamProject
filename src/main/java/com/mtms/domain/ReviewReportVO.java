package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewReportVO {
	private int reviewReportNo;
	private String memberId;
	private int reviewNo;
	private String reviewReportContent;
	private boolean reviewReportResult;
	private Date reviewReportDate;
}
