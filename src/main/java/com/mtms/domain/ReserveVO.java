package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserveNo;			// 예약 번호
	private String memberId;		// 회원 아이디
	private Date scheduleDate;		// 상영 날짜
	private String scheduleTime;	// 상영 시간
	private int movieNo;			// 영화 번호
	
	private int screenNo;			// 상영관
	private String seat;			// 좌석 번호
	// -> ScreenVO 로 해도 될듯
	
	private int adultNum;			// 성인 수
	private int teenNum;			// 청소년 수
	private int status;				// 환불 여부?
}