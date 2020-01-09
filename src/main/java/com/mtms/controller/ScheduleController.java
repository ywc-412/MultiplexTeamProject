package com.mtms.controller;

import java.util.Date;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.ScheduleVO;
import com.mtms.service.ScheduleService;
import com.mtms.service.ScheduleServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/schedule/")
public class ScheduleController {
	
	private ScheduleService scheduleService;

	@GetMapping("register")
	public void register() {
		// 상영스케줄 등록 화면으로 이동
	}
	
	@PostMapping("register")
	public String register(ScheduleVO svo, RedirectAttributes re) {
		// 상영스케줄 등록 화면에서 상영스케줄 insert
		return null;
	}
	
//	@GetMapping("modify")
//	public void modify() {
//		// 상영스케줄 수정 화면으로 이동		
//	}
	
	@PostMapping("modify")
	public String modify(ScheduleVO svo, RedirectAttributes re) {
		// 상영스케줄 수정 화면에서 상영스케줄 update
		return null;
	}
	
	@PostMapping("remove")
	public String remove(int scheduleNo, RedirectAttributes re) {
		//  상영스케줄 삭제
		return null;
	}
	
	@GetMapping({"list", "modify"})
	public void list(Date scheduleDate) {
		// 날짜별 상영스케줄 조회		
	}
}
