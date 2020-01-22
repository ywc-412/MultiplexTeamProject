package com.mtms.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mtms.domain.Coolsms;
import com.mtms.domain.simple.JSONObject;

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

	@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
	public String sendSms(HttpServletRequest request) throws Exception {

		String api_key = "NCSOQVNBTVYZZZ7I";
		String api_secret = "4JVN8VRZEHNTP6GU79TLNQDWATDYTW7O";
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", (String) request.getParameter("to")); // 수신번호

		set.put("from", "01041895485"); // 발신번호
		set.put("text", (String) request.getParameter("text")); // 문자내용
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);
		
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
		}

		return "redirect:/member/client";
	}
}
