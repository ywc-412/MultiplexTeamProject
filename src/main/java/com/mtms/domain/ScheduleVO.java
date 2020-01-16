package com.mtms.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ScheduleVO {
	private int scheduleNo;			// 스케줄 번호
	private String scheduleDate;		// 상영 날짜
	private String scheduleTime;	// 상영 시간 ( 9:00, 10:00, ... ) -> 하나하나 넣기
	private String screen;			// 상영관
	private int movieNo;			// 영화번호 // FK
	
	private MovieVO movieVO; // member - auth 부분 참고해서 영화이름 가져오기
}