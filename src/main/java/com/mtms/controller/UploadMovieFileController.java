package com.mtms.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mtms.domain.MovieAttachVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadMovieFileController {
	
	//오늘 날짜로 년월일 폴더생성
	private String getFolder() {
		
		return null;
	}
	
	//이미지 파일 여부 확인
	private boolean checkImageType(File file) {
		
		return false;
	}
	
	//get방식으로 첨부파일을 업로드 할수 있는 화면을 처리하는 메서드
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	//post방식으로 첨부파일 업로드를 처리하는 메서드
	@PostMapping("/uploadFormAction")
	public void uploadFormAction(MultipartFile[] uploadFile, Model model) {
		
	}
	
	//ajax의 get방식으로 첨부파일을 업로드 할수 있는 화면을 처리하는 메서드
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("uploadAjax");
	}
	
	//ajax의 post방식으로 첨부파일 업로드를 처리하는 메서드
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/uploadAjaxAction")
	@ResponseBody //@RestController를 쓸수 없어서
	public ResponseEntity<List<MovieAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		return null;
	}
	
	//파일 섬네일 보여주기
	@GetMapping("/display")
	@ResponseBody
	//파일을 받아야해서 바이트로 써준다
	public ResponseEntity<byte[]> getFile(String fileName){
		
		return null;
	}
	
	//파일다운로드 처리
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	//HTTP헤더 메시지 중에서 디바이스의 정보를 알 수 있는 헤더는   User-Agent 기존의 다운로드 파일은 User-Agent정보를 파라미터로 수집한다
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName){
		
		return null;
	}
	
	//파일 삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		return null;
	}

}
