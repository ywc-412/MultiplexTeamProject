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
	@Scheduled(cron="30 0,16,20,30,40,50 * * * *")
	public void reserveChange() throws Exception {
		// 현재 날짜, 시간 구하기
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm");
		Date now = new Date();
		String scheduleDate = format1.format(now);
		String time = format2.format(now);
		System.out.println("@Scheduled - date : " + scheduleDate);
		System.out.println("@Scheduled - time : " + time);
		
		reserveMapper.changeStatus(scheduleDate, time);
		reserveMapper.beforeStatus(scheduleDate, time);
	}
}
