package com.mtms.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieVO;
import com.mtms.domain.PageDTO;
import com.mtms.domain.ReserveVO;
import com.mtms.domain.ScheduleVO;
import com.mtms.domain.SeatVO;
import com.mtms.service.MovieService;
import com.mtms.service.ReserveService;
import com.mtms.service.ScheduleService;
import com.mtms.service.SeatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/reserve/")
public class ReserveController {
	
	private ReserveService reserveService;
	private ScheduleService scheduleService;
	private SeatService seatService;
	private MovieService movieService;

	@GetMapping("list")
	public void list(Model model, String memberId, Criteria cri) {
		// 회원 별 예매내역 조회
		model.addAttribute("reserveList", reserveService.getList(memberId, cri));
		model.addAttribute("pageMaker", new PageDTO(cri, reserveService.getTotal(memberId, cri)));
	}
	
	@PostMapping("refund")
	public String refund(String reserveNo, Model model, RedirectAttributes rttr ) {
		// 예매 수정하기 (환불)
		// service.refund
		return reserveNo;
	}
	
	@GetMapping("register")
	public void register(Model model) {
		// 초기화면 -> 예매하기 (시간) 화면으로 이동
		// 현재 상영작 영화 목록 끌어오기
		
		// 날짜 구하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat date = new SimpleDateFormat("yyyyMMdd");
		String startDate = date.format(cal.getTime());
		cal.add(Calendar.DATE, 2);
		date = new SimpleDateFormat("yyyyMMdd");
		String endDate = date.format(cal.getTime());
		
		List<ScheduleVO> list = scheduleService.getMovie(startDate, endDate);
		
		System.out.println("controller list size : " + list.size());
		model.addAttribute("movieList", list);
	}
	
	@RequestMapping(value="getDay/{movieNo}", 
			produces = { MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<String>> getDay(@PathVariable("movieNo") int movieNo){
		// 예매 창에서 영화 선택 시 영화에 해당하는 상영 날짜 받아오기
//		System.out.println("RESERVE CONTROLLER - GET DAY - movie No : " + movieNo);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat date = new SimpleDateFormat("yyyyMMdd");
		String startDate = date.format(cal.getTime());
		cal.add(Calendar.DATE, 2);
		date = new SimpleDateFormat("yyyyMMdd");
		String endDate = date.format(cal.getTime());
		return new ResponseEntity<>(scheduleService.getDay(movieNo, startDate, endDate), HttpStatus.OK);
	}
	
	@RequestMapping(value="getTime/{movieNo}/{scheduleDate}",
			produces = { MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<String>> getTime(@PathVariable("movieNo") int movieNo, @PathVariable("scheduleDate") String scheduleDate){
		// 예매 화면에서 영화, 날짜 선택 시 해당 시간대 받아오기
//		System.out.println("RESERVE CONTROLLER - GET TIME - MOVIE NO : " + movieNo + " / scheduleDate : " + scheduleDate);
		return new ResponseEntity<>(scheduleService.getTime(movieNo, scheduleDate), HttpStatus.OK);
	}

	@PostMapping("seat")
	public void seat(ScheduleVO svo, String movieTitle, Model model) {
		// 예매하기 (시간) -> 예매하기 (좌석)
//		System.out.println("/reserve/seat");
		int movieNo = svo.getMovieNo();
		String scheduleDate = svo.getScheduleDate();
		String scheduleTime = svo.getScheduleTime();
//		System.out.println("movieNo : " + movieNo);
//		System.out.println("scheduleDate : " + scheduleDate);
//		System.out.println("scheduleTime : " + scheduleTime);
		
		// 좌석 정보 가져오기
			// 영화 번호, 상영 날짜, 상영 시간으로 스케줄 번호 가져오기
		int scheduleNo = scheduleService.getScheduleNo(movieNo, scheduleDate, scheduleTime);
		List<SeatVO> seatStatus = seatService.getStatus(scheduleNo);
		
		model.addAttribute("reserveTime", svo);
		model.addAttribute("scheduleNo", scheduleNo);
		model.addAttribute("movieName", movieTitle);
		model.addAttribute("seatStatus", seatStatus);
	}
	
	@PostMapping("reserve")
	public void reserve(Model model, ReserveVO rvo, String scheduleDate) {
		// 예매하기 (좌석)
		// 예매 완료되면 영화 정보에 예매+1 해주기
		
		String year = scheduleDate.substring(0, 4);
		String day = scheduleDate.substring(4, 8);
		int rand1 = (int)Math.floor(Math.random() * 10000)+1000;
		if(rand1>10000){
			rand1 = rand1 - 1000;
		}
		int rand2 = (int)Math.floor(Math.random() * 10000)+1000;
		if(rand2>10000){
			rand2 = rand2 - 1000;
		}
		String reserveNo = year + "-" + day + "-" + rand1 + "-" + rand2;
		
//		System.out.println("reserveNo : " + reserveNo);
		rvo.setReserveNo(reserveNo);
//		System.out.println("RESERVE CONTROLLER / RESERVE");
		// 예매번호 추가해줘야함 (생성)
//		System.out.println("scheduleNo : " + rvo.getScheduleNo());
//		System.out.println("memberId : " + rvo.getMemberId());
//		System.out.println("seat : " + rvo.getSeat());
//		System.out.println("adultNum : " + rvo.getAdultNum());
//		System.out.println("teenNum : " + rvo.getTeenNum());
//		System.out.println("status : " + rvo.getStatus());
		
		// 예매 테이블에 insert
		reserveService.register(rvo);
		
		// 예매된 좌석 업데이트 해주기
		seatService.modifyStatus(rvo.getSeat(), rvo.getScheduleNo());
		
		ScheduleVO scheduleVO = scheduleService.getSchedule(rvo.getScheduleNo());
		int audienceNum = rvo.getAdultNum() + rvo.getTeenNum();
		// 영화정보에 예매자수 + 해주기
		movieService.audience(scheduleVO.getMovieNo(), audienceNum);
		
		// 예매 결과 보내기
			// 예매내역 정보 보내기
		model.addAttribute("reserve", reserveService.get(reserveNo));
			// 예매한 시간 정보 보내기 
		model.addAttribute("schedule", scheduleVO);
	}

}
