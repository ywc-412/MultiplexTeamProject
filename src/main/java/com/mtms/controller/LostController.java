 package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.LostVO;
import com.mtms.service.LostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/lost/*")
public class LostController {
	
	private LostService lostService;
	
	@PostMapping("remove") 
	 public String remove(int lostNo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		return null;
	}
	
	@PostMapping("modify")
	public String modify(LostVO lvo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		return null;
	}
	
	@GetMapping({"get", "modify"}) 
	public void get(int lostNo, Model model, @ModelAttribute("cri") Criteria cri) {
		
	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		
	}
	
	@GetMapping("register")
	public void register() {
		System.out.println("들오와라");
	}
	
	@PostMapping("register")
	public String register(LostVO lvo, RedirectAttributes rttr) {
		return null;
	}


}
