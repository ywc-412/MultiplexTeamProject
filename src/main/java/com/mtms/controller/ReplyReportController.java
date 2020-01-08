package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyReportVO;
import com.mtms.service.ReviewReportServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/report/reply/*")
public class ReplyReportController {
	@PostMapping("remove")
	 public String remove(int ReplyReportNo,RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		return null;
		
	}
	@PostMapping("modify")
	public String modify(ReplyReportVO rpvo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		return null;
		
	}
	@GetMapping({"get", "modify"})
	public void get(int ReplyReportNo, Model model, @ModelAttribute("cri") Criteria cri) {
		
	}
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		
	}
	@PostMapping("register")
	public String register(ReplyReportVO rpvo, RedirectAttributes rttr) {
		return null;
		
	}

}
