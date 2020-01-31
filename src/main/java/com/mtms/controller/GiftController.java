package com.mtms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;
import com.mtms.service.GiftService;
import com.mtms.service.MyGiftService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gift/")
public class GiftController {
	
	@Setter(onMethod_ = @Autowired)	
	private GiftService giftService;
	
	@Setter(onMethod_ = @Autowired)
	private MyGiftService myGiftService;
	
	//기프티콘 목록
	@GetMapping("list")	
	public void list(Model model) {
		model.addAttribute("list", giftService.getList());
		model.addAttribute("pic", giftService.giftPicList());		
	}
	
	//기프티콘 상세보기
	@GetMapping("get")	
	public void get(@RequestParam("giftNo") int giftNo, Model model) {
		model.addAttribute("gift", giftService.get(giftNo));
	}	
	
	//기프티콘 등록(P)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("register")	
	public String register(GiftVO gift, RedirectAttributes rttr) {
		if(gift.getAttachList() != null) {
			gift.getAttachList().forEach(attach -> log.info(attach));
		}		
		giftService.register(gift);
		rttr.addFlashAttribute("result", gift.getGiftNo());	//추가적으로 새롭게 등록된 기프티콘 번호를 함께 전달
		return "redirect:/gift/list";		
	}
	
	//기프티콘 등록(G)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("register")	
	public void register() {
		
	}
	
	//기프티콘 수정(P)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("modify")	
	public String modify(GiftVO gift, RedirectAttributes rttr) {
		if(giftService.modify(gift)) {
			rttr.addAttribute("result", "success");
		}
			return "redirect:/gift/list";
	}
	
	//기프티콘 수정(G)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("modify")	
	public void modify(int giftNo, Model model) {
		model.addAttribute("gift", giftService.get(giftNo));
	}
	
	//기프티콘 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("remove")	
	public String remove(GiftVO gift, RedirectAttributes rttr) {
		if(giftService.deleteChk(gift)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/gift/list";		
	}
	
	//기프티콘 사진 붙이기	
	@GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<List<GiftAttachVO>> getAttachList(int giftNo) {		
		return new ResponseEntity<>(giftService.getAttachList(giftNo), HttpStatus.OK);
	}
	
	@PostMapping("paying")
	public String paying(GiftVO gift, MyGiftVO myGift, int qty, RedirectAttributes rttr) {
		// myGift에 내가 주문한 기프티콘을 insert한다. 
		for(int i=1; i <= qty; i++) {
			myGiftService.myInsertSelectKey(myGift);
		}		
		rttr.addAttribute("qty", qty);
		rttr.addAttribute("giftNo", gift.getGiftNo());	
	
		return "redirect:/gift/pay";	
	}
	
	@GetMapping("pay")
	public void pay(@RequestParam("giftNo") int giftNo, int qty, Model model) {
		model.addAttribute("gift", giftService.get(giftNo));
		model.addAttribute("qty", qty);
		model.addAttribute("pic", giftService.giftPicList());
	}
	
}
