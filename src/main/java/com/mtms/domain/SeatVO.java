package com.mtms.domain;

import lombok.Data;

@Data
public class SeatVO {

	private int scheduleNo;	// 스케줄 번호 : 날짜/시간/스크린 가져옴
//	private String seatAlphabet; // 좌석의 행(ABC...)
//	private String seatNum;	// 좌석의 열 (계속 추가될 것)
	
	
	private String seatNo; // 좌석 번호 (A1, A2...)
	private int seatStatus; // 좌석 상태 (0 : 공석 / 1 : 예매됨 / 2 : 예매중)
}
