package com.mtms.controller;

import java.util.List;

import org.springframework.security.access.annotation.Secured;
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
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.PageDTO;
import com.mtms.service.CommentReportService;
import com.mtms.service.CommentService;
import com.mtms.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/report/comment/*")
@AllArgsConstructor
public class CommentReportController {
	
	private CommentReportService commentReportService;
	private CommentService commentService;
	private MovieService movieService;
	
	//한줄평 신고 상세보기(보여주기)
	@Secured("ROLE_ADMIN")
	@GetMapping("get")
	public void get(Model model, @RequestParam("commentNo") int commentNo, @RequestParam("commentReportNo") int commentReportNo, @ModelAttribute("cri") Criteria cri) {
		
		model.addAttribute("comment", commentService.get(commentNo));
		model.addAttribute("commentReport", commentReportService.get(commentReportNo));
	}
	
	//한줄평 신고 삭제 처리
	@GetMapping("remove")
	public String remove(@RequestParam("commentNo") int commentNo, RedirectAttributes rttr,  @ModelAttribute("cri") Criteria cri) {
		
		int result = commentService.remove(commentNo);
	    if(result == 1) {
	    	rttr.addFlashAttribute("result", "success");
	    }
	    
	    rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/report/comment/list";
	}
	
	//한줄평 신고 등록 창 보여주기
	@GetMapping("register")
	@Secured("ROLE_MEMBER")
	public void register(Model model, @RequestParam("commentNo") int commentNo, @RequestParam("movieNo") int movieNo, @ModelAttribute("cri") Criteria cri) {
		
		log.info("controller 신고 register");
		model.addAttribute("movie", movieService.get(movieNo));
		model.addAttribute("comment", commentService.get(commentNo));
	}
	
	//한줄평 신고 등록 처리
	@Secured("ROLE_MEMBER")
	@PostMapping("register")
	public String register(CommentReportVO commentReport, @RequestParam("movieNo") int movieNo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		log.info("Controller register()");
		
		commentReportService.register(commentReport);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/movie/get?movieNo=" + movieNo;
	}
	
	//한줄평 신고 전체 조회
	@Secured("ROLE_ADMIN")
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		log.info("Controller list ");

		model.addAttribute("comment", commentService.getCommentList());
		model.addAttribute("commentReport", commentReportService.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, commentReportService.getTotal(cri)));
		
	}
	
	// 신고에서 전체 삭제
	@GetMapping("deleteAll")
	public String deleteAll(@RequestParam("checkComment") String checkComment, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
//			commentService
		System.out.println("COMMENT CONTROLLER - CHECKCOMMENT : " + checkComment);
		
		String[] arrComment = checkComment.toString().split(",");
		for( int i=0; i<arrComment.length; i++) {
			System.out.println(Integer.parseInt(arrComment[i]));
			
			int result = commentService.remove(Integer.parseInt(arrComment[i]));
			System.out.println(result);
			
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/report/comment/list";
	}

}
