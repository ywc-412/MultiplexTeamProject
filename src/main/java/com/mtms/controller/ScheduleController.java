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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/schedule/")
public class ScheduleController {

	@GetMapping("register")
	public void register() {
		
	}
	
	@PostMapping("register")
	public String register(ScheduleVO svo, RedirectAttributes re) {
		return null;
	}
	
	@GetMapping("modify")
	public void modify() {
		
	}
	
	@PostMapping("modify")
	public String modify(ScheduleVO svo, RedirectAttributes re) {
		return null;
	}
	
	@PostMapping("remove")
	public String remove(int scheduleNo, RedirectAttributes re) {
		return null;
	}
	
	@GetMapping("list")
	public void list(Date scheduleDate) {
		
	}
}
