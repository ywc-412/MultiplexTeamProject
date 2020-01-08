package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserveNo;
	private String memberId;
	private Date scheduleDate;
	private String scheduleTime;
	private int screenNo;
	private int movieNo;
	private String seat;
	private int adultNo;
	private int teenNum;
	private int status;
}
