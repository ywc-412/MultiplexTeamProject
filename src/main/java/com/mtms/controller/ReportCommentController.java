package com.mtms.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.CommentReportVO;
import com.mtms.domain.Criteria;
import com.mtms.service.CommentReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/report/comment/*")
@AllArgsConstructor
public class ReportCommentController {
	
	private CommentReportService commentReportService;
	
	//한줄평 신고 상세보기(보여주기) 
	@GetMapping("get")
	public void get(Model model, @RequestParam("commentReport") int commentReport, @ModelAttribute("cri") Criteria cri) {
		
	}
	
	//한줄평 신고 삭제 처리
//	@PreAuthorize("principal.username == #id") //수정필요
	@GetMapping("remove")
	public String remove(String memberId, @RequestParam("commentReport") int commentReport, RedirectAttributes rttr,  @ModelAttribute("cri") Criteria cri) {
		
		return memberId;
	}
	
	//한줄평 신고 등록 창 보여주기
	@GetMapping("register")
//	@PreAuthorize("isAuthenticated()")
	public void register(Model model) {
		
	}
	
	//한줄평 신고 등록 처리
	@PostMapping("register")
//	@PreAuthorize("isAuthenticated()")
	public String register(CommentReportVO commentReport, RedirectAttributes rttr) {
		
		return null;
	}
	
	//한줄평 신고 전체 조회
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		
		
	}
	

}
