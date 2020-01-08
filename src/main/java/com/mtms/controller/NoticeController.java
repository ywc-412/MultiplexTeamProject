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
import com.mtms.domain.NoticeVO;
import com.mtms.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/notice/")
public class NoticeController {
	
	private NoticeService noticeService;
	
	@GetMapping("list")//공지사항 목록조회
	public void list(Criteria cri, Model model) {
		
	}
	
	@GetMapping("get")	//공지사항 상세보기
	public String get(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") Criteria cri, Model model) {
		return null;
	}
	
	@PostMapping("register")	//공지사항 등록(P)
	public String register(NoticeVO nvo, RedirectAttributes rttr) {
		return null;	
	}
	
	@GetMapping("register")	//공지사항 등록(G)
	public void register() {
		
	}
	
	@PostMapping("modify")	//공지사항 수정(P)
	public String modify(NoticeVO nvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;	
	}
	
	@GetMapping("modify")	//공지사항 수정(G)
	public void modify() {
		
	}
	
	@PostMapping("remove")	//공지사항 삭제
	public String remove(int noticeNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;	
	}
}
