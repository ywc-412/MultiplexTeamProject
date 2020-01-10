package com.mtms.controller;

import java.io.File;
import java.util.List;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mtms.domain.GiftAttachVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GiftUploadController {
	
	@GetMapping("/uploadAjax")		//첨부파일 업로드 화면을 처리
	public void uploadAjax() {
		
	}
	
	
	@PreAuthorize("isAuthenticated()")		
	@PostMapping(value = "/uploadAjaxAction")		//첨부파일 업로드를 처리
	@ResponseBody
	public ResponseEntity<List<GiftAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		return null;
		
	}
	
	private String getFolder() {	//현재 시점의 연\\월\\일 폴더 경로 문자열 생성
		return null;
		
	}
	
//	@GetMapping("/display")	//표시
//	@ResponseBody
//	public ResponseEntity<byte[]> getFile(String fileName) {
//		return null;
//		
//	}
	
	@PreAuthorize("isAuthenticated()")	//파일삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		return null;
		
	}

}
