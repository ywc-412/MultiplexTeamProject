package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewReportVO;
import com.mtms.service.ReviewReportService;
import com.mtms.service.ReviewReportServiceImpl;
import com.mtms.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/report/review/*")
public class ReviewReportController {
	
	private ReviewReportService reviweReportService;
<<<<<<< HEAD
	private ReviewService reviewService;
	
	@PostMapping("remove")
	 public String remove(int reviewNo,RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
=======

	@PostMapping("remove")
	public String remove(int reviewReportNo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
>>>>>>> 0d7ac4dc372619cc44dbae0d36b2aa5d67429616
		return null;

	}
	
//	@PostMapping("modify")
//	public String modify(ReviewReportVO rrvo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
//		return null;
//		
//	}
	
//	@GetMapping({"get", "modify"})
	@GetMapping("get")
	public void get(int reviewReportNo, Model model, @ModelAttribute("cri") Criteria cri) {
		
	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		
	}
	
	@GetMapping("register")
	public void register() {
		
	}
	
	@PostMapping("register")
	public String register(ReviewReportVO rrvo, RedirectAttributes rttr) {
		return null;
		
	}
}
