package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mtms.domain.PageDTO;

import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;
import com.mtms.service.MyGiftService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/myGift/")
public class MyGiftController {
	
	private MyGiftService myGiftService;
	
	@GetMapping("list")//내 기프티콘 목록조회
	public void list(Criteria cri, Model model) {
		log.info("Gift Controller list()");
		model.addAttribute("mygift", myGiftService.getListWithPaging(cri));
		
		int total = myGiftService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("get")	//내 기프티콘 상세보기
	public void get(@RequestParam("myGiftNo") int myGiftNo, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("mygift", myGiftService.get(myGiftNo));
		model.addAttribute("cri", cri);
	}
	
	@PostMapping("extend")	//내 기프티콘 기간연장(P)
	public String extend(MyGiftVO myGift, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		System.out.println("hi! jj");
		log.warn("Gift Controller extend()");
		if(myGiftService.extend(myGift)) {
			rttr.addAttribute("result", "success");
		}
		rttr.addAttribute("myGiftNo",myGift.getMyGiftNo());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/myGift/list";	
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
