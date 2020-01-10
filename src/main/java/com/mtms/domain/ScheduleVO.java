package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ScheduleVO {
	private int scheduleNo;			// 스케줄 번호
	private Date scheduleDate;		// 상영 날짜
	private String scheduleTime;	// 상영 시간 ( 9:00, 10:00, ... ) -> 나중에 구분자로 split
	private int screenNo;			// 상영관 // FK
	private int movieNo;			// 영화번호 // FK
}
