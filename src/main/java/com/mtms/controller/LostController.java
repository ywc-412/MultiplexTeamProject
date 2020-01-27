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
import com.mtms.domain.PageDTO;
import com.mtms.service.LostService;
import com.zaxxer.hikari.util.SuspendResumeLock;

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
		rttr.addFlashAttribute("result", lostService.remove(lostNo));
		return "redirect:/lost/list";
	}
	
	@PostMapping("modify")
	public String modify(LostVO lvo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		System.out.println("로스트 모디파이 들어왔다"+lvo);
		if(lostService.modify(lvo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return  "redirect:/lost/list";
	}
	
	@GetMapping("get") 
	public void get(int lostNo, Model model, @ModelAttribute("cri") Criteria cri) {
			model.addAttribute("lvo", lostService.get(lostNo));
	}
	
	@GetMapping("modify") 
	public void modify(int lostNo, Model model, @ModelAttribute("cri") Criteria cri) {
			model.addAttribute("lvo",lostService.get(lostNo));
	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		System.out.println("로스트 리스티로 들어온다@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		model.addAttribute("list", lostService.getList(cri));
		int total = lostService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("register")
	public void register() {
		
	}
	
	@PostMapping("register")
	public String register(LostVO lvo, RedirectAttributes rttr) {
		System.out.println("로스트 컨트롤러 register에 들어온다.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		lostService.register(lvo);
		rttr.addFlashAttribute("result",lvo.getLostNo());
		return "redirect:/lost/list";
	}


}
