package com.mtms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.PageDTO;
import com.mtms.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private MovieService movieService;
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Model model) {
//		
//		return "index";
//	}
	
	//영화 전체 조회
	@GetMapping("/")
	public String indexList(Model model) {
		System.out.println("인덱스 영화조회");
		
		int totalMovie = movieService.totalMovie();
		
		model.addAttribute("totalMovie", totalMovie);
		model.addAttribute("attachList", movieService.attachGetList());
		model.addAttribute("moveList", movieService.getIndexList());

		return "index";
	}
	
	//사진 보여주기
	@GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<MovieAttachVO>> getAttachList(int movieNo) {
		System.out.println("무비사진");
		return new ResponseEntity<>(movieService.getAttachList(movieNo), HttpStatus.OK);
	}
	
}
