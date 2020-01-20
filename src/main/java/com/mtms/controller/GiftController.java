package com.mtms.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonArray;
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
	
	//기프티콘 목록
	@GetMapping("list")	
	public void list(Model model) {
		log.info("Gift Controller list()");
		model.addAttribute("list", giftService.getList());
		model.addAttribute("pic", giftService.giftPicList());
		
	}
	
	//기프티콘 상세보기
	@GetMapping("get")	
	public void get(@RequestParam("giftNo") int giftNo, Model model) {
		log.info("GiftController get()");
		model.addAttribute("gift", giftService.get(giftNo));
	}
	
	//기프티콘 등록(P)
	@PostMapping("register")	
	public String register(GiftVO gift, RedirectAttributes rttr) {
		log.info("Gift Controller register modify,,," + gift);
		if(gift.getAttachList() != null) {
			gift.getAttachList().forEach(attach -> log.warn(attach));
		}		
		giftService.register(gift);
		rttr.addFlashAttribute("result", gift.getGiftNo());	//추가적으로 새롭게 등록된 기프티콘 번호를 함께 전달
		return "redirect:/gift/list";		
	}
	
	//기프티콘 등록(G)
	@GetMapping("register")	
	public void register() {
		log.warn("Gift Controller register get,,,");
	}
	
	//기프티콘 수정(P)
	@PostMapping("modify")	
	public String modify(GiftVO gift, RedirectAttributes rttr) {
		log.info("Gift Controller modify post,," + gift);
		if(giftService.modify(gift)) {
			rttr.addAttribute("result", "success");
		}
			return "redirect:/gift/list";
	}
	
	//기프티콘 수정(G)
	@GetMapping("modify")	
	public void modify(int giftNo, Model model) {
		log.info("Gift Controller modify Get,,");
		model.addAttribute("gift", giftService.get(giftNo));
	}
	
	//기프티콘 삭제
	@PostMapping("remove")	
	public String remove(@RequestParam("giftNo") int giftNo, RedirectAttributes rttr) {
		log.warn("Gift Controller remove()");
		List<GiftAttachVO> attachList = giftService.getAttachList(giftNo); 
		if(giftService.remove(giftNo)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/gift/list";		
	}
	
	//기프티콘 사진 붙이기	
	@GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<List<GiftAttachVO>> getAttachList(int giftNo) {		
		log.warn("Gift AttachList,,,," + giftNo);
		return new ResponseEntity<>(giftService.getAttachList(giftNo), HttpStatus.OK);
	}

	
	//사진 목록
//	@GetMapping("giftPicList")	
//	@ResponseBody	//json으로 값을 보낼꺼기 때문에  ResponseBody, ResponseEntity 필요함
//	public ResponseEntity<List<GiftAttachVO>> getAttachPicList() {		
//		//log.warn("Gift AttachPicList,,,,");
//		
//		List<GiftAttachVO> list = giftService.giftPicList();
//		
//		
//		return new ResponseEntity<>(list, HttpStatus.OK);
//	}
	
	
	
	//첨부파일 포함한 게시글 삭제
	private void deleteFiles(List<GiftAttachVO> attachList) {
		log.warn("Gift deleteFiles,,,,");
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("c:\\upload\\" + attach.getGiftUploadPath() /* + "\\" */+ attach.getGiftUuid() + "_" + attach.getGiftFileName());
				log.info(file);
				Files.deleteIfExists(file);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		});
	}
	
}
