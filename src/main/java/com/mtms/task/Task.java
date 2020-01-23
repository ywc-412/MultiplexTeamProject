package com.mtms.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mtms.mapper.ReserveMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
@AllArgsConstructor
public class Task {
	
	private ReserveMapper reserveMapper;
	
	// 매 10분마다 실행
	@Scheduled(cron="30 0,10,20,30,40,50 * * * *")
	public void reserveChange() throws Exception {
		// 현재 날짜, 시간 구하기
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm");
		Date now = new Date();
		String scheduleDate = format1.format(now);
		String time = format2.format(now);
		System.out.println("@Scheduled - date : " + scheduleDate);
		System.out.println("@Scheduled - time : " + time);
		
		// 상영시간이 지난 영화 : 상태 1로 변경 -> 리뷰작성 가능
		reserveMapper.changeStatus(scheduleDate, time);
		// 상영시간 30분 전인 영화 : 상태 3으로 변경 -> 예매취소 불가
		reserveMapper.beforeStatus(scheduleDate, time);
	}
}
