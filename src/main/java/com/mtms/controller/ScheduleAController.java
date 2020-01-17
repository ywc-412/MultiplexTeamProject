package com.mtms.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mtms.domain.ScheduleVO;
import com.mtms.service.ScheduleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/scheduleA")
@AllArgsConstructor
public class ScheduleAController {
	private ScheduleService scheduleService;
	
	// 상영시간표 추가
	@PostMapping(value="/add",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE} )
	public ResponseEntity<List<ScheduleVO>> create(@RequestBody ScheduleVO svo){
		int result = scheduleService.register(svo);
		System.out.println("SCHEDULE AJAX CONTROLLER - size : " + result);
		return result == 1 ?
				new ResponseEntity<>(scheduleService.get(svo.getScheduleDate(), svo.getScreen()), HttpStatus.OK) :
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
