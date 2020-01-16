package com.mtms.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.mtms.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	private MemberService memberService;

	@GetMapping("/join")
	public void join() {
		// 회원가입 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/join")
	public String join(MemberVO memberVO, RedirectAttributes rttr) {
		// 입력 화면에서 form action /member/join
		log.info("join");
		
		int result = memberService.join(memberVO);
		
		rttr.addFlashAttribute("regMsg", "환영합니다!");
		
		return "redirect:/";
		
	}
	
	@GetMapping("/findId")
	public void findId() {
		// 아이디 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findId")
	public String findId(MemberVO memberVO, Model model) {
		// 아이디 찾기 화면에서 form action /member/findId
		return null;		// 아이디 찾고 customLogin 페이지로 이동
	}
	
	@GetMapping("/findPw")
	public void findPw() {
		// 비밀번호 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findPw")
	public String findPw(MemberVO memberVO, Model model) {
		// 비밀번호 찾기화면에서 포스트 매핑
		
		return null;		// 비밀번호 찾고 customLogin 페이지로 이동
	}
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model){
		// 멤버 리스트 조회 컨트롤러 // 전체 회원 목록 조회
		
		return null;
	}
	
	@GetMapping("/get")
	public String get(String memberId, Model model) {
		//회원 상세보기 컨트롤러	
		
		return null;
	}
	
	@PostMapping("/remove")
	public String removeMember(String memberId, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		// 회원 강퇴, 삭제 컨트롤러
		
		return null;
	}
	
	@PostMapping("/modify")
	public String modifyMember(String memberId, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		// 회원 수정 , 컨트롤러
		
		return null;
	}
	
}












