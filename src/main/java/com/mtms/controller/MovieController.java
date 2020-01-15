package com.mtms.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.MovieVO;
import com.mtms.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
@AllArgsConstructor
public class MovieController {
	
	private MovieService movieService;

	//첨부 파일 삭제 메서드 - 영화사진 
	private void deleteFiles(List<MovieAttachVO> attachList) {
		
	}
	
	//영화 상세보기(보여주기)
	@GetMapping("get")
	public void get(Model model, @RequestParam("movieNo") int movieNo, @ModelAttribute("cri") Criteria cri) {
		
	}
	
	//영화 수정 보여주기
	@GetMapping("modify")
	public void modify(Model model, @RequestParam("movieNo") int movieNo, @ModelAttribute("cri") Criteria cri) {
		
	}
	
	//영화 수정 처리
//	@PreAuthorize("principal.username == #memo.id") //수정필요
	@PostMapping("modify")
	public String modify(MovieVO movie, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		return null;
	}
	
	//영화  삭제 처리
	@GetMapping("remove")
	public String remove(@RequestParam("movieNo") int movieNo, RedirectAttributes rttr,  @ModelAttribute("cri") Criteria cri) {
		
		return null;
	}
	
	//영화 등록 창 보여주기
	@GetMapping("register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
		
	//영화 등록 처리
	@PostMapping("register")
//	@PreAuthorize("isAuthenticated()")
	public String register(MovieVO movie, RedirectAttributes rttr) {
		log.info("controller 영화 register");
		
		movieService.register(movie);
		
		return "redirect:/movie/list";
	}
	
	//영화 전체 조회
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		
	}
	
	//사진 보여주기
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<MovieAttachVO>> getAttachList(int movieNo) {
		
		return null;
	}
}
