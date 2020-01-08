package com.mtms.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mtms.domain.ReplyPageDTO;
import com.mtms.domain.ReplyVO;
import com.mtms.service.ReviewReplyServiceImpl;
import com.mtms.service.ReviewServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/reply/*")
public class ReviewReplyController {
	private ReviewReplyServiceImpl replyService;
	
	@GetMapping(value = "pages/{reviewNo}/{page}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("reviewNo") int reviewNo, 
			@PathVariable("page") int page) {
				return null;
		//댓글 페이징 처리하기 위한 
	}
			
	@PostMapping(value = "new",
					 consumes = "application/json",
					 produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> register(@RequestBody ReplyVO revo){
		//등록하기위한 메소드
			return null;
		
	}
	@GetMapping(value = "{replyNo}")
		public ResponseEntity<ReplyVO> get(@PathVariable("replyNo") int replyNo){
		//댓글을 상세보기하기위한 메소드
			return null;
		
	}
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH},
					   	value = "{replyNo}",
					   	produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> modify(@PathVariable("replyNo") int replyNo, @RequestBody ReplyVO revo){
		//댓글 수정하기위한 메소드
		
			return null;
		
	}
			

	@DeleteMapping(value = "{replyNo}", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> remove(@PathVariable("rno") int replyNo){
			return null;
		
	}
}
