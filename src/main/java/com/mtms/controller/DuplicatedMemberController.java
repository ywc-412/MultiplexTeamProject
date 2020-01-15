package com.mtms.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mtms.domain.MemberVO;
import com.mtms.service.MemberService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/duplicated")
@AllArgsConstructor
public class DuplicatedMemberController {
	
	private MemberService memberService;
	
	@GetMapping(value="/{memberId}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> get(@PathVariable("memberId") String memberId){
		
		return new ResponseEntity<>(memberService.duplicatedId(memberId), HttpStatus.OK);
	}
	
	@GetMapping(value="/{memberEmail}/{memberEmailSecond}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> get(@PathVariable("memberEmail") String memberEmail, @PathVariable("memberEmailSecond") String memberEmailSecond){
		
		return new ResponseEntity<>(memberService.duplicatedEmail(memberEmail, memberEmailSecond), HttpStatus.OK);
	}
}
