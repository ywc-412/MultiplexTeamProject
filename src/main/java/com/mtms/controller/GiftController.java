package com.mtms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/gift/")
public class GiftController {
	@GetMapping("list")	//기프티콘 목록
	public void list(Criteria cri, Model model) {
		
	}
	
	@GetMapping("get")	//기프티콘 상세보기
	public void get(@RequestParam("giftNo") int giftNo, @ModelAttribute("cri") Criteria cri, Model model) {
		
	}
	
	@PostMapping("register")	//기프티콘 등록(P)
	public String register(GiftVO gvo, RedirectAttributes rttr) {
		return null;
		
	}
	
	@GetMapping("register")	//기프티콘 등록(G)
	public void register() {
	
	}
	
	@PostMapping("modify")	//기프티콘 수정(P)
	public String modify(GiftVO gvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}
	
	@GetMapping("modify")	//기프티콘 수정(G)
	public void modify() {
		
	}
	
	@PostMapping("remove")	//기프티콘 삭제
	public String remove(@RequestParam("giftNo") int giftNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
		
	}
	
}
