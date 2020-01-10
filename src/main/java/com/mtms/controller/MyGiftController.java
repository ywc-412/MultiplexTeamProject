package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;
import com.mtms.service.MyGiftService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mygift/")
public class MyGiftController {
	
	private MyGiftService myGiftService;
	
	@PostMapping("register")	//내 기프티콘 등록(P)
	public String register(MyGiftVO mvo, RedirectAttributes rttr) {
		return null;
		
	}
	
	@GetMapping("register")	//내 기프티콘 등록(G)
	public void register() {
	
	}
	
	@GetMapping("list")//내 기프티콘 목록조회
	public void list(Criteria cri, Model model) {
		
	}
	
	@GetMapping("get")	//내 기프티콘 상세보기
	public String get(@RequestParam("myGiftNo") int myGiftNo, @ModelAttribute("cri") Criteria cri, Model model) {
		return null;
	}
	
	@PostMapping("extend")	//내 기프티콘 기간연장(P)
	public String extend(MyGiftVO mvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}
	
//	@GetMapping("extend")	//내 기프티콘 기간연장(G)
//	public void extend() {
//		
//	}
	
	@PostMapping("refund")	//내 기프티콘 환불
	public String refund(int myGiftNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;	
	} 

	
	
}
