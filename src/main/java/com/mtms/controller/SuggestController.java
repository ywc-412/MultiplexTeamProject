package com.mtms.controller;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.PageDTO;
import com.mtms.domain.SuggestVO;
import com.mtms.service.SuggestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/suggest/")
public class SuggestController {
	
	private SuggestService suggestService;
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("register")
	public void register() {
		// 건의사항 등록 화면으로 이동
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("register")
	public String register(SuggestVO suggestVO, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("registerComplete", "건의사항이 등록되었습니다!");
		suggestService.registerSuggest(suggestVO);
			
		return "redirect:/suggest/list";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("modify")
	public String modify(SuggestVO suggestVO, RedirectAttributes rttr) {
		// 건의사항 수정
		rttr.addFlashAttribute("updateComplete", "수정되었습니다");
		suggestService.modifySuggest(suggestVO);
		rttr.addAttribute("suggestNo", suggestVO.getSuggestNo());
		return "redirect:/suggest/get";
	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		// 건의사항 게시글 전체 조회
		model.addAttribute("list", suggestService.getSuggestListWithPaging(cri));
		int total = suggestService.getTotalCount(cri);
		
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("get")
	public void get(int suggestNo, @ModelAttribute("cri") Criteria cri, Model model) {
		// 건의사항 게시글 상세보기 화면으로 이동
		model.addAttribute("suggest", suggestService.getSuggest(suggestNo));
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("modify")
	public void modifyGet(int suggestNo, @ModelAttribute("cri") Criteria cri, Model model) {
		// 건의사항 게시글 상세보기 화면으로 이동
		model.addAttribute("suggest", suggestService.getSuggest(suggestNo));
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER') or hasRole('ROLE_ADMIN')")
	@PostMapping("remove")
	public String remove(int suggestNo, RedirectAttributes rttr) {
		// 건의사항 게시글 삭제
		suggestService.removeSuggest(suggestNo);
		
		rttr.addFlashAttribute("suggestRemoveComplete", "해당 건의사항이 삭제되었습니다.");
		
		return "redirect:/suggest/list";
	}
	
	
	

}
