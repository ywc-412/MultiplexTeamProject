package com.mtms.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mtms.domain.Coolsms;
import com.mtms.domain.PhoneAuthVO;
import com.mtms.domain.simple.JSONObject;
import com.mtms.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberSerivce;
	
	String api_key = "NCSOQVNBTVYZZZ7I";
	String api_secret = "4JVN8VRZEHNTP6GU79TLNQDWATDYTW7O";
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);

		model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
	}
	
	@PreAuthorize("!isAuthenticated()")
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info(error);
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/logout")
	public void logoutGet() {
		log.info("custom logout");
	}

	@GetMapping("/customLoginError")
	public void loginError() {

	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
	public String sendSms(HttpServletRequest request) throws Exception {

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
	
	@GetMapping("/phoneAuthPopup")
	public void phoneAuthPopup() {
		
	}
	
	@RequestMapping(value = "/sendSmsPhoneAuth", method = RequestMethod.POST)
	public String sendSmsPhoneAuth(HttpServletRequest request, PhoneAuthVO paVO, Model model) throws Exception {

		int resultService = memberSerivce.phoneAuthInsert(paVO);
		
		if(resultService != 1) {
			System.out.println("error");
			return null;
		}
		
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", paVO.getAuthPhone()); // 수신번호

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
		
		return "redirect:/phoneAuthPopup?phone="+paVO.getAuthPhone();
	}
	
	@GetMapping("/error404")
	public void error404() {
		
	}
	
	@GetMapping(value="/{authPhone}/{authNumber}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PhoneAuthVO> get(@PathVariable("authPhone") String authPhone, @PathVariable("authNumber") String authNumber){
		
		return new ResponseEntity<>(memberSerivce.phoneAuthSelect(authPhone, authNumber), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/deleteAuth/{authPhone}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Integer> phoneAuthDelete(@PathVariable("authPhone") String authPhone){
		
		return new ResponseEntity<>(memberSerivce.phoneAuthDelete(authPhone), HttpStatus.OK);
	}
	
}










