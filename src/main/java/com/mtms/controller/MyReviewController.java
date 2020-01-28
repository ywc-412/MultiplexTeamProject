package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mtms.domain.Criteria;
import com.mtms.domain.PageDTO;
import com.mtms.domain.ReviewVO;
import com.mtms.service.MyReviewService;
import com.mtms.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myReview/*")
@AllArgsConstructor
public class MyReviewController {
	private MyReviewService service;
	
	@GetMapping("list")
	public void getList(Criteria cri,Model model,@RequestParam("memberId")String memberId) {
		model.addAttribute("list", service.getList(cri,memberId));
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("myReviewList", "myReviewList");
	}
}
