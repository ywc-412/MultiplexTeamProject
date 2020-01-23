package com.mtms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.mtms.domain.MovieVO;
import com.mtms.domain.ScheduleVO;
import com.mtms.service.ScheduleService;
import com.mtms.service.SeatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/schedule/")
public class ScheduleController {
	
	private ScheduleService scheduleService;
	private SeatService seatService;

	@GetMapping("register")
	public void register(Model model, String scheduleDate) {
		// 상영스케줄 등록 화면으로 이동
		List<ScheduleVO> list1, list2, list3;
		if(scheduleDate == null) {
			Date tomorrow = new Date(new Date().getTime() + 60*60*24*1000);
			SimpleDateFormat all = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat month = new SimpleDateFormat("MM");
			SimpleDateFormat date = new SimpleDateFormat("dd");
			String tomoMonth = month.format(tomorrow);
			String tomoDate = date.format(tomorrow);
			model.addAttribute("selMonth", tomoMonth);
			model.addAttribute("selDate", tomoDate);
	
			list1 = scheduleService.get(all.format(tomorrow), "1관 3층");
			list2 = scheduleService.get(all.format(tomorrow), "2관 3층");
			list3 = scheduleService.get(all.format(tomorrow), "3관 3층");
		} else {
			list1 = scheduleService.get(scheduleDate, "1관 3층");
			list2 = scheduleService.get(scheduleDate, "2관 3층");
			list3 = scheduleService.get(scheduleDate, "3관 3층");
			
			String month = scheduleDate.substring(4, 6);
			String date = scheduleDate.substring(6, 8);
			
			model.addAttribute("selMonth", month);
			model.addAttribute("selDate", date);
		}
		model.addAttribute("schedule1", list1);
		model.addAttribute("schedule2", list2);
		model.addAttribute("schedule3", list3);
	}
	
	@PostMapping("register")
	public void register(ScheduleVO scheduleVO, String[] time, String[] regSeq, Model model) {
		// 상영스케줄 등록 화면에서 상영스케줄 insert
		// 모달창에서 '추가' 버튼 누르는 순간에 등록하는 거라서 VO 하나씩 가지고 감
		
		// 해당 날짜, 상영관에 스케줄이 있는 지 확인
		int chkResult = scheduleService.checkSchedule(scheduleVO.getScheduleDate(), scheduleVO.getScreen());
		
		String month = scheduleVO.getScheduleDate().substring(4, 6);
		String date = scheduleVO.getScheduleDate().substring(6, 8);
		
		List<String> listSeq = new ArrayList<String>();
		for(int i=0; i<regSeq.length; i++) {
			listSeq.add(regSeq[i]);
		}
		
		if(chkResult == 1) { // 스케줄이 존재하지 않음 -> 등록가능
			for(int i=0; i<time.length; i++) {	
				ScheduleVO svo = new ScheduleVO();
				svo.setScheduleDate(scheduleVO.getScheduleDate());
				System.out.println("register : sdate : " + scheduleVO.getScheduleDate());
				svo.setMovieNo(scheduleVO.getMovieNo());
				svo.setScreen(scheduleVO.getScreen());
				svo.setScheduleTime(time[i]);
				
				scheduleService.register(svo);
				int curSeq = scheduleService.getSeq();
				seatService.register(curSeq);
				listSeq.add(String.valueOf(curSeq));
			}
		} else {
			model.addAttribute("msg", "해당 날짜, 상영관에 스케줄이 존재합니다.");
		}
		
		List<ScheduleVO> list1 = scheduleService.get(scheduleVO.getScheduleDate(), "1관 3층");
		List<ScheduleVO> list2 = scheduleService.get(scheduleVO.getScheduleDate(), "2관 3층");
		List<ScheduleVO> list3 = scheduleService.get(scheduleVO.getScheduleDate(), "3관 3층");
		model.addAttribute("schedule1", list1);
		model.addAttribute("schedule2", list2);
		model.addAttribute("schedule3", list3);
		model.addAttribute("listSeq", listSeq);
		model.addAttribute("selMonth", month);
		model.addAttribute("selDate", date);
	}
	
	@PostMapping("cancel")
	public String cancel(String[] regSeq, RedirectAttributes rttr) {
		// 방금 등록했던 스케줄 다시 삭제
		scheduleService.remove(regSeq);
		return "redirect:/schedule/get";
	}
	
	@PostMapping("remove")
	public String remove(String scheduleDate, RedirectAttributes rttr) {
		// 상영스케줄 삭제 (하루치)
		// scheduleDate 같은 게 여러 개니까 한번에 삭제~
		System.out.println("SCHEDULE CONTROLLER - REMOVE");
		System.out.println("DATE : " + scheduleDate);
		
		// 오늘 날짜 구하기
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String formatToday = date.format(today);
		
		if(scheduleDate.equals(formatToday)) {
			// 삭제하는 날짜와 오늘 날짜가 같은 경우 삭제 불가능
			System.out.println("오늘 날짜의 스케줄은 삭제가 불가능합니다.");
			rttr.addFlashAttribute("result", "todaySchedule");
		} else {
			if(scheduleService.removeDay(scheduleDate)) {
				System.out.println("상영스케줄 삭제 성공");
				rttr.addFlashAttribute("result", "removeSuccess");
			} else {
				System.out.println("상영스케줄 삭제 실패");
				rttr.addFlashAttribute("result", "removeFail");
			}
		}
		return "redirect:/schedule/get";
	}
	
	@GetMapping({"get", "modify"})
	public void get(Model model, String scheduleDate) {
		// 날짜별 상영스케줄 조회
		List<ScheduleVO> list1, list2, list3;
		
		// 오늘 날짜 구하기
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String formatToday = date.format(today);
		
		// scheduleDate 값이 null로 들어오면 -> 오늘 날짜의 상영시간표 가져오기
		if(scheduleDate == null || scheduleDate.equals(formatToday)) {
			scheduleDate = formatToday;
			list1 = scheduleService.get(scheduleDate, "1관 3층");
			list2 = scheduleService.get(scheduleDate, "2관 3층");
			list3 = scheduleService.get(scheduleDate, "3관 3층");
		} else {
			// 선택한 날짜의 상영스케줄 조회
			list1 = scheduleService.get(scheduleDate, "1관 3층");
			list2 = scheduleService.get(scheduleDate, "2관 3층");
			list3 = scheduleService.get(scheduleDate, "3관 3층");
		}
		model.addAttribute("schedule1", list1);
		model.addAttribute("schedule2", list2);
		model.addAttribute("schedule3", list3);
	}
	
}
