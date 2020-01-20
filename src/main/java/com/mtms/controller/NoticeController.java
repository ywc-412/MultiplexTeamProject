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

import com.mtms.domain.Criteria;
import com.mtms.domain.NoticeVO;
import com.mtms.domain.PageDTO;
import com.mtms.service.NoticeService;
import com.mtms.service.NoticeServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/notice/")
public class NoticeController {
	
	private NoticeService noticeService;
	
	//공지사항 목록조회
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		log.info("Notice Controller list,,,");
		model.addAttribute("list", noticeService.getList(cri));
		
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//공지사항 상세보기 , 공지사항 수정(G)
	@GetMapping("get")	
	public void get(int noticeNo, @ModelAttribute("cri") Criteria cri, Model model) {		
		log.info("Notice Controller Get,,,");
		noticeService.viewUpdate(noticeNo);
		model.addAttribute("notice", noticeService.get(noticeNo));
		
	}
	
	@GetMapping("modify")	
	public void modiGet(int noticeNo, @ModelAttribute("cri") Criteria cri, Model model) {		
		log.info("Notice Controller Get,,,");
		model.addAttribute("notice", noticeService.get(noticeNo));
	}
	
	//공지사항 등록(P)
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MEMBER')")	
	@PostMapping("register")	
	public String register(NoticeVO notice, RedirectAttributes rttr) {	
		log.info("Notice Controller register,,");
		noticeService.register(notice);
		rttr.addFlashAttribute("result", notice.getNoticeNo());
		return "redirect:/notice/list";
	}
	
	//공지사항 등록(G)
	@GetMapping("register")	
	public void register() {
		log.info("Notice Controller register get,,");
	}
	
	//공지사항 수정(P)
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("modify")	
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("Notice Controller modify post,,");
		if(noticeService.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list" + cri.getListLink();	
	}
	
	//공지사항 삭제
	@PreAuthorize("principal.username == #writer")
	@PostMapping("remove")	
	public String remove(int noticeNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("Notice Controller modify post,,");
		if(noticeService.remove(noticeNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list" + cri.getListLink();	
	}
	
}
