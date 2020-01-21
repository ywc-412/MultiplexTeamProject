package com.mtms.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ScheduleMovieVO {
	private int scheduleNo;			// 스케줄 번호
	private String scheduleDate;		// 상영 날짜
	private String scheduleTime;	// 상영 시간 ( 9:00, 10:00, ... ) -> 하나하나 넣기
	private String screen;			// 상영관
	private int movieNo;			// 영화번호 // FK
	
	private String movieTitle;					// 영화 제목
	private String movieManager;				// 영화 감독
	private String movieMainActor;				// 주연
	private String movieSupportActor;			// 조연
	private String movieGenre;					// 장르
	private int movieGrade;						// 등급
	private int runningTime;					// 러닝 타임, 총 상영시간
	private String summary;						// 줄거리
	private Date openDate;						// 개봉일
	private List<MovieAttachVO> attachList;		// 사진첨부
	private int yesterdayNum;				// 전날 예매수 -> @Schedule 사용해서 매일 0으로 초기화시켜주기

}
