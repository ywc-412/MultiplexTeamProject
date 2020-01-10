package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;
import com.mtms.service.ReviewService;
import com.mtms.service.ReviewServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/review/*")
public class ReviewController {
	
	private ReviewService reviewService;
	
	@PostMapping("remove")	
	 public String remove(int reviewNo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		return null;
		//삭제처리 하기위한 메소드
	}
	
	@PostMapping("modify")
	public String modify(ReviewVO rvo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		//게시물 수정처리
		return null;
	}
	
	@GetMapping({"get", "modify"})
	public void get(int reviewNo, Model model, @ModelAttribute("cri") Criteria cri) {
		//게시물 수정 처리
	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		//게시물 리스트처리
	}
	
	@GetMapping("register")
	public void register() {
		
	}	
	
	@PostMapping("register")
	public String register(ReviewVO rvo, RedirectAttributes rttr) {
		//게시물을 등록하기 위한 메소드
		return null;
		
	}

}
