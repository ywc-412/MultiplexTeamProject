package com.mtms.controller;

import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mtms.domain.MovieAttachVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/movieUpload/*")
public class UploadMovieFileController {
	
	//오늘 날짜로 년월일 폴더생성
	private String getFolder() {
		//현재 시점의 연\\월\\일 폴더 경로 문자열 생성 및 반환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//이미지 파일 여부 확인
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("checkImageType : " + contentType);
			//시작값이 image이면
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
//		FileTypeDetector를 사용하여 MIME형식을 검사하는 probeContentType의 기본 구현은 
//		OS에 따라 조금씩 차이를 보이며 때때로 실패할 수도 있으며 파일에 확장명이 없으면 오류가 발생할 수도 있다
		//ppt업로드가능
		
		return false;
	}
	
	//ajax의 get방식으로 첨부파일을 업로드 할수 있는 화면을 처리하는 메서드
	@GetMapping("uploadAjax")
	public void uploadAjax() {
		log.info("uploadAjax");
	}
	
	//ajax의 post방식으로 첨부파일 업로드를 처리하는 메서드
//	@PreAuthorize("isAuthenticated()")
	@PostMapping("uploadAjaxAction")
	@ResponseBody //@RestController를 쓸수 없어서
	public ResponseEntity<List<MovieAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		log.info("uploadAjaxPost");	//pptx나 excel은 json으로 받아서 실패가 뜨나 저장은된다 이오류는 잡아줘야한다
		System.out.println("uploadAjaxPost");
		List<MovieAttachVO> list = new ArrayList<MovieAttachVO>();
		String uploadFolder = "C:\\upload\\movie"; //사진을 저장할 위치
		
		//폴더 만든다
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path : " + uploadPath);
		
		//연\\월\\일 폴더가 없으면 생성
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			//객체만든다
			MovieAttachVO movieAttach = new MovieAttachVO();
			
			//파일명 다르게할려고 UUID값 해준다
			UUID uuid = UUID.randomUUID();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//파일이름 넣는다									
			movieAttach.setMovieFileName(uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1));
			
			//중복안되게 uuid 붙여서 이름 변경
			uploadFileName = uuid.toString() + "_" + uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println(uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				
				movieAttach.setMovieUuid(uuid.toString());
				movieAttach.setMovieUploadPath(getFolder());
					
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				
				thumbnail.close();
				
				list.add(movieAttach);
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}
		}//END for
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	//파일 섬네일 보여주기
	@GetMapping("display")
	@ResponseBody
	//파일을 받아야해서 바이트로 써준다
	public ResponseEntity<byte[]> getFile(String movieFileName){
		
		File file = new File("c:\\upload\\movie\\" + movieFileName);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	//파일 삭제
//	@PreAuthorize("isAuthenticated()")
	@PostMapping("deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("deleteFile : " + fileName);
		try {
			File file = new File("c:\\upload\\movie\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			String largeFileName = file.getAbsolutePath().replace("s_", "");
			log.info("largeFileName" + largeFileName);
			file = new File(largeFileName);
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted OK", HttpStatus.OK);
	}

}
