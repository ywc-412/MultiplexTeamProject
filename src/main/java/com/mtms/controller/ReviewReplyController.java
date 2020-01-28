package com.mtms.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyPageDTO;
import com.mtms.domain.ReplyVO;
import com.mtms.service.ReviewReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/replies/*")
public class ReviewReplyController {
	
	private ReviewReplyService replyService;
	
	//댓글 달기
		@PreAuthorize("isAuthenticated()")
		@PostMapping(value = "new", consumes = "application/json"				// 전달받는 객체
								  , produces = { MediaType.TEXT_PLAIN_VALUE })	// 전달하는 객체..?
		// ResponseEntity : 응답할 때 메세지와 상태코드값 같이 보낼 수 있음
		public ResponseEntity<String> create(@RequestBody ReplyVO revo){
			// JSON 데이터를 RVO 객체로 변환할 거라 @RequestBody 사용
			
			int insertCount = replyService.register(revo);
			
			log.info("Reply INSERT COUNT " + insertCount);
			// result가 1이면(성공) : ResponseEntity로 success 와 OK 보냄
			return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		// 댓글 전체 조회
	    // page와 {page} 차이 알아야함
	    @GetMapping(value = "pages/{reviewNo}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
	                          								   MediaType.APPLICATION_JSON_UTF8_VALUE } )
	    											// URL의 일부를 파라미터로 사용하는 PathVariable
	    public ResponseEntity<ReplyPageDTO> getList( @PathVariable("page") int page, @PathVariable("reviewNo") int reviewNo ) {
	        // 댓글의 페이지수를 받아서 10개씩 페이징할 것
	        Criteria cri = new Criteria(page, 10);

	        // service에서 받아온 리스트의 값과 OK를 함께 넘김
//	        return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
	        return new ResponseEntity<>(replyService.getListPage(cri,reviewNo ), HttpStatus.OK);
	    }
		
		//댓글 조회
		@GetMapping(value = "{replyNo}", produces = { MediaType.APPLICATION_XML_VALUE,
												  MediaType.APPLICATION_JSON_UTF8_VALUE} )		
		public ResponseEntity<ReplyVO> get(@PathVariable("replyNo") int replyNo){
			return new ResponseEntity<>(replyService.get(replyNo),HttpStatus.OK);
			
		}
		
		// 댓글 삭제
//		   @PreAuthorize("principal.username == #rvo.replyer")
		   @DeleteMapping(value = "/{replyNo}",
		            // text로 보냄
		            produces = { MediaType.TEXT_PLAIN_VALUE })
		   public ResponseEntity<String> remove(@RequestBody ReplyVO revo, @PathVariable("replyNo") int replyNo){
		      log.info("Controller - remove : " + replyNo);
		         // 댓글 삭제가 성공되면 (1) success와 OK보냄
		      return replyService.remove(replyNo) == 1 ?
		            new ResponseEntity<>("success", HttpStatus.OK) :
		            new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		   }
		
		//댓글수정
		@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
						value = "{replyNo}",
						consumes = "application/json",
						produces = { MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> modify( @RequestBody ReplyVO revo, @PathVariable("replyNo") int replyNo){
			revo.setReplyNo(replyNo);;
			return replyService.modify(revo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		
}
