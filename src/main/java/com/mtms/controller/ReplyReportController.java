package com.mtms.controller;

import javax.servlet.http.HttpServletRequest;

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
import com.mtms.domain.ReplyReportVO;
import com.mtms.domain.ReviewReportVO;
import com.mtms.service.ReviewReplyReportService;
import com.mtms.service.ReviewReplyReportServiceImpl;
import com.mtms.service.ReviewReplyService;
import com.mtms.service.ReviewReplyServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/report/reply/*")
public class ReplyReportController {

   private ReviewReplyReportService replyReportService;

   @PostMapping("remove")
   public String remove(@RequestParam("replyNo") String replyNo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
String[] words = replyNo.split(",");

		
		for (String wo : words ){
			int replyNo1 = Integer.parseInt(wo);
		if (replyReportService.remove(replyNo1)) {
			rttr.addFlashAttribute("result", "success");
		}
	}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/report/reply/list";
	}

//	@PostMapping("modify")
//	public String modify(ReplyReportVO rpvo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
//		return null;
//		
//	}
//	@GetMapping({"get", "modify"})
	@GetMapping("get")
	public void get(@RequestParam("replyReportNo")int replyReportNo, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("rpvo",replyReportService.get(replyReportNo));
	}

	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", replyReportService.getList(cri));

		int total = replyReportService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("register")
	public void register(HttpServletRequest request, Model model) {
		String replyNo1 = request.getParameter("replyNo");
		int replyNo = Integer.parseInt(replyNo1);
		String replyContent = request.getParameter("replyContent");

		ReplyReportVO rpvo = new ReplyReportVO();
		rpvo.setReplyNo(replyNo);
		rpvo.setReplyContent(replyContent);

		model.addAttribute("revo", rpvo);
	}

	@PostMapping("register")
	public String register(ReplyReportVO rpvo, RedirectAttributes rttr) {
		replyReportService.register(rpvo);
		rttr.addFlashAttribute("result", rpvo.getReplyReportNo());
		return "redirect:/review/list";

	}

}

