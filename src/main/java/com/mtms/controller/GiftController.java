package com.mtms.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.service.GiftService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/gift/")
public class GiftController {
	
	private GiftService giftService;
	
	@GetMapping("list")	//기프티콘 목록
	public void list(Model model) {
		log.info("GiftController list()");
		model.addAttribute("list", giftService.getList());
	}
	
	@GetMapping("get")	//기프티콘 상세보기
	public void get(@RequestParam("giftNo") int giftNo, Model model) {
		log.info("GiftController get()");
		model.addAttribute("gift", giftService.get(giftNo));
	}
	
	@PostMapping("register")	//기프티콘 등록(P)
	public String register(GiftVO gift, RedirectAttributes rttr) {
		log.warn("===========================");
		log.warn("register : " + gift);
		if(gift.getAttachList() != null) {
			gift.getAttachList().forEach(attach -> log.warn(attach));
		}
		
		giftService.register(gift);
		rttr.addFlashAttribute("result", gift.getGiftNo());	//추가적으로 새롭게 등록된 기프티콘 번호를 함께 전달
		return "redirect:/gift/list";
		
	}
	
	@GetMapping("register")	//기프티콘 등록(G)
	public void register() {
		log.warn("Gift Controller register get");
	}
	
	@PostMapping("modify")	//기프티콘 수정(P)
	public String modify(GiftVO gvo, RedirectAttributes rttr) {
		return null;
	}
	
	@GetMapping("modify")	//기프티콘 수정(G)
	public void modify(int giftNo, Model model) {
		
	}
	
	@PostMapping("remove")	//기프티콘 삭제
	public String remove(@RequestParam("giftNo") int giftNo, RedirectAttributes rttr) {
		return null;
		
	}
	
	@GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	//기프티콘 사진 조회	
	public ResponseEntity<List<GiftAttachVO>> getAttachList(int giftNo) {		
		log.warn("Gift Attach List,,,," + giftNo);
		return new ResponseEntity<>(giftService.getAttachList(giftNo), HttpStatus.OK);
	}
	
}
