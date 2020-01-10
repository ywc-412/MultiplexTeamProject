package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserveNo;			// 예약 번호
	private String memberId;		// 회원 아이디
	
//	private Date scheduleDate;		// 상영 날짜
//	private String scheduleTime;	// 상영 시간
//	private int movieNo;			// 영화 번호
//	private int screenNo;			// 상영관
	private ScheduleVO scheduleVO;
	
	private String seat;			// 좌석 번호
	
	private int adultNum;			// 성인 수
	private int teenNum;			// 청소년 수
	private int status;				// 현재 상태 
	// 0 : 관람 전 / 1 : 관람 후 / 2 : 환불 완료
}