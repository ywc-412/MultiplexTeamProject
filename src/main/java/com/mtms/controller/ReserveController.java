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

import com.mtms.domain.ReserveVO;
import com.mtms.domain.ScheduleVO;
import com.mtms.service.MemberServiceImpl;
import com.mtms.service.MovieServiceImpl;
import com.mtms.service.ReserveServiceImpl;
import com.mtms.service.ScheduleServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/reserve/")
public class ReserveController {
	
	private ReserveServiceImpl reserveService;
	private ScheduleServiceImpl scheduleService;
	private MovieServiceImpl movieService;
	// movieServiceImpl에 예매수(todayNum) +1 하는 update 구현해야함..
	
	@GetMapping("get")
	public String get(String reserveNo, RedirectAttributes rttr) {
		// 예매 완료 후 예매 결과창으로 이동
		return reserveNo;
	}

	@GetMapping("list")
	public void list(Model model, String memberId) {
		// 회원 별 예매내역 조회
	}
	
	@PostMapping("modify")
	public void modify(String reserveNum, Model model) {
		// 예매 수정하기 (환불 등)
	}
	
	@GetMapping("register")
	public void register() {
		// 초기화면 -> 예매하기 (시간) 화면으로 이동
	}

	@PostMapping("register")
	public String register(ScheduleVO svo, RedirectAttributes rttr) {
		// 예매하기 (시간) -> 예매하기 (좌석)
		return null;
	}

//	@GetMapping("seat")
//	public void seat(ScheduleVO svo) {
//		// 예매하기 (시간) -> 예매하기 (좌석)
//	}
	
	@PostMapping("seat")
	public void seat(Model model, int screenNo, Date scheduleDate, String scheduleTime) {
		// 예매하기 (좌석)
		// 예매 완료되면 영화 정보에 예매+1 해주기
	}

//	@GetMapping("num")
//	public void num(Model model, int screenNo, Date scheduleDate, String scheduleTime) {
//		// 예매할 때 예매된 좌석 수 가져오기
//	}

}
