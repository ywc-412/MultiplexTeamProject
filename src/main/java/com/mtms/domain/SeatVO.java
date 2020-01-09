package com.mtms.domain;

import lombok.Data;

@Data
public class SeatVO {

	private int scheduleNo;	// 스케줄 번호 : 날짜/시간/스크린 가져옴
	private String seatAlphabet; // 좌석의 행(ABC...)
	private String seatNum;	// 좌석의 열 (계속 추가될 것)
	
}
