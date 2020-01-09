package com.mtms.controller;

import java.util.Date;
import java.util.List;

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
	public void register(ScheduleVO svo) {
		// 상영스케줄 등록 화면에서 상영스케줄 insert
		// 모달창에서 '추가' 버튼 누르는 순간에 등록하는 거라서 VO 하나씩 가지고 감
		// 모달창 뜰 때, hidden으로 날짜 값 모달 창에 보내야해
	}
	
//	@GetMapping("modify")
//	public void modify(Date scheduleDate) {
//		// 상영스케줄 수정 화면으로 이동		
//	}
	
	@PostMapping("modify")
	public void modify(ScheduleVO svo) {
		// 상영스케줄 수정 화면에서 상영스케줄 update
		// 모달창에서 '수정'버튼 누르는 순간에 수정 VO
		// 모달창 뜰 때, hidden으로 날짜 값 모달 창에 보내야해
	}
	
	@PostMapping("remove")
	public String remove(Date scheduleDate, RedirectAttributes re) {
		//  상영스케줄 삭제
		// scheduleDate 같은 게 여러 개니까 한번에 삭제~
		return null;
	}
	
	@GetMapping({"get", "modify"})
	public void get(Model model, Date scheduleDate) {
		// 날짜별 상영스케줄 조회
	}
	
}
