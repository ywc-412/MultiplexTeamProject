package com.mtms.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
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
import com.mtms.domain.PageDTO;
import com.mtms.domain.ReviewReportVO;
import com.mtms.service.ReviewReportService;
import com.mtms.service.ReviewReportServiceImpl;
import com.mtms.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/report/review/*")
public class ReviewReportController {
	
	private ReviewReportService reviweReportService;
	
	@PostMapping("remove")
	public String remove(@RequestParam(value="reviewNo") String reviewNo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		String[] words = reviewNo.split(",");
		System.out.println(reviewNo);
		for (String wo : words ){
			int reviewNo1 = Integer.parseInt(wo);
			if (reviweReportService.remove(reviewNo1)){ 
				rttr.addFlashAttribute("result","success"); 
			}
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/report/review/list";
	}
	
//	@PostMapping("modify")
//	public String modify(ReviewReportVO rrvo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
//		return null;
//		
//	}
	
//	@GetMapping({"get", "modify"})
	@GetMapping("get")
	public void get(@RequestParam("reviewReportNo")int reviewReportNo, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("rrvo",reviweReportService.get(reviewReportNo));
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list",reviweReportService.getList(cri) );
		
		int total = reviweReportService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("register")
	public void register(HttpServletRequest request,Model model) {
		String reviewNo1 = request.getParameter("reviewNo");
		int reviewNo = Integer.parseInt(reviewNo1);
		String reviewTitle = request.getParameter("reviewTitle");
		
		ReviewReportVO rrvo = new ReviewReportVO();
		rrvo.setReviewNo(reviewNo);
		rrvo.setReviewTitle(reviewTitle);
		
		model.addAttribute("rvo", rrvo);
		
	}
	
	@PostMapping("register")
	public String register(ReviewReportVO rrvo, RedirectAttributes rttr) {
		log.info("reviewController register()");
		reviweReportService.register(rrvo);
		rttr.addFlashAttribute("result",rrvo.getReviewReportNo());
		return "redirect:/review/list";
		
	}
}

