package com.mtms.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mtms.domain.GiftAttachVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/giftUpload")
public class GiftUploadController {
	
	@GetMapping("/uploadAjax")		//첨부파일 업로드 화면을 처리
	public void uploadAjax() {
		log.info("uploadAjax()");
	}
	
	
	//@PreAuthorize("isAuthenticated()")		
	@PostMapping(value = "/uploadAjaxAction" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)		//첨부파일 업로드를 처리
	@ResponseBody
	public ResponseEntity<List<GiftAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<GiftAttachVO> list = new ArrayList<>();
		log.info("update ajax post.........");		
		
		String uploadFolder = "C:\\upload";
		
		//폴더 생성
		File giftUploadPath = new File(uploadFolder, "\\gift\\");
		log.info("upload path" + giftUploadPath);
		
		if(giftUploadPath.exists() == false) {
			giftUploadPath.mkdirs();
		}
		
		for(MultipartFile multiF : uploadFile) {
			GiftAttachVO gav = new GiftAttachVO();
			gav.setGiftFileName(multiF.getOriginalFilename());
			gav.setGiftUploadPath("\\gift\\");
			
			log.warn("Upload File Name : " + multiF.getOriginalFilename());
			log.warn("Upload File Size : " + multiF.getSize());

			//file path
			String uploadFileName = multiF.getOriginalFilename();
			uploadFileName = multiF.getOriginalFilename().substring(multiF.getOriginalFilename().lastIndexOf("\\") + 1);
			
			//중복 방지위한 random uuid 생성
			UUID uuid = UUID.randomUUID();
			gav.setGiftUuid(uuid.toString());
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			File saveFile = new File(giftUploadPath, uploadFileName);
			log.warn(saveFile);
			//io는 예외 꼭 해야함
			try {
				multiF.transferTo(saveFile);
				
					list.add(gav);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//END try
		}		
		return new ResponseEntity<>(list, HttpStatus.OK);		
		//RestController의 결과데이터가 예외적인 상황에서 문제가 발생할 수 있으므로 
		//직접 결과 데이터와 HTTP 상태 코드를 직접 제어할 수 있는 세밀한 제어가 필요할 때 사용
		
	}
	
	
	@GetMapping("/display")	//표시
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String giftFileName) {
		log.info("giftFileName : " + giftFileName);
		File file = new File("C:\\upload\\" + giftFileName);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	//@PreAuthorize("isAuthenticated()")	//파일삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String giftFileName) {
		log.info("deleteFile : " + giftFileName);
		File file;
		
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(giftFileName,"UTF-8"));
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("delete ok", HttpStatus.OK);
		
	}

}
