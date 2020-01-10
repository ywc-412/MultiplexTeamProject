package com.mtms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtms.domain.ScheduleVO;
import com.mtms.domain.SeatVO;
import com.mtms.service.ScreenService;
import com.mtms.service.SeatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/seat/")
public class SeatController {

	private SeatService seatService;
	
	@GetMapping("list")
	public void list(ScheduleVO svo) {
		// service.getStatus
	}
	
	@PostMapping("register")
	public void register(List<SeatVO> seatList){
		// service.register
	}
	
	@PostMapping("remove")
	public void remove(int scheduleNo) {
		// service.remove
	}
	
	@PostMapping("modify")
	public void modify(List<SeatVO> seatList) {
		// service.modify
	}
	
}
