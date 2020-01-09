package com.mtms.controller;

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

import com.mtms.service.ScreenService;
import com.mtms.service.ScreenServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/screen/")
public class ScreenController {
	
	private ScreenService screenService;
	
	@GetMapping("seat")
	public void getSeat(int screenNo) {
		// 상영관별 좌석번호 가져오기
	}
	
	@GetMapping("num")
	public void num(Model model, int screenNo) {
		// 상영관별 총 좌석수 가져오기
	}

}
