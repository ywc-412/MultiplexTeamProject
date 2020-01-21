package com.mtms.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.MemberVO;
import com.mtms.domain.PageDTO;
import com.mtms.service.MemberService;
import com.mtms.service.SuggestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	private MemberService memberService;
	private SuggestService suggestService;
	
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/join")
	public void join() {
		// 회원가입 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/join")
	public String join(MemberVO memberVO, RedirectAttributes rttr) {
		// 입력 화면에서 form action /member/join
		
		int result = memberService.join(memberVO);
		
		rttr.addFlashAttribute("regMsg", "환영합니다!");
		
		return "redirect:/";
		
	}
	
	@GetMapping("/findId")
	public void findId() {
		// 아이디 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findId")
	public String findId(MemberVO memberVO, RedirectAttributes rttr) {
		// 아이디 찾기 화면에서 form action /member/findId
		String result = memberService.findId(memberVO);
		
		if(result != null) {
			rttr.addFlashAttribute("findMemberId", result);
			return "redirect:/customLogin";	// 아이디 찾고 customLogin 페이지로 이동
		}
		rttr.addFlashAttribute("findMemberId", "일치하는 아이디가 존재하지 않습니다.");
		return "redirect:/member/findId";	
	}
	
	@GetMapping("/findPw")
	public void findPw() {
		
		// 비밀번호 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findPw")
	public String findPw(MemberVO memberVO, RedirectAttributes rttr) {
		// 비밀번호 찾기화면에서 포스트 매핑
		MemberVO memberIdVo = memberService.findPwByEmail(memberVO);
		String memberId = memberIdVo.getMemberId();
		
		if(memberId != null) {
			rttr.addFlashAttribute("findMemberId", memberId);
			return "redirect:/member/findPw";
		}
		// 서비스 메서드 실행시켰지만 입력받은 정보가 데이터베이스에 없을 경우 "입력하신 정보가 일치하지 않습니다"
		rttr.addFlashAttribute("findMemberIdError", "입력하신 정보가 일치하지 않습니다");
		return "redirect:/member/findPw";
				// 비밀번호 찾고 customLogin 페이지로 이동
	}
	
	@PostMapping("/findPwComplete")
	public String findPwComplete(MemberVO memberVO, RedirectAttributes rttr) {
		int result = memberService.findPw(memberVO);
		if(result == 1) {
			rttr.addFlashAttribute("findPw", "비밀번호 수정이 완료되었습니다");
			
			return "redirect:/customLogin";
		}
		rttr.addFlashAttribute("findPwError","데이터 베이스 오류 관리자에게 문의하십시오.");
		return "redirect:/member/findPw";
		
	}
	
	@GetMapping("/client")
	public void list(Criteria cri, Model model){
		// 멤버 리스트 조회 컨트롤러 // 전체 회원 목록 조회
		model.addAttribute("list", memberService.getMemberList(cri));
		
		int total = memberService.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/clientInfo")
	public void clientGet(String memberId, Model model) {
		model.addAttribute("member", memberService.getMember(memberId));
	}
	
	@GetMapping("/myInfo")
	public void get(String memberId, Model model) {
		//회원 상세보기 컨트롤러	
		MemberVO memberVO = memberService.getMember(memberId);
		
		model.addAttribute("memberInfo", memberVO);
	}
	
	@PostMapping("/client/remove")
	public String adminRemoveMember(String memberId, RedirectAttributes rttr) {
		
		memberService.removeMember(memberId);
		
		rttr.addFlashAttribute("removeCompleteMsg", "해당 회원이 강퇴처리되었습니다");
		
		return "redirect:/member/client";
	}
	
	@PostMapping("/remove")
	public String removeMember(MemberVO memberVO, RedirectAttributes rttr) {
		int result = memberService.removeMember(memberVO);
		
		if(result == -1) {
			rttr.addFlashAttribute("noGoodBye", "비밀번호가 일치하지 않습니다");
			rttr.addAttribute("memberId", memberVO.getMemberId().split(",")[0]);
			return "redirect:/member/myInfo";
		}
		// 회원 강퇴, 삭제 컨트롤러
		rttr.addFlashAttribute("goodBye", "감사합니다 다음에 또 놀러와주세요!");
		
		return "redirect:/logout";
	}
	
	@PostMapping("/myInfoMod")
	public String modifyMember(MemberVO memberVO, RedirectAttributes rttr) {
		// 회원 수정 , 컨트롤러
		int result = memberService.modifyMember(memberVO);
		
		System.out.println("result : " + result);
		
		if(result == 1) {
			rttr.addFlashAttribute("updateSuccess", "수정되었습니다");
			rttr.addAttribute("memberId", memberVO.getMemberId());
			return "redirect:/member/myInfo";
		}
		rttr.addFlashAttribute("updateFail", "update 실패 관리자에게 문의해주세요");
		return "redirect:/member/myInfoMod";
	}
	
	@GetMapping("/myInfoMod")
	public void modifyMember(String memberId, Model model) {
		MemberVO memberVO = memberService.getMember(memberId);
		
		model.addAttribute("memberInfo", memberVO);
	}
	
	@GetMapping("/mySuggest")
	public void mySuggest(Criteria cri, Model model) {
		model.addAttribute("list", suggestService.getSuggestListWithPaging(cri));
		
		int total = suggestService.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
}












