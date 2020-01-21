package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private String reserveNo;			// 예약 번호
	private String memberId;		// 회원 아이디
	
//	private Date scheduleDate;		// 상영 날짜
//	private String scheduleTime;	// 상영 시간
//	private int movieNo;			// 영화 번호
//	private int screenNo;			// 상영관
	private int scheduleNo;
	
	private ScheduleVO scheduleVO; // 상영날짜/시간/영화번호/상영관 가져오기
	private MovieVO movieVO;
	
	private String seat;			// 좌석 번호 - 여러개 ,로 묶여서 들어갈 것
	
	private int adultNum;			// 성인 수
	private int teenNum;			// 청소년 수
	private int status;				// 현재 상태 
	// 0 : 관람 전 / 1 : 관람 후 / 2 : 환불 완료
}