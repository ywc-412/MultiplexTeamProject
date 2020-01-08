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
	@GetMapping("uploadForm")	//첨부파일을 업로드할 수 있는 화면을 처리
	public void uploadForm() {
		
	}
	
	@PostMapping("/uploadFormAction")	//첨부파일 업로드를 처리
	public void uploadFormAction(MultipartFile[] uploadFile, Model model) {
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadAjaxAction")
	@ResponseBody
	public ResponseEntity<List<GiftAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		return null;
		
	}
	
	//현재 시점의 연\\월\\일 폴더 경로 문자열 생성
	private String getFolder() {
		return null;
		
	}
	
	//특정 파일이 이미지 타입인지 검사
	private boolean checkImageType(File file) {
		return false;
		
	}
	
	@GetMapping("/display")	//표시
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		return null;
		
	}
	
	@GetMapping(value = "/download")	//다운로드
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName, @RequestHeader("User-Agent") String userAgent) {
		return null;
		
	}
	
	@PreAuthorize("isAuthenticated()")	//삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		return null;
		
	}

}
