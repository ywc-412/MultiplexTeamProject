package com.mtms.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mtms.domain.CommentPageDTO;
import com.mtms.domain.CommentVO;
import com.mtms.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/comment/")
@RestController
@Log4j
@AllArgsConstructor
public class CommentController {
	
	private CommentService commentService;
	
	//한줄평 등록 - AJAX
	@PostMapping(value = "new", consumes = "application/json"				
							  , produces = { MediaType.TEXT_PLAIN_VALUE })	
	public ResponseEntity<String> create(@RequestBody CommentVO cvo){
		
		return null;
	}
	
	//한줄평 전체 조회 - AJAX
    // page와 {page} 차이 알아야함
    @GetMapping(value = "pages/{movieNo}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
                          								  MediaType.APPLICATION_JSON_UTF8_VALUE } )
    											// URL의 일부를 파라미터로 사용하는 PathVariable
    public ResponseEntity<CommentPageDTO> getList( @PathVariable("page") int page, @PathVariable("movieNo") Long movieNo ) {
		
    	return null;
    }
	
	//한줄평 조회 - AJAX
	@GetMapping(value = "{CommentNo}", produces = { MediaType.APPLICATION_XML_VALUE,
											  MediaType.APPLICATION_JSON_UTF8_VALUE} )		
	public ResponseEntity<CommentVO> get(@PathVariable("commentNo") Long commentNo){
		
		return null;
	}
	
	//한줄평 삭제 - AJAX
//	@PreAuthorize("principal.username == #rvo.replyer") //수정필요
	@DeleteMapping(value = "{CommentNo}", produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody CommentVO cvo, @PathVariable("commentNo") Long commentNo){
		
		return null;
	}
	
	//한줄평 수정 - AJAX
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
					value = "{CommentNo}",
					consumes = "application/json",
					produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody CommentVO cvo, @PathVariable("commentNo") Long commentNo){
		
		return null;
	}
	
	
}
