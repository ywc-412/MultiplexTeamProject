package com.mtms.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		model.addAttribute("loginSuccess", "환영합니다");
	}
	
	@GetMapping("/logout")
	public void logoutGet() {
		log.info("custom logout");
	}
	
	@GetMapping("/customLoginError")
	public void loginError() {
		
	}
}
