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
	
	@Scheduled(cron = "30 0 0 * * *")
	public void expireChk() throws Exception {
		SimpleDateFormat format1 = new SimpleDateFormat("yy/MM/dd");	
		//SimpleDateFormat format2 = new SimpleDateFormat("HH:mm");	
		
		Date now = new Date();
		
		String expireDate = format1.format(now);
		//String expireTime = format2.format(now);
		
		System.out.println("@expired - date : " + expireDate);
		//System.out.println("@expired - time : " + expireTime);
		
		myGiftMapper.expireChk(expireDate);
	}
}
