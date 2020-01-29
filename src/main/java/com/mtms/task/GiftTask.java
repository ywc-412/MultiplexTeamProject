package com.mtms.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mtms.mapper.MyGiftMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
@AllArgsConstructor
public class GiftTask {
	
	private MyGiftMapper myGiftMapper;
	
	//내 기프티콘 만료일자가 되면 현재상태가 '사용가능'에서'기간만료'로 변경됨
	@Scheduled(cron = "59 59 23 * * *")
	public void expireChk() throws Exception {
		SimpleDateFormat format1 = new SimpleDateFormat("yy/MM/dd");			
		Date now = new Date();
		
		String expireDate = format1.format(now);
		
		log.info("@expired - date : " + expireDate);
		
		myGiftMapper.expireChk(expireDate);
	}
}
