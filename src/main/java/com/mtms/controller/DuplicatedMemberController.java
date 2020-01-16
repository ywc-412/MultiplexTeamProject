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
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/duplicated")
@AllArgsConstructor
@Log4j
public class DuplicatedMemberController {
	
	private MemberService memberService;
	
	@GetMapping(value="/{memberId}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> get(@PathVariable("memberId") String memberId){
		
		return new ResponseEntity<>(memberService.duplicatedId(memberId), HttpStatus.OK);
	}
	
	@GetMapping(value="/email/{totalEmail}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> getEmail(@PathVariable("totalEmail") String totalEmail){
		System.out.println("controller : " + totalEmail);
		
		return new ResponseEntity<>(memberService.duplicatedEmail(totalEmail), HttpStatus.OK);
	}
}
