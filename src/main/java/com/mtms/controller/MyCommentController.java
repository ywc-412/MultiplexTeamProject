package com.mtms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtms.domain.Criteria;
import com.mtms.domain.PageDTO;
import com.mtms.service.CommentService;
import com.mtms.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/myComment/*")
@AllArgsConstructor
public class MyCommentController {
	
	private CommentService commentService;
	private MovieService movieService;
	
	//회원 별 한줄평 조회
	@GetMapping("myList")
	public void mylist(Model model, Criteria cri, String memberId) {
		System.out.println("씨바333");
		System.out.println(memberId);
		
		//한줄평이랑 같이 불러와서 영화명 불러오기
		model.addAttribute("movie", movieService.myMovieList());
		model.addAttribute("comment", commentService.myGetList(cri, memberId));
		model.addAttribute("pageMaker", new PageDTO(cri, commentService.myGetTotal(memberId)));

	}

}
